---
title: "Importing Transaction Lines and Headers Using Webhooks in Pepperi"
description: "This guide demonstrates how to create a Webhook Task in Pepperi to import transaction headers and lines into a client table using SQL. This is particularly useful for tasks like importing sales orders"
order: 317
---
# Importing Transaction Lines and Headers Using Webhooks in Pepperi

*This guide demonstrates how to create a Webhook Task in Pepperi to import transaction headers and lines into a client table using SQL. This is particularly useful for tasks like importing sales orders*

### Overview

The "Import Sales Order" task involves transferring transaction headers and lines from Pepperi to a client database table. This is achieved using a Webhook Task with SQL statements to handle both headers and lines, ensuring accurate data import.

-   **Key SQL Directives:**
    -   @begin\_sql and @end\_sql: Define the SQL block for headers.
    -   @begin\_lines and @end\_lines: Define the SQL block for lines.

---

### Step 1: Create the Webhook Task

1.  **Set Up the Webhook Task:**
    -   Go to Pepperi’s Integration module.
    -   Create a new Webhook Task with the following settings:
        -   **Source Object:** Pepperi Transaction Webhook
        -   **Target Object:** Generic Desktop Import

2.  **Configure Webhook Settings:**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-45.png)

1.  **Configure the SQL Settings:**

-   Add the SQL statements to the Webhook Task configuration.
-   Use the following example to import headers and lines into a table named YourTable

```
@begin_sql
INSERT INTO YourTable
(
  [SalesOrderNo]
 ,[OrderDate]
 ,[OrderType]
 ,[InvoiceNo]
 ,[ShipExpireDate]
 ,[BillToName]
 ,[BillToAddress]
 ,[BillToCity]
 ,[BillToState]
 ,[BillToZipCode]
 ,[BillToCountryCode]
 ,[ShipToCode]
 ,[ShipToName]
 ,[ShipToAddress]
 ,[ShipToCity]
 ,[ShipToState]
 ,[ShipToZipCode]
 ,[ShipToCountryCode]
 ,[DiscountAmt]
 ,[TaxableAmt]
 ,[NonTaxableAmt]
 ,[SalesTaxAmt]
 ,[Comment]
 ,[Status]
)
VALUES
(
  '$#InternalID#$'
 ,CONVERT(datetime,'$#ActionDateTime#$', 127)
 ,'#$#TSAOrderType#$'
 ,'#$#TSANextInvoiceUpdating#$'
 ,CONVERT(datetime,'$#DeliveryDate#$', 127)
 ,'#$#Account.TSABillToName#$'
 ,'#$#Account.TSABillToAddress#$'
 ,'#$#Account.TSABilltoCity#$'
 ,'#$#Account.TSABillToState#$'
 ,'#$#Account.TSABillToZipCode#$'
 ,'#$#Account.TSABillToCountryCode#$'
 ,'#$#Account.TSALocationNumber#$'
 ,'#$#Account.TSAShipToName#$'
 ,'#$#Account.TSAShipToAddress#$'
 ,'#$#Account.TSAShipToCity#$'
 ,'#$#Account.TSAShipToState#$'
 ,'#$#Account.TSAShipToZipCode#$'
 ,'#$#Account.Country#$'
 ,0
 ,'#$#TSAHeaderAmountTaxable#$'
 ,'#$#TSAHeaderNonTaxableAmt#$'
 ,'#$#TSATotalTax#$'
 ,'#$#TSAGrandTotalSO#$'
 ,'#$#Remark#$'
 ,GETDATE()
)
@begin_lines
INSERT INTO YourTable
(
  [SalesOrderNo]
 ,[ItemCode]
 ,[QuantityOrdered]
 ,[QuantityShipped]
 ,[QuantityBackordered]
 ,[UnitPrice]
 ,[Status]
 ,[Comment]
)
VALUES
(
  '$#InternalID#$'
 ,'#$#Item.ExternalID#$'
 ,'#$#TSAUnitQuantity#$'
 ,'#$#TSATruckUnits#$'
 ,'#$#TSABackOrderQty#$'
 ,'#$#TSAUnitPrice#$'
 ,GETDATE()
 ,'#$#TSALineComment#$'
)
@end_lines
@end_sql
@begin_sql
select '1', '$#InternalID#' from YourTable
@end_sql
```

-   **Explanation:**
    -   Fields in \[ \]: Represent columns in the client’s YourTable.
    -   Fields in '$# #$': Represent Pepperi fields (e.g., InternalID, Account.TSABillToName).
    -   Hardcoded values (e.g., 0 for DiscountAmt) can be used where applicable.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-46.png)

### Step 2: Handle Special Characters and Filtering

1.  **Replace Special Characters:**
    -   The presence of a single quote (') in fields (e.g., names, addresses) can break SQL.
    -   Use the Replace Tab to escape these characters:
    -   Apply this to all fields where special characters might occur (e.g., BillToName, ShipToAddress).

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3.png)

-   **Filter Lines and Headers:**
    -   To exclude specific lines (e.g., "blue lines" from campaigns), add a trn\_import\_filter with a logic expression:
        -   trn\_import\_filter - logic expression

    -   List required fields in:
        -   webhook\_trn\_header\_fields: Header fields used (e.g., InternalID, TSAOrderType, Account.TSABillToName).
        -   webhook\_trn\_line\_fields: Line fields used (e.g., Item.ExternalID, TSAUnitQuantity).

!!!info
### Note:

If no data appears in Transaction Logs after running the webhook, check `webhook_trn_header_fields` and `webhook_trn_line_fields` for mismatches with the SQL statement.
!!!
