---
description: Updating Transaction-Scope Items (Order Center Items)
---

# Updating Items in Transaction Scope

### Data Update Methods

#### Update Multiple Items in Transaction Scope

* **Description:** Updates or upserts multiple items in the Order Center (transaction scope) using the update function, requiring a transaction UUID and item details.
* **Behavior:** Updates existing items; for items not in the cart, it acts as an upsert, adding them.
*   **Syntax:**

    ```javascript
    pepperi.api.transactionScopeItems.update({
      transaction: { UUID: "<transaction UUID>" },
      objects: [
        { item: { UUID: "<item UUID>" }, <field1>: <value1>, <field2>: <value2> },
        { item: { UUID: "<item UUID>" }, <field1>: <value1>, <field2>: <value2> }
      ]
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.transactionScopeItems.update({
      transaction: { UUID: "1af91512-81ef-4897-afb1-55d51f0a1948" },
      objects: [
        { item: { UUID: "c1e3fa63-6ca3-4ac2-82bf-c75a43ad138a" }, TSAHello: "hi" },
        { item: { UUID: "4a4bfe74-e948-46da-8a61-01be248e42c2" }, TSAHello: "bye" }
      ]
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "result": [
        {
          "id": "c1e3fa63-6ca3-4ac2-82bf-c75a43ad138a",
          "status": "updated",
          "message": ""
        },
        {
          "id": "4a4bfe74-e948-46da-8a61-01be248e42c2",
          "status": "updated",
          "message": ""
        }
      ]
    }
    ```
