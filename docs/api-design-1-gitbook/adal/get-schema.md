# Get Schema

{% swagger baseUrl="https://api.pepperi.com" path="/v1.0/addons/data/schemes/{table_name}" method="get" summary="Get Schema by schema name" %}
{% swagger-description %}
Get specific addon schema by name
{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" type="string" %}
addon owner uuid
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-ActionID" type="string" %}
action uuid for logging
{% endswagger-parameter %}

{% swagger-response status="200" description="Successfully retrieved." %}
```
{
	"Hidden":false, //readonly
	"CreationDateTime":"1-1-2012", //readonly, index
	"ModificationDateTime":"", // readonly
	"Name": "{Table}", // mandatory field
	"StringIndexName": "my_index" // optional, the name of the field in the document to be used as index
	"Type": data/meta_data // default type: "meta_data"
	"Fields": {a1: {Type: String}, a2: {Type: String}}, // Columns enabled for search, Type can be String/Bool/Integer/MultipleStringValues
	"Validator": /addon/api...,
}
```
{% endswagger-response %}
{% endswagger %}

