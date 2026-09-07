# Get List Of Addons Code Jobs

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="code_jobs" method="get" summary="Get List of Code Jobs" %}
{% swagger-description %}
Get list of scheduled jobs 
{% endswagger-description %}

{% swagger-parameter in="query" name="is_distinct" type="boolean" %}
PHASE #2 retrieves only distinct values based on fields - default false
{% endswagger-parameter %}

{% swagger-parameter in="query" name="full_mode" type="boolean" %}
PHASE #2 returns all relation objects fields(like Owner Name) - default false
{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_count" type="boolean" %}
 is returns count header - default false
{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_deleted" type="boolean" %}
default is false (Hidden field)
{% endswagger-parameter %}

{% swagger-parameter in="query" name="order_by" type="string" %}
PHASE #1 -CodeJobName, NextRunTime
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="number" %}
PHASE #2 - by default 100 max is 250
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="number" %}
PHASE #2 - page number
{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" type="string" %}
list of fields - by default all fields are returned
{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}
PHASE #2
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
[
   {
       response of get single addon code job
   },
   .....
]

```
{% endswagger-response %}
{% endswagger %}
