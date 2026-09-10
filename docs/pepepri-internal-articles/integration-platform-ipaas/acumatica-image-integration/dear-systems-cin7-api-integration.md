---
title: "DEAR Systems (Cin7) API Integration"
description: "This guide provides step-by-step instructions for integrating DEAR Systems (also known as Cin7), a cloud inventory management software for eCommerce, with Pepperi using the DEAR Systems API (V2)."
order: 106
---
# DEAR Systems (Cin7) API Integration

*This guide provides step-by-step instructions for integrating DEAR Systems (also known as Cin7), a cloud inventory management software for eCommerce, with Pepperi using the DEAR Systems API (V2).*

### Overview

The DEAR Systems API (V2) enables management of eCommerce enterprise resource planning (ERP) data, including invoices, customers, suppliers, and additional business operations. It accepts only JSON data format and offers advanced functionality with recent system updates. DEAR Systems, also branded as Cin7, is a cloud-based inventory management solution. This integration allows Pepperi to connect with DEAR Systems via HTTP requests for data synchronization.

---

### Prerequisites

-   A DEAR Systems (Cin7) account.
-   Access to the Pepperi iPaaS module.
-   The customer must provide the developer with:
    -   DEAR Account ID
    -   API Application Key
    -   URL for requests
    -   Or, alternatively, provide admin access to the system.

---

### Steps to Establish the Integration

#### Step 1: Obtain and Store Credentials

-   **Credential Acquisition:**
    -   The customer must provide the DEAR Account ID, API Application Key, and request URL.
    -   Alternatively, create a new integration account:
        -   Go to the [API setup page](https://inventory.dearsystems.com/ExternalAPI.).
        -   Create the account, save it, and retrieve the credentials (DEAR Account ID and API Application Key).

            ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-602.png)

-   **Store Credentials:**
    -   Navigate to **General Settings** in Pepperi iPaaS.
    -   Store the DEAR Account ID and API Application Key.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-603.png)

#### Step 2: Configure Dataflow or Webhook Task

-   Create a new dataflow task or webhook task in Pepperi iPaaS.
-   Set the following settings:
    -   **Application:** Generic HTTP Connector
    -   **Source Object:** Generic Http Exporter
    -   **Target Object:** Pepperi Export User Defined Table

#### Step 3: Configure HTTP Tab

-   Specify the type of HTTP request (e.g., GET, POST) based on your needs.
-   Insert the URL into the URL placeholder, incorporating paging and data limit per page.
    -   **Configure URL with API Explorer:**
        -   To configure the URL to get data, you can go to the API explorer and select an API version, an endpoint, and a method. Then you can add additional parameters and pagination. You can copy the request URL or test the query with the Execute button.

            ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-604.png)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-605.png)

    -   Example:
        -   https://inventory.dearsystems.com/dearapi/{someData}?page={#page\_num#}&limit={some number}
        -   Replace {someData} with the appropriate API endpoint (e.g., /SaleOrder, /Product).

-   Add the DEAR Account ID and API Application Key to the headers section:
    -   api-auth-accountid: !%connection\_param\_1%!
    -   api-auth-applicationkey: !%connection\_param\_2%!

-   **Optional Body:** If a request body is needed, ensure it is in JSON format, as the API accepts only JSON data.

#### Step 4: Test the Configuration

-   Run the task or webhook to verify the connection and data retrieval.
-   Adjust the URL parameters (e.g., page number, limit) as needed.

---

### Additional Resources

-   **Documentation:** [API details](https://dearinventory.docs.apiary.io/#).
-   **API Explorer:** Use the API explorer in the DEAR Systems/Cin7 portal to select the API version, endpoint, method, and add pagination parameters. Test queries with the Execute button and copy the request URL.
