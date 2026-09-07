# Get Collections

{% hint style="warning" %}
Hidden documents will get deleted permanently after 30 days.
{% endhint %}

{% hint style="warning" %}
Collections with documents that are not hidden, cannot be deleted.
{% endhint %}

{% swagger method="get" path="/user_defined_collection/schemes" baseUrl="https://api.pepperi.com/v1.0" summary="Get schemes" %}
{% swagger-description %}
Get all collections schemes for the Distributor
{% endswagger-description %}

{% swagger-response status="200: OK" description="successfully retrieved" %}
```javascript
[
{
    // pepperi generic schema
    // below are extensions to the schema
    DocumentKey: {
        Type: 'AutoGenerate' | 'Composite' | 'Key'// default value is 'Key',
        Fields: ['Field1', 'Fields2'..],
        Delimiter: '_'
    }
    ListView: { } // data view of type 'Grid'
    Fields: [
        Field1: {
            OptionalValues: ['value1', 'value2' ...],
            Mandatory: false, 
            Description: ''
        },
    ]
},
{},
...
]
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="collection not empty" %}
```javascript
{
    "fault": {
        "faultstring": "Failed due to exception: Cannot delete collection with documents",
        "detail": {
            "errorcode": "BadRequest"
        }
    }
}
```
{% endswagger-response %}
{% endswagger %}

### Schema additions

the following items will be added to the generic schema.

#### DocumentKey.Type

* **AutoGenerate** - API will generate a guid and will use it as the document key.
* **Composite** - API will concate the values of the fields showing in the DocumentKey.Fields attribute with 'Delimiter' between.&#x20;
* **Key -** User will send a field names 'Key' which will be unique. (default value)

#### DocumentKey.Fields

contains the fields name from which the API need to composite the document key. (only for composite type).

{% hint style="info" %}
&#x20;max number of fields is 8.
{% endhint %}

#### DocumentKey.Delimiter

default will be '\_' (only for composite type).

#### ListView

DataView of type '[Grid](../meta-data/data-views/get-list-of-data-views/grid-data-view.md)'.&#x20;

#### Fields.Field1.OptionalValues

list of optional values this field can get. will be enforced by the API and also when importing documents.

#### Fields.Field1.Mandatory

whether this field is mandatory when adding documents to the collection.

#### Fields.Field1.Description
