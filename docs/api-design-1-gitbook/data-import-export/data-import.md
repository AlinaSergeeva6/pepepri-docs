---
description: Import data to a data source
---

# Data Import

## Data import

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/import/{addonUUID}/{resource}`

Import an array of up to 500 JSON objects to ADAL

#### Path Parameters

| Name                                        | Type   | Description                                     |
| ------------------------------------------- | ------ | ----------------------------------------------- |
| addonUUID<mark style="color:red;">\*</mark> | string | addonUUID of the addon this resource belongs to |
| resource<mark style="color:red;">\*</mark>  | string | Resource name                                   |

#### Headers

| Name              | Type   | Description                            |
| ----------------- | ------ | -------------------------------------- |
| X-Pepperi-OwnerID | String | Mandatory only for meta-data resources |

#### Request Body

| Name                                      | Type    | Description                                            |
| ----------------------------------------- | ------- | ------------------------------------------------------ |
| OverwriteObject                           | boolean | Overwrite existing objects in table. Default is false. |
| Objects<mark style="color:red;">\*</mark> | array   | Array of objects to be uploaded                        |
| AdditionalInitData                        | any     | here you can add any data you want                     |

{% tabs %}
{% tab title="200 Operation successfully done." %}
```
    [
        {
            'Key': 'foo1',
            'Status': 'Insert'
        },
        {
            'Key': 'foo2',
            'Status': 'Merge',
            'Details': '3'
        },
        {
            'Key': 'foo3',
            'Status': 'Ignore'
        },
        {
            'Key': 'foo2',
            'Status': 'Update'
        },
        {
            'Key': '',
            'Status': 'Error',
            'Details': 'Key is missing'
        },
        {
            'Key': 'foo4',
            'Status': 'Error',
            'Details': 'BatchPut: Upload failed'
        }
    ]
```
{% endtab %}

{% tab title="400 Error" %}
```
{"Message": "Invalid input"}
```
{% endtab %}
{% endtabs %}

Given an array of objects, pre-processes them using [relations](../addon-relations/addons-link-table/relation-names/data-import/) to prepare them for upload, and uploads them in batches using [BatchUpsert](../adal/batch-upsert.md).

{% hint style="info" %}
* Maximum input is 6MB
* A single object cannot exceed 400KB
* Maximum of 500 objects in input
{% endhint %}

{% hint style="info" %}
Using this interface is only possible with tables that support Import/Export. In order to support Import/Export, please refer to the [Import](../addon-relations/addons-link-table/relation-names/data-import/) and [export](../addon-relations/addons-link-table/relation-names/data-export.md) relations.
{% endhint %}

#### OverwriteObject

When uploading an object to the database using a "put" action, it will overwrite an existing object with the same key. Because of this, before uploading the object this function first checks if the object already exists in the database, and if so merges them together (overwriting only modified attributes) and only then uploads them.&#x20;

This happens by default. If an addon wishes to import objects while completely overwriting any existing object in the database (i.e. bypass the merging process) it may also pass "OverwriteObject"=true in the body parameter.

If "OverwriteObject" = true, all successful uploads will be represented in the DIMXObject returned as the Status: "Insert".&#x20;

### Input:

```typescript
{
    'Objects': 
    [
        {
            'Key': 'foo',
            'Attribute1': 'something',
            'Attribute2': 'something else'
        },
        {
            //...
        }
    ],
    'OverwriteObject': false, // false by default.
    "AdditionalInitData": { //the initial data that will be used in initRelationDataRelativeURL
        "Schema": "Pages",
        "AddonUUID": "f392f0ec-4282-11ee-be56-0242ac120002"
    }
}
```

### Schema notes

Data import uses the resource's schema, therefore when importing records to a resource, make sure that the [schema](../pepperi-resource-schema/) matches the records to be imported.

In case there is a difference between the structure of the records within the resource and the records that have been exported (if the relation function changed the structure of the records) make sure that the following apply:

1. A property must not have 2 types. That means, you cannot have property "Prop" which is considered a string in the resource schema, and export it as a number. A property must retain its type ALWAYS.
2. Include all properties from both structures. I.E the resource schema is the union of both structures. For example, if a relation adds a new property "Prop" to be exported, but the original record didn't have that property, "Prop" must still be included in the schema with its appropriate type. <br>

Note that any property that is not well documented in the schema, could be interpreted and imported as a string by default.

#### Output:

Outputs an array of DIMXObjects, each matching by index an input object (i.e. output\[5] is a DIMXObject corresponding to the input object input.Objects\[5].

{% hint style="info" %}
Automatically fills in values for the 'Key' attribute of the output [DIMXObjects](imported-object.md), using the 'Key' values in the objects returned by the relation. If no such value exists, the output [DIMXObject](imported-object.md) will contain an empty 'Key' and the 'Status' will be 'Error' ("Table key must exist").
{% endhint %}
