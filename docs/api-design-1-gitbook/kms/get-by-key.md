---
description: Standard resource without multiple and post operations
---

# Get By Key



{% swagger method="get" path="/kms/parameters/{key}" baseUrl="https://api.pepperi.com/v1.0" summary="Get value by key" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerUUID" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-SecretKey" required="true" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
{
    "Key": "",
    "Value": ""
}
```
{% endswagger-response %}
{% endswagger %}
