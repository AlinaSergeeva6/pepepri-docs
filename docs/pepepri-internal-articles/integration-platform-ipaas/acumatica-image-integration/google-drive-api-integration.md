---
title: "Google Drive API Integration"
order: 108
---
# Google Drive API Integration

### Overview

This process allows you to connect your Google Drive account to Pepperi for tasks such as file access and synchronization. By enabling the Google Drive API and configuring OAuth 2.0 credentials, you can integrate Google Drive with Pepperi’s iPaaS module for seamless dataflow operations.

---

### Prerequisites

-   A Google account with administrative access.
-   Access to the Pepperi iPaaS module.

---

### Steps to Establish the Connection

#### Step 1: Log In to Your Google Account

-   Log in to your Google account at [https://accounts.google.com.](https://accounts.google.com./)

#### Step 2: Access API and Services

-   Visit the [Google Cloud Console](https://console.cloud.google.com/).
-   Click **API and Services** in the left-hand menu.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-574.png)

#### Step 3: Create a Project

-   Press **Select Project**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-575.png)

-   Click **New Project**, enter a name (e.g., "Pepperi Google Drive Integration"), and create the project.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-576.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-577.png)

#### Step 4: Enable the Google Drive API

-   Press **Enable APIs and Services**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-578.png)

-   Search for **Google Drive API**, select it, and click **Enable**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-579.png)

#### Step 5: Configure the Consent Screen

-   In the left menu, navigate to **OAuth consent screen**.
-   Configure the consent screen by providing an app name, support email, and other required details.
-   Save and continue to the next step.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-580.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-581.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-582.png)

#### Step 6: Configure Scopes

-   Under **Scopes**, add the necessary permissions for the Google Drive API.
-   Select all relevant scopes.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-583.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-584.png)

#### Step 7: Add Test Users

-   In the **Test users** section, add the email addresses of users who will test the integration.
-   Save the changes.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-585.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-586.png)

#### Step 8: Create Credentials

-   Click **Create Credentials** in the left menu and select **OAuth 2.0 Client IDs**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-587.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-588.png)

-   Configure the redirect URI as:

    `https://integration.pepperi.com/utils/oauth/AuthorizeOAuth2`

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-589.png)

-   Download the JSON file containing the client ID and secret.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-590.png)

#### Step 9: Set Up Dataflow Task

-   Use the following [dataflow task](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90342) as a reference and copy it to your Pepperi environment:
    -   Go to the dataflow task in iPaaS and press **Get Token** on the HTTP tab.
    -   Fill in the details:
        -   **Start Authorization URL:** https://accounts.google.com/o/oauth2/auth
        -   **Get Access Token URL:** https://oauth2.googleapis.com/token
        -   **Renew Access Token URL:** https://oauth2.googleapis.com/token
        -   **Consumer Key:** Extract from the downloaded JSON file.
        -   **Consumer Secret:** Extract from the downloaded JSON file.
        -   **OAuth2 Scope:** https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive.readonly
        -   **OAuth2 Access Type:** offline

    -   Press **Continue** and confirm access when prompted.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-591.png)

---

### Google Drive - Tasks Examples

-   **Based on API Documentation:** [https://developers.google.com/drive/api/reference/rest/v3/files](https://developers.google.com/drive/api/reference/rest/v3/files)
-   **Example of a Task to Get List of Folders:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90342](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90342)
-   **Example of a Task to Get Data Files of Folder:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90347](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90347)
-   **Example of a Task to Get CSV Data File:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90349](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90349)
-   **Example of a Task to Get List of Images in Images Folder:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90348](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90348)
-   **Example of a Task to Get List of Image Links Within a Folder:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90345](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90345)
