---
description: remove all items from this schema - hard delete
---

# Truncate

#### Permission: Admin only

{% swagger method="post" path="/v1.0/addons/data/schemes/{TableName}/truncate" baseUrl="https://api.pepperi.com" summary="" %}
{% swagger-description %}
This is **async** operation which removes all items under this schema

Note: for every removed item "Remove" PNS will be issued
{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" %}
addon uuid of the schema owner
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-SecretKey" %}
secret key of the addon owner
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```typescript
{
   "Done": true|false, // async can be "success or failure" but Done can be false (failed to remove all items) 
   "ProcessedCounter": 23232 // the number of items that were removed 
}
```
{% endswagger-response %}
{% endswagger %}
