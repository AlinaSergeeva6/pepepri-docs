---
title: "Bulk(Excel) Cart Uploader"
description: "Estimated Implementation Time: ~1 hour"
order: 42
---
# Bulk(Excel) Cart Uploader

*Estimated Implementation Time: ~1 hour*

### Overview

The **Bulk Cart Uploader** is a Pepperi UI Task that enables users to upload a file (XLSX, XLS, CSV, TXT, or JSON) containing item SKUs and quantities to update a transaction's cart. This feature streamlines bulk updates to the cart and can be integrated into the Order Center menu, Cart menu, as a workflow action, or as a button on a custom homepage.

Users download a template, fill it with item details, upload it via the UI Task, and review the data in a Kendo Grid before updating the cart. If errors occur (e.g., invalid quantities or missing columns), they are displayed in the grid for correction.

![](https://alinasergeeva6.github.io/pepepri-docs/static/22332.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image7-43.png)

---

### Advantages and Disadvantages

#### Advantages

-   **Bulk Updates**: Add or update multiple items in a single action.
-   **Flexible File Formats**: Supports XLSX, XLS, CSV, TXT, and JSON.
-   **Interactive UI**: View and edit uploaded data in a Kendo Grid before updating the cart.
-   **Configurability**: Customize columns, filters, and additional fields from Pepperi.
-   **Error Handling**: Displays detailed errors for invalid items or quantities.

#### Disadvantages

-   **No Offline Support**: Requires an internet connection.
-   **Delayed Sync**: Other users won't see updates until the device is synced.
-   **iPaaS Dependency**: Cannot be implemented without Pepperi iPaaS.
-   **Limited Quantity Fields**: The default implementation supports only one quantity field (UnitsQuantity).

---

### Demo: How It Works

Follow these steps to test the Bulk Cart Uploader in the Services Demo Environment:

1.  Open a **Sales Order** transaction from the homepage.
2.  In the **Order Center**, click the top-right menu and select **Bulk Cart Upload**.
3.  Download a template (XLSX, XLS, CSV, TXT, or JSON) from the links at the top of the UI Task.
4.  Fill the template with item SKUs (in the ItemNumber column) and quantities (in the Quantity column). Ensure:
    -   SKUs exist in Pepperi.
    -   Quantities are positive numbers.
    -   The SKU column is formatted as text to preserve leading zeros.

5.  Click **Upload File**, select your filled template, and wait for the Kendo Grid to display the data.
6.  Review the grid. If any columns are missing or quantities are invalid, an alert will appear.
7.  Click **Update Cart** and wait for a popup (do not close the form).
    -   If all items are valid, a **Success** popup appears, and the cart is updated.
    -   If some items fail (e.g., invalid SKUs or quantities), an **Error** popup appears, and the grid highlights errors in red with details in the Message column.

8.  Correct errors in the grid or upload a new file, then click **Update Cart** again.
9.  Review the updated items in the transaction cart.

!!!info
**Note**: If an item already exists in the cart, the uploaded quantity is added to the existing quantity (unless isOverwriteQty is set to true).
!!!

---

### How to Deploy to Another Environment

To deploy the Bulk Cart Uploader to a new Pepperi environment:

1.  **Copy the UI Task**:
    -   Access the UI Task in the Services Demo Environment: UI Task Link.
    -   Copy the task to your environment using the Pepperi Plugin Settings.

2.  **Create a Program**:
    -   In your environment, create a new program in the Pepperi Admin.
    -   Add a **Custom Form** action.
    -   Embed the copied UI Task into the custom form.

3.  **Integrate the Program**:
    -   Add the program to the desired location (e.g., Order Center menu, Cart menu, or as a workflow action).
    -   Save and publish the changes.

4.  **Verify Setup**:
    -   Open the transaction in your environment.
    -   Ensure the UI Task loads and displays the file upload interface.
    -   Test with a sample file to confirm the grid renders and the cart updates.

**Troubleshooting**:

-   If the UI Task fails to load, check the browser console for errors (e.g., missing Kendo UI or XLSX libraries).
-   Ensure the transaction UUID is accessible via pepperi.app.getContext.

---

### Advanced Configuration

The Bulk Cart Uploader is highly configurable to meet client requirements. Below are the key settings, defined in the global object of the UI Task script.

#### Defining File Columns

Specify the required columns in the uploaded file. If any defined column is missing, the file is rejected, and an alert is displayed.

**Example**:

```
columns: {
  ItemNumber: {
    Name: "Item Number",
    Validation: false // Do not change; used internally
  },
  Quantity: {
    Name: "Quantity",
    Validation: false // Do not change; used internally
  }
}
```

**Options**:

-   **Key**: Column name in the file (e.g., ItemNumber).
-   **Name**: Display name in the Kendo Grid (e.g., Item Number).
-   **Validation**: Internal flag (always false initially; set to true during validation).

**Notes**:

-   The default setup expects one SKU column (ItemNumber) and one quantity column (Quantity).
-   Adding more columns is possible but not recommended due to UI complexity.
-   To support multiple quantity fields, custom development is required.

#### Defining Pepperi Columns

Add columns to the Kendo Grid with data from Pepperi’s TransactionScopeItems API. This is useful for displaying additional item details (e.g., item name, category) without requiring them in the file.

**Example**:

```
fieldsFromPepperi: [
  { Name: "Name", Field: "ItemName" },
  { Name: "Main Category", Field: "ItemMainCategory" },
  { Name: "Account External ID", Field: "TransactionAccountExternalID" }
]
```

**Options**:

-   **Name**: Column name in the Kendo Grid.
-   **Field**: API field name from TransactionScopeItems (e.g., ItemName).

**Notes**:

-   Ensure the specified fields exist in Pepperi; otherwise, the column will be empty.
-   Fields are read-only in the grid.

#### Filtering Items on Upload

Apply filters to prevent certain items from being added to the cart, even if they exist in Pepperi. This is useful for aligning with transaction line filters.

**Example**:

```
isShowFilteredItemsInTable: true, // Show filtered items in the grid (marked as "~Filtered")
filterItemCartUpload: [
  {
    ApiName: "ItemExternalID",
    Operation: "IsEqual",
    Values: ["HT3001"]
  }
]
```

**Options**:

-   **isShowFilteredItemsInTable**:
    -   true: Display filtered items in the grid (marked with ~Filtered in the SKU).
    -   false: Hide filtered items and do not add them to the cart.

-   **filterItemCartUpload**: Array of Pepperi API filters (default operation is AND).
    -   **ApiName**: Field to filter (e.g., ItemExternalID).
    -   **Operation**: Filter operation (e.g., IsEqual, Contains).
    -   **Values**: Array of values to filter against.

**Notes**:

-   To disable filtering, set filterItemCartUpload to an empty array (\[\]).
-   Filters are applied during the validateCurrentCart function.

![](https://alinasergeeva6.github.io/pepepri-docs/static/1122333.png)

#### Quantity Handling

-   **isOverwriteQty**:
    -   true: Overwrite existing quantities in the cart with the uploaded values.
    -   false (default): Add uploaded quantities to existing ones.

-   **Validation**:
    -   Quantities must be non-negative numbers.
    -   Quantities are validated against ItemCaseQuantity (if defined in Pepperi). If not divisible, the quantity is rounded up to the nearest multiple.

**Example**: If ItemCaseQuantity = 6 and the uploaded quantity is 10, it is adjusted to 12 (the next multiple of 6).

---

### Adding a Button on a Custom Homepage

To add the Bulk Cart Uploader as a button on a custom homepage (e.g., in the 'B2B Order' transaction between 'New' and 'In Creation' workflow steps):

1.  **Copy Workflow Configuration**:
    -   In the Services Demo Environment, copy the workflow configuration for the 'B2B Order' transaction.
    -   Ensure the workflow includes a custom form action for the UI Task.

2.  **Create Transaction Fields**:
    -   Add the following fields to the transaction in your environment:
        -   TSANavigationToCart (boolean): Tracks navigation to the cart.
        -   TSASelectUploadExcelBranch (boolean): Indicates the upload branch.
        -   TSAUploadFileStatus (string): Stores the upload status.

3.  **Implement Button Logic**:
    -   On the custom homepage, add an button.
    -   On button click, set a flag in sessionStorage that this is upload excel
        -   ```
            sessionStorage.setItem('UploadBranch', 'UploadExcel')
            ```

    -   Create a workflow action (between 'New' and 'In Creation') that checks sessionStorage
        -   If it is true, it means we need to follow 'upload excel' workflow,
        -   Otherwise we need to skip upload excel and navigate to the order center.

4.  **Add Redirect Form**:

-   Create a second custom form to redirect to the cart after the upload is complete.
-   Use TSANavigationToCart to trigger the redirect.

**Notes**:

-   On iPads, sessionStorage will not persist, causing the upload button to fail.
    -   So if we are following 'upload excel' workflow - we need to add custom form with UI task and another custom form which will redirect to cart

-   Test the workflow thoroughly to ensure the correct form is opened.
