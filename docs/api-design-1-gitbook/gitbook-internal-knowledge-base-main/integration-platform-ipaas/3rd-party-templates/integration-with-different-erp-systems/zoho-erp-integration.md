# Zoho ERP Integration

### Overview

This integration allows you to connect Zoho ERP to Pepperi via HTTP requests, providing access to all data within the ERP. Users can upload items and price lists, with default mappings available, and retrieve information as needed for synchronization.

***

### Prerequisites

* A Zoho account (create one at [https://www.zoho.com/](https://www.zoho.com/) if not already available).
* Access to the Pepperi iPaaS module.
* Access to the Services Demo Environment.

***

### Steps to Establish the Integration

#### Step 1: Connect to Zoho ERP

* Log in to your Zoho account and navigate to the ERP module.
* Use HTTP requests to access ERP data, authenticated via OAuth 2.0 (refer to Zoho API documentation for setup details).

#### Step 2: Upload Items and Price Lists

* **Default Mapping:** Items are mapped by default (specific mapping details not provided; consult Zoho ERP documentation for customization).

<figure><img src="../../../.gitbook/assets/image (1518).png" alt="" width="563"><figcaption></figcaption></figure>

*   **Item List and Page:** The item list and item page layouts are predefined (examples not provided; refer to Zoho ERP UI for visual reference).<br>

    <figure><img src="../../../.gitbook/assets/image (1519).png" alt="" width="563"><figcaption></figcaption></figure>

    <figure><img src="../../../.gitbook/assets/image (1520).png" alt="" width="563"><figcaption></figcaption></figure>
* **Upload Examples:** Data for items and price lists can be uploaded (specific examples not provided; prepare data in JSON or CSV format as per Zoho API requirements).\
  ![](<../../../.gitbook/assets/CleanShot 2022-11-18 at 10.06.27@2x.png>)![](<../../../.gitbook/assets/CleanShot 2022-11-18 at 10.06.12@2x.png>)![](<../../../.gitbook/assets/CleanShot 2022-11-18 at 10.05.48@2x.png>)
* In Zoho ERP, use the upload functionality to add items and price lists manually or via API endpoints.

#### Step 3: Configure Dataflow Tasks

*   **Copy Dataflow Tasks:**

    * Navigate to the 'Zoho' folder in the Integration Examples of the Services Demo Environment.
    * Copy the existing dataflow tasks that retrieve data from Zoho.
    * Update the credentials with your own Zoho account details (e.g., API key, access token).

    <figure><img src="../../../.gitbook/assets/image (1521).png" alt="" width="563"><figcaption></figcaption></figure>
* **HTTP Request Setup:**
  * In the Pepperi iPaaS, create or modify a dataflow task.
  * Configure the HTTP tab with the appropriate Zoho API endpoint (e.g., https://www.zohoapis.com/erp/v3/items).
  * Include authentication details and map the data fields to Pepperi objects.
