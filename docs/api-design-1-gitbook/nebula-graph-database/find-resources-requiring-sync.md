---
description: Gets data of Nebula-synced resources that were changed
---

# 🔁 Find Schemes Requiring Sync

Given DateTime, returns the names of Nebula-synced resources that contain records which were modified after that ModificationDateTime.&#x20;

For example, For a given synced resource "A", a record was modified today at 5PM exactly. When requesting for resources requiring sync and providing the Date-time today at 4PM, the returned list will contain "A". If on the other hand, the Date-time provided was today at 6PM, assuming no other changes were made to "A", it will not be returned.

{% swagger method="post" path="/nebula/sync/schemes" baseUrl="https://api.pepperi.com/v1.0" summary="Find resource requiring sync" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="ModificationDateTime" required="false" type="string" %}
Returns _resources changed after this time_
{% endswagger-parameter %}

{% swagger-parameter in="body" name="IncludeDeleted" type="boolean" %}
default false
{% endswagger-parameter %}

{% swagger-parameter in="body" name="PathData" type="PathDataObject" required="true" %}
Used to filter the schemes, see definition below.
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="Success" %}
```json
{
    "LastSyncTime": "2022-01-11T11:11:11.169Z"
    "results": [
        {
            "AddonUUID": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
            "Resource": "ResourceName",
            "Hidden": "false",
            "Type": "data",
            "SyncData": {..} // Official SyncData from Schema defintion
            "Token": "" // A security token that must be sent to get records.
        },
        ...
    ]
}
```
{% endswagger-response %}
{% endswagger %}

### PathDataObject definition

```typescript
interface PathDestination {
    Resource: string;
    Key: string;
}

interface PathDataObject {
    ModificationDateTime?: string;
    IncludeDeleted?: boolean;
    PathData: {
        PermissionSet: string; // eg. Sync or Online
        Destinations?: PathDestination[]; // Describe where to trim the paths.
        IncludedResources?: string[]; // Resources that must be in the path
        ExcludedResources?: string[]; // Resources that must not be in the path
    };
}
```

{% hint style="info" %}
**Destinations**

* The order of the destinations is important. The first destination that is found in the path will be trimmed by.\
  If the order of destinations was: users and then accounts the first destination found is users, so the path will be trimmed to users resource.
* In case of 'users' resource, only an admin can send a user UUID which is not his own.
{% endhint %}
