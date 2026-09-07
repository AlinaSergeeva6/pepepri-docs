---
description: Add new or edit existing theme (for addon)
---

# Upsert Theme



{% swagger method="post" path="/v1.0/theme" baseUrl="https://api.pepperi.com" summary="Add/Edit theme" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="{}" required="true" type="Object" %}
Same as returned in the "get"
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" type="String" required="true" %}
The requested addonUUID (mandatory only for meta_data - in this case it is different from the URL AddonUUID and will be verified against the document owner id) 
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-SecretKey" required="true" type="String" %}
Addon secret key (the secret key of the AddonUUID from the URL)
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="Data successfully retrieved." %}

{% endswagger-response %}
{% endswagger %}

{% swagger method="post" path="/v1.0/theme/publish" baseUrl="https://api.pepperi.com" summary="Publish the theme" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Theme" required="true" type="Object" %}
Same as returned in the "get"
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Message" type="String" %}
The message for the publish
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" type="String" required="true" %}
The requested addonUUID (mandatory only for meta_data - in this case it is different from the URL AddonUUID and will be verified against the document owner id) 
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-SecretKey" required="true" type="String" %}
Addon secret key (the secret key of the AddonUUID from the URL)
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="Data successfully retrieved." %}

{% endswagger-response %}
{% endswagger %}
