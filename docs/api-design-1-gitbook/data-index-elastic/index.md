---
description: Standard Pepperi resource
---

# Index

{% hint style="warning" %}
**Elastic should never be a main data source, use it only as an indexed copy.**

As such it **does not** support "Hidden", CreationDateTime and ModificationDateTime functionality, only permanent delete
{% endhint %}

{% swagger method="get" path="/v1.0/addons/index|shared_index" baseUrl="https://api.pepperi.com" summary="This is the base URL for the Data Index DataSourceURL" %}
{% swagger-description %}
_**The parameter/headers/respond are described on ADAL Schema creation**_
{% endswagger-description %}
{% endswagger %}

### Data Index Types

**Index**

* Single resource index
* Should be used when indexing data resource with large data (> 5MB)

**Shared  Index**

* Multiple resources index
* Should be used when having multiple small data resources
*   As defined in [pepperi schema](../pepperi-resource-schema/), Key is mandatory field.&#x20;

    The key MUST be unique in the index - two different resources under the same index can't have the same key&#x20;

### Data index [resource schema](../pepperi-resource-schema/)&#x20;

#### Data resource data object

```
 "DataSourceData": {
        //Optional and relevent on index creation - default is 1 
        //canno't be change after the index was created
        "NumberOfShards": 1,
        //Mandatory on type typed_index
        "IndexName": "something_else"
    }
```

**Fields**

```
 "Fields": {
        "Field1": {
            "Type": "String|Bool|DateTime|Integer|Double|MultipleStringValues|Object",,
            // e.g. extension of the ADAL/index/shared_index
            // in index/shared_index text is case inseneitive
            "Indexed": true, // Default is false
            // e.g. extension of the index/shared_index
            // used for full phrase search, case sensitive 
            // only for string
            "Keyword":true //  Default is false
        },...
        }
```
