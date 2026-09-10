---
title: "Dynamics BC - Azure configuration"
description: "Effort Estimation: 8h"
order: 119
---
# Dynamics BC - Azure configuration

*Effort Estimation: 8h*

### Overview

Azure configuration is essential when integrating or customising Dynamics 365 Business Central because Dynamics BC relies on **Azure Active Directory (Azure AD)** and other Azure services for secure access, identity management, and API interaction. Here’s why it is necessary:

-   **OAuth 2.0 Authentication**: Azure AD is used to authenticate external applications and users. It ensures secure access to Dynamics BC resources.
-   **User Identity Management**: Azure AD manages user credentials and permissions for Dynamics BC, ensuring that only authorised users can access or modify data.
-   **Integration with External Applications:** Azure configuration allows you to register custom applications (App Registrations) that interact with Dynamics BC via APIs.

---

Follow the steps below to set up a new Dynamics 365 Business Central application in Azure or to modify an existing one.

### App Creation

Log in to the [https://portal.azure.com/](https://portal.azure.com/) using Microsoft credentials provided by the client

-   Search for App Registrations and click on it:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-505.png)

-   Click on **New registration** to register a new app:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-506.png)

-   Provide the needed configurations:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-507.png)

!!!info
*Name* - should be unique among your existing Azure applications, can be changed at any time.

*Supported account types* - for the first configuration and testing it's better to choose **Accounts in this organizational directory only**. Once requested it can be changed depending on app features and future requirements.

Provide IPaaS *redirect URI*: [https://integration.pepperi.com/mgr/OAuth2/AuthorizeOAuth2](https://integration.pepperi.com/mgr/OAuth2/AuthorizeOAuth2)
!!!

-   After successful registration you’ll be redirected to the App Overview page, where you can find useful information about your app (Application ID, redirect URIs etc.):

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-508.png)

### Authentication

-   Click on **Certificates & secrets** in the left sidebar and then click **New Client Secret**:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-509.png)

-   In the sidebar (appeared on the right) provide **client secret name** and setup **expiration period** (recommended to be 6 months due to security purposes).Then click on **Add**:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-510.png)

!!!danger
**Attention**!

Please, copy **client secret** value and store it somewhere separately (save as txt file for example), as it won’t be available on this page after short period of time
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-511.png)

Secret key which will be unavailable after short-while

### API Permissions

-   The next step is to configure API permissions for our Azure app. In the left sidebar click on API permissions and in the opened window click on Add a permission:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-512.png)

-   Select your target integration system - **Dynamics 365 Business Central**:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-513.png)

-   You’ll see two possible variants of permissions. We need to configure both of them, let’s start with **Delegated** permissions:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-514.png)

-   Select checkboxes with permissions listed below and click Add permissions:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-515.png)

-   Now click again on "**Add a permission"** → "**Dynamics 365 Business Central"** → "**Application permissions"** and select checkboxes with permissions listed below. Then click on Add permissions button:

![](https://alinasergeeva6.github.io/pepepri-docs/static/зображення_2024-03-07_162053353.png)

!!!warning
**Attention!**

Based on client’s Azure configuration you may need to grant consent for some permissions. Ask your Azure administrator to provide needed permissions for the app. If your account has an administration role - just click on "**Grant admin consent for …"** near the "**Add a permission button"**.

On the screenshot below you can see an example for user who is not an administrator and the button is disabled for him:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-516.png)
!!!

### API scope

-   Now let’s configure default API scope. In the left sidebar select "**Expose an API"** and then click on "**Add a scope"**:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-517.png)

-   Application (client) ID is set here automatically, check that this ID matches your target application ID (Overview tab). Then click on Save and continue:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-518.png)

-   Here is an example of scope creation parameters. Fill in the required fields and click on Add scope:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-519.png)

### Redirect URIs

-   In order to successfully retrieve data using Azure, we need to configure redirect URLs, which will save auth data to pepperi.
-   Go to the redirect URLs tab through "**Overview**" or "**Authentication**" tabs

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-520.png)

Here is the list of redirect URLs for the "**Web"** platform (including postman for testing purposes):

```
https://oauth.pstmn.io/v1/browser-callback
https://oauth.pstmn.io/v1/callback
https://integration.pepperi.com/mgr/OAuth2/AuthorizeOAuth2
https://businesscentral.dynamics.com
https://businesscentral.dynamics.com/OAuthLanding.htm
```

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-521.png)
