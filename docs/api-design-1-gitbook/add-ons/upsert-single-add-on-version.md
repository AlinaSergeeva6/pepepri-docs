---
description: Upsert by Version ID
---

# Upsert single add-on version

{% hint style="danger" %}
<mark style="color:red;">**Obsolete**</mark>

Please Use [upsert addons versions](../var-api/upsert-addon-single-version.md) on var api
{% endhint %}

{% hint style="warning" %}
Upsert of version is done by version id&#x20;

Upsert of files within the version is done by 2 keys:  FileName + MimeType

Files within a version are never deleted - only updated
{% endhint %}

## Upsert add-on's version by version id (e.g 1.2)

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/{addon UUID}/versions`

#### Path Parameters

| Name           | Type   | Description |
| -------------- | ------ | ----------- |
| Authorization  | string |             |

#### Request Body

| Name | Type   | Description        |
| ---- | ------ | ------------------ |
|      | object | Same as GET object |

{% tabs %}
{% tab title="200 " %}
```
Returns the GET object
```
{% endtab %}
{% endtabs %}
