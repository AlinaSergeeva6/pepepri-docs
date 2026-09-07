# Internal: Post Delete Data

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/elasticsearch/delete/{type}" method="post" summary="Post Delete Data" %}
{% swagger-description %}
This endpoint allows you to get free cakes.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="object" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="type" type="string" %}
all_activities/transaction_lines/open_catalog
{% endswagger-parameter %}

{% swagger-response status="200" description="Data deleted successfully " %}
```
{
  "took" : 215,
  "timed_out" : false,
  "total" : 54,
  "deleted" : 54,
  "batches" : 1,
  "version_conflicts" : 0,
  "noops" : 0,
  "retries" : {
    "bulk" : 0,
    "search" : 0
  },
  "throttled_millis" : 0,
  "requests_per_second" : -1.0,
  "throttled_until_millis" : 0,
  "failures" : [ ]
}
```
{% endswagger-response %}

{% swagger-response status="400" description="" %}
```
{
    "erroeMessage": "..."
}
```
{% endswagger-response %}
{% endswagger %}

#### JSON Body Example

```
{
  "query": {
    "bool": {
      "must": {
        "match" : { 
          "Version" : 12 
        }
      }
    }
  }
}
```
