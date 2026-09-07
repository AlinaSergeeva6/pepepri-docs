# Execute addon code - Node.js documentation

{% hint style="info" %}
must return a response object,  for async the success property mapped to audit log success parameter, errorMessage is needed in case of failure and resultObject is optional returned body&#x20;
{% endhint %}

```javascript
response = {success:true, errorMessage:"", resultObject:{}} 
```

```javascript
response = {success:true, errorMessage:""} 
```

## Node.js function gets 2 objects: client and request:

* **`Client.BaseURL;`**   returns API base URL (production/sandbox/EU server)
* **`Client.OAuthAccessToken;`** returns OAuth Access Token used for API requests.
* **`use console.log / console.warning and console.error for logging`**
* **`Client.ActionUUID;`**  execution identifier (UUID)
* **`Client.CodeJobUUID;`**  codejob identifier (UUID)
* **`Client.NomberOfTry;`**  current execution try
* **`Client.AddonUUID;`**  addon identifier (UUID)
* **`Client.EncryptedAddonUUID;`**  addon key identifier
* **`Client.CodeRevisionURL;`**  addon file path
* **`Client.AssetsBaseUrl;`**  addon file folder path
* **`Client.Retry(delayTime);`**  retry function, delayTime <= 6000ms
* **`Client.ValidatePermission(policyName);`**  check permission according to policy
* **`Request.path;`**   returns a relative URL request
* **`Request.header;`**   returns dictionary of header parameters
* **`Request.query;`** returns dictionary of query parameters
* **`Request.body;`**  returns the raw payload to the code\_job&#x20;
* **`Request.originalUrl;`**  returns a full URL request
*   **`Request.method;`**  POST/GET



