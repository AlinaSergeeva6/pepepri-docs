---
description: >-
  Given an ADAL search body, returns the records the current user is authorized
  to get (based on Febula filters).
---

# 🔍 Search



{% hint style="info" %}
This endpoint is using Febula's "Online" permission set.
{% endhint %}

{% hint style="warning" %}
Limitations:

* ADAL's search limitations apply here too.
* Limited to 1000 records per Febula filter (meaning a single path must point to less than a 1000 records, i.e. 5k items pointing to a single user will cause the search to fail on table).
{% endhint %}

{% swagger method="post" path="/nebula/search/AddonUUID}/{SchemaName}" baseUrl="https://api.pepperi.com/v1.0" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="AddonUUID" type="string" required="true" %}
The owner of the schema.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="SchemaName" type="string" required="true" %}
The schema to search.
{% endswagger-parameter %}

{% swagger-parameter in="body" type="Search body" name="Request body" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="The response from ADAL's search endpoint." %}

{% endswagger-response %}
{% endswagger %}
