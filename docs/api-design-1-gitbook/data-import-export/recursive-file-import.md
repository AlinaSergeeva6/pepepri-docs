---
description: Import files that were exported using Recursive File Export
---

# Recursive File Import

## Import records from multiple files to multiple resources while fixing inner references

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/addons/data/import/file/recursive/{addon_uuid}/{resource}`

#### Path Parameters

| Name                                          | Type   | Description                                |
| --------------------------------------------- | ------ | ------------------------------------------ |
| addon\_uuid<mark style="color:red;">\*</mark> | String | UUID of the addon this resource belongs to |
| resource<mark style="color:red;">\*</mark>    | String | The resource we wish to import to          |

#### Request Body

| Name                                  | Type    | Description                                                                                                         |
| ------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------- |
| URI<mark style="color:red;">\*</mark> | String  | URL of the main JSON data to be imported                                                                            |
| Resources                             | Array   | Array of referenced resources to be imported alongside the original request                                         |
| OverwriteObject                       | String  | Overwrite existing objects in table. Default is false.                                                              |
| Mapping                               | Object  | Mapping object got from "Create Recursive Mapping". Not providing a mapping object will result in an empty mapping. |
| Version                               | String  | Version of the addon used in export                                                                                 |
| OverwriteTable                        | boolean | Should overwrite the entire table, meaning only the imported items should remain in the resource                    |
| AdditionalData                        | any     | here you can add any data you want                                                                                  |

{% tabs %}
{% tab title="200: OK Process Finished" %}
```javascript
{
    "URI": "https://pfs.staging.pepperi.com/fcd1d935-5ab7-4e0a-a3cf-1644acad3dec/9ddbf18c-3223-40ac-b251-6fc6fa99e473/DIMX_import/75314b81-28b1-4443-b90a-daac564c6713.json",
    "Resources": [
        {
            "URI": "https://pfs.staging.pepperi.com/fcd1d935-5ab7-4e0a-a3cf-1644acad3dec/9ddbf18c-3223-40ac-b251-6fc6fa99e473/DIMX_import/f1ed055e-04ee-4246-979a-f2b418300ba1.json",
            "AddonUUID": "d8769c04-4295-4925-908c-415fcb12b451",
            "Resource": "recursive3"
        },
        {
            //
        }
    ]
}
```
{% endtab %}

{% tab title="400: Bad Request Error" %}
```javascript
{"Message": ErrMsg}
```
{% endtab %}
{% endtabs %}

### Input:

```javascript
{
    // URL of the main request
    "URI": "https://pfs.staging.pepperi.com/fcd1d935-5ab7-4e0a-a3cf-1644acad3dec/9ddbf18c-3223-40ac-b251-6fc6fa99e473/DIMX_import/75314b81-28b1-4443-b90a-daac564c6713.json",
    // Addon version
    "Version":"1.0.3",
    // Array of inner references obtained from the main request
    "Resources": [
        {
            "URI": "https://pfs.staging.pepperi.com/fcd1d935-5ab7-4e0a-a3cf-1644acad3dec/9ddbf18c-3223-40ac-b251-6fc6fa99e473/DIMX_import/f1ed055e-04ee-4246-979a-f2b418300ba1.json",
            "AddonUUID": "d8769c04-4295-4925-908c-415fcb12b451",
            "Resource": "recursive3",
            "Version":"1.0.14",
            "OverwriteTable":false // false by default
        }
    ]
    // Mapping object. Note that all "Action"s must be "Replace".
    // if an "Ask" action is receieved, the request will fail.
    // the mapping object should only refer to records that require changes.
    "Mapping":{
        "addonUUID1_resource1": {
            "originalKey1": {
                "Action":"Replace",
                "NewKey":"newKey1"
            },
            "originalKey2": {
                "Action":"Replace",
                "NewKey":"newKey2"
            },
        },
        {
        "addonUUID2_resource2": {
            "originalKey1": {
                "Action":"Replace",
                "NewKey":"newKey1"
            },
            "originalKey2": {
                "Action":"Replace",
                "NewKey":"newKey2"
            },
        }
    }
    // Should overwrite the current object in the database instead of merging 
    // into it. Progagates to inner references imports.
    "OverwriteObject": false,
    
    // Should overwrite the entire table, 
    // meaning only the imported items should remain in the resource.
    // does not propegate to inner references imports and each reference
    // should indicate if it wishes to overwrite the table.
    "OverwriteTable":false,
    "AdditionalInitData": { //the initial data that will be used in initRelationDataRelativeURL
        "Schema": "Pages",
        "AddonUUID": "f392f0ec-4282-11ee-be56-0242ac120002"
    }
}
```

### Reference Fixing:

When importing a record to another system, there might be a need to fix some of its properties. For example, an item with the ID 10 in one system might have the ID 83 in another, and therefore it must be fixed before being imported to the other system. This problem gets more complicated when considering referenced records. Lets assume that record A holds a reference to record B, and B has a different ID in the new system we're importing it to.\
Not only do we have to change the record B to match the ID of the new system, we also have to change the hosting record A to match the new ID.\
For that purpose, we introduce a fixing mechanism. Go to [import relation](../addon-relations/addons-link-table/relation-names/data-import/#communication-api-for-mappingrelativeurl) for more details.
