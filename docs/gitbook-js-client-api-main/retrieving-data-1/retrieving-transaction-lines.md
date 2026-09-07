# Retrieving Transaction Lines

### Data Retrieval Methods

#### Get Single Transaction Line by Unique Key

* **Description:** Retrieves a single Transaction Line using the get function, with Line UUID as the only supported key.
*   **Syntax:**

    ```javascript
    pepperi.api.transactionLines.get({
      key: { UUID: "<UUID>" },
      fields: [<string array of relevant field names>]
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.transactionLines.get({
      key: { UUID: "aefb523e-74ac-4041-8bb1-a76a3b5e78d8" },
      fields: ["UnitsQuantity", "Item.ExternalID"]
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "object": {
        "UUID": "aefb523e-74ac-4041-8bb1-a76a3b5e78d8",
        "UnitsQuantity": 34,
        "Item.ExternalID": "ABCD123"
      }
    }
    ```

#### Search List of Transaction Lines by Filter

* **Description:** Retrieves multiple Transaction Lines using the search function with a filter, sorting, page size, and page number.
*   **Syntax:**

    ```javascript
    pepperi.api.transactionLines.search({
      fields: [<string array of relevant field names>],
      filter: { <filter object> },
      sorting: [{ Field: "<fieldName>", Ascending: <boolean> }],
      pageSize: <number>,
      page: <number>
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.transactionLines.search({
      fields: ["Transaction.UUID", "ExternalID", "MyTSA"],
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

#### Search List of Transaction Lines by Transaction Filter and Transaction Lines Filter

* **Description:** Retrieves Transaction Lines from transactions not yet loaded into memory using the search function with separate transactionFilter and filter parameters.
* **Purpose:** Enables fetching lines from unloaded transactions efficiently.
*   **Syntax:**

    ```javascript
    pepperi.api.transactionLines.search({
      fields: [<string array of relevant field names>],
      transactionFilter: { <filter object> },
      filter: { <filter object> },
      sort: [{ Field: "<fieldName>", Ascending: <boolean> }],
      pageSize: <number>,
      page: <number>
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.transactionLines.search({
      fields: ["UUID", "ExternalID", "MyTSA"],
      transactionFilter: {
        "Operation": "AND",
        "LeftNode": { "ApiName": "APIName1", "Operation": ">", "Values": ["7"] },
        "RightNode": { "ApiName": "ApiName2", "Operation": "InTheLast", "Values": ["4", "Weeks"] }
      },
      filter: {
        "Operation": "AND",
        "LeftNode": { "ApiName": "APIName1", "Operation": ">", "Values": ["7"] },
        "RightNode": { "ApiName": "ApiName2", "Operation": "InTheLast", "Values": ["4", "Weeks"] }
      },
      sort: [{ "Field": "MyTSA", "Ascending": true }, { "Field": "MyTSA2", "Ascending": true }],
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
