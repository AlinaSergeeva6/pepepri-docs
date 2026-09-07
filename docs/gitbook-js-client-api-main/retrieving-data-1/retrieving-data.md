---
description: Data retrieval - standard resources
---

# Retrieving Standard Resources

### Data Retrieval Methods

#### Get Single Object by Unique Key

* **Description:** Retrieves a single object using the get function for the desired resource, supporting only UUID as the key.
* **Supported Resources:**&#x20;
  * accounts&#x20;
  * transactions
  * activities
  * transactionLines
  * transactionScopeItems&#x20;
  * _from CPI 15.85_
    * items
    * catalogs
    * users
    * contacts&#x20;
*   **Syntax:**

    ```javascript
    pepperi.api.<resource>.get({
      key: { UUID: "<UUID>" },
      fields: [<string array of relevant field names>]
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.activities.get({
      key: { UUID: "aefb523e-74ac-4041-8bb1-a76a3b5e78d8" },
      fields: ["UUID", "ExternalID", "MyTSA"]
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "object": {
        "UUID": "aefb523e-74ac-4041-8bb1-a76a3b5e78d8",
        "ExternalID": "ABC123",
        "MyTSA": 34.56
      }
    }
    ```

    * The returned object can be used for update functions.

#### Search List of Objects by Filter

* **Description:** Retrieves multiple objects using the search function with a filter, sort, page size, and page number.
*

    **Supported Resources:**&#x20;

    * accounts&#x20;
    * transactions
    * activities
    * transactionLines
    * transactionScopeItems&#x20;
    * _from CPI 15.85_
      * items
      * catalogs
      * users
      * contacts&#x20;
*   **Syntax:**

    ```javascript
    pepperi.api.<resource>.search({
      fields: [<array of fields>],
      filter: { <filter object> },
      sorting: [<array of sort objects>],
      pageSize: <number>,
      page: <number>
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.activities.search({
      fields: ["UUID", "ExternalID", "MyTSA"],
      filter: {
        "Operation": "AND",
        "LeftNode": { "ApiName": "APIName1", "Operation": ">", "Values": ["7"] },
        "RightNode": { "ApiName": "ApiName2", "Operation": "InTheLast", "Values": ["4", "Weeks"] }
      },
      sorting: [{ "Field": "MyTSA", "Ascending": true }, { "Field": "MyTSA2", "Ascending": true }],
      pageSize: 1000,
      page: 1
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "objects": [
        {
          "UUID": "aefb523e-74ac-4041-8bb1-a76a3b5e78d8",
          "ExternalID": "abc123",
          "MyTSA": 12.8
        },
        {
          "UUID": "aefb5346-74ac-4041-8bb1-a76a3b5e734h",
          "ExternalID": "abc456",
          "MyTSA": 34.5
        }
      ]
    }
    ```

#### Retrieve Item’s Images (To Be Developed)

* **Description:** Planned enhancement to add 12 new fields to the items resource for image retrieval, supporting up to 6 images per item.
* **Fields to Add:** ImageURL, ImageURI, ImageURL2, ImageURI2, ..., up to ImageURL6, ImageURI6.
* **Behavior:** Similar to attachments.get, where:
  * ImageURL returns a URL.
  * ImageURI returns Base64 content on mobile devices and a URL on the Web App.
* **Status:** To be developed; not yet available in current API versions.

