# Bulk search



{% swagger baseUrl="https://papi.pepperi.com/v1.0/" path="{type}/search" method="post" summary="Bulk search by InternalID list" %}
{% swagger-description %}
Search API data by list of InternalIDs
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="InternalIDList" type="array" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="fields" type="string" %}
string containing all the fields we want to get "InternalID,Hidden...."
{% endswagger-parameter %}

{% swagger-parameter in="body" name="include_count" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="is_distinct" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="include_deleted" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
```
{% endswagger-response %}
{% endswagger %}

{% swagger baseUrl="https://papi.pepperi.com/v1.0/" path="{type}/search" method="post" summary="Bulk search by UUIDD list" %}
{% swagger-description %}
Search API data by list of UUIDs
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="UUIDList" type="array" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="fields" type="string" %}
string containing all the fields we want to get "InternalID,Hidden...."
{% endswagger-parameter %}

{% swagger-parameter in="body" name="include_count" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="is_distinct" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="include_deleted" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
```
{% endswagger-response %}
{% endswagger %}

