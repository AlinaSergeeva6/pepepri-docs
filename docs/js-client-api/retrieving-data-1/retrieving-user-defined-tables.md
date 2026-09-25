# Retrieving User Defined Tables

### Data Retrieval Methods

#### Get Single Value from User Defined Table

* **Description:** Retrieves a single value from a UDT using the get function,&#x20;
*   **Syntax:**

    ```javascript
    pepperi.api.userDefinedTables.get({
      table: "<tableName>",
      mainKey: "<mainKey>",
      secondaryKey: "<secondaryKey>"
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.userDefinedTables.get({
      table: "myTable",
      mainKey: "Item123",
      secondaryKey: "Category124"
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "value": "1"
    }
    ```

{% hint style="warning" %}
Requiring both **mainKey** and **secondaryKey** parameters.
{% endhint %}

#### Get List of Values from User Defined Table

* **Description:** Retrieves a list of values from a UDT using the getList function, available from CPI 15.70.&#x20;
  * The currentAccountScope parameter defaults to true (limits to current account scope); set to false to load all data from disk.
*   **Syntax:**

    ```javascript
    pepperi.api.userDefinedTables.getList({
      table: "<tableName>",
      mainKey: "<mainKey>" (optional),
      secondaryKey: "<secondaryKey>" (optional),
      currentAccountScope: <boolean>
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.userDefinedTables.getList({
      table: "myTable",
      mainKey: "Item123",
      currentAccountScope: true
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "objects": [
        { "mainKey": "ABCD12", "secondaryKey": "GFT4", "value": "23.5" },
        { "mainKey": "ABCD12", "secondaryKey": "GFT5", "value": "5656.5" }
      ]
    }
    ```

{% hint style="warning" %}
Requires at least **tableName. mainKey** and **secondaryKey** are optional.&#x20;
{% endhint %}

{% hint style="warning" %}
**Note:** Availale only from CPI 15.70.
{% endhint %}
