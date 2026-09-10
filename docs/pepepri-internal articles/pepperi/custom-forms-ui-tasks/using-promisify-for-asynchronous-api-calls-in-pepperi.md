---
title: "Using Promisify for Asynchronous API Calls in Pepperi"
order: 322
---
# Using Promisify for Asynchronous API Calls in Pepperi

The promisify function in Pepperi simplifies working with asynchronous API calls by converting callback-based Pepperi API functions into Promise-based ones. This allows for cleaner, more modern JavaScript code in both Custom Forms and UI Tasks. This guide explains how promisify works, provides examples, and highlights key considerations.

---

### How Promisify Works

Promisify creates a randomly indexed variable in the global environment to handle the response from a Pepperi API call. When the response callback updates this variable, promisify either resolves or rejects the Promise based on the response:

-   **Resolve:** If res.success is true.
-   **Reject:** For all other results (e.g., res.success is false or an error occurs).

#### Promisify Function Code

Here’s the implementation of the promisify function:

```
function promisifyCallback(data) {
    window[window.promisifyCallback.uniqueVariableName] = data;
}

function promisify(pepperiFunction, argumentObject = {}) {
    let uniqueVariable = 'responseCallback' + [...Array(40)].map(() => Math.floor(Math.random() * 10)).join('');
    window.promisifyCallback.uniqueVariableName = uniqueVariable;
    let UIargumentObject = {};

    function toPromise(resolve, reject) {
        if (!window.location.href.includes('ui_tasks')) {
            argumentObject.responseCallback = 'promisifyCallback';
        } else {
            UIargumentObject.method_name = pepperiFunction;
            UIargumentObject.request_object = { ...argumentObject, responseCallback: 'promisifyCallback' };
        }

        !window.location.href.includes('ui_tasks') ? pepperiFunction(argumentObject) : call_client_api(UIargumentObject);

        let intervalId = setInterval(function () {
            if ((window[uniqueVariable] || {}).success) {
                clearInterval(intervalId);
                resolve(window[uniqueVariable]);
            } else if (window[uniqueVariable] && !window[uniqueVariable].success) {
                reject(window[uniqueVariable]);
            }
        }, 100);
    }

    return new Promise(toPromise);
}
```

#### Parameters

-   pepperiFunction**:** The Pepperi API function to call (e.g., pepperi.app.getContext).
-   argumentObject**:** An optional object containing settings for the API function. If not provided, defaults to an empty object ({}).

**Note:** The responseCallback parameter is automatically added by promisify, so you don’t need to include it in argumentObject.

---

### Using Promisify in Custom Forms

#### Example: Fetching Transaction Context

In a Custom Form, you can use promisify to call pepperi.app.getContext without specifying additional arguments (since getContext only requires a response callback):

```
promisify(pepperi.app.getContext)
    .then(data => {
        console.log(data);
        alert('It works!');
        alert(data.success);
    })
    .catch(error => {
        console.error('Error fetching context:', error);
    });
```

**Key Points:**

-   Pass the Pepperi API function directly (e.g., pepperi.app.getContext).
-   The responseCallback is handled automatically by promisify.
-   Use .then() to handle the resolved data and .catch() for errors.

---

### Using Promisify in UI Tasks

#### Example: Fetching Transaction Context

In a UI Task, the syntax differs slightly—you pass the Pepperi API function as a string. Additionally, promisify must be called within the on\_load() function:

```
<script>
function on_load() {
    promisify('pepperi.app.getContext')
        .then(data => {
            console.log(data);
            alert('It works!');
            alert(data.success);
        })
        .catch(error => {
            console.error('Error fetching context:', error);
        });
}
</script>
```

**Key Points:**

-   Use the string name of the API function (e.g., 'pepperi.app.getContext').
-   call\_client\_api (used internally by promisify) only works within the on\_load() function in UI Tasks.
-   The return value is the same as in Custom Forms: a Promise that resolves with the API response if success is true, or rejects otherwise.

---

### Debugging Tips

1.  **Check the Console:**
    -   Use Chrome Developer Tools (F12 or right-click → **Inspect**) to monitor the webappiframe console for logs.
    -   Add console.log statements in your .then() and .catch() handlers to inspect the response or errors.

2.  **Test in the Web App:**
    -   Test the Custom Form or UI Task in the Pepperi Web App to ensure the API call works as expected.

3.  **Handle Errors:**
    -   Always include a .catch() handler to manage rejected Promises and troubleshoot issues.

---

### Final Notes

The promisify function streamlines asynchronous API calls in Pepperi, making your code cleaner and more maintainable. By following the examples and best practices in this guide, you can effectively use promisify in both Custom Forms and UI Tasks while avoiding common pitfalls.

![](/static/1.jpg)
