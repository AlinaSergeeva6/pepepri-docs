# Obsolete: Get machine

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="distributor/machine" method="get" summary="Get Machine" %}
{% swagger-description %}
This endpoint allows you to get free cakes.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{
        "Machine": "prod-web05.pepperi.com",
        "Port":"50000"
}
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
Get the machine of the distributor of the given token.
{% endhint %}

