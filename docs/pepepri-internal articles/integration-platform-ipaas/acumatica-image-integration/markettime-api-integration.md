---
title: "MarketTime API Integration"
description: "MarketTime is a B2B e-commerce platform designed to streamline marketing campaigns, manage leads, and optimize business processes. This guide explains how to integrate Pepperi with MarketTime using it"
order: 104
---
# MarketTime API Integration

*MarketTime is a B2B e-commerce platform designed to streamline marketing campaigns, manage leads, and optimize business processes. This guide explains how to integrate Pepperi with MarketTime using it*

### Overview

#### What is MarketTime?

MarketTime provides tools for B2B commerce, helping businesses manage sales, marketing, and operational workflows. Its API allows seamless integration with platforms like Pepperi for task automation and data synchronization.

!!!info
**Documentation:** [MarketTime API Documentation](https://markettime.com/api)
!!!

#### API Characteristics

-   **Architecture:** RESTful
-   **Data Format:** JSON (for both requests and responses)
-   **Rate Limits:** Recommended limit of 60 requests per minute to avoid HTTP 429 (Too Many Requests) errors.

!!!warning
#### Prerequisites

To integrate with MarketTime, the customer must provide:

-   **MarketTime Manufacturer ID:** The client ID in MarketTime (e.g., M123).
-   **whoAmI ID:** Represents a user or group of users (e.g., R456 for a Rep Group).
-   **API Key:** Required for authentication in API requests.

!!!

!!!info
#### Understanding {whoAmI}

The **{whoAmI}** placeholder in MarketTime API endpoints dynamically represents the account type and ID:

-   **M + ID** = Manufacturer (e.g., M123)
-   **R + ID** = Rep Group (e.g., R456)
-   **S + ID** = Salesperson (e.g., S789)
-   **B + ID** = Retailer (e.g., B321)

Replace **{whoAmI}** with the appropriate value based on the account type when configuring API requests.
!!!

---

### Step 1: Fetch Data with a Dataflow Task

A Dataflow Task in Pepperi retrieves data from MarketTime (e.g., orders) and imports it into Pepperi objects.

#### Configure the Dataflow Task

1.  **Create a Dataflow Task:**
    -   Go to Pepperi’s Integration module.
    -   Create a new task with the following settings:
        -   **Application:** Generic HTTP Connector
        -   **Source Object:** Generic Http Exporter
        -   **Target Object:** Select the desired Pepperi object (e.g., Pepperi Export Transaction Header).

2.  **Set Up the HTTP Request:**
    -   Navigate to the **HTTP** tab and configure:
        -   **Method:** POST
        -   **Authentication Type:** None
        -   **URL:** https://publicapi.markettime.com/mtpublic/api/v1/{whoAmI}/orders/get
            -   Replace {whoAmI} with the appropriate account ID (e.g., M123).

        -   **Headers:**

            ```
            x-api-key: [Your API Key]
            ```

        -   **Body:** Add filtering parameters for the search (e.g., {"status": "pending"}).

3.  **Add Paging Settings (if retrieving lists):**
    -   MarketTime limits the number of records per request to a maximum of 250 (default is 50).
    -   Include the following parameters in the URL for pagination:

        ```
        page_num_start=0&page_interval=250&offset={#page_num#}&recordSize=250
        ```

        -   Example URL with paging:

            ```
            https://publicapi.markettime.com/mtpublic/api/v1/M123/orders/get?page_num_start=0&page_interval=250&offset={#page_num#}&recordSize=250
            ```

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot_1.png)

a dataflow task example

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot_2.png)

paging settings

#### Example Dataflow Tasks

-   [Task 97902](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=97902https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=98023)
-   [Task 98023](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=97902https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=98023)

---

### Step 2: Send Data with a Webhook Task

A Webhook Task in Pepperi sends data (e.g., transaction updates) from Pepperi to MarketTime.

#### Configure the Webhook Task

1.  **Create a Webhook Task:**
    -   Go to Pepperi’s Integration module.
    -   Create a new task with the following settings:
        -   **Application:** Generic HTTP Connector
        -   **Source Object:** Pepperi Transaction Webhook
        -   **Target Object:** Generic Http Importer

2.  **Set Up the HTTP Request:**
    -   Navigate to the **HTTP** tab and configure:
        -   **Method:** POST
        -   **Authentication Type:** None
        -   **URL:** https://publicapi.markettime.com/mtpublic/api/v1/{whoAmI}/orders
            -   Replace {whoAmI} with the appropriate account ID (e.g., M123).

        -   **Headers:**

            ```
            x-api-key: [Your API Key]
            Content-Type: application/json
            ```

        -   **Body:** JSON data to send (e.g., {"order\_id": "123", "status": "shipped"}).

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot_3.png)

a webhook task example

#### Example Webhook Task

-   [Task 95331](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=95331)

---

### Step 3: Handle API Rate Limits

MarketTime enforces API rate limits to ensure system stability:

-   **Recommended Limit:** 60 requests per minute.
-   **Consequence of Exceeding:** HTTP 429 (Too Many Requests) errors, leading to temporary throttling.

#### Best Practices for Rate Limits

-   **Batch Requests:** Use recordSize=250 in Dataflow Tasks to maximize the number of records per request (MarketTime’s maximum limit).
-   **Monitor Usage:** Track the number of API calls to stay within the 60 requests/minute limit.
