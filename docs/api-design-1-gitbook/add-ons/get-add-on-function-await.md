# GET add-on function - await

{% hint style="info" %}
Same as the await POST&#x20;

without the body part and this method should not change any data
{% endhint %}

{% hint style="info" %}
Request timeout is 30 seconds
{% endhint %}

{% hint style="info" %}
log group in cloudwatch: ExecuteAddonSync | ExecuteAddonSyncByVersion | ExecuteAddonAdminSync | ExecuteAddonAdminSyncByVersion
{% endhint %}

## synchronous execute function&#x20;

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/addons/api/{addonUUID}/{js_file_name}/{function_name}`

#### Headers

| Name               | Type   | Description                    |
| ------------------ | ------ | ------------------------------ |
| X-Pepperi-ActionID | String | supply action id for execution |

{% tabs %}
{% tab title="200 " %}
```
the exact return objectfrom js function
```
{% endtab %}
{% endtabs %}

