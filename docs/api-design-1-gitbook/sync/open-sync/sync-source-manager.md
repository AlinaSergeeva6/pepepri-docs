---
description: The addon that manages sync sources
---

# Sync Source Manager

Holds all the sync sources of a tenant, and allows update of lastSyncTime per Source, and quick function to return the delta of sync sources (sources that have changes in a time period)

#### Upsert Sync Sources or Update just the LastSyncDateTime

## Upsert Sync Source

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/sync/ssm/sources`

Get is also supported as. Standard resource.

{% tabs %}
{% tab title="200: OK " %}
```json
// this is the request body as well
{
    // the source name
    // Mandatory: for debug purposes
    "Name": "",

    // the source addon UUID
    // this addon will be called to get the last delta
    "AddonUUID": "",

    // Mandatory
    // defines the endpoint to call to get the last delta, when it is required per the LastSyncDateTime
    // the endpoint is relative to the papi base url
    // The interface is defined in the Source tab
    "DeltaRelativeURL": "",

    // Mandatory
    // Defines the endpoint to call to rebuild the delta cache
    // The interface is defined in Source tab
    // This field is not returned in the delta endpoint since it is not relevant in sync
    "RebuildRelativeURL": "",
    
    // Optional: default is all the defaults below
    // Fields that relay information to the sync addon 
    // on how to handle the data it receives from the ADAL (eg. removing properties, adding files, etc.)
    // this configuration can be on the source level in this source object, additionally it can return 
    // from the delta endpoint per Schema level. 
    // The actual configuration is the merge of the source and schema configuration, where the scheme level
    // overrides the source level
    "SyncDataConfiguration": {
        // Optional: exclude these fields from being synced
        // default includes all fields
        "ExcludedFieldIDs": [],
        // Optional: Sync only these FieldIDs (In addition to basic ADAL fields)
        // default includes all fields, or per the ExcludedFieldIDs
        "IncludedFieldIDs": [],
        // Optional, default is Key
        // eg. configuration may want to store the DraftKey
        "KeyFieldID": "",
        // Optional, default is none
        // Allows indexing a single field
        // This field can be queried using the keyword index in the
        // pepperi.api.adal.getList ClientAPI 'index' parameter
        "IndexFieldID": "",
        
        // Optional, default is false
        // if false, data that is added to the scheme from cpi-side will not be pushed to the server
        // and other users/devices will not be able to see it.
        // NOTE: workaround alert - this property should be a copy from the schema.
        "PushLocalChanges": true,

        // Optional
        // An array of files to create per synced object
        "Files": [
            {
                // Mandatory - Either URLFieldID or URL
                // The Field URL from where to bring the file name can be a full URL or relative URL
                // Mutually exclusive with URL
                // if in the field there is an array of URLs, for each URL there will be a file
                "URLFieldID": "URL",
                // Mandatory - Either URLFieldID or URL
                // can be a full URL or relative URL
                // Mutually exclusive with URLFieldID
                "URL":"file.txt",
                // base url for the file, must be paired with URL or URLFieldID
                // Mutually exclusive with BaseURLFieldID
                "BaseURL":"https://cdn.pepperi.com/Addon/Public/00000000-0000-0000-0000-00000000c07e/1.3.4",
                // the field which contains the base url path, must be paired with URL or URLFieldID
                // Mutually exclusive with BaseURL
                "BaseURLFieldID": "URLFieldName",
                // Optional: default uses the URL path 
                // The relative path the file will have in the CPI Side
                // ** NOT IMPLEMENTED ** 
                "RelativePathFieldID": "Key",
                // Optional: Default is empty
                // Concats the BaseRelativePath to the RelativePath (by RelativePathFieldID or default)
                // ** NOT IMPLEMENTED ** 
                "BaseRelativePath": "/ef70ea3e-ca53-4ecf-a42c-445036a3a3dd/ad909780-0c23-401e-8e8e-f514cc4f6aa2/Assets",
                // Optional: Field in the object specifying SyncType
                // The field value can be "None" | "Device" | "Always"
                // default is "Device"
                "SyncFieldID": "Sync",
                // Optional: default uses the ModificationDateTime
                // Allows file object to specify if the file was changed
                // So that in cases where the object was changed and the file
                // wasn't the sync will only sync the data but not the file
                // The sync compares the value in the field to the current lastSyncDateTime
                "FileModificationDateTimeFieldID":"FileModificationDateTime"
            }
        ]
    },
    
    // Optional
    // An array of resources supported by this sync 
    // Default is only users
    // which mean that by default a source will only be called if either 
    // PathData.IncludedResources is empty, or it includes "users"
    "SupportedIncludedResources": [
        "users"
    ],

    // Optional on upsert
    // The last time a delta cache was updated for this source
    // Stored by the client to use on next delta sync
    "LastSyncDateTime": ""
}
```
{% endtab %}
{% endtabs %}

#### Get the Sources requiring sync based on their currently LastSyncDateTime

### Examples:

```json
For the examples data will be:
{
        "ModificationDateTime": "2025-04-20T09:56:05.722Z",
        "CreationDateTime": "2023-05-23T09:24:11.571Z",
        "AssetsBaseUrl": "https://cdn.staging.pepperi.com/Addon/Public/00000000-0000-0000-0000-000000000000/1.4.3",
        "CPISideFiles": "client.zip",
        "Relations": {
            "AddonBlocks": [],
            "PageBlocks": []
        },
        "Hidden": false,
        "Version": "1.4.3",
        "Key": "00000000-0000-0000-0000-000000000000"
}
```

<pre class="language-json"><code class="lang-json">// NOTE! all of the following examles will create the same file url -
// https://cdn.staging.pepperi.com/Addon/Public/00000000-0000-0000-0000-000000000000/1.4.3/client.zip
// URL &#x26; BaseURLFieldID:
<strong>{
</strong>    "Files":[
        {
            "URL":"client.zip",
            "BaseURLFieldID": "AssetsBaseUrl"
        }
    ]
}

// URL 
{
    "Files":[
        {
            "URL":"https://cdn.staging.pepperi.com/Addon/Public/00000000-0000-0000-0000-000000000000/1.4.3/client.zip"
        }
    ]
}

// BaseURL &#x26; URLFieldID
{
    "Files":[
        {
            "BaseURL":"https://cdn.staging.pepperi.com/Addon/Public/00000000-0000-0000-0000-000000000000/1.4.3",
            "URLFieldID": "CPISideFiles"
        }
    ]
}

// BaseURLFieldID &#x26; URLFieldID
{
    "Files":[
        {
            "BaseURLFieldID": "AssetsBaseUrl",
            "URLFieldID": "CPISideFiles"
        }
    ]
}
</code></pre>

## Get delta of sync sources

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/sync/ssm/delta`

#### Request Body

| Name    | Type  | Description                                                           |
| ------- | ----- | --------------------------------------------------------------------- |
| Sources | Array | <p>The last sync sources<br>Mandatory AddonUUID, LastSyncDateTime</p> |

{% tabs %}
{% tab title="200: OK Returns all the sync sources requiring sync" %}
```json
{
    // The sync sources that have new delta 
    // in respect to the request LastSyncDateTime
    // In addition, any new Sync Sources that aren't sent
    "Sources": [
    ]
}
```
{% endtab %}
{% endtabs %}



