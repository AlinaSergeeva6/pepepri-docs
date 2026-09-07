# Delete Data by Query

permanently deletes the documents from the index &#x20;

{% swagger method="post" path="/v1.0/addons/index/delete/{Addon UUID}/{resource_name}" baseUrl="https://papi.pepperi.com/v1.0/" summary="Post Delete Data (for type index)" %}
{% swagger-description %}
This endpoint allow to delete data by query DSL
{% endswagger-description %}

{% swagger-parameter in="query" name="X-Pepperi-SecretKey" required="true" %}
The addonUUID secret key
{% endswagger-parameter %}

{% swagger-parameter in="body" name="KibanaDSL" type="object" required="true" %}
JSON in Kibana DSL format
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
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
{% endswagger %}

{% swagger method="post" path="/addons/shared_index/index/{index_name}/delete/{Addon UUID}/{resource_name}" baseUrl="https://papi.pepperi.com/v1.0/" summary="Post Delete Data (for type shared_index)" %}
{% swagger-description %}
This endpoint allow to delete data by query DSL

&#x20;**(parameters and response as in the above endpoint)**
{% endswagger-description %}
{% endswagger %}
