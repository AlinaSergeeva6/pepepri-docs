# Get Document by key

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons/data/{AddonUUID}/{table}/{key}" method="get" summary="Get data from dynamo by key" %}
{% swagger-description %}
Get addon's data item from DynamoDB
{% endswagger-description %}

{% swagger-parameter in="path" name="table" type="string" %}
table name
{% endswagger-parameter %}

{% swagger-parameter in="path" name="key" type="string" %}
requested primary key value in table
{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="successfully retrieved." %}
```
{
	"Hidden":false, 
	"CreationDateTime":"2020-11-08T11:55:10.501Z", //readonly, index
	"ModificationDateTime":"", // readonly
	"Key":"hello" // primary
	"a1": "as",
	"a2": "bd",
	"any_valid_param": 78,
	"ExpirationDateTime":"" // if exist
}
```
{% endswagger-response %}
{% endswagger %}

