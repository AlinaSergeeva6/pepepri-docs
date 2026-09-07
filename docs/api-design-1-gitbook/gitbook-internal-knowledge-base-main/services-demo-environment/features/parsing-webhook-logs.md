---
layout:
  width: default
  title:
    visible: true
  description:
    visible: false
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
  metadata:
    visible: true
  tags:
    visible: true
  actions:
    visible: true
---

# Parsing Webhook Logs

### Overview

This guide details a process for parsing webhook logs in the _**Services Demo Environment (7343) (30013939)**_ to address failed webhook requests for a client's ERP. When a failed request returns a different response or status code, or when data needs to be uploaded to transaction fields, a group of dataflow tasks automates the retrieval and parsing of logs. This solution generates links, loads logs, and extracts necessary data using regex patterns.

***

### Data Parsing Process

#### How It Works

* **Process Overview:**
  * Collects all failed webhooks within a specified time period.
  * Generates links for each failed execution's webhook log.
  * Loads and parses each log using regex to extract required data.
* **Tasks Overview:**
  *   **Dataflows:**<br>

      * **Parse Webhook Logs - Get All Failed Transactions By Date Range:** Retrieves failed transaction webhooks.
      * **Parse Webhook Logs - Generate Logs Links:** Creates links to logs for each transaction log UUID.
      * **Parse Webhook Logs - Get Links for JS:** Prepares data from the link generation task for JS processing.
      * **Parse Webhook Logs - Generate Final Report:** Fetches and parses logs with customizable regex patterns.

      <figure><img src="../../.gitbook/assets/image (1557).png" alt=""><figcaption></figcaption></figure>
  * **Webhook:**
    * **Parse Webhook Logs - Webhook:** Demonstrates functionality (adapt to your environment's webhook).

#### Task Details

1. **Parse Webhook Logs - Get All Failed Transactions By Date Range**
   * **Purpose:** Retrieves all failed transaction webhooks.
   *   **Parameters (Client-Specific):**

       * <mark style="background-color:$primary;">ClientID</mark>: ID of the client's environment.
       * <mark style="background-color:$primary;">SearchFromDate</mark>: Start date for searching failed transactions.
       * <mark style="background-color:$primary;">SearchToDate</mark>: End date for the search.
       * <mark style="background-color:$primary;">ClientTask\_TaskName</mark>: Name of the webhook failed transaction to target.

       <figure><img src="../../.gitbook/assets/image (1558).png" alt=""><figcaption></figcaption></figure>
2. **Parse Webhook Logs - Generate Logs Links**
   * **Purpose:** Generates links to logs for each transaction log UUID.
   * **Action:** No changes required.
3. **Parse Webhook Logs - Get Links for JS**
   * **Purpose:** Prepares data from the "Generate Logs Links" task for faster JS retrieval.
   * **Action:** No changes required.
4. **Parse Webhook Logs - Generate Final Report**
   * **Purpose:** Fetches logs from generated links and parses them using regex patterns.
   *   **Customization:** Open the JS Script tab, locate the regexList variable, and update the array with desired patterns to parse log data<br>

       <figure><img src="../../.gitbook/assets/image (1560).png" alt=""><figcaption></figcaption></figure>
   *   **Example:**

       * When a webhook fails, we receive this [log](parsing-webhook-logs.md#attachment)
       * That contains this data

       <figure><img src="../../.gitbook/assets/image (1561).png" alt="" width="563"><figcaption></figcaption></figure>

       * So while parsing this log by user-selected regex, we can obtain any necessary information from the response, such as response code, response body, etc.
       * &#x20;In our example, we extract text from the h1 HTML tag that contains info about the error that occurred during execution.
       * And as the final report, we receive this CSV

       <figure><img src="../../.gitbook/assets/image (1563).png" alt=""><figcaption></figcaption></figure>

#### Copying to Another Environment

* **Action:** Copy the _**scheduled job 'Parse Webhook Logs'**_ from the _**Services Demo Environment**_ to your environment and configure the dataflow tasks for your specific use case.

***

### Additional Features

* **Description:** To retrieve failed logs from multiple webhooks, modify the JSON in the HTTP tab of the 'Parse Webhook Logs - Get All Failed Transactions By Date Range' task to include additional webhook names.
*   **Configuration:**

    ```json
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
* **Action:** Replace \[Webhook name 1] and \[Webhook name 2] with the actual names of the webhooks you want to monitor.

***

### **Attachment**

{% file src="../../.gitbook/assets/Log Example.txt" %}
