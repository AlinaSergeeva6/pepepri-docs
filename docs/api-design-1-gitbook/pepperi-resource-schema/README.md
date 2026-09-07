---
description: Pepperi Standard Schema per resource
---

# Pepperi Resource Schema

Schema can be used whenever needed but there are two clear usages&#x20;

1. Define a resource on a Pepperi data source (ADAL, PFS, ...)
2. As part of a relation, when the relation owner needs to get a schema or partial schema\
   For example, the page will require the block to define a schema containing only fields that have SupportScreenSizes needed by the page for the configuration of the block. The Block can return a full schema or partial according to the relation definition&#x20;

{% hint style="info" %}
Reference Dynamic/Static - reference means pointing to another schema

Dynamic - the reference schema UUID is not defined in the hosting schema&#x20;

Static - the referenced schema UUID is part of the data of the hosting object&#x20;

Reference contained/pointing

Pointing - the reference is to another table (holding key)

Contained - the reference is stored within the hosting object (holding data)&#x20;
{% endhint %}

{% hint style="info" %}
contained object&#x20;

* The schema Type must be **contained**&#x20;
* does not manage its own data storage
* does not support resource endpoint - it is not a regular endpoint as it does not stand on its own&#x20;
* can not hold a private reference (ownership reference), can hold reference of another contained type&#x20;
* &#x20;no PNS event on this object
{% endhint %}

```javascript
{
    //Mandatory
    "Name": "my_table", // camelCase (or snake_case) Not PascalCase
    "Hidden": false, //readonly
    "CreationDateTime": "1-1-2012", //readonly, index
    "ModificationDateTime": "", // readonly

    // the type is actually sub type of the DataSourceUUID (addon specific data)
    // data - ADAL
    // indexed_data - ADAL index (legacy?) - it should be implemented with elastic?
    // meta_data - 
    // shared_index - elasticsearch
    // pfs - Pepperi Files Service. 
    // will be extended in the future (e.g. can add "external" and then look for UUID relation and its addon)
    "Type": "contained|abstract|data|indexed_data|papi|meta_data|index|shared_index|pfs", // default type: "meta_data" TODO: should we change it back to data?

    // Sync (optional) - Nebula
    // If the SyncData exists it means that this schema should be synced
    "SyncData": {
        // whether to sync this table
        // default false
        "Sync": true,
        // if false, data that is added to the scheme from cpi-side will not be pushed to the server
        // and other users/devices will not be able to see it.     
        // default false
        "PushLocalChanges": true,
        // in case associative is present in means that this table will be used as edges 
        // the sync will not take any data from the table, it will just use the two references to create 
        // "undirected" edge in the Nebula
        "Associative": {"FieldID1": "accounref", "FieldID2":"userref"},
        // NOTE: Associative and ReferenceFields are mutually exclusive.
        // reference fields that are used to create edges in Nebula pointing 
        // to the node it is referencing
        // The Schema poiting to can be with Sync false thus the node will never exist
       "ReferenceFieldIDs":["f1","f2", ...],
        // If SyncFieldLevel is false - indicates to sync all of the fields in the object.
        // If SyncFieldLevel is true - indicates that there are fields on the object that no need to be synced.
        // Each field will be marked individually with the "Sync" property
        // ignore this field for now - "SyncFieldLevel": false, // by default
        // This field will be indexed in the CPI
        "IndexedField": "Field1"   // default is "" - optional   
        // Should the records of the table be synced into the graph.
        // default true.
        "SyncRecords": true,
        // An array of rules per profile that defines how the table should be synced.
        SyncRules: {
            // The profile that the rules apply to.
            ProfileKey: string;
            // The sync rules array.
            // If empty - the entire table will be synced.
            Rules: {
                // The name of the source table (points to current table).
                SourceTable: string;
                // The field ID in the source table that points to the current table.
                SourceFieldID: string;
                // The field ID in the current table that connects SourceTable to it.
                TargetFieldID: string;
            }[];
        }[];
    }
    // optional
    // Was there a change to the sync configuration.
    // Reset after applying changes.
    SyncDataDirty: boolean;
    // by default pepperi supports all of the above Types and know the DataSourceBaseURL for each one of them
    // if someone wants to create their own data source this must be defined
    // POST DataSourceBaseURL/schemes/{addonUUID}/create - will get the schema in the body
    // POST DataSourceBaseURL/schemes/{addonUUID}/purge - will get the schema in the body
    // GET DataSourceBaseURL/{addonUUID}/{resourceName}/{:key} - legacy endpoint - not needed
    // GET DataSourceBaseURL/{addonUUID}/{resourceName}/key/{:key} 
    // POST DataSourceBaseURL/search/{addonUUID}/{resourceName} - get items with big where clause or by keyList
    // POST DataSourceBaseURL/{addonUUID}/{resourceName}
    // POST DataSourceBaseURL/batch/{addonUUID}/{resourceName}
    "DataSourceBaseURL": "https://url",
    // optional
    // specific data per data source 
    // will be defined per data source 
    "DataSourceData": {
    },
    // I do not think we use this? it is part of the schema fields
    // TODO : remove this?
    "StringIndexName": "my_index", // optional, the name of the field in the document to be used as index

    // optional
    // define if this schema should be returned from the resources api call.
    // if true, the name of the schema must be unique accross all schemes 
    "GenericResource": false // by default
    
    // optional
    // If the schema extends a base-schema it should include this field,
    // (the base schema should be in the current distributor)
    // all fields from the base-schema are copied and into this schema 
    // so it's important to make sure you don't have a field with the same name (else it will fail)
    // Note: When a change happens in the fields of the base-schema this new schema will changes accordingly.
    "Extends": {
        "AddonUUID": "UUID",
        "Name": "RESOURCE_NAME"
    }
    
    "Fields": { // all fields should be PascalCase
        "Field1": {
            "Type": "String|Bool|DateTime|Integer|Double|MultipleStringValues|Object",
            // properties can be added by defining them on the relation, thus 
            // extending the schema
            // optional
            "ExtendedRelationProperty": any,
            // e.g. extension of the ADAL/index/typed_index
            // in index/typed_index text is case inseneitive
            "Indexed": true, // Default is false
            // e.g. extension of the index/typed_index
            // used for full phrase search, case sensitive 
            // only for string
            "Keyword":true, //  Default is false
            // if Sync is true, it means that this field will sync to the app
            "Sync": false, // Default is false
            // optional - default is false
            // true if this field is unqiue and supports GET /unique/Field1/value 
            "Unique": true,
            // Is the field inherited from base schema
            // readonly
            "ExtendedField": true,
            // Optional Field (Can be left undifined)
            // Will be taken into consideration on batch requests only!
            // A default value for the field - will be added to records on a batch requests if defined and the fields value wasn't specified
            "DefaultValue": undefined|any
        },
        "Field2": {
            "Type": "String|Bool|DateTime|Integer|Double|MultipleStringValues|Object",
        },
        "Field3": {
            "Type": "Array",
            "Items": {
                "Type": "String",
            }
        },
        "Field4": {
            // there is no need to define object type
            // The field is only validated if it has the object type
            "Type": "Object",
            "Fields": {
                "Field1": {
                    "Type": "",
                    // "SupportScreenSizes": true, // Default is false - For next version
                }
            }
        },
        "Field5": {
            // Defined a reference for Pepperi Resource 
            // The field value can be either a string or number or an object 
            // if it is string/number it represents the key of the object (reference)
            // if the field is an object it is not a reference but inline data and its type will be "ContainedResource:
            "Type": "Resource | ContainedResource",
            "Resource": "CollectionA",
            "AddonUUID": "",
            "Indexed": true, // Default is false
            //This fields will be exported to data index from the resource
            "IndexedFields":{
                "RefField1":{
                    "Type": "String|Bool|DateTime|Integer|Double",
                    "Indexed":true,
                    "Keyword":true //only for string fields
                
                },.
            "RefField2":{
                    "Type": "Resource",
                    "Resource": "data_queries",
                    "AddonUUID": "",
                    //This fields will be exported to data index from the resource
                    "IndexedFields":{..}
                }
            },
            
            // should this field be used as a user scope filter (sync)
            "ApplySystemFilter": true
        },
        "Field6": {
            // Dynamic Resource 
            // The field is an Object that represents a pepperi resource
            // and will be composed with three fields:
            // Resource: the pepperi resource
            // AddonUUID: the pepperi addon UUID
            // Key|Data: ("DynamicResource | ContainedDynamicResource" respectivley) the data of the resource - if there is a key it is a reference 
            "Type": "DynamicResource | ContainedDynamicResource"
        }
    },
    "ReferenceFields":{
    ""
    },
    // Is schema defined by a user? default False
    // Cannot be changed after schema creation.
    // Determines the name convention for the schema.
    UserDefined: true | false,
    //Object to save internal data for the schema
    Internals: {}
}

```

### Examples refs/contained&#x20;

|         |                       |                                 |
| ------- | --------------------- | ------------------------------- |
|         | Pointer (Key)         | Contained (Data)                |
| Static  | **Asset**             | ScriptAction (Script and Param) |
| Dynamic | blocks not contained  | **Blocks inside page**          |

Example:



For the following object:

```json
{
      "StringVal": "something",
      "DoubleVal": 9.87,
      "IntegerVal": 5,
      "BoolVal": true,
      "DateTimeVal":"Tue Nov 05 1985 06:23:20 GMT+0530 (IST)",
      "StringArray": ['h', 'e', 'l', 'l'],
      "IntegerArray": [6, 6, 6],
      "DoubleArray": [1.23, 4.56, 7.89],
      "BoolArray": [false, true, true, false],
      "ReferenceVal1": "abcd-1234-5678", 
      "ReferenceVal2": 12345678,
      "ReferenceVal3": {
          "Resource":"items", 
          "AddonUUID":"1234-567d-cba8", 
          "Data":{"val":"hello"}
      }
      "ObjectVal": {
         "StringVal2": "something else",
         "DoubleVal2": 6.54,
         "ObjectVal2": {
            "StringVal3": "something completely different",
            "DoubleVal3": 3.21
         }
      }
   }
```

The scheme that would fit the object is:

```json
{
      "Fields": {
         "StringVal": { "Type": "String" },
         "DoubleVal": { "Type": "Double" },
         "IntegerVal": { "Type": "Integer" },
         "BoolVal": { "Type": "Bool" },
         "DateTimeVal": { "Type": "DateTime"},
         "StringArray": { "Type": "Array", "Items": { "Type": "String" } },
         "DoubleArray": { "Type": "Array", "Items": { "Type": "Double" } },
         "IntegerArray": { "Type": "Array", "Items": { "Type": "Integer" } },
         "BoolArray": { "Type": "Array", "Items": { "Type": "Bool" } },
         "ReferenceVal1": { 
            "Type": "Resource", 
            "Resource": "items", 
            "AdoonUUID": "1234-567d-9999"
         },
         "ReferenceVal2": {
            "Type": "Resource",
            "Resource": "itemNumbers",
            "AdoonUUID": "1234-567d-9999"
         },
         "ReferenceVal3": {"Type": "Resource"}
         "ObjectVal": {
            "Type": "Object",
            "Fields": {
               "StringVal2": { "Type": "String" },
               "DoubleVal2": { "Type": "Double" },
               "ObjectVal2": {
                  "Type": "Object",
                  "Fields": {
                     "StringVal3": { "Type": "String" },
                     "DoubleVal3": { "Type": "Double" }
                  }
               }
            }
         }
      }
   }
```
