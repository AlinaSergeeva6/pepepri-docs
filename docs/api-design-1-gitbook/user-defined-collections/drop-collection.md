---
description: Delete the entire collection and the data in it permanently
---

# Drop Collection

{% swagger method="post" path="/user_defined_collection/schemes/{collection_name}/hard_delete" baseUrl="https://api.pepperi.com/v1.0" summary="Delete the entire collection and all the hidden data in it" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="collection_name" required="true" %}
collection name to drop
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Force" type="Boolean" %}
should delete also if not hidden. default is false (will not delete if not hidden)
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="collection deleted successfully" %}
```javascript
{
    // Response
}
```
{% endswagger-response %}
{% endswagger %}
