---
description: Async Job
---

# Start Sync Application's Data Job (Async)

The sync function get the local data updates and merge them into the remote server data. It returns the sync UUID and two URLs for polling \
1\) LocalDataUpdatesResponseURL (optional) - will conatin the respond to the data update sent from the local device. If there was no data sent from the local device, no URL will be returned \
2\) RemoteDataUpdatesResponseURL - will conatin the data that was changed on the remote server since the last sync time. It will include the data that was sent with changes done during the "merge"

Sync is a **blocking** function per DeviceExternalID, only one sync can be processed in parallel. All other sync requests will wait in queue.

**Critical Note**: For performance considerations only the latest sync request will be processed from the queue This is done because of the assumption that the client device will always send the changed data until they will process the LocalDataUpdatesResponseURL. For example, if there are 3 sync called one after the other the first will start to process while the second and third will wait in queue. once the first complete the second will be skipped and the third will be processed

{% hint style="warning" %}
You must wait for the sync request to return before creating another request using the same ClientDBUUID&#x20;
{% endhint %}

{% hint style="info" %}
LocalDataUpdate and LocalDataUpdateURL are mutually exclusive, URL in LocalDataUpdateURL should be used when data is bigger then 500KB, or the convert of the data from LocalDataUpdate to LocalDataUpdateURL will happen on the server side before the Sync will be sent.
{% endhint %}

## Start a sync process&#x20;

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/application/sync`

#### Path Parameters

| Name | Type   | Description      |
| ---- | ------ | ---------------- |
|      | object | see object below |

{% tabs %}
{% tab title="200 " %}
```javascript
{   
    "SyncJobUUID":"" ,
    "URI" : "/sync/jobinfo/{SyncJobUUID}"
}
```
{% endtab %}
{% endtabs %}

Body object:

```java
{
 "LocalDataUpdates" : { },// mutually exclusive with LocalDataUpdatesURL
 "LocalDataUpdatesURL": "", // mutually exclusive with LocalDataUpdates
 "LastSyncDateTime" :"", 
 "DeviceExternalID" : "",
 "CPIVersion" : "",
 "TimeZoneDiff" :
 "Locale" : "", 
 "BrandedAppID" : "", why? // for log purposes 
 "UserFullName" : ""
 "SoftwareVersion" : "",
 "SourceType" : "",
 "DeviceModel" : "",
 "DeviceName" : "",
 "DeviceScreenSize" : "",
 "SystemName" : "",
 "ClientDBUUID" :""
}
```

Last updated Sun Aug 11 2019 06:28:59 GMT+0000 (UTC)
