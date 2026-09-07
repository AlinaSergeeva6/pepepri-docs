# Create List of Log Entry Line Details

## Create List of Audit Log Entry Lines&#x20;

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/audit_logs/{UUID}/lines`

#### Path Parameters

| Name | Type   | Description          |
| ---- | ------ | -------------------- |
|      | object | As the example below |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}

```javascript
[
    {
        "CreationDateTime" : "2020-07-16T19:20:30.45Z",
        "Text": "started running function XYZ..."
    },
    {
        "CreationDateTime" : "2020-07-16T19:24:13.45Z",
        "Text": "ended running function XYZ..."
    },
    ....
]
```
