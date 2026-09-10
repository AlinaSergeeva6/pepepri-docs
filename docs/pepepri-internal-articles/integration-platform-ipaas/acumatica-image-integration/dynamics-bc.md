---
title: "Dynamics BC"
order: 120
---
# Dynamics BC

### General Information

**Dynamics 365 Business Central (BC)** is an ERP system by Microsoft designed for small and medium-sized businesses. It provides tools to manage various business processes, including finance, supply chain, sales, project management, and operations. Dynamics BC uses oAuth 2.0 authentication (similar to Acumatica or MYOB Advanced). In order to access data in Dynamic BC we need to use Microsoft Authentication.

### Process of Dynamics BC Configuration

Configuration process includes multiple steps that are listed below.

1.  Request the Microsoft account credentials for the account where Dynamics BC is configured. Ensure that you have the appropriate permissions to proceed.
2.  If necessary, set up Two-Factor Authentication (2FA) using a compatible app, such as **Microsoft Authenticator**.
3.  Configure a new application in **Azure Active Directory** (if it has not already been done). For detailed instructions, refer to [this guide](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/dynamic-bc/dynamic-bc-azure-configuration).
4.  Update the Dynamics BC environment parameters to prepare for integration. This step is essential to establish a connection between the Dynamics BC environment and the Azure application. For more information, see [this article](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/dynamic-bc/dynamic-bc-configuration).
5.  Complete the IPaaS configuration, including dataflow tasks creation and authentication tokens generation. For detailed guidance, refer to [this resource](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/dynamic-bc/dynamic-bc-oauth-2.0-token-generation).

### Example: Getting Data from the ERP

To retrieve data from the configured Business Central environment, you need to obtain the URLs of the required queries. These queries can be found in the **Web Services** list, which is accessible via the search.

Locate the correct endpoint URL in the **OData v4** column. Copy this URL and paste it into the HTTP tab. Set the HTTP method to **GET** to retrieve the data.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-503.png)

Then using this URLs and Authentication Type = OAuth 2.0 you can get data from BC

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-504.png)
