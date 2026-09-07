# Get Documents

{% hint style="info" %}
Get by where clause for cpi\_meta\_data is only supported for Hidden, CreationDateTime, ModificationDateTime and Key properties
{% endhint %}

{% hint style="info" %}
there is no option to ask for: where=Param like ''%25val" (there is no ends\_with operator in DynamoDB), instead you can ask for where=Param like ''val%25" or where=Param like ''%25val%25" or where=Param like ''val"
{% endhint %}

{% hint style="info" %}
you can search only on first level params
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="addons/data/{AddonUUID}/{table}" method="get" summary="Get data from dynamo" %}
{% swagger-description %}
Get addon's data from dynamo DB
{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-ActionID" type="string" %}
The requested actionUUID
{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_deleted" type="boolean" %}
default false
{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}
where clause
{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" type="string" %}
the fields to be returned from the object, if omitted return the whole object
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="number" %}
which page to extract
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="number" %}
number of items in every page
{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_count " type="boolean" %}
\# Phase 2
{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_owned " type="boolean" %}
default true
{% endswagger-parameter %}

{% swagger-parameter in="query" name="order_by" type="string" %}
order by only by indexed parameter
{% endswagger-parameter %}

{% swagger-response status="200" description="successfully retrieved." %}
```
[
{
 
	"Hidden":false, 
	"CreationDateTime":"2020-11-08T11:55:10.501Z", //readonly, index
	"ModificationDateTime":"", // readonly
	"Key":"hello" // primary
	"a1": "as",
	"a2": "bd",
	"any_valid_param": 78,
	"ExpirationDateTime":"" // if exist
},
{
}
]
```
{% endswagger-response %}
{% endswagger %}
