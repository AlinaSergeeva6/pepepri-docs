# 🧱 Rebuild Indexes

{% hint style="info" %}
Only ADAL schemas with Type: "data" and indexed fields are supported for rebuilding.
{% endhint %}

{% hint style="info" %}
Index rebuilding is only available for supported addons (PFS, UDC, CoreResources, VisitFlow).
{% endhint %}

{% hint style="info" %}
Maximum 10 schemas per rebuild request.
{% endhint %}

## Overview

This API triggers a rebuild of specified indexed schemas for a supported addon on the current distributor.

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/{AddonUUID}/rebuild_indexes`

#### Headers

| Name                                                  | Type   | Description      |
| ----------------------------------------------------- | ------ | ---------------- |
| x-pepperi-secretkey<mark style="color:red;">\*</mark> | String | addon secret key |
| x-pepperi-ownerid<mark style="color:red;">\*</mark>   | String | addon owner uuid |

#### Path Parameters

| Name      | Type   | Description              |
| --------- | ------ | ------------------------ |
| AddonUUID | String | Schemas owner addon uuid |

#### Request Body

| Name    | Type            | Description                            |
| ------- | --------------- | -------------------------------------- |
| Schemas | Array of string | Array containing schema names (max 10) |

#### Response Details

The rebuild operation executes a separate multi-crawler job for each schema. The response array order matches the order of schemas in the request body, with each element containing the async response for that schema's rebuild job.

{% tabs %}
{% tab title="200: OK " %}
```javascript
[
  {"ExecutionUUID": "a1b2c3d4-e5f6-7890-abcd-ef1234567890"},
  {"URI": "/audit_logs/a1b2c3d4-e5f6-7890-abcd-ef1234567890"}
]
```
{% endtab %}
{% endtabs %}

