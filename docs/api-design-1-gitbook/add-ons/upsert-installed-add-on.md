---
description: Upsert installed add-on by installed add-on UUID
---

# Upsert installed add-on

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons/installed_addons" method="post" summary="Upsert installed add-on by add-on UUID" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="" type="object" %}
same as the GET object
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{ statuse = ""} 
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
Usage: Will assign (install) a addon to the distributor.
{% endhint %}

{% hint style="info" %}
On create – will execute the install function from installation.js
{% endhint %}

{% hint style="info" %}
On update -

* Make validations that addon UUID is already assigned to the user and addon is of type distributor.&#x20;
* Version is **read only** and will be ignored. If you want to change version use upgrade installed addon method
* System data can't be update - read only
* For updating the **AutomaticUpgrade -** sent it as separate field (as you get it in the GET of installed addons)


{% endhint %}
