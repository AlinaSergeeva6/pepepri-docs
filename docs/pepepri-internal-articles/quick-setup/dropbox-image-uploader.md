---
title: "Dropbox Image Uploader"
description: "This guide provides an overview and step-by-step instructions for configuring the Dropbox Image Uploader Quick Setup in Pepperi"
order: 47
---
# Dropbox Image Uploader

*This guide provides an overview and step-by-step instructions for configuring the Dropbox Image Uploader Quick Setup in Pepperi*

### Overview

The Dropbox Image Uploader Quick Setup allows you to configure automatic recurring uploads of images from your Dropbox folders to your Pepperi account. This feature supports:

-   Dropbox access for connecting to image location folder(s).
-   Mapping images to items using a specified field (e.g., Item Code or custom field).
-   Scheduling upload times or running uploads manually on demand.

---

### Prerequisites

-   Ensure access to the iPaaS module.
-   Verify you have the necessary permissions to configure activities and workflows.

---

### Dropbox Image Uploader Setup

#### Accessing the Setup

-   Navigate to **Settings -> iPaaS -> Quick Setup -> Dropbox Image Uploader**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-935.png)

-   **Install:** Click **Install** if the add-on is not yet installed.
-   **Launch:** Click **Launch** if it is already installed.
-   You can create multiple configurations (e.g., "Dropbox Brand Images", "Dropbox Custom Images") and upload them separately.
-   Add a new configuration or copy an existing one and modify it as needed.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-936.png)

-   **Note:** Click **Save** at the top of the page to save changes. Clicking **OK** or **Confirm** within configuration screens will not save changes.

#### Configuration Steps

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-937.png)

**General Tab**

-   **Path to Dropbox Folder:** Enter the path to the Dropbox folder with images, starting from the root (e.g., /Images/Products).
-   **Connection ID:** Assign a unique name for each configuration (e.g., "Dropbox Brand Images", "Dropbox Custom Images"), relevant only if using multiple Dropbox accounts.
    -   **Note:** Changing the name of an existing configuration requires re-connecting to Dropbox and saving the configuration.

-   **Connect to Dropbox:** Click this button to initiate authorization, redirecting you to the Dropbox authentication page.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-938.png)

-   After successful authorization, you will be redirected to a success page with your credentials.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-939.png)

**Configure Advanced Upload Settings Tab**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-940.png)

-   **Items Image Name Field:** Select the field to map image file names to items (e.g., Item Code, Item Image Code, or a custom field).
    -   **Note:** The value of this field will be compared with the image file name.

-   **Image Number Separator:** Specify a character (e.g., "\_", "-") to support multiple images (up to 6 per item).
    -   **Note:** Leave empty to upload only one main image per item.
    -   **Note:** Supports JavaScript regular expressions (e.g., /ab+c/).

-   **Default Time Delta, days:** Set the number of days within which images with modified dates in Dropbox will be re-uploaded (value must be between 1 and 99999).
    -   **Note:** Images older than this delta will not be re-uploaded.

-   **Image Number Compatibility:** Choose based on your file naming convention:
    -   **Disabled:** Supports main image file names as .jpg or \_1.jpg.
    -   **Enabled:** Requires main image file name to be .jpg.

**Upload Tab**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-941.png)

-   **Run Now:** Click to test the configuration and connection via a test scheduled job.

**Schedule Upload Tab:** Set up a schedule for recurring uploads.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-942.png)

-   Enter necessary parameters (e.g., Once every # of hours, Days of the Week).
-   Check the **Use Scheduler** box to create a scheduled job in iPaaS.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-943.png)

    Created job for images uploads

**Finalize Configuration**

-   Click **Save** at the top of the page to apply all changes.
-   Upon successful installation and configuration, a folder of dataflow tasks will appear in your iPaaS module.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-944.png)

---

### Test the Solution

1.  **Verify Installation:**
    -   Confirm the Dropbox Image Uploader is installed and accessible in iPaaS.

2.  **Test Connection:**
    -   Run the **Run Now** option and check for successful connection to Dropbox.

3.  **Validate Image Mapping:**
    -   Upload test images and verify they map correctly to items based on the selected field.

4.  **Check Scheduled Upload:**
    -   Set a schedule and confirm the job runs as expected in iPaaS.
