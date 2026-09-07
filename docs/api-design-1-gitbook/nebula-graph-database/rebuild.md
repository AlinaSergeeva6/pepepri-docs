---
description: Rebuilds the Nebula graph to make sure data is up-to-date.
---

# 🧱 Rebuild

{% hint style="info" %}
Rebuilding a resource means that the Nebula copy of your data is syncing with the original resource so that Nebula is up-to-date with your data.&#x20;

In order for Nebula to know your resource should be synced, the schema must contain:

```json
SyncData: {
    Sync: true
}
```

If you wish to remove a previously synced resource from Nebula, set "Sync" to false.
{% endhint %}

{% swagger method="post" path="/addons/nebula/rebuild" baseUrl="https://api.pepperi.com/v1.0" summary="Rebuild using documents crawler - asynchronous call" %}
{% swagger-description %}
In case of an empty body, rebuild all schemes (like ExcludedResources=\[]).
{% endswagger-description %}

{% swagger-parameter in="body" name="IncludedResources" type="string[]" %}
Resources to rebuild.\
If empty will not rebuild any schema.

If a resource name matches two schemes, an error will be thrown.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="ExcludedResources" type="string[]" %}
Mutually exclusive with IncludedResources. \
If a resource name matches two schemes, an error will be thrown.
{% endswagger-parameter %}
{% endswagger %}

{% swagger method="post" path="/addons/nebula/cleanse" baseUrl="" summary="Cleanse graph using graph crawler - asynchronous call" %}
{% swagger-description %}
Remove orphans documents (e.g. archived and purged documents).
{% endswagger-description %}

{% swagger-parameter in="body" name="IncludedResources" type="string[]" %}
Resources to cleanse (remove left over data).\
If empty will not cleanse any schema.

If a resource name matches two schemes, an error will be thrown.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="ExcludedResources" type="string[]" %}
Mutually exclusive with IncludedResources. \
If a resource name matches two schemes, an error will be thrown.
{% endswagger-parameter %}
{% endswagger %}

{% code title="Rebuild response" overflow="wrap" fullWidth="true" %}
```typescript
{
    Results:
    [{
        Resource: string;
        Status: 'Success' | 'Failure' | 'InProgress';
        Message?: string; // Could be error message, or anything else.
        // Number of items that was upserted/purged by the rebuild process.
        TotalDocumentChanges: number;
        // If the rebuild process changed anything, this field will have a URL to a temp file that will hold the
        // first 50 changes (ignoring changes that occured during the rebuild process, like PNS callbacks)
        Changes?: string; 
    }
    , ...]
}
```
{% endcode %}



{% code title="Changes (format of temp file)" fullWidth="true" %}
```typescript
[
    {
        Key: string;
        GraphCreationDateTime: string; // Only for nodes
        GraphModificationDateTime: string;
        DocumentCreationDateTime: string;
        DocumentModificationDateTime: string;
    }, 
...]
```
{% endcode %}
