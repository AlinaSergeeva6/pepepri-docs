# Create Schema

{% hint style="info" %}
**Name Restrictions:**

**System-** field ID PascalCase and schema name camelCase.

**User Defined-** field ID camelCase and Schema name PascalCase
{% endhint %}

### Fields

Fields are needed only for "searchable" fields - if you plan to search on them you need to mention them. It is better to use minimum number of fields.&#x20;

only primitive fields are searchable (not nested object)

### Indexes & Sorting

The cpi\_meta\_data allows sorting & filter on the following (but not on any other):\
CreationDateTime, ModificationDateTime, Hidden and Key.

All the other types work as the following.

Every Type has certain indexes. These indexes can be used to improve selection performance & to sort the results. Only one index can used per query.&#x20;

The order\_by field in the GET request will be used as the index (default is Key).

The index used in the query will improve selection on that field. But there are certain limitations on the selection of that field. \
The selection on that field can only have simple operators (<,>,=), and cannot be contained in an logical OR (eg. IndexField = '1' OR OtherField = '2'), cannot contains IN operator, cannot contains LIKE %test% (only LIKE %test or LIKE test%) and can only appear once in the selection string. If one of these conditions are broken the query will return an error.

### Table Types

#### meta\_data (default)&#x20;

Store meta data. Use for addon configuration, where access is by key.\
Supports OwnerUUID header (X-Pepperi-OwnerID mandatory header), that every entry in the table has a OwnerUUID, and that once it is created with the Owner it can only be updated with the Owner.

#### data

Store server-side operational data.\
Indexed only by CreationDateTime.

#### ~~cpi\_meta\_data~~

Store addon configuration that is needed in the cpi-side as well\
Implemented using UDT. saved in UDT table ExternalID = 'ADDON\_CPI\_SIDE\_DATA'

cpi\_meta\_data does not implement drop table function and not implement where on schema Fields properties

#### indexed\_data

Store operational server-side data that needs to be indexed.\
You can choose 4 fields to be indexed. Three of them Type: String and one Integer (number).

The order\_by field in the GET request will be used as the index (default is Key).

The indexes need to be defined as part of the create schema Fields parameter, for example: "Fields":{a1: {Type: String, Indexed: true}, {a2:{Type: String\}} } - a1 is indexed property and a2 is non indexed property

{% hint style="info" %}
Index cannot be changed
{% endhint %}

| Type             | meta\_data | data | ~~cpi\_meta\_data~~ | indexed\_data     |
| ---------------- | ---------- | ---- | ------------------- | ----------------- |
| ownerID          | mandatory  | no   | ?                   | no                |
| upsert perf      | x+a        | x    | y                   | x+                |
| query key perf   | a          | a    | b                   | a                 |
| where            | scan       | scan | not supported       | indexed + scan    |
| change schema    | yes        | yes  | yes (no meaning)    | excluding indexes |
| available on CPI | no         | no   | yes                 | no                |
| Fields           | yes        | yes  | no                  | yes               |

{% swagger baseUrl="https://api.pepperi.com" path="/v1.0/addons/data/schemes" method="post" summary="" %}
{% swagger-description %}
This endpoint allows you to create table schema in DynamoDB
{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-ActionID" type="string" %}
action uuid for logging 
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-SecretKey" type="string" %}
addon secret key
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" type="string" %}
addon owner uuid
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{
	"Hidden":false, //readonly
	"CreationDateTime":"1-1-2012", //readonly, index
	"ModificationDateTime":"", // readonly
	"Name": "{Table}", // mandatory field
	"Type": data/meta_data // default type: "meta_data" "cpi_meta_data"
	"Fields": {a1: {Type: String}, a2: {Type: String}}, // Columns enabled for search, Type can be String/Bool/DateTime/Integer/Double/MultipleStringValues
	"Validator": /addon/api...,
}
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="Schema has 'Extends' but not 'Name' or 'AddonUUID'" %}
```json
{
    "fault": {
        "faultstring": "Extend field mush have 'AddonUUID' and 'Name' fields",
        "detail": {
            ...
        }
    }
}
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="Base schema does not exist" %}
```json
{
    "fault": {
        "faultstring": 'Base schema does not exist',
        "detail": {
            ...
        }
    }
}
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="Schemas conflicts (has same fields)" %}
```json
{
    "fault": {
        "faultstring": 'Cannot extend schema, fields [CONFLICTED_FIELDS_LIST] exist in both schemas',
        "detail": {
            ...
        }
    }
}
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="Schema type cannot be updated" %}
```javascript
{
    "fault": {
        "faultstring": 'Schema type cannot updated',
        "detail": {
            ...
        }
    }
}
```
{% endswagger-response %}
{% endswagger %}

