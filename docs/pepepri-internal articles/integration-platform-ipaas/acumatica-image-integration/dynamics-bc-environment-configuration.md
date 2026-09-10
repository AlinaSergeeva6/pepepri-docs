---
title: "Dynamics BC - Environment Configuration"
description: "Effort Estimation: 1h"
order: 118
---
# Dynamics BC - Environment Configuration

*Effort Estimation: 1h*

### Overview

Configuring Dynamics 365 Business Central to link with an Azure App is a critical step to enable secure and functional integrations. Within the BC environment, this setup allows the system to communicate with external services and tools using APIs while maintaining data security through Azure AD. It ensures that your BC instance is properly prepared to handle authentication tokens and API requests, enabling smooth data exchange.

### App Creation

Log in to the [https://businesscentral.dynamics.com/](https://businesscentral.dynamics.com/) using Microsoft credentials provided by the client.

Go to search panel and type: a) In old BC versions - **Azure Active Directory Applications**:

![](/static/image-522.png)

b) In new BC versions - **Microsoft Entra** **Applications**:

![](/static/image-523.png)

After update on April 2024 **Azure Active Directory Applications** was changed to **Microsoft Entra** **Applications**, but the configuration process remains the same. So all further steps are identical for both versions.

Click on **New** to add a new app:

![](/static/image-524.png)

Configure the app with your existing **Client ID** from Azure - Application (client) ID. Then add a **Description** (name):

![](/static/image-525.png)

Now switch the **State** to *Enabled* value and submit the popup.

### Permissions Configuration

After that you need to configure permissions. In the **User Permission Sets** section click on empty row - then push on 3 dots and select the needed permissions from the popup list:

![](/static/image-526.png)

For basic configuration specify the following permissions:

![](/static/image-527.png)
