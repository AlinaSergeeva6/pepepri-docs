# Upsert todo

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/todos" method="get" summary="upsert todo item" %}
{% swagger-description %}
if the key exists it will update if not exist it will create the item. The body of the post is the same as the body returned from single GET by key
{% endswagger-description %}

{% swagger-response status="200" description="" %}
```
same as in GET of the inserted object
```
{% endswagger-response %}
{% endswagger %}
