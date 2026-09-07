---
description: Create/Update (UPSERT) of add-on, Upsert - Updates by UUID or inserts
---

# Upsert single add-on

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/addons" method="post" summary="Upsert of a single add-on" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="" type="object" %}
same as the GET  object
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
Returns the GET object
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
Mandatory fields:  Type, Name
{% endhint %}

{% hint style="info" %}
Can create an add-on with given UUID
{% endhint %}
