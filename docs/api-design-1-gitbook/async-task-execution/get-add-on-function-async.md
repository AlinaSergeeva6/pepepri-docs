# GET add-on function - async

{% hint style="info" %}
Same behavior as the POST async function\
Note that there is no body in the request object + GET should not change any data &#x20;
{% endhint %}

{% hint style="info" %}
log group in cloudwatch: code\_jobs + AddonsExecuteJavaScriptLambdaAsync
{% endhint %}

## Execute add-on function&#x20;

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/addons/api/async/{addonUUID}/{js_file_name}/{function_name}`

#### Query Parameters

| Name     | Type    | Description                                                                 |
| -------- | ------- | --------------------------------------------------------------------------- |
| callback | String  | callback\_uuid                                                              |
| retry    | Integer | <p>Number of retries in case of failure <br>Default - 1 (no retries)   </p> |

#### Headers

| Name               | Type   | Description                    |
| ------------------ | ------ | ------------------------------ |
| X-Pepperi-ActionID | String | supply action id for execution |

{% tabs %}
{% tab title="200 " %}
```
{
    "ExecutionUUID": "3274fbbc-8e62-42c8-bdde-21f9ccfd2506",
    "URI": "/audit_logs/3274fbbc-8e62-42c8-bdde-21f9ccfd2506"
}
```
{% endtab %}
{% endtabs %}
