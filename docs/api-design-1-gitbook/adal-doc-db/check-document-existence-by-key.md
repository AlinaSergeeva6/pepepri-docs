---
description: Checks if a document with the specified key exists in a table.
---

# Check Document Existence by Key

<mark style="color:green;">`GET`</mark> `https://api.pepperi.com/v1.0/addons/data/exist/{addonUUID}/{table}/{key}`

#### Path Parameters

| Name      | Type   | Description            |
| --------- | ------ | ---------------------- |
| addonUUID | string | Owner addons addonUUID |
| table     | string | Table name             |
| key       | string | Documents key          |

#### Response

{% tabs %}
{% tab title="200" %}
```json
{
    "Exists": true
}
```
{% endtab %}
{% endtabs %}

