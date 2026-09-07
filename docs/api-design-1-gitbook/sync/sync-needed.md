---
description: Indicate in sync is needed based on a given modification date time
---

# Sync Needed

{% swagger method="get" path="/sync_needed/{modificationDateTime}" baseUrl="https://api.pepperi.com/v1.0" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="modificationDateTime" required="true" %}
The date on which it is based
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
{
    "is_sync_needed": true
}
```
{% endswagger-response %}
{% endswagger %}
