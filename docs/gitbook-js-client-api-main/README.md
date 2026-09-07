---
description: >-
  Pepperi JS Client Side API {Beta} enables you to extend our Native and Web
  Apps. The run-time of the API is either from our Rule-Engine-based User Define
  Fields or from our Workflow's Custom Web Forms
---

# Getting Started

### Overview

The Pepperi JS Client Side API (Beta) enables you to extend the functionality of Pepperi’s Native and Web Apps. This API operates within the Rule-Engine-based User Defined Fields (UDFs) or Workflow’s Custom Web Forms.&#x20;

***

### Namespace: pepperi.api

* **peperi.api Namespace:**
  * Functions do not trigger auto-calculation of the app’s business logic (Rule Engine).
  * Suitable for use in calculated UDFs within the Rule Engine.
  * Only “api” functions are supported in the Rule Engine.
* **peperi.app Namespace:**
  * Triggers the app’s business logic (Rule Engine) for calculations.
  * Supported functions:
    * peperi.app.accounts.update
    * peperi.app.activities.update
    * peperi.app.transactions.update
    * peperi.app.transactionLines.update
    * peperi.app.transactionScopeItems.update
    * peperi.app.transactions.addLines
    * peperi.app.transactions.removeLines
  * Both “api” and “app” namespaces can be used in Custom Web Forms (visible or hidden) as a step in a Workflow.

***

### Asynchronous Behavior: Custom Web Forms vs Calculated UDFs

* **Custom Web Forms:**
  * All Client API functions operate asynchronously.
  * Two additional parameters are required:
    * responseCallback: Callback function to handle the response.
    * requestID: Optional identifier for the request (recommended for tracking).
  *   **Example:**

      ```javascript
      pepperi.api.activities.get({
        key: { UUID: "aefb523e-74ac-4041-8bb1-a76a3b5e78d8" },
        fields: ["ExternalID", "MyTSA"],
        responseCallback: "<your_callback_function>",
        requestID: "<your_request_id>"
      });
      ```
* **Calculated UDFs (Rule Engine):**
  * Synchronous execution; no asynchronous parameters needed.

***

### Date and Time Handling

* **API Format:** Dates are retrieved and updated in UTC only, using ISO 8601 format (e.g., 2018-12-18T12:29:02Z or 2018-12-18Z).
* **Rule Engine Format:**
  * Retrieved via GetValueByAPIName in Unix timestamp format (seconds since January 1, 1970, UTC).
  *   Conversion required for updates. **Example:**

      ```javascript
      var date = new Date(TSACaptureDateTime * 1000); // Convert to milliseconds
      var ret_object = pepperi.api.accounts.update({
        objects: [{
          UUID: GetValueByApiName("Account.UUID"),
          TSALastActiveDate: date.toISOString() // Update in UTC ISO format
        }]
      });
      ```
* **Filters:** Dates in filter objects can be non-UTC; the function converts them internally to UTC.

***

### Logging

* **Purpose:** Send logs to Pepperi servers to track issues.
* **Behavior:**
  * iOS/Android: Logs sent only on app crashes.
  * Web App: Logs sent constantly in real-time.
*   **Syntax:**

    ```javascript
    pepperi.log({ message: "<your message>", verbosity: "Low" });
    ```

    * **verbosity:** Optional (Low, Medium, High); defaults to Low.

***

### Error Handling

*   **Error Object:** All functions return the same error structure on failure:

    ```json
    {
      "success": false,
      "value": "",
      "error": {
        "code": 54,
        "message": "<relevant error message>"
      }
    }
    ```

***

### Context Retrieval

* **Purpose:** Retrieves the run-time scope, crucial for Custom Web Forms within Workflows.
* **Syntax:**
  *   **Custom Web Forms (Async):**

      ```javascript
      pepperi.app.getContext({ responseCallback: "mycallback" });
      ```
  *   **Calculated UDFs (Sync):**

      ```javascript
      var ret = pepperi.app.getContext({});
      ```
*   **Returned Object:**

    ```json
    {
      "CPIDateTime": "2018-12-23T12:34:56Z",
      "appVersion": "",
      "appType": "web",
      "OSType": "",
      "OSVersion": "",
      "company": {
        "id": 30011895,
        "name": "Regine_DO_NOT_CHANGE_ClientAPI"
      },
      "user": {
        "id": 4492855,
        "uuid": "d8ce933a-a0dd-4a9f-9b88-c83581180dc5",
        "externalId": ""
      },
      "account": {
        "id": 18163276,
        "name": "Cat n Dog New",
        "uuid": "67274419-7f66-46f6-847a-72aa19d3db8a"
      },
      "transaction": {
        "id": -50,
        "externalId": "",
        "uuid": "131023c8-bbfd-4a15-ba4b-030fe7bdb44c"
      }
    }
    ```

***

### Filter Object for Search Functions

* **Purpose:** Used in “search” functions across the Client API to filter multiple objects.
*   **Simple Example:**

    ```json
    {
      "ApiName": "UnitPrice",
      "Operation": ">=",
      "Values": ["7"]
    }
    ```
*   **Complex Example with Multiple Conditions:**

    ```json
    {
      "Operation": "AND",
      "LeftNode": {
        "ApiName": "UnitPrice",
        "Operation": ">",
        "Values": ["7"]
      },
      "RightNode": {
        "ApiName": "Transaction.ActionDateTime",
        "Operation": "InTheLast",
        "Values": ["4", "Weeks"]
      }
    }
    ```
*   **Supported Operators by Data Type:**

    ```json
    {
        "String": [
            "Contains",
            "StartWith",
            "EndWith",
            "IsEqual",
            "IsNotEqual",
            "IsEmpty",
            "IsNotEmpty"
        ],
        "Integer": [
            ">",
            "<",
            "=",
            ">=",
            "<=",
            "!=",
            "Between",
            "IsEmpty",
            "IsNotEmpty"
        ],
        "Real": [
            ">",
            "<",
            "=",
            ">=",
            "<=",
            "!=",
            "Between",
            "IsEmpty",
            "IsNotEmpty"
        ],
        "Boolean": [
            "IsEqual"
        ],
        "DateTime": [
            "Today",
            "ThisWeek",
            "ThisMonth",
            "Before",
            "After",
            "Between",
            "On",
            "InTheLast",
            "NotInTheLast",
            "DueIn",
            "NotDueIn",
            "IsEmpty",
            "IsNotEmpty"
        ],
        "File": [
            "IsEmpty",
            "IsNotEmpty"
        ],
        "MultiDropDown": [
            "IsEqual",
            "IsNotEqual",
            "IsEmpty",
            "IsNotEmpty"
        ],
        "PropertyMultiDropDown": [
            "IsEqual",
            "IsNotEqual",
            "IsEmpty",
            "IsNotEmpty"
        ],
        "UsersSpecialMultiDropDown": [
            "IsLoggedInUser",
            "IsEqual",
            "IsNotEqual",
            "IsEmpty",
            "IsNotEmpty"
        ]
    }
    ```
