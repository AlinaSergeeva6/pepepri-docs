# POST add-on function - async

{% hint style="info" %}
The function should get two parameters:

Client: same as in user code job + Client.AddonUUID; (addon identifier - UUID)

Request: { path - the relative url request, query - dictionary of the query params, body - the original request body, originalUrl - full url request, method - POST/GET }
{% endhint %}

{% hint style="info" %}
The audit log will be like execute now of code\_job
{% endhint %}

{% hint style="info" %}
log group in cloudwatch: code\_jobs + AddonsExecuteJavaScriptLambdaAsync
{% endhint %}

{% hint style="warning" %}
max body size is 256KB

max result size is 128KB
{% endhint %}

## execute POST add-on exported JS function&#x20;

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/api/async/{addonUUID}/{js_file_name}/{function_name}`

Execute a specific function on the server side in asynchronous way\
The function is exported function on a JS file (=resource) of a specific addon\
Using code\_jobs & audit\_log&#x20;

#### Query Parameters

| Name                   | Type    | Description                                                                 |
| ---------------------- | ------- | --------------------------------------------------------------------------- |
| callback\_encoded\_url | string  | encoded relative url                                                        |
| callback (obsolete)    | string  | callback\_uuid                                                              |
| retry                  | integer | <p>Number of retries in case of failure <br>Default - 1 (no retries)   </p> |

#### Headers

| Name               | Type   | Description                    |
| ------------------ | ------ | ------------------------------ |
| X-Pepperi-ActionID | String | supply action id for execution |

{% tabs %}
{% tab title="200 Note that the returned object from the function will be placed in the ResultObject in the AuditLog entry " %}
```
{
    "ExecutionUUID": "3274fbbc-8e62-42c8-bdde-21f9ccfd2506",
    "URI": "/audit_logs/3274fbbc-8e62-42c8-bdde-21f9ccfd2506"
}
```
{% endtab %}
{% endtabs %}

### callback

The callback function will be called in a POST synchronous way (using await)&#x20;

the body contains **Request** - original request and **Result** - the result of the async function

The result is ignored, also exception is ignored

````javascript
// the body sent to the callback
// import { Request } from '@pepperi-addons/debug-server';
{
   Request:Request,
   Result:Any
}

// example for how the callback is called           
//var ret = await this.papiClient.post(callbackURL, {Request:this.peppperiJob!.Job.Request, Response:this.resultFromUser});
// log ret and ignore it

```
````

```
exports.example1= (Client, Request) => {
    var ret= {};

     ret.success = true;

     ret.resultObject = {};

     ret.resultObject.msg = "hello world";

    return ret;

}
```

{% hint style="info" %}
The result from the executed function will be placed in the ResultObject of the AuditLog&#x20;
{% endhint %}
