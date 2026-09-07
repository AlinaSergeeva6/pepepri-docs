# Post Category

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/categories" method="post" summary="Post Category" %}
{% swagger-description %}
This endpoint allows you to post category.
{% endswagger-description %}

{% swagger-parameter in="path" name="id" type="string" %}
ID of the cake to get, for free of course.
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-response status="200" description="Category successfully retrieved." %}
```
return the same object as GET
```
{% endswagger-response %}
{% endswagger %}

