---
description: Removes orphaned records from the Data Index that no longer exist in DynamoDB.
---

# 🧱 Cleanse Index

{% hint style="info" %}
Only ADAL schemas with Type: "data" and indexed fields support cleanse operations.
{% endhint %}

{% hint style="info" %}
Cleanse is only available for supported addons (PFS, UDC, CoreResources, VisitFlow).
{% endhint %}

## Remove orphaned records from data index

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/schemes/{table_name}/cleanse`

#### Headers

| Name                                                  | Type   | Description      |
| ----------------------------------------------------- | ------ | ---------------- |
| x-pepperi-secretkey<mark style="color:red;">\*</mark> | String | addon secret key |
| x-pepperi-ownerid<mark style="color:red;">\*</mark>   | String | addon owner uuid |

#### Request Body

No request body required.

#### Response Details

This API triggers Multi Crawler operation. The asynchronous response returned is from the Multi Crawler API

{% tabs %}
{% tab title="200: OK " %}
```javascript
{
    "ExecutionUUID": "574a460e-d369-46ae-a557-0272d4e6118a",
    "URI": "/audit_logs/574a460e-d369-46ae-a557-0272d4e6118a"
}
```
{% endtab %}
{% endtabs %}

