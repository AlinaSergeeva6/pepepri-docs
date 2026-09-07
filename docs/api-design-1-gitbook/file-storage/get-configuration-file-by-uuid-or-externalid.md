# Get Configuration File By InternalID or Name

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="file_storage/{InternalID}" method="get" summary="Get configuration file by InternalID" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
 same as the list
```
{% endswagger-response %}
{% endswagger %}

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="file_storage/name/{file name}" method="get" summary="Get configuration file by File Name" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
same as the list
```
{% endswagger-response %}
{% endswagger %}
