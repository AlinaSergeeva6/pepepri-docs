# Get Single Sync Data

The GET sync data returns the data of the sync stored on the queue for sync. In case no syncUUID is found error will be returned.&#x20;

{% hint style="info" %}
Sync data has a life span of 2 weeks after which it will be purged
{% endhint %}

{% hint style="info" %}
Only the same user can get the sync data (even admin cannot get it)
{% endhint %}

{% hint style="info" %}
LocalDataUpdate and LocalDataUpdateURL are mutually exclusive, URL in LocalDataUpdateURL should be used when data is bigger then 500KB, or the convert of the data from LocalDataUpdate to LocalDataUpdateURL will happen on the server side before the Sync will be sent.
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/application/sync/data/{SyncUUID}" method="get" summary="Sync Data" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200" description="" %}
```java
{
   "UUID" : "", //read only
   "LocalDataUpdates" : { }, // mutually exclusive with LocalDataUpdatesURL
   "LocalDataUpdatesURL": "" // mutually exclusive with LocalDataUpdates
}
```
{% endswagger-response %}
{% endswagger %}

