---
description: Retrieving Transaction-Scope Items (Order Center Items)
---

# Retrieving Items in Transaction Scope

### Data Retrieval Methods

#### Get Single Transaction-Scope Item

* **Description:** Retrieves a specific transaction-scope item using the get function, requiring both a transaction key and an item key (UUID, ExternalID, or InternalID).
*   **Syntax:**

    ```javascript
    pepperi.api.transactionScopeItems.get({
      transaction: { UUID: "<transaction UUID>" },
      item: { UUID: "<item UUID>" }, // or { ExternalID: "" } or { InternalID: 123 }
      fields: ["Price", "Item.Name"]
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.transactionScopeItems.get({
      transaction: { UUID: "txn123e-74ac-4041-8bb1-a76a3b5e78d8" },
      item: { UUID: "itm456f-74ac-4041-8bb1-a76a3b5e78d9" },
      fields: ["Price", "Item.Name"]
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "object": {
        "UUID": "aefb523e-74ac-4041-8bb1-a76a3b5e78d8",
        "Price": 123.4,
        "Item.Name": "Item AB Test1"
      }
    }
    ```

#### Search List of Transaction-Scope Items by Filter

* **Description:** Retrieves multiple transaction-scope items using the search function, available from CPI 16. Requires a transaction key and supports filters, sorting, page size, and page number.
*   **Syntax:**

    ```javascript
    pepperi.api.transactionScopeItems.search({
      transaction: { UUID: "<transaction UUID>" },
      fields: ["UUID", "ItemExternalID", "MyTSA"],
      filter: { <filter object> },
      sorting: [{ Field: "<fieldName>", Ascending: <boolean> }],
      pageSize: <number>,
      page: <number>
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.transactionScopeItems.search({
      transaction: { UUID: "txn123e-74ac-4041-8bb1-a76a3b5e78d8" },
      fields: ["UUID", "ItemExternalID", "MyTSA"],
      filter: {
        "Operation": "AND",
        "LeftNode": { "ApiName": "APIName1", "Operation": ">", "Values": ["7"] },
        "RightNode": { "ApiName": "ApiName2", "Operation": "InTheLast", "Values": ["4", "Weeks"] }
      },
      sorting: [{ "Field": "MyTSA", "Ascending": true }, { "Field": "MyTSA2", "Ascending": true }],
      pageSize: 1000,
      page: 1
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "objects": [
        {
          "UUID": "aefb523e-74ac-4041-8bb1-a76a3b5e78d8",
          "ItemExternalID": "abc123",
          "MyTSA": 12.8
        },
        {
          "UUID": "aefb5346-74ac-4041-8bb1-a76a3b5e734h",
          "ItemExternalID": "abc456",
          "MyTSA": 34.5
        }
      ]
    }
    ```

{% hint style="warning" %}
**Note:** Supported from CPI 16 only.
{% endhint %}
