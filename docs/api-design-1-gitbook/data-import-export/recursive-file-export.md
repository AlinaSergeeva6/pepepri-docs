---
description: >-
  Export data from resource recursively, including references and
  sub-references.
---

# Recursive File Export

## Similar to File Export, but exports references recursively.&#x20;

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/export/file/recursive/{addon_uuid}/{resource}`

Export objects from an data source query to a CSV/JSON temporary file and returns the file's URL. Similarly, recursively exports referenced objects and returns a URL for each different resource exported

#### Path Parameters

| Name                                          | Type   | Description                                |
| --------------------------------------------- | ------ | ------------------------------------------ |
| addon\_uuid<mark style="color:red;">\*</mark> | String | UUID of the addon this resource belongs to |
| resource<mark style="color:red;">\*</mark>    | String | The resource we wish to export from        |

#### Request Body

| Name               | Type   | Description                                                                                                                                                           |
| ------------------ | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| IncludeDeleted     | String | include deleted records. Default is false. Applies only to the original request and not to the inner references.                                                      |
| Where              | String | Where String Where clause. Empty where clause will export the entire resource. Applies only to the original request and not to the inner references.                  |
| Fields             | String | Fields String The fields to be exported from the object. If omitted, exports the entire object. Applies only to the original request and not to the inner references. |
| ExcludedKeys       | Array  | Array of keys that should be excluded from the export. Records that match the keys will not be included in the final export file.                                     |
| AdditionalInitData | any    | here you can add any data you want                                                                                                                                    |

{% tabs %}
{% tab title="200: OK Process finished" %}
```javascript
{
    "URI": "https://pfs.staging.pepperi.com/0a3af4e7-32de-4118-8ccf-5d9dbd79c041/44c97115-6d14-4626-91dc-83f176e9a0fc/DIMX_import/8d6baa51-bcc0-421d-bb9c-d4ba505b62dd.json",
    "Version": "1.0.3"
    "Resources": [
        {
            "URI": "https://pfs.staging.pepperi.com/0a3af4e7-32de-4118-8ccf-5d9dbd79c041/44c97115-6d14-4626-91dc-83f176e9a0fc/DIMX_import/01e1d25d-62eb-4e8e-9619-ba3ad5734b63.json",
            "AddonUUID": "b78f61f0-e9f0-4650-9ab1-d8b0906505ec",
            "Resource": "recursive3",
            "Version": "1.0.12"
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

Recursive File Exports will export data from a resource in a recursive manner. That means that if the resource's schema defines a property to be a reference, the objects referenced by the exported objects will also be exported, and so on.

For example:

Resource A has 3 records: A1, A2, A3. Each of those records references a record of resource B: A1 references B1, A2 references B2 and A3 references B3. Therefore when exporting records A1,A2,A3 from resource A we will get the URI for resource A and also the URI for resource B.

Note- There are 2 types of references, as described in the[ Pepperi Resource Schema](../pepperi-resource-schema/#examples-refs-contained) page: pointing reference (holds a key to a record of another resource) and a data reference (holds the entire data that belongs to another resource).

In case the reference is a pointing reference, the URI of that export will be included in the output. In case the reference is a data reference, there will be no additional URI for that resource since the data is already **contained** within its host, so there is no need to export it separately.



Usage example:\
Assume we have the following resource schemas

```javascript
// schema for the resource "recursive1"
{
    "Name": "recursive1",
    "Type": "data",
    "Fields": { 
        "Key": {"Type": "String"},
        "Reference1": {
            "Type": "Resource",
            "Resource": "recursive2",
            "AddonUUID": "addon_uuid"}
    }
}

// schema for the resource "recursive2"
{
    "Name": "recursive2",
    "Type": "data",
    "Fields": { 
        "SomeProperty": {"Type": "String"},
        "Reference2": {
            "Type": "Array",
            "Items":{
                    "Type": "Resource",
                    "AddonUUID": "addon_uuid",
                    "Resource":"recursive3"}
        }
        
    }
}

// schema for the resource "recursive3"
{
    "Name": "recursive3",
    "Type": "data",
    "Fields": { 
        "Key": {"Type": "String"},
        "NotReference": {
            "Type": "String"}
    }
}
```

as we can see, records of "recursive1" reference records of "recursive2" which in turn reference records of "recursive3"

we upload the following records to 'recursive3':

```javascript
{
    "Objects": [
        {"Key":"recursive3key1",
        "NotReference":"1thing"
        },
        {"Key":"recursive3key2",
        "NotReference":"2thing"
        },
        {"Key":"recursive3key3",
        "NotReference":"3thing"
        }
    ]
}
```

we upload the following record to 'recursive1':

```javascript
{
    "Objects": [
        {"Key":"recursive1key2",
        "Reference1":{ //This will contain a data object that fits the schema of "recursive2"
            // some property of a record of resource 'recursive2'
            "SomeProperty":"recursive2key2",
            // an array of inner references to 'recursive3'. Each string within the array
            // is a key of a record of resource 'recursive3'
            "Reference2" : ["recursive3key1", "recursive3key2", "recursive3key3"] 
        }
    ]
}
```

As we can see, records of resource 'recursive1' have a property "Reference1" which is a reference of type data, which holds data that belongs to the resource 'recursive2'.

We can also observe that records of resource 'recursive2' (the objects contained within 'recursive1' records) have a property "Reference2" which is a pointing reference to records of resource 'recursive3'

We can request a recursive export of 'recursive1' by posting to https://api.pepperi.com/v1.0/addons/data/export/file/recursive/addon\_uuid/recursive1

The output we get is this:

```javascript
{
    "URI": "https://pfs.staging.pepperi.com/0a3af6e7-32de-4128-8ccf-5dddbd79c041/6333669d-4367-4f71-a74e-a13b18105af3/DIMX_import/12de8111-b57b-4098-8c8f-1b343143231e.json",
    "Resources": [
        {
            "URI": "https://pfs.staging.pepperi.com/bab41422-ef97-87a8-ccab-3d9d18fcaaaa/83701d83-5c4e-4b43-a4c1-cf9c5d2fb4ea/DIMX_import/ea2a2481-7467-4adf-b351-a81827de7366.json",
            "AddonUUID": addon_uuid,
            "Resource": "recursive3"
        }
    ]
}
```

"URI" is the result file of the original request to export 'recursive1'

"Resources" is an array of references found within 'recursive1'

Within "Resources" We get the URI of the inner reference 'recursive3', together with the addon\_uuid and resource name describing 'recursive3'.

Note that we have no URI for 'recursive2' since the records of 'recursive2' are already contained within records of 'recursive1'

{% hint style="info" %}
Unlike the regular [File Export](file-export.md), this Recursive File Export only supports JSON format, CSV is not supported.
{% endhint %}
