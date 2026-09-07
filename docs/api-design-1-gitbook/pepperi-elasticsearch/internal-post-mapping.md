# Internal: Post Mapping

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/elasticsearch/mapping/{type}" method="post" summary="Get Post Mapping" %}
{% swagger-description %}
This endpoint allows you add field to the mapping of the index.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="type" type="string" %}
all_activities/transaction_lines/open_catalog
{% endswagger-parameter %}

{% swagger-response status="200" description="ElasticSearch response successfully retrieved." %}
```
{
  "acknowledged" : true
}
```
{% endswagger-response %}
{% endswagger %}

#### JSON Body Example

```
{
    "properties": {
        "ItemImage": {"enabled": false}
    }
}
```
