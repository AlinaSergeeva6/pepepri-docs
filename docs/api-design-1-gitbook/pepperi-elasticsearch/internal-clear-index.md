# Internal: Clear Index

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/elasticsearch/clear/{index_name}" method="post" summary="Clear Index" %}
{% swagger-description %}
This endpoint allows you clear an index on ElasticSearch
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="index_name" type="string" %}
The index to clear. open_catalog/ data_index
{% endswagger-parameter %}

{% swagger-response status="200" description="Index successfully cleared." %}
```
{
    "success": true,
    "resultObject": {
        "Message": "Clear index successfully on ElasticSearch"
    }
}
```
{% endswagger-response %}
{% endswagger %}

