---
description: Describes the functions that handles the custom form's user experience
---

# Custom Form Window Functions

### Overview

This guide describes the functions available in the Pepperi JS Client Side API that manage the user experience of Custom Web Forms within Workflows. These functions control the closing, canceling, and saving of forms, with notes on deprecated usage.

***

### Custom Form Window Functions

#### window.pepperiApp.onClose()

* **Description:** Closes the Custom Web Form window without affecting the Workflow status.
* **Use Case:** Use this to exit the form when no changes need to be preserved or canceled.
*   **Syntax:**

    ```javascript
    window.pepperiApp.onClose();
    ```

#### window.pepperiApp.onCancel()

* **Description:** Closes the Custom Web Form window and cancels the Workflow, reverting to the previous status.
* **Use Case:** Ideal for discarding changes and undoing the current Workflow step.
*   **Syntax:**

    ```javascript
    window.pepperiApp.onCancel();
    ```

#### window.pepperiApp.onSaveAndClose()

* **Description:** Closes the Custom Web Form window and saves changes applied to the Workflow object (deprecated).
* **Use Case:** Use this only if relying on the deprecated Workflow object to persist modifications.
*   **Syntax:**

    ```javascript
    window.pepperiApp.onSaveAndClose();
    ```
* **Note:** The Workflow object is deprecated; consider modern alternatives for new implementations.

