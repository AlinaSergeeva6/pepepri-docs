---
description: Returns the Sync Job Response Information
---

# Get Sync Job Info

{% hint style="info" %}
Only the same user can get the job info (even admin cannot get it)
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/application/sync/jobinfo/{Sync UUID}" method="get" summary="Get Single Sync Job Info" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200" description="" %}
```java
    {   
        "SyncUUID":""  ,
        "CreationDatTime" : "",
        "ModificationDateTime": "",
        "CreatedByUserUUID": "",
        "Status" : "InProgress",
        "ProgressPercentage" : 40,
        "SentData" : { "ResponseURL": "","DataFullyUpdated" : true},//S3 URL    
        "DataUpdates": { "URL": ""}//S3 URL
        "FreeTextFromClient": "",
        "Error" : { "Code": "123" , "Message" : "bad request" }" },        
        "ClientInfo":
        {
         "LastSyncDateTime" :"", 
         "LastSyncFormatedDateTime" :"", // Read only
         "DeviceExternalID" : "",
         "CPIVersionCPIVersion" : "",
         "TimeZoneDiff" : 1234
         "LocaleLocale" : "", 
         "BrandedAppID" : "", why? // for log purposes 
         "UserFullName" : "",
         "SoftwareVersion" : "",
         "SourceType" : "",
         "DeviceModel" : "",
         "DeviceName" : "",
         "DeviceScreenSize" : "",
         "SystemName" : "",
         "ClientDBUUID" :""
        }
    }
```
{% endswagger-response %}
{% endswagger %}

