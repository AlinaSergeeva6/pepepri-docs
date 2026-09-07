# Rule Engine Unique Functions

### Overview

This guide details the unique functions available within the Pepperi JS Client Side API’s Rule Engine, specifically **GetValueByApiName** and **SetValueByApiName**.&#x20;

These functions are exclusive to the Rule Engine and are used to retrieve and set values in User Defined Fields (UDFs) without triggering additional calculations.

***

### Unique Rule Engine Functions

#### GetValueByApiName

* **Description:** Retrieves a single value from the current object’s field, returning a dynamic type based on the field’s content.
* **Use Case:** Ideal for accessing data from the current object, such as a Transaction Line’s associated Transaction UUID.
*   **Example:**

    ```javascript
    let value = GetValueByApiName("Transaction.UUID");
    ```

    * In this case, if the Calculated Formula is defined on a Transaction Line UDF, it retrieves the Transaction’s UUID.

#### SetValueByApiName

* **Description:** Sets a single value to the current object’s field, returning a Boolean to indicate success.
* **Use Case:** Useful for updating UDF values without invoking further calculations.
*   **Example:**

    ```javascript
    let res = SetValueByApiName("TSAMessage", "hello");
    ```

{% hint style="warning" %}
**Note**: Setting a value with SetValueByApiName does not trigger any additional calculation logic.
{% endhint %}
