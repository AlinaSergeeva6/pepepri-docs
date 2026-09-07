---
description: for sync version 2.0 and above (open sync)
---

# Sync (sync 2.0 Pull)



{% hint style="info" %}
Note!&#x20;

* if sync is not receiving sources in its body, than no sync will be performed.
* if sources is passed but not last sync date time that matches the source, a resync will be performed only on the sources that is missing last sync time<br>
{% endhint %}

## bringing all modified data since modification date, for specific sources

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/open-sync/sync`

#### Request Body

| Name                                      | Type  | Description                                                                                                                                                            |
| ----------------------------------------- | ----- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Sources<mark style="color:red;">\*</mark> | array | <p>array of objects that has two properties -<br>AddonUUID and </p><p>LastSyncDateTime<br>this object is from ssm, sources last modification time</p>                  |
| ClientSources                             | array | <p>array of objects that has two properties -<br>AddonUUID and LastSyncDateTime,<br>this objects are from client device, what is the last sync time of each source</p> |

{% tabs %}
{% tab title="200: OK " %}
<pre class="language-json"><code class="lang-json">// If there are not any records to sync the response will be
{
    "UpToDate": true
}
<strong>
</strong><strong>// If there are records to sync the response will be
</strong>{
    "UpToDate": false, 
    "Resources": {
        "ContentLength": "283", // bytes
<strong>        "Data": [
</strong>            {
                "Schema": {
                    "SyncData": {
                        "IndexedField": "FirstName",
                        "Sync": true
                    },
                "Name": "MyNewCollection",
                "AddonUUID": "122c0e9d-c240-4865-b446-f37ece866c22",
                "Hidden": false
                },
                "Objects": [
                    {
                        "ModificationDateTime": "2022-06-16T14:42:30Z",
                        "Resource":{
                            "Name": "Resource Name",
                            "AddonUUID": "122c0e9d-c240-4865-b446-f37ece866c22",
                        },
                        "Key": "e4405aff-9e2f-4f5f-8a63-330572d87c4d",
                        "Name":"Simcha1",
                        "Hidden": false,
                        "ExpirationDateTime": "2023-06-16T14:42:02Z",
                        "CreationDateTime": "2022-06-16T14:42:02Z",
                        "Description": "Waintrob2",
                    }
                ]
            },
            {
                "Schema": {
                    "SyncData": {"Sync":true}, 
                    "Name": "MyNewCollection2",
                    "IndexedField": "LastName",
                    "AddonUUID": "122c0e9d-c240-4865-b446-f37ece866c22",
                },
                "Objects": [
                    {
                        "Key": "e4405aff-9e2f-4f5f-8a63-330572d87c4d",
                        "Hidden": false,
                        "CreationDateTime": "2022-06-16T14:42:02Z",
                        "ModificationDateTime": "2022-06-16T14:42:30Z",
                        "FirstName": "Moyshe",
                        "LastName": "Zuchmir"
                    }
                ]
            }
        ]
    },
    // only if there are files to sync you will see files in the response
    "Files": {
        "URL": "path to files Data base64 file",
        "Data": [
            {
                "URL": "https://cdn.staging.pepperi.com/Addon/Public/5123dc6d-745b-4f46-bb8e-bd25225d380a/0.6.6/client.zip",
                "DownloadToWebApp": false
            },
            {
                "URL": "https://cdn.staging.pepperi.com/Addon/Public/5123dc6d-745b-4f46-bb8e-bd25225d396a/0.6.6/addon-cpi.js",
                "DownloadToWebApp": true
            }
        ],
        "ContentLength": 270
    }  
}
</code></pre>
{% endtab %}
{% endtabs %}
