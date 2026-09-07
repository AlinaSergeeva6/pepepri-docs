# Get installed add-on current version

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="addons/installed_addons/{addonUUID}/version" method="get" summary="Get installed add-on current version" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
"1.0" (the version string)
```
{% endswagger-response %}
{% endswagger %}
