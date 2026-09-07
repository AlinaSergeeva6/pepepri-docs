# Updating Standard resources

### Overview

This guide outlines the process for updating standard resources using the Pepperi JS Client Side API. The update function allows modification of multiple objects by their unique keys, currently supporting only UUIDs.&#x20;

Supported resources include accounts, transactions, activities, and transactionLines, with contacts added from CPI 15.85.

***

### Data Update Methods

#### Update Multiple Objects by Unique Keys

* **Description:** Updates multiple objects in a specified resource using the update function, requiring UUIDs as the only supported key.
* **Supported Resources:** accounts, transactions, activities, transactionLines (plus contacts from CPI 15.85)
*   **Syntax:**

    ```javascript
    pepperi.api.<resource>.update({
      objects: [
        { UUID: "<UUID>", <field1>: <value1>, <field2>: <value2> },
        { UUID: "<UUID>", <field1>: <value1>, <field2>: <value2> }
      ]
    });
    ```
*   **Example:**

    ```javascript
    pepperi.api.activities.update({
      objects: [
        { UUID: "tgfb523e-74ac-4041-8bb1-a76a3b5e78f5", TSAMyComment: "ABC" },
        { UUID: "aefb523e-74ac-4041-8bb1-a76a3b5e78h6", TSAMyComment: "DEF" }
      ]
    });
    ```
*   **Returns:**

    ```json
    {
      "success": true,
      "result": [
        { "id": "tgfb523e-74ac-4041-8bb1-a76a3b5e78f5", "message": "", "status": "updated" },
        { "id": "aefb523e-74ac-4041-8bb1-a76a3b5e78h6", "message": "", "status": "updated" }
      ]
    }
    ```
