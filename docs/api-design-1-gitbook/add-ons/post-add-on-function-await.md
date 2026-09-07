# POST add-on function - await

{% hint style="info" %}
Exact same behavior as the async POST on the call. Since this is synchronous operation there are no retries&#x20;

the respond is different of course, but there will be audit log, the uuid of the audit log will not be returned in case of success. In case of error, it will be part of the fault string&#x20;

the return object in case of success will be the exact data returned from the JS function&#x20;
{% endhint %}

{% hint style="info" %}
Request timeout is 30 seconds
{% endhint %}

{% hint style="info" %}
log group in cloudwatch: ExecuteAddonSync | ExecuteAddonSyncByVersion | ExecuteAddonAdminSync | ExecuteAddonAdminSyncByVersion
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com" path="/v1.0/addons/api/{addonUUID}/{js_file_name}/{function_name}" method="post" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-ActionID" %}
supply action id for execution
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
The exact returned object from the JS function 
```
{% endswagger-response %}
{% endswagger %}

