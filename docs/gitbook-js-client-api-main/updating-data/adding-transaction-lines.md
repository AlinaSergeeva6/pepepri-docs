# Adding Transaction Lines

### Data Addition Methods

#### Add Lines to an Existing Transaction Cart

* **Description:** Adds one or more lines to an existing transaction cart using the addLines function, requiring a transaction UUID and line details. The leadingLine parameter is optional, used for bonus items linked to a parent item.
* **Namespace:** Currently implemented only for the "app" namespace.
* **Behavior:** Applies only to the cart, not the Order Center.
*   **Syntax:**

    ```javascript
    pepperi.app.transactions.addLines({
      transaction: { UUID: "<transaction UUID>" },
      lines: [
        {
          item: { ExternalID: "<externalID>" },
          lineData: { <field1>: <value1>, <field2>: <value2> },
          leadingLine: { UUID: "<leadingLine UUID>" } // Optional
        }
      ]
    });
    ```
*   **Example:**

    ```javascript
    pepperi.app.transactions.addLines({
      transaction: { UUID: "11cda91f-df09-4d3c-826d-184e5f394d06" },
      lines: [
        {
          item: { ExternalID: "MCR00101BLUEL" },
          lineData: { UnitsQuantity: 5 },
          leadingLine: { UUID: "11cda91f-df09-4d3c-826d-184e5f394d0d" }
        }
      ]
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "result": [
        {
          "id": "69dc3368-c74a-4616-b1dc-b21ba38c4daa",
          "status": "added",
          "message": ""
        }
      ]
    }
    ```
