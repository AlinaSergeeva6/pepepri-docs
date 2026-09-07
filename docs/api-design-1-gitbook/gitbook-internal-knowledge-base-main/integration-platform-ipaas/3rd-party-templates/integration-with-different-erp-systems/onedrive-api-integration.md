---
description: >-
  This guide provides step-by-step instructions for establishing a connection
  with OneDrive to enable integration with Pepperi.
---

# OneDrive API Integration

### Overview

This process allows you to connect your personal OneDrive account to Pepperi for tasks such as file access and synchronization. By registering an app in the Azure portal, configuring OAuth 2.0 credentials, and setting up dataflow tasks, you can integrate OneDrive with Pepperi’s iPaaS module for seamless operations.

***

### Prerequisites

* A personal Microsoft account with access to OneDrive.
* Access to the Pepperi iPaaS module.

***

### Steps to Establish the Connection

#### Step 1: Log In to OneDrive

* Log in to your personal OneDrive account via the [Azure portal](https://portal.azure.com/).

#### Step 2: Register a New Application

*   Press **New Registration** in the Azure Active Directory section.<br>

    <figure><img src="../../../.gitbook/assets/image (1504).png" alt="" width="563"><figcaption></figcaption></figure>
*   Provide the following details:<br>

    * **Name:** Enter a descriptive name (e.g., "Pepperi").
    * **Supported account types:** Select an appropriate option (e.g., "Personal Microsoft accounts only").
    * **Redirect URI:** Enter https://integration.pepperi.com/utils/oauth/AuthorizeOAuth2 and select "Web" as the platform.

    <figure><img src="../../../.gitbook/assets/image (1505).png" alt="" width="563"><figcaption></figcaption></figure>
* Submit the registration.

#### Step 3: Access App Overview

* After successful registration, you’ll be redirected to the **App Overview** page.
* Note the **Application (Client) ID** and other details (e.g., redirect URLs) for future use.

#### Step 4: Generate Client Secret

*   In the left sidebar, click **Certificates & secrets**.<br>

    <figure><img src="../../../.gitbook/assets/image (1506).png" alt="" width="563"><figcaption></figcaption></figure>
* Click **New Client Secret**.
* Add a description and set an expiration period, then click **Add**.
* Copy the **Value** (e.g., zSe8Q\~Hk-1.G9f7xHDY1jN9dLHWnDIYgLa.vrbW\_) and save it securely.
  *   **Secret ID:** 5ec67bd4-9015-40bc-80c5-32b8454c9411 (for reference).<br>

      <figure><img src="../../../.gitbook/assets/image (1507).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 5: Configure API Permissions

* Go to **API permissions** in the left sidebar.
*   Click **Add a permission** and select **Microsoft Graph**.<br>

    <figure><img src="../../../.gitbook/assets/image (1508).png" alt="" width="563"><figcaption></figcaption></figure>
*   Choose the appropriate permissions (e.g., Files.ReadWrite.All) and grant admin consent if required.<br>

    <figure><img src="../../../.gitbook/assets/image (1509).png" alt="" width="563"><figcaption></figcaption></figure>

    <figure><img src="../../../.gitbook/assets/image (1510).png" alt="" width="563"><figcaption></figcaption></figure>

#### Step 6: Expose an API and Add Scope

*   Navigate to **Expose an API** in the left sidebar<br>

    <figure><img src="../../../.gitbook/assets/image (1513).png" alt="" width="563"><figcaption></figcaption></figure>
*   Click **Add a scope** and configure:<br>

    * **Scope Name:** api://aa965841-0806-4e67-85ff-9b7b1e460073
    * Set other required details (e.g., admin consent, description).

    <figure><img src="../../../.gitbook/assets/image (1512).png" alt="" width="563"><figcaption></figcaption></figure>
* Save the changes.

#### Step 7: Configure Dataflow Task

*   In Pepperi iPaaS, go to the dataflow task and press **Get Token** on the HTTP tab.<br>

    <figure><img src="../../../.gitbook/assets/image (1514).png" alt="" width="450"><figcaption></figcaption></figure>
* Fill in the details:
  * **Start Authorization URL:** https://login.live.com/oauth20\_authorize.srf
  * **Get Access Token URL:** https://login.live.com/oauth20\_token.srf
  * **Renew Access Token URL:** https://login.live.com/oauth20\_token.srf
  * **Consumer Key:** Extract from the **Application (Client) ID** on the App Overview page.
  * **Consumer Secret:** Use the previously generated secret value (e.g., zSe8Q\~Hk-1.G9f7xHDY1jN9dLHWnDIYgLa.vrbW\_).
  * **OAuth2 Scope:** https://graph.microsoft.com/.default offline\_access
* Press **Continue** and confirm access when prompted.

***

### OneDrive - Tasks Examples

* **Feature Note:** OneDrive provides open links to download files, facilitating easy access.
* **Example of a Task to Get List of All Drives Available:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90360](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90360)
* **Example of a Task to Get List of Folders:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90361](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90361)
* **Example of a Task to Get Image Links Within a Folder:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90362](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90362)
* **Example of a Task to Get Data Folder Content:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90363](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90363)
* **Example of a Task to Download CSV File to Pepperi:**\
  [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90364](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90364)
