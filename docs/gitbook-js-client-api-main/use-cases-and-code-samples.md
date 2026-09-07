# Use Cases & Code Samples

### Overview

This guide presents use cases and code samples for leveraging the Pepperi JS Client Side API. One key use case is concatenating filter objects for the \<resource>.search function, simplifying the construction of complex filters with a reusable helper function.

***

### Use Cases

#### Use Case: Custom Web Form Sample

{% file src=".gitbook/assets/CustmForm_JSClientAPI_Sample.txt" %}
A Custom Form Basic Sample Usage Of JS Client API
{% endfile %}

#### Use Case: Concatenating Filters

* **Description:** When using the \<resource>.search function (e.g., peppi.api.attachments.search), you can build filter objects to query multiple conditions. The helper function below facilitates the concatenation of filter nodes, supporting both AND and OR operations.
*   **Helper Function:**

    ```javascript
    function concatFilters(f1, f2, and) {
      return {
        "Operation": (and ? "AND" : "OR"),
        "LeftNode": f1,
        "RightNode": f2
      };
    }
    ```

    * **Parameters:**
      * f1: First filter object.
      * f2: Second filter object.
      * and: Boolean to determine operation (true for AND, false for OR).
*   **Code Sample:**

    ```javascript
    var uuids = // your attachments in an array (e.g., ["uuid1", "uuid2", "uuid3"]);
    var filter = { "Operation": "IsEqual", "ApiName": "UUID", "Values": [uuids[0]] };
    for (var i = 1; i < uuids.length; i++) {
      filter = concatFilters(filter, 
        { "Operation": "IsEqual", "ApiName": "UUID", "Values": [uuids[i]] });
    }
    // Use the filter in a search function, e.g.:
    peppi.api.attachments.search({ filter: filter, responseCallback: "myCallback" });
    ```
* **Explanation:** This code initializes a filter with the first UUID and iteratively concatenates additional UUID filters using AND operations, building a chain of equality conditions.

#### Use Case: Console.log as Response Callback Function

* **Description:** Simplifies testing API requests in the browser console by using console.log as a responseCallback instead of defining a separate function, reducing unnecessary code.
*   **Traditional Approach:**

    ```javascript
    pepperi.app.transactions.removeLines({
      transaction: { UUID: "11cda91f-df09-4d3c-826d-184e5f394d06" },
      lines: [
        { UUID: "74667b10-25f8-48bd-8a08-66f682e2a45c" },
        { UUID: "4dd8b710-af0d-4357-b697-d28bffe2f21e" },
      ],
      responseCallback: "test",
    });

    function test(params) {
      console.log(params);
    }
    ```
*   **Optimized Approach:**

    ```javascript
    pepperi.app.transactions.removeLines({
      transaction: { UUID: "11cda91f-df09-4d3c-826d-184e5f394d06" },
      lines: [
        { UUID: "74667b10-25f8-48bd-8a08-66f682e2a45c" },
        { UUID: "4dd8b710-af0d-4357-b697-d28bffe2f21e" },
      ],
      responseCallback: "console.log",
    });
    ```
* **Benefit:** Achieves the same result with less code, logging the response directly to the console.

#### Use Case: Easy Retrieve Transaction UUID

* **Description:** Simplifies obtaining the transaction UUID for API testing by extracting it from the current URL using window.location.href.split('/')\[5], avoiding manual copying.
*   **Syntax:**

    ```javascript
    window.location.href.split('/')[5]
    ```
*   **Example Usage:**

    ```javascript
    pepperi.app.transactions.removeLines({
      transaction: { UUID: window.location.href.split('/')[5] },
      lines: [
        { UUID: "74667b10-25f8-48bd-8a08-66f682e2a45c" },
        { UUID: "4dd8b710-af0d-4357-b697-d28bffe2f21e" },
      ],
      responseCallback: "console.log",
    });
    ```
* **Benefit:** Automates UUID retrieval from the URL, improving testing efficiency.
