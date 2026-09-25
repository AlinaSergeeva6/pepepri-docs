# Updating User Defined Table

### Data Update Methods

#### Upsert a Single User Defined Table Value

* **Description:** Inserts or updates a single value in a UDT using the upsert function, requiring table, mainKey, and secondaryKey to identify the record, and value for the data.
*   **Syntax:**

    ```javascript
    pepperi.api.userDefinedTables.upsert({
      table: "<tableName>",
      mainKey: "<mainKey>",
      secondaryKey: "<secondaryKey>",
      value: "<value>"
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.userDefinedTables.upsert({
      table: "myTable",
      mainKey: "Item123",
      secondaryKey: "Category124",
      value: "my value"
    });
    ```
*   **Returns:**

    ```json
    {
        "success": true
    }
    ```
