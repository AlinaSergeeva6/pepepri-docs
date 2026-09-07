---
description: Interface for addons implement a sync source
---

# Source

###

### Get Delta changes of a source

{% hint style="warning" %}
Currently MVP\
We may add additional capabilities to the response (eg. files, full object instead of keys etc.)
{% endhint %}

This endpoint is called by the sync addon in sync

## Get list of object Key that changed in a specific time

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/addons/api/${sourceAddonUUID}/source/delta`

The URL is an example, it can be anything. The sync calls the URL specified in the Source.

#### Request Body

| Name                                              | Type    | Description                |
| ------------------------------------------------- | ------- | -------------------------- |
| LastSyncDateTime                                  | String  |                            |
| PageKey                                           | String  |                            |
| PageSize                                          | Integer | Returns around that number |
| IncludeDeleted                                    | Boolean | default is false           |
| PathData                                          | Object  | see documentation below    |
| SourceAddonUUID<mark style="color:red;">\*</mark> | String  | The source addon UUID      |

{% tabs %}
{% tab title="200: OK " %}
```json
{
    "Resources": [
        {
            "Schema": {
                "AddonUUID": "",
                "Name": ""
            },
            "Keys":[],
            "HiddenKeys":[],
            // optional, if exists these are the objects to be returned
            // both "Keys" and "HiddenKeys" are mutually exclusive with "Objects".
            "Objects":[], 
            
            // Optional
            // same as in Source object
            // overides sync behaviour specific on the source level
            "SyncDataConfiguration": {}
        }
    ],
    "NextPageKey": "" // only if there are additional pages left

    // Optional
    // if returned this is the time that will be stored on the client and not 
    // the time that the sources delta endpoint returns
    // NOTE: can only be returned on the first page!!
   "LastSyncDateTime": ""
}
```
{% endtab %}
{% endtabs %}



### Rebuild Sync source

Returns an async job that rebuilds a sync sources cache. This operation should be in a crawl mode, meaning that it shouldn't be destructive, and should only fix things that need to be fixed.

The response, containing information regarding the rebuild,  will be the documented body or a async job response where the result object of the async job is that object.

## The URL is an example, it can be anything. The sync calls the URL specified in the Source.

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/addons/api/${sourceAddonUUID}/source/rebuild`

#### Request Body

| Name              | Type      | Description                                                                                                                                                                                   |
| ----------------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| IncludedResources | String\[] | <p>Array of scheme names<br>Only these schemes will be rebuilt</p>                                                                                                                            |
| ExcludedResources | String\[] | <p>Array of scheme names<br>These schemes will not be rebuilt</p>                                                                                                                             |
| SourceAddonUUID   | String    | <p>The Sync Source Addon UUID.<br>Allows Addons to use proxies to implement the rebuild (eg. Nebulus for UDC)</p>                                                                             |
| Clean             | boolean   | <p>Cleans the cache before the rebuild.<br>Default is false.<br><strong>Use with caution, this will force all users to get all the data, because the cache will reset the delta.</strong></p> |

{% tabs %}
{% tab title="200: OK " %}
```json
{
    "Outputs": {
        [SchemeName: string]: {
            // The amount of changes that happened in the cache
            // eg. these changes will return in the next sync call
            "TotalChanges": 0
            
            // The total amount of object in cache after the rebuild
            "TotalCacheObjects": 0,
            
            // The total amount of objects crawled on from the ADAL
            "TotalObjects": 0,
    
            // Optional if there are changes
            // returns a URL to a file with the first 100 changes for debug purposes
            // The file content is an array of change objects like the following
            // {
            //     "Key": "136b3e60-34b1-4c2a-beb7-f60114e879a2",
            //     "CacheModificationDateTime": "2023-11-26T15:26:28.429Z",
            //     "CacheCreationDateTime": "2023-11-19T12:20:53.171Z"
            //     "ObjectModificationDateTime": "2023-11-23T07:54:18.000Z",
            //     "ObjectCreationDateTime": "2023-11-14T14:43:46.000Z",
            // }
            "Changes": "https://cdn.pepperi.com/TemporaryFiles/59ec5589-bc56-4606-b3e2-1593c120616a" 
        }
    },
    
    "Statuses": {
        [SchemeName: string]: {
            Status: 'Finished' | 'InProgress' | 'Aborted' | 'Failed';
            Message?: string;
        };
    }
}
```
{% endtab %}
{% endtabs %}

### Path Data

Lets review the following example&#x20;

* users connected to accounts, activities and to divisions&#x20;
* accounts connected to activities&#x20;
* divisions connected to items&#x20;

if IncludedResources contains accounts and account key in dest - only activities connected to the user and to the account will be returned

if ExcludeResources contains account and no destinations - divisions and items will be returned&#x20;

if path is empty - all will be returned&#x20;

<pre class="language-json"><code class="lang-json"><strong>{
</strong>    // Stop all reference paths on the first resource that exists in this array
    // The current user resource is always appended to this array 
    // if there is no path data - it means that we start from "users"
    // if no users resources exist
    "Destinations": [
        {
            "Resource": "accounts",
            "Key": "2c7d9007-8291-494a-95a9-8a5dda990722"
        }
    ],
    
    // Return only resources that have one of these resources in one their reference paths
    "IncludedResources": ["accounts"],

    // Return all resources expect these that have one of these resources in one their reference paths
    "ExcludedResources": [
    
    ]
}
</code></pre>
