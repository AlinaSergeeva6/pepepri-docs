---
description: Sync data from ADAL
---

# Pull Data



## Get differential data based on LastSyncDateTime

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/pull`

Based on the given LastSyncDateTime ([ISO format](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global\_Objects/Date/toISOString)) all the data in ADAL that was changed since this time will be retrieved.\
in case `Query` is undefined or null or empty return objects without any filter.

#### Headers

| Name                                                 | Type   | Description             |
| ---------------------------------------------------- | ------ | ----------------------- |
| X-Pepperi-ActionID<mark style="color:red;">\*</mark> | String | should be the sync uuid |

#### Request Body

| Name                                      | Type   | Description                                                                                                                                                                                                                                                                                       |
| ----------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ClientDBUUID - not in use                 | String | Do not return data that was modified by this DB UUID                                                                                                                                                                                                                                              |
| Resources - not in use                    | Array  | <p><del>By default it is the user.</del><br><del>The object is AddonUUID, Resource, Key.</del><br><del>{</del> <br>   <del>"AddonUUID": "",</del></p><p>   <del>"Resource": "",</del><br>   <del>"Query": {} // see below</del></p><p><del>}</del></p>                                            |
| Sources<mark style="color:red;">\*</mark> | Array  | <p>[</p><p>    {</p><p>        "AddonUUID: "",</p><p>        "LastSyncDateTime": "" </p><p>    },</p><p>    {</p><p>        "AddonUUID:"",</p><p>        "LastSyncDateTime": ""</p><p>    },</p><p>]</p><p></p><p>Array of the sources that needs to be syned (Nebula, Core etc..)</p><p><br></p> |

{% tabs %}
{% tab title="200: OK " %}
<pre class="language-json"><code class="lang-json">// If there aren't ADAL records to Sync the response will be
{
    "UpToDate": true
}
<strong>// If there are ADAL records to sync the response will be
</strong>{
    "UpToDate": false,
    "ExecutionURI": "/audit_logs/{{Execution UUID}}"
}
<strong>// when checking the audit log of the sync response the data will be
</strong><strong>{   
</strong><strong>    "ADALLastSyncTime": "2023-10-30T10:08:27.186Z",
</strong>    "Resources": {
        "ContentLength": "283", // bytes
        // in case data is bigger than 128 KB, url link will be returned 
        // the files stored in PFS and the are in base64, delimiter between
        // each resource is newline
        // each resource is containing schema and objects to sync
        "URL": "path to ResourcesData json file",
        // Otherwise Data will be returned
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

```javascript
// Query Resource Definition in the request body
{
    "Type": "Resource" | "Custom" ,
    // Specific type data
    
}
// Resource Type Query 
{
    "Resource": "users",
    "AddonUUID": "00000000-0000-0000-0000-0000000c09e", //nucleus
    "Key": "2d06b975-a03b-42c9-940a-a3a6f67d6d67"
}
```

{% hint style="info" %}
WACD should get the sync data in a specific format (MapData format), so by replacing '/sync' endpoint with '/sync?wacd=true' we'll get the data in this format.\
Besides, the behavior will be the same between the endpoints



the response will be an array of objects like the following object:
{% endhint %}

```
[ 
    {
        "Key1": "{addon_uuid}_{resource}",
        "Key2": "d00d-98-98-98", // the object key,
        "Values": "{\"ModificationDateTime\":\"2022-05-29T14:26:07.302Z\",\"Phone\":\"123-456-7890\",\"Age\":32}", // the full object except the key  
        "Hidden": false,        
        "MapDataMetaDataInternalID": 7552, // the map data meta data internal id
        "InternalID": 297656854 // some temporary internal id
    }
    .....
]
```
