---
description: Retrieving attachments
---

# Retrieving Attachments

### Data Retrieval Process

#### Two-Step Retrieval

1. **Obtain Attachment UUID:** Retrieve the UUID from the relevant object field, such as Transaction.TSAMyImage1.
2. **Retrieve Attachment Data:** Use peperi.api.attachments.get for a single attachment or peperi.api.attachments.search for multiple attachments.

#### Get Single Attachment

* **Description:** Retrieves a single attachment using the get function, requiring a UUID as the key. Includes optional fields URI and URL with specific behaviors.
*   **Syntax:**

    ```javascript
    pepperi.api.attachments.get({
      key: { UUID: "<UUID>" },
      fields: ["UUID", "URI", "URL"]
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.attachments.get({
      key: { UUID: "659a8f38-9f8a-4286-b3dd-1973dd8c35b2" },
      fields: ["UUID", "URI", "URL"]
    });
    ```
*   **Returns:**

    ```json
    {
      "UUID": "659a8f38-9f8a-4286-b3dd-1973dd8c35b2",
      "URI": "",
      "URL": ""
    }
    ```
* **Field Behaviors:**
  * **URI:** Returns Base64 of the binary content in data-URI format on native apps; empty on Web App.
  * **URL:** Always returns the attachment’s web URL, regardless of app type (Web or native).

#### Get List of Attachments

* **Description:** Retrieves multiple attachments using the search function with a filter, supporting optional fields URI and URL.
*   **Syntax:**

    ```javascript
    pepperi.api.attachments.search({
      fields: ["UUID", "URI", "URL"],
      filter: { <filter object> }
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.attachments.search({
      fields: ["UUID", "URI", "URL"],
      filter: {
        "ApiName": "URL",
        "Operation": "Contains",
        "Values": ["MyItem"]
      }
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "objects": [
        {
          "UUID": "aefb523e-74ac-4041-8bb1-a76a3b5e78d8",
          "URI": "",
          "URL": ""
        },
        {
          "UUID": "aefb523e-74ac-4041-8bb1-a76a3b5e78d8",
          "URI": "",
          "URL": ""
        }
      ]
    }
    ```
* **Field Behaviors:**
  * **URI:** Returns [Base64 ](https://en.wikipedia.org/wiki/Data_URI_scheme)on native apps; empty on Web App.
  * **URL:** Always returns the web URL.

