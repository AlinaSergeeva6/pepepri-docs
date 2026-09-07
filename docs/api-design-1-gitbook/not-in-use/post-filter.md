# Post Filter

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/filters" method="post" summary="Get Cakes" %}
{% swagger-description %}
This endpoint allows you to get free cakes.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Filter" type="object" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{    
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```
{ our standaty error }
```
{% endswagger-response %}
{% endswagger %}

