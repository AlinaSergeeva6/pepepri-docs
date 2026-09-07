---
description: Allows crawling on multiple source-target pair simultaneously.
---

# 🤹 Multi-Crawler



## Crawls on multiple source-target pairs.

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/crawler/multi_crawl`

#### Request Body

| Name                                       | Type                              | Description                                                                                                    |
| ------------------------------------------ | --------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Crawlers<mark style="color:red;">\*</mark> | crawl input and pager input array | See crawler/crawl & crawler/pager.                                                                             |
| Defaults                                   | see below                         | <p>Default values for optional crawler parameters.</p><p>Lower priority.</p>                                   |
| MaxSourcesConcurrency                      | number                            | <p>Maximum number of parallel calls to the sources.</p><p>Default: 1, max: 5.</p>                              |
| AbortOnFailure                             | boolean                           | <p>Should the multi-crawl be aborted if one of the crawlers fails?<br>Default: false.</p>                      |
| MaxTargetsConcurrency                      | number                            | <p>Maximum number of parallel calls to the targets.</p><p>Default: 5, Max: 10.</p>                             |
| BlockingRules                              | see below                         | Defines dependencies between crawlers.                                                                         |
| LockID                                     | string                            | <p>Used to block running the same crawler twice (in parallel).<br>Cannot be the same as a crawler lock ID.</p> |

{% tabs %}
{% tab title="200: OK Returns async job response." %}

{% endtab %}
{% endtabs %}



{% code title="Defaults" fullWidth="true" %}
```typescript
{
    SourceData?: object;
    TargetData?: object;
    MaxPageSize?: number;
    MaxConcurrency?: number;
    TargetOutputs?: TargetOutputBlueprint[];
}
```
{% endcode %}

<pre class="language-typescript" data-title="BlockingRules" data-full-width="true"><code class="lang-typescript">/**
* The key is the crawler's BlockID that should be blocked.
* The array is the crawlers BlockIDs that blocks the former.
<strong>*/
</strong>{ 
    [key: string]: string[] 
}
</code></pre>



{% code title="MultiCrawlerOutput Interface" fullWidth="true" %}
```typescript
{
    /**
     * All crawlers outputs.
     */
    Outputs: {
        [CrawlerName: string]: {
            [FieldID: string]: string | number;
        };
    };

    /**
     * Combined statistics of the crawlers.
     */
    Statistics: {
        SourcePagesCount: number;
        SourceObjectsCount: number;
        TargetTimeInSeconds: number;
        SourceTimeInSeconds: number;
        SourceSizeInKB: number;
        PagerTimeInSeconds: number;
    };

    /**
     * The status of each crawler.
     */
    Statuses: {
        [CrawlerName: string]: {
            /**
             * Finished - the crawler finished crawling successfully.
             * InProgress - the crawler is still running (or waiting for retry).
             * Aborted - the crawler was aborted but did not fail directly, for more information read message.
             * Failed - the crawler failed, for more information read message.
             */
            Status: 'Finished' | 'InProgress' | 'Aborted' | 'Failed';
            Message?: string;
        };
    };
}
```
{% endcode %}
