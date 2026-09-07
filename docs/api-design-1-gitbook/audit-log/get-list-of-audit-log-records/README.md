---
description: 'supported resources : all_activities, accounts, transactions'
---

# Get List Of Audit Log Entries

### Audit Log

* Record every activity going through the PNS&#x20;
* Two main types - data & action
* 'data' audit log is an atomic well defined operation of data change
* 'action' audit log is recording async  addon function, it is a continuous action which record an entry in its beginning and update this entry at least once at the end&#x20;
* data audit log can have an action audit log as its SourceAuditLog
* Header format is the same in every audit log &#x20;
* AuditInfo is different between every action audit log (see below all relevant types)
* AuditInfo is the same for all data audit logs&#x20;



{% hint style="warning" %}
This API Endpoint can only be used by Admin User - any other user type will get 401 Unauthorized HTTP Status Code&#x20;
{% endhint %}

{% hint style="info" %}
All Audit Logs has the same structure as "header"  and the "info" objects are unique to the specific AuditType
{% endhint %}

{% hint style="info" %}
The Status \
&#x20;       Failure =0

&#x20;       Success=1

&#x20;       InProgress=2

&#x20;       Skipped=3

&#x20;       InRetry=4
{% endhint %}

#### Example of items data changed by sync

```java
    { 
        "UUID" : "",
        "CreationDateTime" : "", //of the audit log ! not the data object
        "User" : {"InternalID" :12, "Name" :"", "Email" : ""},
        "Type" : "data",  //OR adal ( = PNSType)
        "AddonUUID": "",
        "Resource":  "items",
        "ActionType" : "update", // in case of "insert" no revised fields  
        "SourceActionUUID" : "",
        "Object": {
            "ModificationDateTime": "", 
            "InternalID": ""
            "UUID": "7b86e560-4761-421c-a04f-2d98d01d2c3b",
            "UpdatedFields" :
                        [
                            {
                                "FieldID" : "TSAMyCategory",
                                "OldValue" : "Nike",
                                "NewValue" : "Adidas"
                            },
                            {
                                "FieldID" : "Description",
                                "OldValue" : "Men Shoes 1",
                                "NewValue" : "Men Shoes 2"
                            }, 
                            ...
                        ]
        }
    }
```

## Get List Audit Log Entries (response where AuditType=data)

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/audit_logs`

## Get List Audit Log Entries (response where AuditType=data)

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/audit_logs`

**Example of Code Job data change**

#### Query Parameters

| Name           | Type    | Description                 |
| -------------- | ------- | --------------------------- |
| include\_count | boolean |                             |
| ascending      | boolean |                             |
| order\_by      | string  |                             |
| is\_distinct   | string  |                             |
| page\_size     | string  |                             |
| page           | string  |                             |
| fields         | string  |                             |
| where          | string  | e.g:  resource='activities' |

{% tabs %}
{% tab title="200 Response where=AuditType=data" %}
```java
[
    { 
        "UUID" : "",
        "CreationDateTime" : "", //of the audit log ! not the data object
        "ModificationDateTime" : "",
        "AuditType" : "data",  //OR action
        "Event" : { "Type": "nuclus" }, // future : Type :"User" and UserAction : "Submit"
        "SourceAuditLog" : {"UUID" : "",  "AuditType": "action", "EventType" : "sync" }, //e.g: Event such as Sync or Code Job
        "Status" : { "ID": 1, "Name": "Success" }, // { "ID": 0, "Name": "Failure" }
        "AuditInfo":
        {
            "ObjectUUID" :"7b86e560-4761-421c-a04f-2d98d01d2c3b",
            "DataModificationDateTime" : "",
            "Action" : {"ID" :12 , "Name": "Published/Updated/Created",  
            "DataResource":  "code_jobs",
            "NucleusModified": true,
            "AuditComment" : "Changed the cron expression to run every 2 hours",  //Comment added by the user        
            "RevisedFields" :
                        [
                            {
                                "FieldID" : "NextRunTime",
                                "OldValue" : "1565527080000",
                                "NewValue" : "1765527080000"
                            },
                            {
                                "FieldID" : "CronExpression",
                                "OldValue" : "*/2 * * * *",
                                "NewValue" : "*/3 * * * *"
                            }, 
                            ...
                        ]
        }        
    },
    ...
]
```
{% endtab %}
{% endtabs %}

#### Query Parameters

| Name           | Type    | Description  |
| -------------- | ------- | ------------ |
| include\_count | boolean | kL4QAFWged17 |
| ascending      | boolean | aPGY5YQkM4bz |
| order\_by      | string  | kurOrf4gD6Bz |
| is\_distinct   | string  | efqSfLwRYxao |
| page\_size     | string  | BI6XB7JJKLqY |
| page           | string  | ClCgvIt27TCy |
| fields         | string  | 28GGGbyRpMV2 |
| where          | string  | ph8JmpLVtAzX |

### Response where Event.Type=code\_job\_execution

{% hint style="info" %}
ResultObject size limit is 215K&#x20;
{% endhint %}

```java
[
    { 
        "UUID" : "",
        "CreationDateTime" : "", //of the audit log ! not the data object
        "ModificationDateTime" : "",
        "AuditType" : "action",  
        "Event" : { "Type": "code_job_execution" ,"User" : {"InternalID" :12, "Name" :"", "Email" : ""}}, // future : Type :"User" and UserAction : "Submit"
        "SourceAuditLog" : {"UUID" : "",  "AuditType": "action", "EventType" : "sync" }, //e.g: Event such as Sync or Code Job
        "Status" : { "ID": 1, "Name": "Success" }, // { "ID": 0, "Name": "Failure" }
        "AuditInfo":
        {
            "JobMessageData":{
                "CodeJobUUID" : "7daf16c1-c4b3-4096-b06a-6e03051f750f",
                "CodeJobName" : "",
                "CodeJobDescription": "",
                "IsScheduled" : false/true,
                "IsPublished" : false,
                "MessageType" : "UserCodeJobMessage",
                "SchemaVersion" : 1,
                "DistributorUUID" : "79012cfd-2497-4207-9acc-fa05f8f28b01",
                "FunctionPath" : "CodeJobFiles/79012cfd-2497-4207-9acc-fa05f8f28b01/Draft/7f7dd8c5-a298-447e-b621-8f041c22b8a0",
                "ExecutionMemoryLevel" : 1,
                "UserUUID" : "e9d48ad0-576b-4a8e-a8d7-8ab08e7abf44",
                "NumberOfTry" : 1,
                "NumberOfTries" : 1, // Maximum number of tries
                "FunctionName" : "main",
                "StartDateTime" : "2020-07-26T06:57:29.624Z",
                "EndDateTime" : "2020-07-26T06:57:31.639Z",
                "Request" : {
                  "path" : "", // Relative url path
                  "method" : "POST"/"GET",
                  "originalUrl" : "",
                  "query" : { }, // request query parameters
                  "body" : { } // request body objects
                },
            }
            "ResultObject" : {}, // the object returned from the function execution 
        }        
    },
    ...
]
```

### Response where Event.Type=addon\_job\_execution

```java
[
    { 
        "UUID" : "",
        "CreationDateTime" : "", //of the audit log ! not the data object
        "ModificationDateTime" : "",
        "AuditType" : "action",  
        "Event" : { "Type": "addon_job_execution" ,"User" : {"InternalID" :12, "Name" :"", "Email" : ""}}, // future : Type :"User" and UserAction : "Submit"
        "SourceAuditLog" : {"UUID" : "",  "AuditType": "action", "EventType" : "sync" }, //e.g: Event such as Sync or Code Job
        "Status" : { "ID": 1, "Name": "Success" }, // { "ID": 0, "Name": "Failure" }
        "AuditInfo":
        {
            "JobMessageData":{
                "CodeJobUUID" : "7daf16c1-c4b3-4096-b06a-6e03051f750f",
                "CodeJobName" : "",
                "CodeJobDescription" : "",
                "IsScheduled" : false/true,
                "IsPublished" : false,
                "AddonData" : { "AddonUUID" : "7daf16c1-c4b3-4096-b06a-6e03051f750f", "AddonPath":"", "AddonVersion":"" }, // AddonVersion = null in case of latest version
                "CallbackUUID" : "7daf16c1-c4b3-4096-b06a-6e03051f750f",
                "MessageType" : "AddonCodeJobMessage"/"AddonMessage",
                "SchemaVersion" : 1,
                "DistributorUUID" : "79012cfd-2497-4207-9acc-fa05f8f28b01",
                "FunctionPath" : "Addon/Public/c2d696b7-4942-4d19-9db7-7ccbb4f5a700/Ver3/test.js",
                "ExecutionMemoryLevel" : 1,
                "UserUUID" : "e9d48ad0-576b-4a8e-a8d7-8ab08e7abf44",
                "NumberOfTry" : 1,
                "NumberOfTries" : 1, // Maximum number of tries
                "FunctionName" : "main",
                "StartDateTime" : "2020-07-26T06:57:29.624Z",
                "EndDateTime" : "2020-07-26T06:57:31.639Z",
                "Request" : {
                  "path" : "", // Relative url path
                  "method" : "POST"/"GET",
                  "originalUrl" : "",
                  "query" : { }, // request query parameters
                  "body" : { } // request body objects
                },
            }
            "ResultObject" : {}, // the object returned from the function execution 
        }        
    },
    ...
]
```

### Response where Event.Type = sync

```java
[
    { 
        "UUID" : "", //syncUUI
        "CreationDateTime" : "", //of the audit log ! not the data object
        "ModificationDateTime" : "",
        "AuditType" : "action",  
        "Event" : { "Type": "sync" ,"User" : {"InternalID" :12, "Name" :"", "Email" : ""}}, // future : Type :"User" and UserAction : "Submit"
        "Status" : { "ID": 1, "Name": "Success" }, // { "ID": 0, "Name": "Failure" }
        "AuditInfo":
        {
            "AddonJob" : { "UUID" : "7daf16c1-c4b3-4096-b06a-6e03051f750f" } ,
            "StartDateTime" : "2019-07-07T12:58:13Z",
            "EndDateTime" : "2019-07-07T12:58:13Z",
            "LastSyncDateTime": 0,
            "DeviceExternalID": "daltestamirpc",
            "ClientDBUUID": "MaorTest3",
            "CPIVersion": "16.40",
            "TimeZoneDiff": 0,
            "Locale": "",
            "BrandedAppID": "",
            "UserFullName": "",
            "SoftwareVersion": "",
            "SourceType": "5",
            "DeviceModel": "",
            "DeviceName": "",
            "DeviceScreenSize": "",
            "SystemName": "AMIRF-PC"          "" : 2,
            "ResultObject" : {}, // the object returned from the function execution 
            "getURL" : "CodeJobFiles/8513b815-4487-4f16-97ef-2062d8dbde34/Draft/7daf16c1-c4b3-4096-b06a-6e03051f750f",
            "putURL" : "https://api.pepperi.com/v1.0/addons/api/{addon_name}/async/{js_file_name}/{function_name}" // the user request url
        }        
    },
    ...
]
```

### Response where  Event.Type=deployment

```java
[
    { 
        "UUID" : "",
        "CreationDateTime" : "", //of the audit log ! not the data object
        "ModificationDateTime" : "",
        "AuditType" : "action",  
        "Event" : { "Type": "deployment" ,"User" : {"InternalID" :12, "Name" :"", "Email" : ""}}, // future : Type :"User" and UserAction : "Submit"
        "Status" : { "ID": 1, "Name": "Success" }, // { "ID": 0, "Name": "Failure" }
        "AuditInfo":
        {
            "Addon" : {
                  "Name": "Promotion"
                  "UUID": "7daf16c1-c4b3-4096-b06a-6e03051f750f"
             }, 
             "AddonJobExecutionUUID": "7daf16c1-c4b3-4096-b06a-6e03051f750f" // the audit of the addon script that runs in the deployment 
             "Type": ""  // install/upgrade/downgrade/uninstall
             "FromVersion": "V1",
             "ToVerion": "V5.BETA",
            "StartDateTime" : "2019-07-07T12:58:13Z",
            "EndDateTime" : "2019-07-07T12:58:13Z"
        }        
    },
    ...
]
```

### Response where  Event.Type=login

```java
[
    { 
        "UUID" : "",
        "CreationDateTime" : "", //of the audit log ! not the data object
        "ModificationDateTime" : "",
        "AuditType" : "action",  
        "AuditType" : "action",  
        "Event" : { "Type": "login" , "User" : {"InternalID" :12, "Name" :"", "Email" : ""}}, // future : Type :"User" and UserAction : "Submit"
        "SourceAuditLog" : null,
        "Status" : { "ID": 1, "Name": "Success" }, // { "ID": 0, "Name": "Failure" }      
        "AuditInfo":
        {
              "ActivityID" : "0HLO0I0KSPFPE:00000006",
              "Error" : "invalid password",
              "ClientData" : {
                "Browser" : "chrome",
                "PepperiVersion" : "16_00"
              },
              "ClientID" : "pepperi.webapp.app.sandbox.pepperi.com",
              "AuthenticationMethod" : "pwd",
              "IdentityProvider" : "pepperi",
              "IsLoginByPepperiAdmin" : false
        }        
    },
    ...
]
```

### Audit log for sync\_actions

```
[
    { 
        "UUID" : "",
        "CreationDateTime" : "", //of the audit log- not the data object
        "ModificationDateTime" : "",
        "AuditType" : "sync_action",  
        "Status" : // TBD
        "AuditInfo":
        {
            "JobMessageData": {
                "DistributorUUID" : "79012cfd-2497-4207-9acc-fa05f8f28b01",
                "AddonUUID" : "00000000-0000-0000-0000-00000e1a571c",
                "UserUUID" : "e9d48ad0-576b-4a8e-a8d7-8ab08e7abf44",
                "FunctionPath" : "CodeJobFiles/79012cfd-2497-4207-9acc-fa05f8f28b01/Draft/7f7dd8c5-a298-447e-b621-8f041c22b8a0",
                "FunctionName": "function_name",
                "StartDateTime" : "2020-07-26T06:57:29.624Z",
                "ActionUUID" : "2ca2e693-fdc5-42bf-b154-6bc1cdc34c4a",
                "RequestID" : "46cd7dbd-d0f3-43f3-ad17-76ff8cf69185",
                "LambdaVersion" : "49",
                "LambdaMemorySize" : 256,
                "Duration" : 0.245,
            }
        }        
    },
    ...
]
```
