# General Overview of Transaction Fields

This guide provides an overview of transaction field types, their usage, and best practices for managing dependencies, creating transactions, and other key considerations in Pepperi.

***

### Field Types

There are three main field types in transactions, each with distinct behaviors:

* **Always:**\
  Calculated every time a user runs the transaction.
* **On Change:**\
  Triggered when changes are made to specified fields.
* **On Demand:**\
  Calculated only within the user’s scope and does not save the value.\
  **Remark:** On Demand fields are always temporary.

#### Temporary Fields

Each field type can be marked as "temporary," meaning the data is only visible within the scope where the variable is triggered and is not saved to the database.

#### Best Practices

* Avoid using "Always" fields for parsing large HTML templates, as they save data to the server, consuming significant database space. Use "On Demand" fields instead.
* **Important:** On Demand line fields are calculated only when visible in the user’s window, while Always line fields are calculated as soon as the transaction is opened.

***

### Field Types and Usage

#### HTML Formatted Field

* **Purpose:** Used to display or render HTML content in the view for the client.
* **Usage:** Generates a string containing HTML code, including styles, using JavaScript. The string is returned as the field’s value.

{% file src="../../../.gitbook/assets/sample (1).txt" %}

* **Examples:**\
  Available in the Services Demo Environment (7343, ID: 30013939):
  * **Sales Order → Order Center → Medium View**
  * **Sales Order → Order Center → Item Details**

#### Date / Date + Time Fields

* **Behavior:** Returns time in seconds since 1970, which can be formatted into a regular date.
* **Usage:**
  *   Create a Date object and multiply the field value by 1000 to convert seconds to milliseconds:

      ```javascript
      var date = new Date(TSADate * 1000);
      ```
  *   Format the date using toISOString():

      ```javascript
      var date = new Date(TSADate * 1000);
      return date.toISOString();
      ```
* **Configuration:** Date format can be managed in **Back Office → ERP Integration → Configuration**.

![](<../../../.gitbook/assets/image (141).png>)



#### Number, Decimal Number, Currency Fields

* **Behavior:** Return numerical values.
* **Details:**
  * **Decimal Number:** Allows specification of the number of decimal places.
  * **Important:** Ensure the output is a number, not a string.

#### Check-Box Field

* **Caution:** Use carefully. Verify if a check-box field is truly needed for the use case.
* **Alternative:** Perform calculations using a Single Line Text field and return the value instead.
* **Validation Note:** Items in check-box fields can have values True, False, or Null. Account for all three during validation, as some items may not pass the Item filter and thus won’t appear in the transaction.

#### Reference Type Field

* **Purpose:** Connects two transactions (inner and outer).
* **Example:** Commonly used for Package Promotions.

#### List of Objects

* **Usage:** Ideal for scenarios like sending emails to multiple users. Select users and configure settings within this field.

#### Sum Transaction Lines

* **Purpose:** Sums a specified field across transaction lines.
* **Use Case:** The only way to trigger a header field by changing line fields.

#### UDT Fields Delimiter

* **Configuration:** Managed in **ERP Integration → Configuration**.

![](<../../../.gitbook/assets/image (127).png>)

***

### Building Dependencies Between Fields

#### Recommended Approach

The most efficient way to manage dependencies is to create two initialization fields:

* **Header Init:**
  * Receives data and sends it to Lines Init.
  * Sets Header fields as needed using SetValueByApiName(field, value) or other methods.
* **Lines Init:**
  * Receives data from Header Init.
  * Sets Lines fields.

**Note:** These fields should be temporary and used to set data in other transaction fields.

#### Best Practices for Data Transfer

*   **Header to Lines:** Use this to pass data. Example helper function:

    ```javascript
    this.helpers = {
        round: function (value, decimals) {
            return Number(Math.round(value + "e" + decimals) + "e-" + decimals);
        },
    };
    ```
* **Catching Line Changes:**
  * Create a function triggered by a new "On Change" field named "Line Calculation Change".
  * Define all change-related calculations in the Init field by creating a function to handle dependency changes.

#### Handling GetList() Issues

* **Issue:** When using GetList() with a MainKey, an error may occur after reopening the transaction.
* **Solution:** Create a helper function to filter items and avoid this issue.

***

### Creating Activities or Transactions Without Clients

* **Steps:**
  1. Go to the transaction settings.
  2. Navigate to the **Account** section.
  3. Enable the option _**"This Activity will not be assigned to any Account"**_

![](<../../../.gitbook/assets/image (497).png>)

### Additional Reminders

* **Avoid Unnecessary Dependencies:**\
  Do not add dependencies to fields unless they are actively used.
* **Document Fields Clearly:**\
  Provide detailed descriptions for your fields to assist other developers who may work with them later.
* **Custom Form Restrictions:**
  * Do not use save and close() or wfobject in Custom Forms to prevent potential issues.
*   **Import/Export Transaction Types:**\
    If there are no lines or the user cannot create a transaction:

    1. Go to **Transaction Types**.
    2. Select the relevant transaction.
    3. Navigate to **Workflows** → switch to **Table View**.
    4. Add a + under **Create** in the creation settings.

    ![](<../../../.gitbook/assets/image (167).png>)

***

### Final Notes

* Follow these guidelines to create efficient, maintainable transaction fields that minimize performance issues and improve collaboration.
