---
description: Upsert all synced data into the cache using the Crawler addon.
---

# 🏗️ Rebuild

## Rebuild Graph Cache

Copy the synced data into the nucleus graph and subscribe to **records** changes.

<mark style="color:green;">`POST`</mark> `/addons/nebulus/rebuild`

**Query**

| Name                   | Type   | Description                                                              |
| ---------------------- | ------ | ------------------------------------------------------------------------ |
| callback\_encoded\_url | string | URL to call after rebuild is completed, using the async addon mechanism. |

**Body**

| Name              | Type      | Description                                                                                                                                      |
| ----------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| SourceAddonUUID   | string    | <p>Mandatory.</p><p>The owner of the tables to rebuild - <a data-footnote-ref href="#user-content-fn-1">only his tables will be rebuilt.</a></p> |
| Clean             | number    | Should clean the cache first                                                                                                                     |
| IncludedResources | string\[] | Rebuild only this tables                                                                                                                         |
| ExcludedResources | string\[] | Skip rebuilding this tables.                                                                                                                     |

**Response**

{% tabs %}
{% tab title="200" %}
```typescript
{
    ExecutionUUID: string;
    URI: string;
}
```
{% endtab %}

{% tab title="400" %}
```json
{
  "error": "Invalid request"
}
```
{% endtab %}
{% endtabs %}

{% hint style="info" %}
As the rebuild uses a [Multi-Crawler](https://apidesign.pepperi.com/crawler/multi-crawler) to manage the flow, the job will always return as completed.\
In order to review the rebuild result please look at the job's result object.
{% endhint %}

[^1]: It is possible to rebuild core resources as well.
