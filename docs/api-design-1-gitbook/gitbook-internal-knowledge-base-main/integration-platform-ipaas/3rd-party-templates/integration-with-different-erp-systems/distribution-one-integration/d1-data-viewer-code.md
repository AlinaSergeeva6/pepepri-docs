# D1 Data Viewer Code

Use the following code in the `D1 Data Viewer` UI task.

### UI Page Head

```html
<style>
    body {
        font-family: Arial, sans-serif;
        padding: 16px;
        background: #f5f5f5;
    }

    .container {
        background: #fff;
        padding: 16px;
        border-radius: 8px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        max-width: 900px;
        margin: auto;
    }

    .row {
        margin-bottom: 12px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 4px;
    }

    input, textarea, select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-family: monospace;
        box-sizing: border-box;
    }

    textarea {
        min-height: 120px;
    }

    button {
        padding: 10px 16px;
        background: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background: #0056b3;
    }

    #response {
        background: #1e1e1e;
        color: #d4d4d4;
        padding: 12px;
        border-radius: 4px;
        white-space: pre-wrap;
        overflow-x: auto;
        min-height: 150px;
    }

    #tokenStatus {
        font-size: 12px;
        color: #555;
    }
</style>
```

### UI Page Body

```
<div class="container">
    <div class="row">
        <label>Request Type</label>
        <select id="requestType">
            <option value="GET">GET (D1 get data)</option>
            <option value="POST">POST (D1 post data)</option>
        </select>
    </div>

    <div class="row">
        <label>URL</label>
        <input id="urlInput" placeholder="!%generic_param_2%!distone/rest/service/data/read" value="!%generic_param_2%!distone/rest/service/data/read"/>
    </div>

    <div class="row">
        <label>Body</label>
        <textarea id="bodyInput">query=FOR EACH customer NO-LOCK WHERE company_cu='!%generic_param_1%!'&take=1</textarea>
    </div>

    <div class="row">
        <button onclick="sendRequest()">Send Request</button>
    </div>

    <div class="row">
        <label>Token status</label>
        <div id="tokenStatus">Loading token...</div>
    </div>

    <div class="row">
        <label>Response</label>
        <pre id="response"></pre>
    </div>
</div>

<script>
    let token = '';

    async function loadToken() {
        try {
            const result = await get_data_async({
                task_name: 'D1 - Get Token 🔒',
                data_format: 'json_body'
            });

            token = JSON.parse(result.body).access_token || '';

            document.getElementById('tokenStatus').textContent = token
                ? 'Token loaded successfully'
                : 'Token not found in response';

        } catch (err) {

            document.getElementById('tokenStatus').textContent = 'Failed to load token';

            console.error('Token load error:', err);
        }
    }

    async function sendRequest() {

        const type = document.getElementById('requestType').value;
        const url = document.getElementById('urlInput').value;
        const body = document.getElementById('bodyInput').value;

        const taskName = type === 'GET'
            ? 'D1 get data'
            : 'D1 post data';

        try {

            const result = await get_data_async({
                task_name: taskName,
                data_format: 'json_body',
                post_array: [
                    { name: 'url', value: url },
                    { name: 'body', value: body },
                    { name: 'token', value: token }
                ]
            });

            let pretty;

            try {
                pretty = JSON.stringify(JSON.parse(result.body), null, 2);
            } catch (e) {
                pretty = String(result);
            }

            document.getElementById('response').textContent = pretty;

        } catch (err) {

            document.getElementById('response').textContent =
                'ERROR:\n' + err.message;

            console.error('Request error:', err);
        }
    }
</script>

<script>
    async function on_load()
    {
        await loadToken();
    }
</script>
```

The UI task automatically:

1. Loads the D1 access token
2. Stores the token locally in the page
3. Executes requests through iPaaS tasks
4. Displays formatted JSON responses

The task supports both:

* GET-style read requests
* POST requests

The following internal tasks are required:

```
D1 - Get Token 🔒D1 get data
```

Optional:

```
D1 post data
```

### Recommended Usage

Use this task during:

* implementation
* debugging
* API testing
* D1 query development
* table structure validation
* troubleshooting authentication issues

The task can be copied to another environment together with the related D1 tasks.

