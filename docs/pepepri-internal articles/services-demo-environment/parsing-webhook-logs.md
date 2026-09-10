---
title: "Parsing Webhook Logs"
order: 16
---
# Parsing Webhook Logs

### Overview

This guide details a process for parsing webhook logs in the ***Services Demo Environment (7343) (30013939)*** to address failed webhook requests for a client's ERP. When a failed request returns a different response or status code, or when data needs to be uploaded to transaction fields, a group of dataflow tasks automates the retrieval and parsing of logs. This solution generates links, loads logs, and extracts necessary data using regex patterns.

---

### Data Parsing Process

#### How It Works

-   **Process Overview:**
    -   Collects all failed webhooks within a specified time period.
    -   Generates links for each failed execution's webhook log.
    -   Loads and parses each log using regex to extract required data.

-   **Tasks Overview:**
    -   **Dataflows:**
        -   **Parse Webhook Logs - Get All Failed Transactions By Date Range:** Retrieves failed transaction webhooks.
        -   **Parse Webhook Logs - Generate Logs Links:** Creates links to logs for each transaction log UUID.
        -   **Parse Webhook Logs - Get Links for JS:** Prepares data from the link generation task for JS processing.
        -   **Parse Webhook Logs - Generate Final Report:** Fetches and parses logs with customizable regex patterns.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-990.png)

    -   **Webhook:**
        -   **Parse Webhook Logs - Webhook:** Demonstrates functionality (adapt to your environment's webhook).

#### Task Details

1.  **Parse Webhook Logs - Get All Failed Transactions By Date Range**
    -   **Purpose:** Retrieves all failed transaction webhooks.
    -   **Parameters (Client-Specific):**
        -   ClientID: ID of the client's environment.
        -   SearchFromDate: Start date for searching failed transactions.
        -   SearchToDate: End date for the search.
        -   ClientTask\_TaskName: Name of the webhook failed transaction to target.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-991.png)

2.  **Parse Webhook Logs - Generate Logs Links**
    -   **Purpose:** Generates links to logs for each transaction log UUID.
    -   **Action:** No changes required.

3.  **Parse Webhook Logs - Get Links for JS**
    -   **Purpose:** Prepares data from the "Generate Logs Links" task for faster JS retrieval.
    -   **Action:** No changes required.

4.  **Parse Webhook Logs - Generate Final Report**
    -   **Purpose:** Fetches logs from generated links and parses them using regex patterns.
    -   **Customization:** Open the JS Script tab, locate the regexList variable, and update the array with desired patterns to parse log data

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-992.png)

    -   **Example:**
        -   When a webhook fails, we receive this log
        -   That contains this data

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-993.png)

        -   So while parsing this log by user-selected regex, we can obtain any necessary information from the response, such as response code, response body, etc.
        -   In our example, we extract text from the h1 HTML tag that contains info about the error that occurred during execution.
        -   And as the final report, we receive this CSV

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-994.png)

#### Copying to Another Environment

-   **Action:** Copy the ***scheduled job 'Parse Webhook Logs'*** from the ***Services Demo Environment*** to your environment and configure the dataflow tasks for your specific use case.

---

### Additional Features

-   **Description:** To retrieve failed logs from multiple webhooks, modify the JSON in the HTTP tab of the 'Parse Webhook Logs - Get All Failed Transactions By Date Range' task to include additional webhook names.
-   **Configuration:**

    ```
    {
      "take": 250,
      "skip": 0,
      "page": 1,
      "pageSize": 250,
      "filter": {
        "field": "TransactionStatusId",
        "operator": "eq",
        "value": 2,
        "logic": "or",
        "filters": [
          {
            "field": "ClientTask_TaskName",
            "operator": "eq",
            "value": "[Webhook name 1]"
          },
          {
            "field": "ClientTask_TaskName",
            "operator": "eq",
            "value": "[Webhook name 2]"
          }
        ]
      }
    }
    ```

-   **Action:** Replace \[Webhook name 1\] and \[Webhook name 2\] with the actual names of the webhooks you want to monitor.

---

### Attachment

29KB

[Log Example.txt](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FsMa6WAnPjLHYcQvXuBHG%2FLog%20Example.txt?alt=media&token=6feda0b4-c759-48dd-a5dc-be8c8ad5ba9b)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FsMa6WAnPjLHYcQvXuBHG%2FLog%20Example.txt?alt=media&token=6feda0b4-c759-48dd-a5dc-be8c8ad5ba9b)
