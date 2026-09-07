---
description: Retrieving ADAL tables
---

# ADAL

### Overview

This guide details the process for retrieving ADAL (Addon Data Access Layer) tables defined as cpi-meta-data using the Pepperi JS Client Side API.

***

### Data Retrieval Methods

#### Get ADAL Object by Key

* **Description:** Retrieves a single ADAL object using the get function, requiring the addon UUID, table name, and key.
* **Supported From:** CPI 17.00
*   **Syntax:**

    ```javascript
    pepperi.api.adal.get({
      "addon": "<addon UUID>",
      "table": "<tableName>",
      "key": "<key>"
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.adal.get({
      "addon": "bb6ee826-1c6b-4a11-9758-40a46acb69c5",
      "table": "SomeTable",
      "key": "bb6ee826-1c6b-4a11-9758-40a46acb69c5"
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "object": {
        "Key": "bb6ee826-1c6b-4a11-9758-40a46acb69c5",
        "Any": "other",
        "Fields": ["That", "exist", "on", "the", "ADAL"],
        "Object": true
      }
    }
    ```

#### Get Entire ADAL Table

* **Description:** Retrieves all objects from an ADAL table using the get function, requiring the addon UUID and table name.
* **Supported From:** CPI 17.00
*   **Syntax:**

    ```javascript
    pepperi.api.adal.get({
      "addon": "<addon UUID>",
      "table": "<tableName>"
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.adal.get({
      "addon": "bb6ee826-1c6b-4a11-9758-40a46acb69c5",
      "table": "SomeTable"
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "objects": [{
        "Key": "bb6ee826-1c6b-4a11-9758-40a46acb69c5",
        "Any": "other",
        "Fields": ["That", "exist", "on", "the", "ADAL"],
        "Object": true
      }]
    }
    ```
