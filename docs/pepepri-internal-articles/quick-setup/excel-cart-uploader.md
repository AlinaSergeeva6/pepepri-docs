---
title: "Excel Cart Uploader"
description: "This guide provides an overview and step-by-step instructions for configuring the Excel Cart Uploader in Pepperi."
order: 46
---
# Excel Cart Uploader

*This guide provides an overview and step-by-step instructions for configuring the Excel Cart Uploader in Pepperi.*

### Overview

The Excel Cart Uploader allows your customers to upload orders using a familiar and convenient Excel file, which is then converted into a Pepperi order. After uploading, users are redirected to the shopping cart. This feature supports multiple configurations tailored to different Transaction Types, enhancing flexibility for various use cases.

---

### Prerequisites

-   Ensure access to the iPaaS module.
-   Verify you have the necessary permissions to configure activities and workflows.

---

### Excel Cart Uploader Setup

#### Accessing the Setup

-   Navigate to **Settings -> iPaaS -> Quick Setup -> Excel Cart Uploader**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-945.png)

-   **Install:** Click **Install** if the add-on is not yet installed.
-   **Launch:** Click **Launch** if it is already installed.
-   You can create multiple configurations for use with different Transaction Types.
-   Add a new configuration or copy an existing one and modify it as needed.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-946.png)

-   **Note:** Click **Save** at the top of the page to save changes. Clicking **OK** or **Confirm** within configuration screens will not save changes.

#### Configuration Steps

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-947.png)

**General Tab**

-   **Select Transaction:** Choose the Transaction Type (e.g., Sales Order, B2B Order) that will be updated with the uploaded Excel data.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-948.png)

**Excel Fields Mappings Tab**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-949.png)

-   **Configure Mappings:** Define the mappings between Excel columns and transaction fields.
    -   **Column Name:** Enter the equivalent name from the uploaded Excel sheet.
    -   **Source Field:** Specify the transaction field where the Excel value will be populated.

-   **Add Field:** Click **Add** to include a new field in the uploader configuration.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-950.png)

-   **Edit Field:** Click **Edit** to update the Column Name or Source Field as needed.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-951.png)

**Advanced Tab**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-952.png)

-   **Settings Description:**
    -   **Allow Excel Upload Multiple Times:** Enable to permit multiple uploads of Excel files.
    -   **Display Tutorial:** Show a tutorial when the uploader opens.
    -   **Append Cart:** (Unclear intent; assume related to quantity handling—see below.)
    -   **When Allow Upload Excel Multiple Times is Enabled, Allow to Append/Overwrite Quantities in Excel:**
        -   If true, subsequent files append quantities to existing ones in scope.
        -   If false, subsequent files overwrite existing values.

**Finalize Configuration**

-   Click **Save** at the top of the page to apply all changes.
-   Upon successful installation and configuration, UI tasks will appear in your iPaaS module.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-953.png)

#### Next Steps: Integrate with Transaction

1.  **Create Custom Form with UI Task:**
    -   In the **General Tab**, locate the message: "Copy the HTML code by clicking here and insert it into the custom form in the selected transaction."
    -   Click the icon to copy the UI task code.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-954.png)

2.  **Add Program to Transaction Type:**
    -   Go to **Sales Activities -> Transaction Types -> &lt;Your Transaction>**.
    -   Navigate to the **Programs** tab.
    -   Click **+Program**.
    -   Enter required values (e.g., program name, description).
    -   Add a new **Custom Form Action** and paste the copied UI task code.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-955.png)

3.  **Add to Order Center Menu:**
    -   Go to the **Views Tab -> Menu -> Order Center Menu**.
    -   Add the newly created program to the required user profiles.

---

### Test the Solution

1.  **Verify Installation:**
    -   Confirm the Excel Cart Uploader is installed and accessible in iPaaS.

2.  **Test Upload:**
    -   Upload a test Excel file and verify it converts to a Pepperi order.

3.  **Check Mapping:**
    -   Ensure Excel column mappings populate the correct transaction fields.

4.  **Validate Redirection:**
    -   Confirm the user is redirected to the shopping cart after upload.

5.  **Test Multiple Uploads:**
    -   Enable "Allow Excel Upload Multiple Times" and test append/overwrite behavior.

---

### Known Issues

-   **Multiple Uploads with Same Filename:** The current setup does not allow uploading a file multiple times with the same filename. To address this, add the following condition to the `handleFile` function in the UI task code:

    ```
    $("#select").prop("value", ""); // Clear the file input after upload
    ```

    This ensures the file input is cleared after each upload, allowing subsequent uploads with the same filename.
