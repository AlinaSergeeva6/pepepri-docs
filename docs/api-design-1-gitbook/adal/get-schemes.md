# Get Schemes

{% hint style="info" %}
GET Options

```
    If key & OwnerID header exist- fetching a specific schema (ownerID is required).
    If only OwnerID exist- fetching addon's schemes.
    If OwnerID is missing- fetching all distributor's schemes.
```
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com" path="/v1.0/addons/data/schemes" method="get" summary="Get schemes" %}
{% swagger-description %}
Get all addon schemes
{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" type="string" %}
tables owner uuid\
If missing - returning all distributor's schemas. &#x20;
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-ActionID" type="string" %}
action uuid for logging
{% endswagger-parameter %}

{% swagger-response status="200" description="Successfully retrieved." %}
```
[
{
	"Hidden":false, //readonly
	"CreationDateTime":"1-1-2012", //readonly, index
	"ModificationDateTime":"", // readonly
	"Name": "{Table}", // mandatory field
	"StringIndexName": "my_index" // optional, the name of the field in the document to be used as index
	"Type": data/meta_data // default type: "meta_data"
	"Fields": {a1: {Type: String}, a2: {Type: String}}, // Columns enabled for search, Type can be String/Bool/Integer/MultipleStringValues
	"Validator": /addon/api...,
	"AddonUUID": "" // resource owner uuid
},
{},
...
]
```
{% endswagger-response %}
{% endswagger %}

