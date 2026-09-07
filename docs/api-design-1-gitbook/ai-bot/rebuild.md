---
description: >-
  Rebuilds the embeddings out of resources/items, taking into account the fields
  configured in the AI-configuration settings screen.
---

# Rebuild

## Rebuild embeddings

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/items_ai/rebuild`

Using crawler to populate the vectorDB with the embeddings created from items.&#x20;

Body is empty.

{% hint style="info" %}
The created vectors IDs are the items UUIDs.
{% endhint %}

{% tabs %}
{% tab title="200: OK async job executed" %}
```json
{
    ExecutionUUID: string;
    URI: string;
}
```
{% endtab %}
{% endtabs %}
