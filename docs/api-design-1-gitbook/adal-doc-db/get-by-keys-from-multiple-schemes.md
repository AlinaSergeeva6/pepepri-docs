---
description: Allows callers to get by keys from multiple schemes in a single fast call.
---

# 🤹 Get By Keys From Multiple Schemes

{% hint style="warning" %}
Supports `data` table only!
{% endhint %}

## Get By Keys From Multiple Schemes

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/multi_get`

**Headers**

**Body**

<table><thead><tr><th>Description</th><th>Type</th><th data-hidden>Name</th></tr></thead><tbody><tr><td>See input code block</td><td>object</td><td>See input code block</td></tr></tbody></table>

**Response**

{% tabs %}
{% tab title="200" %}
```json
{
    // See output code block.
}
```
{% endtab %}
{% endtabs %}

```typescript
interface GetFromMultipleSchemesInput {
    Resources: {
        Keys: string[];
        Scheme: {
            Name: string;
            AddonUUID: string;
        }
    }[];
}
```

```typescript
interface GetFromMultipleSchemesOutput {
    Resources: {
        Scheme: {
            Name: string,
            AddonUUID: string
        },
        Objects: {
            [fieldID: string]: unknown, // Record's data.
        }[]
    }[]
}
```
