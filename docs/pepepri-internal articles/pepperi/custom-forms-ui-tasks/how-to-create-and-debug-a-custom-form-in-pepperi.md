---
title: "How to Create and Debug a Custom Form in Pepperi"
description: "Custom Forms in Pepperi are a powerful tool for creating tailored HTML and JavaScript logic to enhance transaction functionality."
order: 323
---
# How to Create and Debug a Custom Form in Pepperi

*Custom Forms in Pepperi are a powerful tool for creating tailored HTML and JavaScript logic to enhance transaction functionality.*

This guide walks you through the process of creating, testing, and debugging a Custom Form, along with best practices for closing forms and avoiding legacy features.

---

### Creating a Custom Form

#### Step 1: Create a Program with a Custom Form

1.  **Navigate to Transaction Settings:**
    -   Go to **Settings → Sales Activities → Transaction Types**.
    -   Select the relevant transaction and navigate to the **Programs** tab.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-33.png)

2.  **Create a New Program:**
    -   Click **Add New Program**.
    -   Create a new **Action** within the program.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-34.png)

    -   Select **Custom Form** as the action type, then click **File**.
    -   A configuration file will be created to store your Custom Form code.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-35.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-36.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-37.png)

#### Step 2: Write the Default HTML Document

1.  **Open Visual Studio Code:** Use Visual Studio Code (or your preferred editor) to write the initial HTML structure.
2.  **Default HTML Template:** Start with the following basic HTML structure:

    ```
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
    </body>
    </html>
    ```

3.  **Add to Custom Form:**
    -   Copy this HTML into the Custom Form editor in Pepperi.
    -   Save the form.

4.  **Add to Menu View:**
    -   Add the program to the transaction’s menu view to make it accessible for testing.

---

### Debugging a Custom Form

#### Step 1: Test in the Web App

1.  **Access the Web App:** Open the Pepperi Web App to test the Custom Form.
    -   **Recommended Browser:** Use Google Chrome for the best debugging experience.

2.  **Open Developer Tools:**
    -   Press F12 or right-click and select **Inspect** to open Chrome Developer Tools.
    -   Ensure the webappiframe console is visible in the Console tab for debugging Pepperi-specific interactions.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-38.png)

#### Step 2: Write and Test JavaScript Logic

1.  **Initial Debugging Code:** Test basic functionality by adding the following code to the Console in Developer Tools:

    ```
    function myCallb(data) {
        console.log(data);
    }
    pepperi.app.getContext({ responseCallback: "myCallb" });
    ```

    This retrieves and logs the transaction context.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-39.png)

1.  **Add Logic to the Custom Form:** Update the Custom Form with the following code to fetch and display transaction details:

    ```
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <script>
            pepperi.app.getContext({ responseCallback: "getTransaction" });
            function getTransaction(data) {
                console.log(data);
                if (data.success) {
                    pepperi.api.transactions.search({
                        fields: ["AccountExternalID", "GrandTotal"],
                        filter: {
                            ApiName: "InternalID",
                            Operation: "IsEqual",
                            Values: ["" + data.transaction.id]
                        },
                        responseCallback: "showCurrentTransactionInfo"
                    });
                }
            }
            function showCurrentTransactionInfo(data) {
                console.log(data);
            }
        </script>
    </body>
    </html>
    ```

2.  **Run and Debug:**
    -   Save the updated Custom Form.
    -   Reload the Web App and check the Console in Developer Tools to verify the output of console.log statements.

#### Step 3: Run in Background (Optional)

-   **Background Execution:** If the Custom Form doesn’t require a UI (e.g., it performs backend logic only), you can run it in the background.
    -   In the Custom Form editor, check the **Run in Background** checkbox.
    -   This is useful for automating tasks without user interaction.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-40.png)

---

### Handling Available Fields (Legacy)

-   **Available Fields Section:** On the left side of the Custom Form editor, you can add fields to the scope, which are accessible via the workflowObject variable.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-41.png)

-   **Caution:** This is a legacy feature and can be buggy, especially with strings containing the " symbol.
    -   **Best Practice:** Avoid using workflowObject to prevent potential issues. Instead, use direct API calls (e.g., pepperi.api.transactions.search) to fetch data.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-42.png)

---

### Closing a Custom Form

There are three methods to close a Custom Form, each with specific behaviors:

1.  onClose()
    -   Closes the form and moves forward in the workflow.
    -   Does **not** save any changes to workflowObject.
    -   **Use Case:** When you want to proceed without saving legacy data.

2.  onSaveAndClose() (Legacy)
    -   Closes the form, moves forward in the workflow, and saves all workflowObject changes.
    -   **Caution:** This is a legacy method and should not be used due to potential bugs with workflowObject.

3.  pepperiApp.onCancel()
    -   Closes the form and navigates backward in the workflow (similar to pressing the "Cancel" button).
    -   **Use Case:** When the user wants to cancel the action and return to the previous step.

**Best Practice:** Use onClose() or pepperiApp.onCancel() and avoid onSaveAndClose() to prevent issues with legacy functionality.

---

### Best Practices

-   **Test Thoroughly:** Test the Custom Form in the Web App using Chrome Developer Tools to catch errors early.
-   **Avoid Legacy Features:** Do not use workflowObject or onSaveAndClose() due to their buggy nature.

---

### Final Notes

Custom Forms are a versatile tool for adding custom HTML and JavaScript logic to Pepperi transactions. By following these steps and best practices, you can create, debug, and deploy Custom Forms efficiently while avoiding common pitfalls.
