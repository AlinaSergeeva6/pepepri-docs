---
title: "General Rules for Code Review"
order: 338
---
# General Rules for Code Review

## General Rules for Code Review

These guidelines ensure that your code is maintainable, readable, and efficient, making it easy for others to understand and update. Always consider the "bus test": if you were unavailable tomorrow, could someone else pick up and maintain your code?

---

### Code Review Checklist

-   **Break Down Long Functions:** Split code into smaller, modular functions to improve readability and maintainability.
-   **Follow D.R.Y. (Don’t Repeat Yourself):** Avoid duplicating code; reuse functions and logic where possible.
-   **Use Self-Explanatory Names:** Ensure variable and function names clearly describe their purpose.
-   **Add Comments for Workarounds:** If the code includes workarounds or tricky logic that support teams should notice, add detailed comments.
-   **Include Function-Level Comments:** Above each function, add a comment explaining what it does.
-   **Remove Debugging Code:** Remove or comment out debugging lines (e.g., `console.log`) before production.
-   **Change Log for Offline Custom Forms:** For offline custom forms (not UI tasks), include a change log at the top of the form, as there’s no audit log available.
-   **Centralize Fields in Configs:** Store all used fields in a `config` object to simplify copying to another environment.

---

### Catalog Filtering

-   **Optimize Transaction Item Scope:** Ensure the transaction item scope includes the minimum mandatory parameters to avoid performance issues. For example, if there are 100,000 items but only 5,000 are needed, loading all items triggers unnecessary calculations.
-   **Filter at Catalog Level:** Add as many parameters as possible (used in the scope filter) to `Item Prop1`, `Prop2`, etc., instead of `Item TSA`. This allows filtering in catalog settings at the catalog level, reducing the load before scope filtering and calculations.

---

### Calculated Fields

-   **Minimize Calculated Fields:** Ensure all calculated fields are necessary and actively used. Avoid unused logic or fields.
-   **Field Type Best Practices:**
    -   **Header Level:** Use a single header field (e.g., for UDTs) to set data, storing it in `this`.
    -   **Line Level:** Minimize "Always" fields. Ideally, avoid "Always" fields at the line level entirely. Instead, have one field calculate and set values for others.

-   **Field Documentation:**
    -   Add comments in each calculated field to explain its purpose.
    -   If a field sets values in another field using `SetValueByApiName()`, include a comment describing what it does and which field it sets (e.g., "Set in `setFieldname()` in `TSAHeaderCalculationInit`").

-   **Standard Calculated Fields:** Use only the following calculated fields in transactions:
    -   **Header Level:**
        -   `TSAHeaderCalculationInit`
        -   `TSAHeaderCalculationChange`

    -   **Lines Level:**
        -   `TSALinesCalculationInit`
        -   `TSALinesCalculationChange` Add new logic to these fields. For specific triggers, create an "On Demand" field to call functions from `TSAHeaderCalculationInit`.

-   **Centralize Business Logic:** Store complex business logic in a single field (e.g., `TSAHeaderCalculationInit`) as reusable functions, allowing other fields to call them.
-   **Available Fields Rules:**
    -   **Always Fields:** The "Available Fields" section must be empty.
    -   **On Change Fields:** List fields that trigger recalculation in the "Available Fields" section.
    -   **On Demand Fields:** The "Available Fields" section should be empty unless specific triggers are needed (document the reason in the field’s main comment).

-   **Decompose Code:** Place each piece of business logic in a separate function with detailed comments (see **Code Documentation** below).
-   **Commented Code:** If code is commented out, explain why (e.g., requirement change, better solution). Otherwise, remove it.

---

### Custom Forms & UI Tasks

-   **Code Quality:** Ensure the code is logically written and free of unnecessary "garbage" (e.g., unused variables or logic).
-   **Avoid** `workflowObject`**:** Do not use `workflowObject` in custom forms or UI tasks to prevent potential issues.

---

### Custom Homepage

-   Follow the same guidelines as in **Custom Forms & UI Tasks** above.

---

### Dataflow Tasks and Webhooks

-   **Structured Data and Naming:** Ensure data is well-structured, and task names are logical and descriptive.
-   **Folder Structure:** Organize tasks into a clear folder structure. Avoid clutter by moving obscure test tasks to the recycle bin if they might be needed later.
-   **Insert Operations:** Perform all insert operations to external systems via webhooks only.
-   **Reference Guide:** For instructions on creating dataflows or webhooks, refer to: [Integration Platform General](https://kbint.pepperi.com/integration-platform-ipaas/integration-platform-ipaas-general).

---

### Translation Logic for Different Languages

-   **Support Non-English UI:** If the client uses a language other than English, implement logic to support different languages for UI elements (e.g., titles, buttons), but not for data.
-   **Admin View:** Ensure admin users always see the UI in English to facilitate understanding of UI elements (e.g., for developers working with clients in Israel or other regions).
-   **Example Implementation:**

    ```
    const translations = {
        en: {
            Main_Title_Description: "Distributed Ordering",
        },
        ab: {
            Main_Title_Description: "skdfhksjdhfjdhfdsjkfhkjsdhfsdkhfk",
        },
    };
    let language = "ab";
    if (AgentExternalID == "admin") language = "en";

    SetValueByApiName(TSAText, translations[language]["Main_Title_Description"]);
    ```

---

### External Libraries

-   **Approval Required:** If an external library is needed for a custom form or UI task, it must be approved by a senior developer.
    -   There may be cases where a library cannot be used.
    -   A better solution might already exist for the problem.

---

### Documentation

-   **General Business Logic:** Document the purpose of each:
    -   Scheduled job (in the main folder).
    -   Custom form or UI task.
    -   Calculated field (in `init` functions).
    -   Script (at the beginning of the script).

-   **Function Documentation:** For each function, document:
    -   Arguments and their types.
    -   The business case the function solves.
    -   Any tricky aspects (highlight these for special attention). Keep documentation concise but clear, enabling quick understanding and updates without turning it into an essay.

-   **Code Documentation Format:** Use the following format for function comments (inspired by the "Better Comments" VS Code extension):

    ```
    /**
     * * Description of the function
     * 01/01/2022 - First/Last Names - 'Describe what was changed'
     * @param param - string. 'Put a description here'. (UUID of something or array of objects[] { title: string })
     * @param param2 - number. 'Put a description here'
     * @return 'Put type here' -> void | string | number[] | ...
     */
    function functionName(param, param2) {}
    ```

    This format makes the code easier to read as an instruction, showing what logic is complete or pending.

-   **Change Logging:** If you modify code written by someone else, add a comment explaining why and what was changed. Since there’s no built-in logging (e.g., like in UI tasks), manual logging is required.

---

### Debugging

-   **Debugging Calculated Fields:**
    -   Use a `try-catch` block and log errors:

        ```
        try {
            // Your code
        } catch (error) {
            SetValueByApiName('put name of the field', JSON.stringify(error));
        }
        ```

    -   Alternatively, use a custom form that emulates the Rule Engine (not 100% accurate but sufficient to identify issues in most cases).

---

### Async API Calls

-   **Use Async Functions:** When making Pepperi API calls in Custom Forms, UI Tasks, or Custom Homepages, use async functions to keep code clean and readable.
-   **UI Task Support:** UI Tasks already have built-in logic for async calls.
-   **Custom Forms/Homepages:** Wrap Pepperi API calls in a `Promise` to avoid callbacks.
-   **Example with** `getContext`**:**

    ```
    run();

    async function run() {
        const context = await getContext();
        /* your code here */
    }

    /* Get context async */
    function getContext() {
        return new Promise((resolve, reject) => {
            pepperi.app.getContext({ responseCallback: "getContextCallback" });

            getContextCallback = function (res) {
                if (res.success) {
                    resolve(res);
                } else {
                    resolve();
                }
            };
        });
    }
    ```

---

### Header Calculated Init Code Style

-   **Standardize Code Structure:** Use the following style for `HeaderCalculatedInit` to ensure consistency across clients and improve readability:

    ```
    /**
     * Description of the code below
     *
     * Definition:
     ** Level: Transaction
     ** Trigger: Always || Always (Temporary) || On Change || On Change (Temporary) || On Demand || On Demand (Temporary)
     *
     * Available Fields:
     ** None || List of Fields
     */

    let variable1 = 0;  // Local Variable
    let variable2 = 0;  // Local Variable
    let variable3 = 0;  // Local Variable

    this.globalVariable1 = 0;    // Could Be Used In Another Calculated Field
    this.globalVariable2 = 0;    // Could Be Used In Another Calculated Field
    this.globalVariable3 = 0;    // Could Be Used In Another Calculated Field

    /**
     * * Description of the function
     * 01/01/2022 - First/Last Names - 'Describe what was changed'
     * @param param - string. 'Put a description here'. (UUID of something or array of objects[] { title: string })
     * @param param2 - number. 'Put a description here'
     * @return 'Put type here' -> void | string | number[] | ...
     */
    this.globalFunction1 = function(param, param2) {}       // Could Be Called In Another Calculated Field

    /**
     * * Description of the function
     * 01/01/2022 - First/Last Names - 'Describe what was changed'
     * @return 'Put type here' -> void | string | number[] | ...
     */
    this.globalFunction2 = function() {}       // Could Be Called In Another Calculated Field

    /* Main Code */

    localFunction1();
    localFunction2();

    return "";

    /* END OF THE MAIN CODE, AFTER IT ONLY ADDITIONAL FUNCTIONS */

    /**
     * * Description of the function
     * 01/01/2022 - First/Last Names - 'Describe what was changed'
     * @return 'Put type here' -> void | string | number[] | ...
     */
    function localFunction1() {}       // Local Function

    /**
     * * Description of the function
     * 01/01/2022 - First/Last Names - 'Describe what was changed'
     * @return 'Put type here' -> void | string | number[] | ...
     */
    function localFunction2() {}       // Local Function
    ```

---

### Final Notes

-   Write code with the mindset that someone else will eventually work on it. Clear documentation and logical structure benefit both the team and yourself when revisiting code later.
-   Regularly review these guidelines to maintain consistency and quality in your work.
