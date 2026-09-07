---
description: Retrieves company level configuration
---

# Get company's configuration

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/company/configuration" method="get" summary="Get company level configuration" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="Sample of Ok response" %}
```javascript
{
  "IsUsingLegacyDiscounts": true
}
```
{% endswagger-response %}
{% endswagger %}
