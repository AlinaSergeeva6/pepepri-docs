---
description: >-
  Fetches pages of a resource and sends items in caller-defined chunks to a
  target while keeping track of target's outputs and crawler statistics.
---

# 🐍 Crawl

{% hint style="info" %}
This is the API used to initiate a crawling action and the response of the crawler action, in order to use the crawler you need to make sure that the source & target implements the [Source & Target API](source-and-target-api.md).
{% endhint %}

{% hint style="info" %}
Crawler will use the values of owner-id and secret-key from the request header to make calls to the source and target endpoints.
{% endhint %}

## Fetches pages from source and sends them to target.

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/crawler/crawl`

#### Request Body

| Name                                                | Type          | Description                                                                             |
| --------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------- |
| Name<mark style="color:red;">\*</mark>              | string        | Name of the crawler action.                                                             |
| Description                                         | string        | Description of the crawler action.                                                      |
| LockID                                              | string        | Used to block running the same crawler twice (in parallel).                             |
| SourceRelativeURL<mark style="color:red;">\*</mark> | string        | URL to the resource.                                                                    |
| TargetRelativeURL<mark style="color:red;">\*</mark> | string        | URL to the target (does not have to be the caller).                                     |
| SourceData                                          | object        | Goes into source URL request body.                                                      |
| TargetData                                          | object        | Goes into target URL request body.                                                      |
| MaxPageSize                                         | number        | Maximum size of a page that the target can handle.                                      |
| MaxConcurrency                                      | number        | <p>Maximum number of parallel pages that the target can handle.</p><p>Default is 1.</p> |
| TargetOutputs                                       | TargetOutputs | The blueprint of the outputs from the target (page response).                           |
| BlockID                                             | string        | Used in multi-Crawler to define execution order.                                        |

{% tabs %}
{% tab title="200: OK CrawlerOutput" %}
Returns async job response.
{% endtab %}
{% endtabs %}

{% code title="TargetOutputs Interface" fullWidth="true" %}
```typescript
TargetOutputs: {
    FieldID: string; // target must return the output value with FieldID as key.
    Type: "Sum" | "Array";
    Limit: number; // only for Array, default = no limit
}[];
```
{% endcode %}

{% code title="CrawlerOutput Interface" fullWidth="true" %}
```typescript
 {
    TargetOutputs: {
        // If an array - will be a URL to a file that holds the data.
        [FieldID: string]: string | number;
    };
    Statistics: {
        SourcePagesCount: number;
        SourceObjectsCount: number;
        TargetTimeInSeconds: number;
        SourceTimeInSeconds: number;
        SourceSizeInKB: number;
        PagerTimeInSeconds: number;
    };
}
```
{% endcode %}
