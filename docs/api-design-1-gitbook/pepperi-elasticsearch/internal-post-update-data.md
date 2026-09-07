# Internal: Post Update Data

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/elasticsearch/update/{type}" method="post" summary="Update Data" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="type" type="string" %}
all_activities/ transaction_lines/ open_catalog
{% endswagger-parameter %}

{% swagger-response status="200" description="Update data successfully." %}
```
{
  "took" : 14,
  "timed_out" : false,
  "total" : 1,
  "updated" : 1,
  "deleted" : 0,
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
{% endswagger %}

#### JSON Body Example

```
{
  "query": {
    "bool":{ "must":{"terms":{"UUID":["a7197061-9d76-465d-abd3-df30ea21452e","f71970c1-9d76-415d-abd3-df30ea214531"]}}}
  },
  "script": {
    "source": "ctx._source['CategoryUUID']='Category1'"
  }
}
```
