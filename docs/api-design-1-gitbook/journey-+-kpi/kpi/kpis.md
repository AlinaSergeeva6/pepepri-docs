---
description: The performance of the actions below will be monitored.
---

# KPIs

## Sync Stages

| Regular Sync               | Resync                     | Full Sync                  |
| -------------------------- | -------------------------- | -------------------------- |
| Sync Start                 | Sync Start                 | Sync Start                 |
| Upload Attachments         | Upload Attachments         |                            |
| Push Data/Put Start        | Push Data/Put Start        |                            |
| Put Processing Server      | Put Processing Server      |                            |
| Put Processing Client      | Put Processing Client      |                            |
| Get Data Processing Server | Get Data Processing Server | Get Data Processing Server |
| Get Data / Download        | Get Data / Download        | Get Data / Download        |
| Unzip Get Data             | Unzip Get Data             | Unzip Get Data             |
| Get Data Processing Client | Replace Db Client          | Replace Db Client          |
| Sync Finished              | Sync Finished              | Sync Finished              |

## KPI

<table><thead><tr><th width="166">Name</th><th width="214">Measurement<select multiple><option value="AkpIMgByGoIp" label="DurationInMS" color="blue"></option><option value="z5OtqPZYgNWR" label="Count" color="blue"></option><option value="3K7QVnrfJMEd" label="SizeInBytes" color="blue"></option></select></th><th width="340">Description</th><th data-type="content-ref"></th></tr></thead><tbody><tr><td>SyncTotal</td><td><span data-option="AkpIMgByGoIp">DurationInMS, </span><span data-option="z5OtqPZYgNWR">Count</span></td><td>total sync time from client perspective</td><td><a href="kpis.md#synctotal">#synctotal</a></td></tr><tr><td>SyncTotalServerSide</td><td><span data-option="AkpIMgByGoIp">DurationInMS</span></td><td>total server time </td><td><a href="kpis.md#synctotalserverside">#synctotalserverside</a></td></tr><tr><td><del>SyncPutTotal</del></td><td><span data-option="AkpIMgByGoIp">DurationInMS, </span><span data-option="z5OtqPZYgNWR">Count</span></td><td>Put of sync started preparing data to sent to server to put result processed on client.</td><td><a href="kpis.md#syncputtotal">#syncputtotal</a></td></tr><tr><td><del>SyncPutRequestLatency</del></td><td><span data-option="AkpIMgByGoIp">DurationInMS, </span><span data-option="z5OtqPZYgNWR">Count</span></td><td>PUT request of sync Data transmission to the server started and ended</td><td><a href="kpis.md#syncputrequestlatency">#syncputrequestlatency</a></td></tr><tr><td>SyncPutServer</td><td><span data-option="AkpIMgByGoIp">DurationInMS, </span><span data-option="z5OtqPZYgNWR">Count</span></td><td>Put of sync Started and ended on server</td><td><a href="kpis.md#syncputserver">#syncputserver</a></td></tr><tr><td>SyncGetServer</td><td><span data-option="AkpIMgByGoIp">DurationInMS, </span><span data-option="z5OtqPZYgNWR">Count, </span><span data-option="3K7QVnrfJMEd">SizeInBytes</span></td><td>server getting delta data</td><td><a href="kpis.md#syncgetserver">#syncgetserver</a></td></tr><tr><td><del>SyncGetLatency</del></td><td><span data-option="AkpIMgByGoIp">DurationInMS, </span><span data-option="3K7QVnrfJMEd">SizeInBytes</span></td><td>Download the Sqlite</td><td><a href="kpis.md#syncgetlatency">#syncgetlatency</a></td></tr><tr><td><del>SyncProcessGetClien</del>t</td><td><span data-option="AkpIMgByGoIp">DurationInMS, </span><span data-option="z5OtqPZYgNWR">Count, </span><span data-option="3K7QVnrfJMEd">SizeInBytes</span></td><td>Get of sync - start processing and ended on client (With the sqlite download ?)</td><td><a href="kpis.md#syncprocessgetclient">#syncprocessgetclient</a></td></tr><tr><td><del>SyncLegacyAttachmentUpload</del></td><td><span data-option="z5OtqPZYgNWR">Count, </span><span data-option="AkpIMgByGoIp">DurationInMS</span></td><td>Files sent before the put / Attachments </td><td><a href="kpis.md#synclegacyattachmentupload">#synclegacyattachmentupload</a></td></tr><tr><td>OnClientTransactionButtonClicked</td><td><span data-option="AkpIMgByGoIp">DurationInMS</span></td><td>User clicks on button and user get back control</td><td><a href="kpis.md#onclienttransactionbuttonclicked">#onclienttransactionbuttonclicked</a></td></tr><tr><td>OnClientTransactionScopeItemButtonClicked</td><td><span data-option="AkpIMgByGoIp">DurationInMS</span></td><td>User Clicks on button and user get back control</td><td><a href="kpis.md#onclienttransactionscopeitembuttonclicked">#onclienttransactionscopeitembuttonclicked</a></td></tr></tbody></table>

AdditionalData and ObjectKeys

| Name                                      | Additional Data                                                            | Object Keys      |
| ----------------------------------------- | -------------------------------------------------------------------------- | ---------------- |
| SyncTotal                                 | Initiator (resync, sync, ~~user sync, workflow, homepage, auto-schedule~~) | none             |
| SyncServerSide                            | Same as SyncTotal                                                          | none             |
| SyncPutTotal                              | Same as SyncTotal                                                          | none             |
| SyncRequestLatency                        | Same as SyncTotal                                                          | none             |
| SyncPutServer                             | Same as SyncTotal                                                          | none             |
| SyncGetServer                             | Same as SyncTotal                                                          | none             |
| SyncGetLatency                            | Same as SyncTotal                                                          | none             |
| SyncGetClient                             | Same as SyncTotal                                                          | none             |
| SyncFileUpload                            | Same as SyncTotal                                                          | none             |
| OnClientTransactionButtonClicked          | Activity Type Name +’\_’+ button name (“Sales Order\_ContinueOrder”)       | \[Activity UUID] |
| OnClientTransactionScopeItemButtonClicked | Activity Type Name +’\_’+ button name (“Sales Order\_Cart”)                | \[Activity UUID] |

### SyncTotal

ActionUUID  is the Sync UUID (for all of the sync KPIs)

Name - SyncTotal&#x20;

Count - Count of all records

DurationInMs - Total Duration of Sync Started from Client to Sync Ended on Client

Additional Data - Initiator (resync, sync, ~~user sync, workflow, homepage, auto-schedule~~)

ObjectKeys - None

{% hint style="info" %}
Count, Size should be the sum of data sent from the client + data sent from the server
{% endhint %}

### SyncTotalServerSide

ActionUUID  is the Sync UUID (for all of the sync KPIs)

Name - SyncTotalServerSide&#x20;

DurationInMs - Total Duration of Sync Started from Server to Sync Ended on Server

Additional Data - Same as [#synctotal](kpis.md#synctotal "mention")

ObjectKeys - none

{% hint style="info" %}
Should be similar to sum of server put + server get
{% endhint %}

### ~~SyncPutTotal~~

~~ActionUUID  is the Sync UUID (for all of the sync KPIs)~~

~~Name - SyncPutTotal~~&#x20;

~~DurationInMs - Total Duration of  Sync Put Started from Client to Sync Ended on Client~~

~~Size - Size of all data~~

~~Count~~

~~Additional Data - Same as~~ [#synctotal](kpis.md#synctotal "mention")

~~ObjectKeys - None~~

{% hint style="info" %}
gathering/packaging data
{% endhint %}

### ~~SyncPutRequestLatency~~

~~ActionUUID  is the Sync UUID (for all of the sync KPIs)~~

~~Name - SyncPutRequestLatency~~&#x20;

~~DurationInMs - Total Duration of Put of sync started sending data to the server to Put of sync ended sending data to the server~~

~~Count - Count of all data~~

~~Additional Data - Same as~~ [#synctotal](kpis.md#synctotal "mention")

~~ObjectKeys - None~~

{% hint style="info" %}
sending the data to the server
{% endhint %}

### SyncPutServer

ActionUUID  is the Sync UUID (for all of the sync KPIs)

Name - SyncPutServer&#x20;

Count - Count of all records

DurationInMs - Total Duration of Put of sync started on the server to Put of sync ended on the server

Additional Data - Same as [#synctotal](kpis.md#synctotal "mention")

ObjectKeys - None

{% hint style="info" %}
updating the data
{% endhint %}

### SyncGetServer

ActionUUID  is the Sync UUID (for all of the sync KPIs)

Name - SyncGetServer&#x20;

Count - Count of all records

Size - Size of all data

DurationInMs - Total Duration of Get of sync started on the server to Get of sync ended on the server

Additional Data - Same as [#synctotal](kpis.md#synctotal "mention")

ObjectKeys - None

{% hint style="info" %}
gathering data to be sent to the client
{% endhint %}

### ~~SyncGetLatency~~

~~ActionUUID  is the Sync UUID (for all of the sync KPIs)~~

~~Name - SyncGetLatency~~

~~Size - Size of all data~~

~~DurationInMs - Total Duration of Get of sync started sending data to the client to Get of sync ended sending data to the client~~

~~Count~~

~~Additional Data - Same as~~ [#synctotal](kpis.md#synctotal "mention")

~~ObjectKeys - None~~

{% hint style="info" %}
* sending the data to the client&#x20;
* Implementation note – total Get minus GetServer and GetClient&#x20;
{% endhint %}

### ~~SyncProcessGetClient~~

~~ActionUUID  is the Sync UUID (for all of the sync KPIs)~~

~~Name - SyncProcessGetClient~~&#x20;

~~Count - Count of all records~~

~~Size - Size of all data~~

~~DurationInMs - Total Duration of Get of sync started on the client to Get of sync ended on the client~~

~~Additional Data - Same as~~ [#synctotal](kpis.md#synctotal "mention")

~~ObjectKeys - None~~

{% hint style="info" %}
updating the client data
{% endhint %}

### ~~SyncLegacyAttachmentUpload~~

~~ActionUUID  is the Sync UUID (for all of the sync KPIs)~~

~~Name - SyncLegacyAttachmentUpload~~&#x20;

~~Count - Count of number of files~~

~~DurationInMs - Total Duration of Files upload started to Files upload ended~~

~~Additional Data - Same as~~ [#synctotal](kpis.md#synctotal "mention")

~~ObjectKeys - None~~

{% hint style="info" %}
Files sent before the put / Attachments
{% endhint %}

### OnClientTransactionButtonClicked

ActionUUID  is the EventActionUUID

Name - OnClientTransactionButtonClicked

DurationInMs - Total Duration of user clicks on button and get back control

Additional Data - Activity Type Name +’\_’+ button name (“Sales Order\_ContinueOrder”)

ObjectKeys - \[Activity UUID]

### OnClientTransactionScopeItemButtonClicked

ActionUUID  is the EventActionUUID

Name - OnClientTransactionScopeItemButtonClicked

DurationInMs - Total Duration of user clicks on button and get back control

Additional Data - Activity Type Name +’\_’+ button name (“Sales Order\_Cart”)

ObjectKeys - \[Activity UUID]
