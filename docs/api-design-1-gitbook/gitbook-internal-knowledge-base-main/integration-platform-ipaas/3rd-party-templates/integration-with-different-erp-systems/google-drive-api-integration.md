# Google Drive API Integration

### Overview

This process allows you to connect your Google Drive account to Pepperi for tasks such as file access and synchronization. By enabling the Google Drive API and configuring OAuth 2.0 credentials, you can integrate Google Drive with Pepperi’s iPaaS module for seamless dataflow operations.

***

### Prerequisites

* A Google account with administrative access.
* Access to the Pepperi iPaaS module.

***

### Steps to Establish the Connection

#### Step 1: Log In to Your Google Account

* Log in to your Google account at [https://accounts.google.com.](https://accounts.google.com/)

#### Step 2: Access API and Services

* Visit the [Google Cloud Console](https://console.cloud.google.com/).
*   Click **API and Services** in the left-hand menu.<br>

    <figure><img src="../../../.gitbook/assets/image (13).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 3: Create a Project

*   Press **Select Project**.<br>

    <figure><img src="../../../.gitbook/assets/image (14).png" alt="" width="563"><figcaption></figcaption></figure>
*   Click **New Project**, enter a name (e.g., "Pepperi Google Drive Integration"), and create the project.<br>

    <figure><img src="../../../.gitbook/assets/image (15).png" alt="" width="563"><figcaption></figcaption></figure>

    <figure><img src="../../../.gitbook/assets/image (18).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 4: Enable the Google Drive API

*   Press **Enable APIs and Services**.<br>

    <figure><img src="../../../.gitbook/assets/image (16).png" alt="" width="563"><figcaption></figcaption></figure>
*   Search for **Google Drive API**, select it, and click **Enable**.<br>

    <figure><img src="../../../.gitbook/assets/image (17).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 5: Configure the Consent Screen

* In the left menu, navigate to **OAuth consent screen**.
* Configure the consent screen by providing an app name, support email, and other required details.
* Save and continue to the next step.

<figure><img src="../../../.gitbook/assets/image (19).png" alt="" width="563"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (20).png" alt="" width="563"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (21).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 6: Configure Scopes

* Under **Scopes**, add the necessary permissions for the Google Drive API.
*   Select all relevant scopes.<br>

    <figure><img src="../../../.gitbook/assets/image (22).png" alt="" width="563"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (23).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 7: Add Test Users

* In the **Test users** section, add the email addresses of users who will test the integration.
*   Save the changes.<br>

    <figure><img src="../../../.gitbook/assets/image (24).png" alt="" width="563"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (25).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 8: Create Credentials

*   Click **Create Credentials** in the left menu and select **OAuth 2.0 Client IDs**.<br>

    <figure><img src="../../../.gitbook/assets/image (26).png" alt="" width="563"><figcaption></figcaption></figure>

    <figure><img src="../../../.gitbook/assets/image (27).png" alt="" width="563"><figcaption></figcaption></figure>
*   Configure the redirect URI as:<br>

    `https://integration.pepperi.com/utils/oauth/AuthorizeOAuth2`

    <figure><img src="../../../.gitbook/assets/image (28).png" alt="" width="563"><figcaption></figcaption></figure>
*   Download the JSON file containing the client ID and secret.<br>

    <figure><img src="../../../.gitbook/assets/image (29).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 9: Set Up Dataflow Task

* Use the following [dataflow task](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90342) as a reference and copy it to your Pepperi environment:
  * Go to the dataflow task in iPaaS and press **Get Token** on the HTTP tab.
  * Fill in the details:
    * **Start Authorization URL:** https://accounts.google.com/o/oauth2/auth
    * **Get Access Token URL:** https://oauth2.googleapis.com/token
    * **Renew Access Token URL:** https://oauth2.googleapis.com/token
    * **Consumer Key:** Extract from the downloaded JSON file.
    * **Consumer Secret:** Extract from the downloaded JSON file.
    * **OAuth2 Scope:** https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/drive.readonly
    * **OAuth2 Access Type:** offline
  * Press **Continue** and confirm access when prompted.

<figure><img src="../../../.gitbook/assets/image (30).png" alt="" width="563"><figcaption></figcaption></figure>

***

### Google Drive - Tasks Examples

* **Based on API Documentation:** [https://developers.google.com/drive/api/reference/rest/v3/files](https://developers.google.com/drive/api/reference/rest/v3/files)
* **Example of a Task to Get List of Folders:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90342](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90342)
* **Example of a Task to Get Data Files of Folder:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90347](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90347)
* **Example of a Task to Get CSV Data File:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90349](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90349)
* **Example of a Task to Get List of Images in Images Folder:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90348](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90348)
* **Example of a Task to Get List of Image Links Within a Folder:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90345](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90345)
