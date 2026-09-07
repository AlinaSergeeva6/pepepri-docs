# Search Addon Version

{% swagger method="post" path="/addons/versions/search" baseUrl="https://api.pepperi.com/v1.0" summary="search versions using POST (bigger queries)" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Where" %}
where clause to filter by
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Fields" type="String" %}
String of fields separated by commas
{% endswagger-parameter %}

{% swagger-parameter in="body" name="OrderBy" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="IncludeDeleted" %}
if true will return hidden version, default is false
{% endswagger-parameter %}

{% swagger-parameter in="body" name="IncludeCount" %}
if true will return in the header, default is false
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Page" %}
page index
{% endswagger-parameter %}

{% swagger-parameter in="body" name="PageSize" %}
number of records to return, default is 100
{% endswagger-parameter %}

{% swagger-parameter in="body" name="KeyList" type="" %}
List of versions UUIDs to search for. \
Mutually exclusive with where
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}

{% endswagger-response %}
{% endswagger %}
