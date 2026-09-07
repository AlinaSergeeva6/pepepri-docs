# Upsert Asset

{% swagger baseUrl="https://papi.pepperi.com/V1.0/" path="assets" method="post" summary="Upsert asset" %}
{% swagger-description %}
Endpoint to add new or change an existing asset.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Access token from the IdP
{% endswagger-parameter %}

{% swagger-parameter in="body" name="ExpirationDate" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="InvalidationPolicy" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Sync" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="OwnerUUID" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Thumbnail" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="MIME" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Type" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Name" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Hidden" type="boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="UUID" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
Same as in GET
```
{% endswagger-response %}
{% endswagger %}

