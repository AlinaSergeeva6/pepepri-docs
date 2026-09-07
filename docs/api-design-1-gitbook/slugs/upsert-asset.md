---
description: Add new or editing an existing slug.
---

# Upsert Slug

{% swagger baseUrl="https://papi.pepperi.com/V1.0/" path="slugs" method="post" summary="Add/Edit slug" %}
{% swagger-description %}
Endpoint to add new or editing an existing slug.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Access token from the IdP
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Name" type="string" required="true" %}
Slug name
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Hidden" type="boolean" %}
true for delete the slug
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Key" type="string" required="false" %}
send to Edit/Delete existing slug 
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Description" %}
Slug description
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Slug" required="true" %}
should contains:  only lowercase characters & without any spaces
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
Same as in GET
```
{% endswagger-response %}
{% endswagger %}

