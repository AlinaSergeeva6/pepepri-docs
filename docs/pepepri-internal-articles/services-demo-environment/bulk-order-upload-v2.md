---
title: "Bulk Order Upload v2"
order: 23
---
# Bulk Order Upload v2

### Description:

The feature allows you to upload orders with different transaction IDs with the items from separate transactions and submit them at once. The order items will appear in a table, where you can edit and/or delete each row(which represents the info about each item). Then you can upload transactions.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/11111.png)

## Advantages and disadvantages

!!!success
**Bulk Order Upload** allows customers to see and manage all of their transactions they want to add in one place and has the ability to change lines in the table from UI or just upload a new file.
!!!

!!!success
It supports up to 5 different types of files: **XLSX, XLS, CSV, TXT, JSON**. All of the templates can be downloaded from the UI Task, click on the file type at the top.
!!!

!!!success
When the upload is finished, other users can instantly see the new orders, **you don’t need to sync your device.**
!!!

!!!success
If you have a requirement to split FBM transaction on Sales Order and Return transaction, **it doesn\`t require internet connection** - allows to create orders in the way when customer can see them immediately.
!!!

!!!danger
Bulk Order Upload doesn’t support upload transaction **offline**. They should have an internet connection in order to use it.
!!!

!!!danger
For new orders, workflow actions will not be triggered at the time of their creation. If there are any actions like forms or alerts visible in the UI they will be triggered when the user opens the order. All new orders have **"In Creation"** status.
!!!

!!!danger
Bulk Order Upload doesn\`t support possibility to send new orders to ERP immediately. The user should open the transaction and press **the Submit** button.
!!!

!!!danger
The client should have **iPaaS** to use this feature. This is UI Task, which uses other dataflow tasks, therefore, it is not possible to implement this feature without **iPaaS**.
!!!

## Demo - how does it work

In order to open the bulk order upload go to Homepage -> Bulk Order Upload

1\. **In the Services Demo Environment,** open **Bulk Order Upload** transaction from home-screen.

2\. Download one of the templates at the top, click **Upload File** and select the template file.

3\. Make sure that the columns **Account** and **Item** have a valid input and this accounts/items are exist in Pepperi.

4\. Click **Upload Transactions** and wait a few seconds. (Do not close the form until you see a popup)

5\. After it, you can close the form or repeat the process from the start.

a. In case when not all lines from the table were uploaded, you will see the reason for it and will be able to correct your mistakes and try again.

6\. You can review your new orders in the activity list. They will have a status **In Creation.**

!!!info
**Note:** If you put the ID of an already existing transaction in the **TransactionID** column, you can simply add new items from your file to this transaction or update the number of items if they already exist. **It will not remove items that are in a transaction that is not included in your file.**
!!!

## How to copy to another environment

1\. Copy the UI Task and all subtasks from Services Demo Environment into your environment. Link to the UI Task: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=72452](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=72452)

2\. Create a custom form and put UI Task into it.

3\. Create new activity - **Bulk Order Upload**.

4\. In workflow, between **New -> In Creation** step, add your custom form which contains UI Task.

5\. Disable all accounts for this activity.

## Advanced configuration

This UI Task is very flexible and some of the settings could be changed very easily, based on client requirements.

### Show Logs

You can show logs in the console or don’t show them at all.

```
* true - show console.log() in the console. false - don't show it */
showLog: true
```

**Skip Existing Transactions**

If transaction ID in file is already exist, you can skip it or update it.

```
/* If transaction in file is already exist. Choose what to do in this case.
 * true - skip transaction
 * false - add items from the file to the existed transactions
*/
isSkipExistedTransaction: false
```

**Default Transaction Settings**

In some cases, customer doesn’t want to provide **TransactionType** or **AccountExternalId** or **CatalogName** in the file. In this case, UI Task will use the data from defaultTransactionSettings object. You can easily the values of this object in the head part of the UI Task.

```
/* If file doesn't have one of this data, then it uses the default settings */
defaultTransactionSettings: {
    TransactionType: "Sales Order",
    AccountExternalID: 3962770,
    CatalogName: "Default Catalog"
}
```

### Columns

You can define, which columns should file have in order be processed by UI Task.

If uploaded file, doesn’t have one of the columns defined here, the file data will not be valid and added to the table.

You can change:

· What columns it should have

· Name of the columns

· Pepperi field name corresponding to the columns

· Type of the columns

· If it should group lines by this column (Usually it’s true, only for TransactionID column)

```
/* List of the coulmns that should be in the file. If columns are not in file, the file won't be valid
    Field Names:
    ExternalID - external ID of the transaction
    AccountExternalID - external ID of the account
    ItemExternalID - external ID of the item
    UnitsQuantity - unit quantity of the item
*/
columns: {
     // Name of the column in the file. Could be with spaces (example: 'Transaction ID')
    TransactionID: {
        Name: "TransactionID",      // Name of the column in the table
        Field: "ExternalID",        // Name of the pepperi field
        Type: columnTypes.String,   // Column type in the table.
        GroupByField: true,         // If true, group all lines in file based on fields with GroupByField as true
    },
    AccountID: {
        Name: "Account",
        Field: "AccountExternalID",
        Type: columnTypes.String,
    },
    ItemNumber: {
        Name: "Item",
        Field: "ItemExternalID",
        Type: columnTypes.String,
    },
    Quantity: {
        Name: "Quantity",
        Field: "UnitsQuantity",
        Type: columnTypes.Number,
    },
}
```

### Mapping

If a customer wants to use another column name in the uploading file you can change it easily. For example, you need to change the names of the "TransactionID", "ItemNumber" columns to "OrderNumber" and "Product". Go to the "columns" and change names as you can see on the screenshot and save changes. Now you can upload your file with the new column names.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/mapping.PNG)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/table-column_names.PNG)

### Additional fields

In case you need to add new additional columns, follow these instructions. In the example, we consider two situations: adding a header field and a line field. For headers we will add "TestPO" and for lines, we will add "LineRemark" fields. Go to the "columns" section and add new fields.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/new_columns.PNG)

Then you have to go to the "createTransaction" function where you need to define variables for the new fields. And specify your new fields in the object to create a transaction.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/variables.PNG)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/add_values_to_lines.PNG)

For line fields this will be enough. But for the header fields you need to go to the "Bulk Order Upload - Create Transaction" UI task ->"HTTP" and add your new field as shown in the screenshot.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/order_uploader.PNG)
