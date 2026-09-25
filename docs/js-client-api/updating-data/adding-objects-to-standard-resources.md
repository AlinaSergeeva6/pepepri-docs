# Adding Objects to Standard Resources

### Data Addition Methods

#### Adding a Single Object

* **Description:** Adds a single object to the specified resource using the add function.
* **Supported Resources:** accounts, transactions, activities, contacts
* **Requirements:**
  * **account Field (Mandatory except for accounts):** Supports UUID and InternalID in the references object.
  * **type Field:**
    * Mandatory for transactions and activities.
    * Optional for accounts and contacts; defaults to the resource’s default type if omitted.
    * Must contain either type id or type name (ID takes precedence if both are provided).
  * **Optional Fields:**
    * originAccount (transactions and activities only): Supports InternalID and UUID.
    * catalog (mandatory for accounts, activities, and transactions with multiple catalogs): Supports InternalID, UUID, and catalog Name.
  * **Workflow Behavior:** For objects with workflow transitions, the object is created in the "new" status, with the New>>{Next Transition Step} initialized.
*   **Syntax:**

    ```javascript
    pepperi.app.<resource name>.add({
      type: { InternalID: <id>, Name: "<name>" },
      references: { account: { UUID: "<UUID>" } }, // Optional: originAccount, catalog
      object: { <field1>: <value1>, <field2>: <value2> }
    });
    ```
*   **Example:**

    ```javascript
    pepperi.app.transactions.add({
      type: { InternalID: 1234, Name: "Sales Order" },
      references: { account: { UUID: "acc123e-74ac-4041-8bb1-a76a3b5e78d8" } },
      object: { GrandTotal: 567.5, TSASubject: "This Object was created with the client api" }
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "id": "6e2803cd-b656-4d4f-8d21-f7cee7167350",
      "status": "added",
      "message": ""
    }
    ```
