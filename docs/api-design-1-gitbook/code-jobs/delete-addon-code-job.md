---
description: Hard delete a list of code jobs
---

# Delete Addon Code Job

{% swagger method="post" path="/Scheduler/hard_delete" baseUrl="https://papi.pepperi.com/V1.0" summary="Delete Code Jobs" %}
{% swagger-description %}
Delete a list of Code Jobs by UUID
{% endswagger-description %}

{% swagger-parameter in="body" name="KeyList" type="String array" required="true" %}
Array of keys to be removed
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" type="String" required="true" %}
The requested addonUUID. Must be equal to the inserted codeJob's addonUUID.
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-SecretKey" type="String" required="true" %}
SecretKey of the Addon
{% endswagger-parameter %}
{% endswagger %}
