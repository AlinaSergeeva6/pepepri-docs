---
description: 'Effort Estimation: 1h'
---

# Dynamics BC - Environment Configuration

### Overview

Configuring Dynamics 365 Business Central to link with an Azure App is a critical step to enable secure and functional integrations. Within the BC environment, this setup allows the system to communicate with external services and tools using APIs while maintaining data security through Azure AD. It ensures that your BC instance is properly prepared to handle authentication tokens and API requests, enabling smooth data exchange.



### App Creation

Log in to the [https://businesscentral.dynamics.com/](https://businesscentral.dynamics.com/) using Microsoft credentials provided by the client.

Go to search panel and type:\
a) <mark style="background-color:orange;">In old BC versions</mark> - **Azure Active Directory Applications**:

<figure><img src="../../../../.gitbook/assets/image (1442).png" alt=""><figcaption></figcaption></figure>

b) <mark style="background-color:orange;">In new BC versions</mark> - **Microsoft Entra** **Applications**:

<figure><img src="../../../../.gitbook/assets/image (609).png" alt=""><figcaption></figcaption></figure>

After update on April 2024 **Azure Active Directory Applications** was changed to **Microsoft Entra** **Applications**, but the configuration process remains the same. So all further steps are identical for both versions.



Click on **New** to add a new app:

<figure><img src="../../../../.gitbook/assets/image (1443).png" alt=""><figcaption></figcaption></figure>

Configure the app with your existing **Client ID** from Azure - Application (client) ID. Then add a **Description** (name):

<figure><img src="../../../../.gitbook/assets/image (1444).png" alt=""><figcaption></figcaption></figure>

Now switch the **State** to _Enabled_ value and submit the popup.



### Permissions Configuration

After that you need to configure permissions. In the **User Permission Sets** section click on empty row - then push on 3 dots and select the needed permissions from the popup list:

<figure><img src="../../../../.gitbook/assets/image (1445).png" alt=""><figcaption></figcaption></figure>

For basic configuration specify the following permissions:

<figure><img src="../../../../.gitbook/assets/image (1446).png" alt=""><figcaption></figcaption></figure>
