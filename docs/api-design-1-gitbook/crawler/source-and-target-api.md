---
description: >-
  The following interfaces define a source and a target mandatory endpoints,
  this API must be implemented in order to become a source or a target for the
  Crawler.
---

# 🎯 Source & Target API

{% hint style="info" %}
Source - the source of the data, i.e. ADAL, Nebula.

Target - the addon that will receive the pages.
{% endhint %}

## Source API

{% code title="Crawler -> Source" %}
```typescript
// The following API must be implemented in the source,
// it's used to request a page by the Crawler.
interface SourceInput {
    PageKey: string; // key to the page - will override data parameters.
    [key: string]: unknown; // from SourceData.
}
```
{% endcode %}

{% code title="Source -> Crawler" %}
```typescript
// The following API must be implemented in the source,
// it's used to send a page to the Crawler.
interface SourceOutput {
    Objects: unknown[];
    NextPageKey: string;
}
```
{% endcode %}

## Target API

{% code title="Crawler -> Target" %}
```typescript
// The following API must be implemented in the target,
// it's used to recieve a page from the Crawler.
interface TargetInput {
    TargetData: object; // from caller input.
    Page: unknown[];
}
```
{% endcode %}

{% code title="Target -> Crawler" %}
```typescript
// The following API must be implemented in the target,
// it's used to send a page output to the Crawler.
interface TargetOutput {
    Outputs?: {
        [FieldID: string]: unknown[] | number;
    };
}
```
{% endcode %}
