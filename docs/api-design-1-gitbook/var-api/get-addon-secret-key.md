# Get Addon secret key



{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/addons/{addonUUID}/secret_key" method="get" summary="Get add-on secret key" %}
{% swagger-description %}
This endpoint retrieves the specific addon secret key
{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}
Var admin only
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{
    "SecretKey": "0d28ca30-e4b5-478a-a007-81a0a44666ae"
}
```
{% endswagger-response %}
{% endswagger %}
