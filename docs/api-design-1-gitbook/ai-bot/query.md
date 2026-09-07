---
description: Using the embeddings engine for AI-based querying of items.
---

# Query

## Query embedded items

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/items_ai/query`

**Body**

{% hint style="info" %}
`FreeText` and `KeyList` properties are mutually exclusive.
{% endhint %}

{% hint style="warning" %}
`KeyList`currently supports one key only.
{% endhint %}

| Name       | Type   | Description                                 |
| ---------- | ------ | ------------------------------------------- |
| `FreeText` | string | perform the query based on free text.       |
| `KeyList`  | string | perform the query based on specific items.  |
| `Size`     | number | Number of results to return, default is 10. |

{% tabs %}
{% tab title="200: OK" %}
```json
{
    Objects: [
        {
            Key: "ca951462-b8c1-48cc-92dd-8b56641bc339",
            Score: 0.0800000429
        },
        {
            Key: "537010c6-4d11-449e-b6e5-d2a457f6e2e3",
            Score: 0.0799999237
        }
    ]
}
```
{% endtab %}
{% endtabs %}
