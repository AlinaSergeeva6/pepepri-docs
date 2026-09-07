# Removing Transaction Lines

### Data Removal Methods

#### Remove Lines from Transaction Cart

* **Description:** Removes one or more lines from an existing transaction cart using the removeLines function, requiring a transaction UUID and line UUIDs.
* **Namespace:** Currently implemented only for the "app" namespace.
* **Behavior:** Applies only to the cart, not the Order Center.
*   **Syntax:**

    ```javascript
    pepperi.app.transactions.removeLines({
      transaction: { UUID: "<transaction UUID>" },
      lines: [
        { UUID: "<line1 UUID>" },
        { UUID: "<line2 UUID>" }
      ]
    });
    ```
*   **Example:**

    ```javascript
    pepperi.app.transactions.removeLines({
      transaction: { UUID: "11cda91f-df09-4d3c-826d-184e5f394d06" },
      lines: [
        { UUID: "74667b10-25f8-48bd-8a08-66f682e2a45c" },
        { UUID: "4dd8b710-af0d-4357-b697-d28bffe2f21e" }
      ]
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "result": [
        {
          "id": "3d8c7c96-1db5-4b49-99bf-91d8dae8238a",
          "status": "deleted",
          "message": ""
        }
      ]
    }
    ```
