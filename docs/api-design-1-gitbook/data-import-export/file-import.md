---
description: Asynchronously Import data to a data source using a URI
---

# File Import

## Import URL

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/import/file/{addonUUID}/{resource}`

Import data in JSON/CSV format pointed to by a URI to an ADAL table.

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

| Name                                  | Type    | Description                                                                                                                                          |
| ------------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| OverwriteObject                       | boolean | Overwrite existing objects in table. Default is false.                                                                                               |
| URI<mark style="color:red;">\*</mark> | string  | URL of the JSON/CSV data to be imported                                                                                                              |
| Delimiter                             | string  | Delimiting character if data is in CSV format. Default is the distributor's default delimiter. Must not be '.' (dot). Must be exactly 1 char.        |
| Version                               | String  | Version of the addon used in export                                                                                                                  |
| OverwriteTable                        | boolean | Should overwrite the entire table, meaning only the imported items should remain in the resource                                                     |
| DotAnnotation                         | String  | Character to be used as the dot annotation in CSV only (default is '#') '.' is used in CSV to build internal objects in the JSON (see example below) |
| AdditionalData                        | any     | here you can add any data you want                                                                                                                   |
| MultipartOverwriteKey                 | String  | <p>used for Multipart OverwriteTable.</p><p>Mutually exclusive with OverwriteTable</p>                                                               |

{% tabs %}
{% tab title="200 Process finished" %}
```
// After polling the async result
{"URI":"https://cdn.staging.pepperi.com/TemporaryFiles/3975e4e1-711b-4f5e-cc2b-3747a860b2f4"}
```
{% endtab %}

{% tab title="400 Error" %}
```
{"Message": "File not found"}
```
{% endtab %}
{% endtabs %}

#### OverwriteObject

When uploading an object to the database using a "put" action, it will overwrite an existing object with the same key. Because of this, before uploading the object this function first checks if the object already exists in the database, and if so merges them together (overwriting only modified attributes) and only then uploads them.&#x20;

This happens by default. If an addon wishes to import objects while completely overwriting any existing object in the database (i.e. bypass the merging process) it may also pass "OverwriteObject"=true in the body parameter.

{% hint style="info" %}
Using this interface is only possible with tables that support Import/Export. In order to support Import/Export, please refer to the [Import](../addon-relations/addons-link-table/relation-names/data-import/) and [export](../addon-relations/addons-link-table/relation-names/data-export.md) relations.
{% endhint %}

### Multipart Overwrite Import

When performing a multipart import, incorporating the `MultipartOverwriteKey` into your file import requests is crucial.&#x20;

This key, obtained during the initialization of a multipart session, links each file upload to its respective import session, enabling the successful reassembly and import of the dataset. This process is essential for large file imports that utilize the `overwriteTable` functionality, allowing for the complete replacement of a table's contents with the new imported data.\
For more information, click [here](multipart-import/).

### Input:

```javascript
{
    'URI': 'http://www.some-place-containing-files.com/files/dataURI.ext',
    'OverwriteObject': false //false by default
    
    // The delimiter used for CSV files. 
    // Must be the same delimiter used in the file export.
    // Default is the distributor's default delimiter. 
    // Must not be '.' (dot). Must be exactly 1 char.,
    'Delimiter': ';'
    
    // version of the addon
    "Version": "1.0.3" 

    // Should overwrite the entire table, 
    // Meaning only the imported items should remain in the resource.
    // false by default
    // Mutually exclusive with MultipartOverwriteKey
    "OverwriteTable": false,
    
    // used for table overwrite of large files.
    // Please read "Multipart Import" section above.
    // Mutually exclusive with "OverwriteTable"
    "MultipartOverwriteKey": "some-unique-key", 
    
    //the initial data that will be used in initRelationDataRelativeURL
    "AdditionalInitData": { 
        "Schema": "Pages",
        "AddonUUID": "f392f0ec-4282-11ee-be56-0242ac120002"
    } 
}
```

Takes a URI (URL) describing a data source as an input. The input data can be either in JSON format or CSV format. The URL must have an extension of .csv or .json. URLs without extension will fail.

JSON format: The input data should be in the form of an array, where each element is an object

CSV format: Each line represents a JSON object in dot annotation. Each column represents a property. Nested properties will be separated by a '.' character. For example:

<table><thead><tr><th>Attr1</th><th width="150">Attr2</th><th width="150">Attr3.Nested1</th><th>Attr3.Nested2</th></tr></thead><tbody><tr><td>1</td><td>'a'</td><td>'hello'</td><td>'same'</td></tr><tr><td>2</td><td>'b'</td><td>'this is'</td><td>'goes'</td></tr><tr><td>3</td><td>'c'</td><td>'nested'</td><td>'here'</td></tr></tbody></table>

Represents the following JSON array:

```javascript
[
{
  "Attr1":1,
  "Attr2":'a',
  "Attr3":{
       "Nested1":'hello',
       "Nested2":'same'
  }
},
{
  "Attr1":2,
  "Attr2":'b',
  "Attr3":{
       "Nested1":'this is',
       "Nested2":'goes'
  }
},
{
  "Attr1":3,
  "Attr2":'c',
  "Attr3":{
       "Nested1":'nested',
       "Nested2":'here'
  }
}
]
```

For a simple JSON -> CSV converter and for better understanding, please visit[ this link.](https://toolslick.com/conversion/data/json-to-csv)  (under settings, set "path delimiter" to '.')

{% hint style="info" %}
Importing using the JSON format is limited to 65,536 items, and 500MB.&#x20;

Importing using the CSV format is limited to 327,680 items, and 5GB.&#x20;

Anything greater that that will have to be divided into parts, and imported separately.
{% endhint %}

The format of the data should be the same as the output given by [File Export](file-export.md).

### Schema notes

File import uses the [resource's schema](../pepperi-resource-schema/), therefore when importing records to a resource, make sure that the schema matches the records to be imported.

In case there is a difference between the structure of the records within the resource and the records that have been exported (if the relation function changed the structure of the records) make sure that the following apply:

1. A property must not have 2 types. That means, you cannot have property "Prop" which is considered a string in the resource schema, and export it as a number. A property must retain its type ALWAYS.
2. Include all properties from both structures. I.E the resource schema is the union of both structures. For example, if a relation adds a new property "Prop" to be exported, but the original record didn't have that property, "Prop" must still be included in the schema with its appropriate type. <br>

Note that any property that is not well documented in the schema, could be interpreted and imported as a string by default.

#### Output:

Outputs an object containing a URI of a temp file containing the result, which is an array of [DIMXObjects](imported-object.md)™ merged from all calls made to [Data Import](../addon-relations/addons-link-table/relation-names/data-import/).

Note - This is an asynchronous call. This means that the returned object above is obtainable after polling the audit-log for the result
