---
title: "Return Based On UDT"
description: "This guide details the implementation of a return transaction based on User Defined Tables (UDT). Time to Implement in a New Environment: Approximately 2 hours."
order: 35
---
# Return Based On UDT

*This guide details the implementation of a return transaction based on User Defined Tables (UDT).   Time to Implement in a New Environment: Approximately 2 hours.*

### Overview

The "Return Based On UDT" transaction type is designed for ease of use, displaying only returnable transactions and allowing users to select invoices for item returns via dropdowns. It includes quantity limits and leverages UDTs, calculation fields, and webhooks for data management, with a validation system to ensure accuracy.

---

### Description

This transaction type enables users to return items based on invoices selected from a dropdown for each line item. Key features include:

-   Filters transaction scope to show only returnable invoices.
-   Populates dropdowns with invoice IDs and creates temporary UDT values in the background.
-   Limits return quantities to prevent exceeding original invoice amounts.
-   Triggers a webhook post-submission to clean up UDT data.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2023-03-30-114241.png)

---

### Advantages and Disadvantages

#### Advantages

-   **Robust Validation:** Prevents returns of un-invoiced items or incorrect quantities.
-   **User-Friendly:** Simple interface with customizable settings.
-   **Flexible Configuration:** Supports tailored implementations.

#### Disadvantages

-   **Complexity:** Requires additional calculation fields, UDT creation, temporary data, and a webhook/task for cleanup.

---

### How It Works (Demo)

1.  Open the **Return Based On UDT** transaction and select the first customer.
    1.  In settings it's named as **Return Based On UDT (New)**

2.  Add items to the cart and select an **Invoice ID** from the dropdown for each item.
3.  Background processes:
    -   Search all invoices and populate temporary UDT values (e.g., ItemsForReturn).
    -   Filter transaction scope and update dropdown options.

4.  Submit the transaction.
5.  A webhook triggers a job to clear the UDT values.

---

### Data Validation

-   Upon transaction initiation, validation logic identifies the transaction by **Type** and **CreationDateTime**, adding it to the UDT.
-   UDT data structure:
    -   **Main Key:** AccountExternalID~ItemExternalID
    -   **Secondary Key:** TransactionIID (InternalID or ExternalID)
    -   **Value:** {"qty": 1, "price": 1, "date": "yyyy-MM-ddThh:mm:ssZ"}

-   Calculations use this structure to validate return quantities and prices.

---

### Implementation Details

#### Required Components

-   **Header Fields:**
    -   Text: TSAHeaderCalculationsInit, TSAHeaderCalculationsOnChange
    -   Checkbox: TSABlockTransaction

-   **Line Fields:**
    -   Text: TSALinesCalculationsInit, TSALinesCalculationsChange, TSAMainKey
    -   Dropdown: TSATransactionID
    -   Currency: TSALineTotal
    -   Checkbox: TSAIsRelevantItem
    -   Number: TSATransactionsItemQTY

-   **UDT:**
    -   Name: ItemsForReturn
    -   Main Key: Catalog Name
    -   Secondary Key: Any

-   **IPaaS Dataflow Tasks:**
    -   Get Return1 UDT Data
    -   Post Return1 UDT Data
    -   Add these tasks to the job triggered by the webhook.

-   **Webhook Tasks:**
    -   Trigger Job - Return1 UDC Cleaner
    -   Executes the dataflow tasks to clean UDT data post-submission.

#### Header Calculations Init

```
/**
 * Transaction Processing Script for Pepperi Invoices and Returns
 * Date: June 04, 2025
 * Description: This script processes transactions in Pepperi, focusing on invoice retrieval, return management,
 *              and transaction validation. It retrieves invoice lines, updates return data in User Defined Tables (UDTs),
 *              tracks relevant items for returns, and controls transaction line quantities and totals.
 *              It also includes logic to block transactions if invoice IDs are missing.
 */

/**
 * Main script execution wrapped in a try-catch block for error handling
 * @returns {string} Empty string on success, error message on failure
 */
try {
  const self = this;
  let debug = "";

  // Initialize storage for transaction data
  self.storage = {
    accountExternalID: "", // Account External ID for the current transaction
    returnItems: {}, // Map of returnable items: key is accountID~itemID~transactionID, value is quantity
    relevantItems: {}, // Map of relevant items for returns: key is accountID~itemID, value is the same key
  };

  // Header-level operations for transaction initialization and updates
  self.header = {
    /**
     * Initializes the transaction by loading account data and retrieving invoice lines
     * @returns {void}
     */
    onLoad: function () {
      self.storage.accountExternalID = GetValueByApiName("AccountExternalID");
      self.header.retrieveInvoiceLines();
    },

    /**
     * Updates the ItemsForReturn UDT with return data for a specific item
     * @param {string} itemExternalID - The external ID of the item
     * @param {string} transactionInternalID - The internal ID of the transaction
     * @param {number} unitsQuantity - Quantity of the item in the transaction
     * @param {number} unitPrice - Unit price of the item
     * @param {string} creationDateTime - Creation date and time of the transaction (ISO format)
     * @returns {void}
     */
    updateReturnUdt: function (
      itemExternalID,
      transactionInternalID,
      unitsQuantity,
      unitPrice,
      creationDateTime
    ) {
      const returnData = {
        qty: unitsQuantity,
        price: unitPrice,
        date: creationDateTime,
      };

      // Upsert return data into ItemsForReturn UDT
      let x = pepperi.api.userDefinedTables.upsert({
        table: "ItemsForReturn",
        mainKey: `${self.storage.accountExternalID}~${itemExternalID}`,
        secondaryKey: `${transactionInternalID}`,
        value: JSON.stringify(returnData),
      });
    },

    /**
     * Updates the in-memory storage for returnable and relevant items
     * @param {string} itemExternalID - The external ID of the item
     * @param {string} transactionInternalID - The internal ID of the transaction
     * @param {number} unitsQuantity - Quantity of the item in the transaction
     * @returns {void}
     */
    updateReturnAndRelevantItem: function (
      itemExternalID,
      transactionInternalID,
      unitsQuantity
    ) {
      const returnItemKey = `${self.storage.accountExternalID}~${itemExternalID}~${transactionInternalID}`;
      const relevantItemKey = `${self.storage.accountExternalID}~${itemExternalID}`;

      self.storage.returnItems[returnItemKey] = unitsQuantity;
      self.storage.relevantItems[relevantItemKey] = relevantItemKey;
    },

    /**
     * Retrieves invoice lines for the current account
     * Filters for invoices with positive quantities and non-hidden transactions
     * @returns {void}
     */
    retrieveInvoiceLines: function () {
      const invoiceLines = pepperi.api.transactionLines.search({
        fields: [
          "TransactionInternalID",
          "TransactionExternalID",
          "ItemExternalID",
          "CreationDateTime",
          "UnitsQuantity",
          "UnitPrice",
        ],
        filter: {
          Operation: "AND",
          LeftNode: {
            Operation: "AND",
            LeftNode: {
              ApiName: "Transaction.Type",
              Operation: "IsEqual",
              Values: ["Invoice"],
            },
            RightNode: {
              ApiName: "UnitsQuantity",
              Operation: ">",
              Values: ["0"],
            },
          },
          RightNode: {
            Operation: "AND",
            LeftNode: {
              ApiName: "Transaction.AccountExternalID",
              Operation: "IsEqual",
              Values: [self.storage.accountExternalID],
            },
            RightNode: {
              ApiName: "Hidden",
              Operation: "IsEqual",
              Values: ["false"],
            },
          },
        },
        pageSize: 1000000,
        page: 1,
      });

      // Process retrieved invoice lines
      if (invoiceLines.success && invoiceLines.objects.length > 0) {
        invoiceLines.objects.forEach((line) => {
          const {
            ItemExternalID,
            TransactionInternalID,
            UnitsQuantity,
            UnitPrice,
            CreationDateTime,
          } = line;

          // Update UDT and in-memory storage with invoice data
          self.header.updateReturnUdt(
            ItemExternalID,
            TransactionInternalID,
            UnitsQuantity,
            UnitPrice,
            CreationDateTime
          );
          self.header.updateReturnAndRelevantItem(
            ItemExternalID,
            TransactionInternalID,
            UnitsQuantity
          );
        });
      }
    },

    /**
     * Updates the transaction block status based on missing TSAInvoiceID in transaction lines
     * Blocks the transaction if any line is missing TSAInvoiceID
     * @returns {void}
     */
    updateTransactionBlock: function () {
      const transactionLines = pepperi.api.transactionLines.search({
        fields: [
          "TSAInvoiceID",
          "ItemExternalID",
          "CreationDateTime",
          "UnitsQuantity",
          "UnitPrice",
        ],
        filter: {
          Operation: "AND",
          LeftNode: {
            ApiName: "Transaction.UUID",
            Operation: "IsEqual",
            Values: [GetValueByApiName("UUID")],
          },
          RightNode: {
            ApiName: "Hidden",
            Operation: "IsEqual",
            Values: ["false"],
          },
        },
        pageSize: 1000000,
        page: 1,
      });

      // Check for missing TSAInvoiceID in transaction lines
      if (transactionLines.success && transactionLines.objects.length > 0) {
        const missingInvoiceIDCount = transactionLines.objects.reduce(
          (count, line) => count + (line.TSAInvoiceID ? 0 : 1),
          0
        );

        // Set TSABlockTransaction based on the presence of missing invoice IDs
        SetValueByApiName("TSABlockTransaction", missingInvoiceIDCount > 0);
      }
    },
  };

  // Line-level operations for item validation and calculations
  self.lines = {
    /**
     * Marks an item as relevant for returns if it exists in the relevantItems storage
     * @param {string} itemExternalID - The external ID of the item
     * @returns {void}
     */
    setRelevantItems: function (itemExternalID) {
      const itemKey = `${self.storage.accountExternalID}~${itemExternalID}`;
      if (self.storage.relevantItems[itemKey]) {
        SetValueByApiName("TSAIsRelevantItem", true);
      }
    },

    /**
     * Controls the quantity of an item to ensure it does not exceed the maximum returnable quantity
     * Also ensures the quantity is not negative
     * @param {number} unitsQuantity - The current quantity of the item
     * @param {string} itemExternalID - The external ID of the item
     * @param {string} transactionID - The transaction ID associated with the item
     * @returns {void}
     */
    controlItemsQuantity: function (
      unitsQuantity,
      itemExternalID,
      transactionID
    ) {
      const itemKey = `${self.storage.accountExternalID}~${itemExternalID}~${transactionID}`;
      const maxQuantity = self.storage.returnItems[itemKey] || 0;

      // Set the maximum returnable quantity for reference
      SetValueByApiName("TSATransactionsItemQTY", maxQuantity);

      // Adjust quantity if it exceeds the maximum or is negative
      if (unitsQuantity > maxQuantity) {
        SetValueByApiName("UnitsQuantity", maxQuantity);
      } else if (unitsQuantity < 0) {
        SetValueByApiName("UnitsQuantity", 0);
      }
    },

    /**
     * Calculates the total price for a transaction line based on quantity and price
     * Handles edge cases for negative quantities and quantity limits
     * @param {number} unitsQuantity - The current quantity of the item
     * @param {number} itemPrice - The unit price of the item
     * @param {number} transactionItemUnitsQuantity - The maximum quantity allowed for the item
     * @returns {number} The calculated total price for the line
     */
    calculateLineTotal: function (
      unitsQuantity,
      itemPrice,
      transactionItemUnitsQuantity
    ) {
      if (unitsQuantity < 0) {
        return 0;
      }
      if (
        transactionItemUnitsQuantity &&
        unitsQuantity > transactionItemUnitsQuantity
      ) {
        return transactionItemUnitsQuantity * itemPrice;
      }
      return unitsQuantity * itemPrice;
    },
  };

  // Initialize transaction processing
  self.header.onLoad();

  return debug; // Indicate successful execution
} catch (error) {
  return error.toString(); // Return error message on failure
}
```

#### Header Calculations Change

```
try {
  this.header.updateTransactionBlock();
  return "";
} catch (e) {
  return e.toString();
}
```

#### Line Calculations Init

```
try {
  let ItemExternalID = GetValueByApiName("ItemExternalID");
  this.lines.setRelevantItems(ItemExternalID);
  SetValueByApiName(
    "TSAMainKey",
    this.storage.accountExternalID + "~" + ItemExternalID
  );
  return "";
} catch (e) {
  return e.toString();
}
```

#### Line Calculations Change

```
try {
  let triggerCount = GetValueByApiName("TSALineCalculationsChange") || 0;
  let ItemExternalID = GetValueByApiName("ItemExternalID");
  let ItemPrice = GetValueByApiName("ItemPrice");
  let UnitsQuantity = GetValueByApiName("UnitsQuantity");
  let TransactionID = GetValueByApiName("TSATransactionID");
  let TransactionItemUnitsQuantity = GetValueByApiName(
    "TSATransactionsItemQTY"
  );

  this.lines.controlItemsQuantity(UnitsQuantity, ItemExternalID, TransactionID);

  let lineTotal = this.lines.calculateLineTotal(
    UnitsQuantity,
    ItemPrice,
    TransactionItemUnitsQuantity
  );

  SetValueByApiName("TSALineTotal", lineTotal);

  return triggerCount++;
} catch (e) {
  return e.toString();
}
```

#### Copying to Another Environment

To replicate the "Return Based On UDT" transaction in a new environment:

1.  **Export from Services Demo Environment:**
    -   Export the entire transaction configuration from the Services Demo Environment, including all fields, dataflow tasks, UDTs, and webhook settings.

2.  **Import into New Environment:**
    -   Import the exported transaction into the target environment.

3.  **Adjust Configuration:**
    -   **Transaction Type:** Update the invoice transaction type to match the new environment (e.g., from "Invoice" to a custom type if needed).
    -   **Date Filter:** Add or modify a date filter if specific timeframes are required.
    -   **Price Field:** Adjust the price field to align with the new environment’s pricing structure.
    -   **Transaction ID:** Define a unique transaction ID field to identify transactions associated with items.

4.  **Post-Submission Logic:**
    -   Define actions for selected items after submission (e.g., update inventory, notify stakeholders).
    -   Ensure the webhook (Trigger Job - Return1 UDC Cleaner) executes the dataflow tasks (Get Return1 UDT Data and Post Return1 UDT Data) to clear UDT data.
