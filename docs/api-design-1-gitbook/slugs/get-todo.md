---
description: Get slugs list.
---

# Get Slugs

{% swagger baseUrl="https://papi.pepperi.com" path="/slugs" method="get" summary="Return slugs list" %}
{% swagger-description %}
return list of slug objects. 
{% endswagger-description %}

{% swagger-parameter in="path" name="Key" type="string" %}
the key of the specific slug
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{
    "Key":"unique_key1",
    "Name":"header of the todo",
    "Description":"the todo text content",
    "DueDate":"2021-07-13T00:00:00Z",
    "Completed":false
}
```
{% endswagger-response %}
{% endswagger %}
