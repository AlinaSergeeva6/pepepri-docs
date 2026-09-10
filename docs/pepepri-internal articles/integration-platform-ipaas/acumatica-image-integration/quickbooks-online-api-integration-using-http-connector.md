---
title: "QuickBooks Online API Integration using HTTP Connector"
description: "All the examples you can find in 'Integration Examples' (6685);"
order: 111
---
# QuickBooks Online API Integration using HTTP Connector

*All the examples you can find in 'Integration Examples' (6685);*

### General Dataflow Tasks Configurations

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-555.png)

-   **URL Structure:** Common for all tasks, varying only by realmID and database table.
    -   `https://quickbooks.api.intuit.com/v3/company/[realmID]/query?minorversion=41&query=select * from [table] STARTPOSITION {#page_num#} MAXRESULTS !%page_interval%!`
    -   Replace `[realmID]` with the client’s unique identifier.
    -   Replace `[table]` with the target table (e.g., Account, Item, Invoice).

-   **Settings:**
    -   **Page Num:** Use `{#page_num#}` for pagination.
    -   **Page Interval:** Use `!%page_interval%!` to define the number of records per page.

-   **Authentication:** Configure OAuth 2.0 in the HTTP tab with the access token.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-556.png)

---

### Examples for Different Dataflow Tasks

#### Accounts

-   **URL:** `https://quickbooks.api.intuit.com/v3/company/[realmID]/query?minorversion=41&query=select * from Account STARTPOSITION {#page_num#} MAXRESULTS !%page_interval%!`
-   **Notes:** Retrieve all account data; adjust fields as needed.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-557.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-558.png)

#### Items

-   **URL:** `https://quickbooks.api.intuit.com/v3/company/[realmID]/query?minorversion=41&query=select * from Item STARTPOSITION {#page_num#} MAXRESULTS !%page_interval%!`
-   **Notes:** Fetch item details; customize fields for specific use cases.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-559.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-560.png)

#### Inventory

-   **URL:** `https://quickbooks.api.intuit.com/v3/company/[realmID]/query?minorversion=41&query=select * from Inventory STARTPOSITION {#page_num#} MAXRESULTS !%page_interval%!`
-   **Notes:** Retrieve inventory data; ensure proper table mapping.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-561.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-562.png)

#### Transaction Header

-   **URL:** `https://quickbooks.api.intuit.com/v3/company/[realmID]/query?minorversion=41&query=select * from Invoice STARTPOSITION {#page_num#} MAXRESULTS !%page_interval%!`
-   **Notes:** Example uses Invoice; change `[table]` to SalesOrder, PurchaseOrder, etc., based on the transaction type.
-   **Setting:** Include `sub_type_id` to specify the transaction type (e.g., Invoice, SalesOrder).

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-563.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-564.png)

#### Transaction Lines

-   **URL:** `https://quickbooks.api.intuit.com/v3/company/[realmID]/query?minorversion=41&query=select * from InvoiceLine STARTPOSITION {#page_num#} MAXRESULTS !%page_interval%!`
-   **Notes:** Example uses InvoiceLine; adjust `[table]` (e.g., SalesOrderLine) as needed.
-   **Settings:**
    -   Include `sub_type_id` to specify the transaction type.
    -   Use `http_export_add_parents` to include the transactionID (Doc Num) in the output.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-565.png)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-566.png)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-567.png)

---

### Webhook Tasks Configurations

#### General Webhook Tasks Configurations

-   **Purpose:** Automate data updates or notifications based on QuickBooks events.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-568.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-569.png)

#### Transaction Webhook Example

-   **Body Code Example:**

    ```
    {
      "DocNumber": "$#InternalID#$",
      "SalesTermRef": {
        "value": "$#IIF(TSASalesTermRef='', '3', SUBSTRING(TSASalesTermRef, 1, 1))#$"
      },
      "Line": [
        @@lines
        {
          "Amount": "$#TotalUnitsPriceAfterDiscount#$",
          "DetailType": "SalesItemLineDetail",
          "Description": "$#LongDescription#$",
          "SalesItemLineDetail": {
            "ItemRef": {
              "value": "$#ItemExternalID#$"
            },
            "UnitPrice": "$#UnitPriceAfterDiscount#$",
            "Qty": "$#UnitsQuantity#$",
            "TaxCodeRef": {
              "value": "NON"
            }
          }
        }
        @@lines
      ],
      "CustomerRef": {
        "value": "$#AccountExternalID#$"
      },
      "CustomerMemo": {
        "value": "$#Remark#$"
      }
    }
    ```

-   **Notes:** Customize field mappings (e.g., InternalID, ItemExternalID) based on your data structure.

---

### Additional Resources

-   **Examples:** Available in 'Integration Examples' (6685).
-   **Documentation:** [https://developer.intuit.com/app/developer/qbo/docs/api/accounting/all-entities/customerbalance](https://developer.intuit.com/app/developer/qbo/docs/api/accounting/all-entities/customerbalance) for additional configuration details.
