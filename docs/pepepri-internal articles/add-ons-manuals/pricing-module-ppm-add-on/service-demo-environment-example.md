---
title: "Service Demo Environment Example"
description: "Effort Estimation: 16h"
order: 53
---
# Service Demo Environment Example

*Effort Estimation: 16h*

### Advantages and Disadvantages

#### Advantages

-   **Automated Syncing:** Allows automated syncing of Related Items data between different systems or platforms (Pepperi &lt;> ERP systems).
-   **Real-Time Updates:** Integration via iPaaS enables real-time updates of Related Items, ensuring up-to-date displays.
-   **Efficiency:** Reduces manual effort compared to back-office configuration.

#### Disadvantages

-   **Complex Setup:** Setting up integrations for Related Items may require complex logic and a significant amount of time.
-   **Dependency on Source Data:** Implementation complexity depends on the source data structure and the client’s ERP system.

---

### How to Implement

#### Step 1: Configure Related Items

-   Follow the configuration instructions in the support article: [Related Items Add-on](/add-ons-manuals/pricing-module-ppm-add-on/related-items-add-on.md).

#### Step 2: Set Up Dataflow Tasks

The following dataflow tasks are used to manage related items in the Service Demo Environment:

1.  **Related Items - Get Token**
    -   **Task URL:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92247](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92247)
    -   **General Tab:**
        -   **Description**: Retrieves a token for use in the subsequent HTTP request task.
        -   **Application**: Generic HTTP Connector
        -   **Source Object**: Generic Http Exporter
        -   **Target Object**: Store Data Table For Later Use

    -   **HTTP Tab:**
        -   **URL:** `!%base_address_integration_api%!/PepperiApi/GetIdpToken`

2.  **Related Items - HTTP Request**
    -   **Task URL:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92241](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92241)
    -   **General Tab:**
        -   **Description:** Sends related items data to Pepperi, visible in **Settings -> Items -> Item Collections**.
        -   **Application**: Generic HTTP Connector
        -   **Source Object**: Generic Http Exporter
        -   **Target Object**: Store Data Table For Later Use

    -   **Settings Tab:**
        -   **loop\_over\_table:** Related Items - Get Token

    -   **HTTP Tab:**
        -   **URL:** `https://papi.pepperi.com/V1.0/resources/related_items`
        -   **Header:**
            -   **Authorization**: Bearer $#Data#$
            -   **Content-Type**: application/json

        -   **Header(****Alternatively****):** In this case, you don't need to use ***Related Items - Get Token*** dataflow task
            -   **Authorization:** Bearer {#idp\_token#}
            -   **Content-Type**: application/json

        -   **Body Example:**
            -   **CollectionName**: Name of the collection you'd like to update.

                ![](/static/image-893.png)

                -   **ItemExternalID**: External ID of the item to which related items will be assigned.

            ![](/static/image-894.png)

            -   **RelatedItems:** Array of Item External IDs which will be assigned to the main item.

            ![](/static/image-895.png)

            -   **Key:** CollectionName\_ItemExternalID.

            ![](/static/image-896.png)

            -   **JSON Example:**

    ```
    {
      "CollectionName": "RelatedItemsTest",
      "Hidden": false,
      "ItemExternalID": "HT3041",
      "RelatedItems": ["HT3040", "HT3039"],
      "Key": "RelatedItemsTest_HT3041"
    }
    ```

3.  **Related Items - Upload Data to UDT**
    -   **Task URL**: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92240](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92240)
    -   **General Tab:**
        -   **Description**: Uploads related items data to the UDT "ADDON\_CPI\_SIDE\_DATA".
        -   **Application**: Generic HTTP Connector
        -   **Source Object**: Generic Http Exporter
        -   **Target Object:** Store Data Table For Later Use

    -   **HTTP Tab:**
        -   **URL**: `https://api.pepperi.com/v1.0/user_defined_tables`
        -   **Body Example:**
            -   **MapDataExternalID**: "ADDON\_CPI\_SIDE\_DATA"
            -   **MainKey**: "4f9f10f3-cd7d-43f8-b969-5029dad9d02b\_CPIRelation"
            -   **SecondaryKey:** "CollectionName\_\[UUID of the main item\]":

                ![](/static/image-897.png)

            -   **Values**: \[{"RelatedItems":\["**UUID** of assigned item","**UUID2** of assigned item"....\]}\]

            ![](/static/image-898.png)

            -   **JSON Example:**

                ```
                {
                  "MapDataExternalID": "ADDON_CPI_SIDE_DATA",
                  "Hidden": false,
                  "MainKey": "4f9f10f3-cd7d-43f8-b969-5029dad9d02b_CPIRelation",
                  "SecondaryKey": "RelatedItemsTest_7712fbf3-bd7d-4331-8b6a-c0034aab8ba9",
                  "Values": [{"RelatedItems": ["5f5c801f-5c92-45cd-bd0a-7285d9930e81", "5f5c801f-5c92-45cd-bd0a-7285d9930e81"]}]
                }
                ```

---

### Demo - How It Works

1.  **Access Dataflow Tasks in iPaaS:**
    -   Navigate to the Service Demo Environment in iPaaS and review the following tasks:
        -   [**Related Items - Get Token**:](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92247)
        -   [**Related Items - HTTP Request**:](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92241)
        -   [**Related Items - Upload Data to UDT**:](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92240)

    -   Update the HTTP body in the **Related Items - HTTP Request** task with new item relations:
        -   "ItemExternalID": "HT3041" (main item)
        -   "RelatedItems": \["HT3040", "HT3039"\] (related items)

    -   Update the HTTP body in the **Related Items - Upload Data to UDT** task with UUIDs:
        -   "SecondaryKey": "RelatedItemsTest\_7712fbf3-bd7d-4331-8b6a-c0034aab8ba9" (UUID of the main item)
        -   "Values": \[{"RelatedItems": \["5f5c801f-5c92-45cd-bd0a-7285d9930e81", "5f5c801f-5c92-45cd-bd0a-7285d9930e81"\]}\] (UUIDs of related items)

2.  **Run the Scheduled Job:**
    -   Execute the [**Related Items** scheduled job](https://integration.pepperi.com/mgr/PluginSettings/ScheduledJobs?ScheduledJobId=63531&clientId=7343):

3.  **Verify Results:**
    -   Check the Service Demo Environment to confirm the added item relations are visible in **Settings -> Items -> Item Collections** and the UDT "ADDON\_CPI\_SIDE\_DATA".

---

### How to Copy to Another Environment

-   [**Copy the Scheduled Job**](https://integration.pepperi.com/mgr/PluginSettings/ScheduledJobs?ScheduledJobId=63531&clientId=7343)

!!!warning
The demo tasks contain hardcoded values (e.g., specific ItemExternalIDs and UUIDs). For a real customer, replace these with dynamic values and add logic to prepare data (e.g., mapping customer-specific IDs).
!!!
