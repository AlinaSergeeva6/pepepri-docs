---
description: >-
  This guide provides step-by-step instructions for integrating QuickBooks
  Online with Pepperi using OAuth 2.0, focusing on HTTP request configuration in
  dataflow tasks.
---

# QuickBooks Online API Integration

### Overview

This integration connects QuickBooks Online, a cloud-based ERP designed for small and medium-sized businesses, with Pepperi. It supports integration with third-party software and financial services (e.g., banks, payroll companies, and expense tools). Unlike QuickBooks Desktop, which uses dataflow tasks, QuickBooks Online relies on HTTP requests for data retrieval, authenticated via OAuth 2.0.

***

### Remarks

* **Target Audience:** QuickBooks Online is geared mainly toward small and medium-sized businesses and offers integration with other third-party software and financial services.
* **Difference from QuickBooks Desktop:**
  * QuickBooks Desktop provides data via dataflow tasks.
  * QuickBooks Online retrieves data through HTTP requests.
* **Authentication:** Authorization is managed using OAuth 2.0. Refer to the [guide on managing OAuth 2.0 connections](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/xero-integration/connection-to-xero-using-oauth-2.0.).
* **HTTP Request Configuration:**
  *   **companyID:** Each QuickBooks Online instance has a unique companyID, required in the HTTP request.<br>

      <figure><img src="../../../../.gitbook/assets/image (1516).png" alt="" width="563"><figcaption></figcaption></figure>
  *   **Query Example:** query=select \* from item STARTPOSITION {#page\_num#} retrieves all columns of items, with pagination support via STARTPOSITION.<br>

      <figure><img src="../../../../.gitbook/assets/image (1517).png" alt="" width="563"><figcaption></figcaption></figure>
  * **Important Note:** Using select \* from item is recommended. Specifying specific columns (e.g., select column1, column2 from item) often results in errors.
  * **Additional Settings:** Use the same settings as for QuickBooks (ensure OAuth 2.0 is configured and the HTTP request includes query=select\*).

***

### Steps to Establish the Integration

#### Step 1: Configure OAuth 2.0 Authentication

* Follow the OAuth 2.0 setup guide linked above to authenticate with QuickBooks Online.
* Obtain the companyID from the QuickBooks Online admin portal or API response.

#### Step 2: Set Up HTTP Request in Dataflow Task

* In Pepperi iPaaS, create a new dataflow task and navigate to the **HTTP** tab.
* Configure the HTTP request:
  * **URL:** https://quickbooks.api.intuit.com/v3/company/\<companyID>/query?query=select \* from item STARTPOSITION {#page\_num#}
  * **Method:** GET
  * **Headers:** Include the OAuth 2.0 access token (e.g., in the Authorization header).
* **Note:** Replace \<companyID> with the unique identifier for the customer’s QuickBooks Online instance.

#### Step 3: Test and Validate

* Run the dataflow task and verify the response contains the expected item data.
* Adjust pagination (STARTPOSITION) as needed for large datasets.

***

### Additional Resources

* **Source of Templates:** Integration Examples, folder 'QuickBooks (48191)':
  * [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57475](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57475)
  * [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57480](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57480)
* **To Know More About QuickBooks Online API:** \
  [https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/account](https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/account)
