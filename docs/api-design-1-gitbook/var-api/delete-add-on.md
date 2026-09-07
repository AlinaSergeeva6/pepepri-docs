# Delete add-on

{% hint style="info" %}
deleting an add-on will not uninstall the add-on from tenants. all installations will continue to work as usual but no one else will see it from now on in the available add-on list &#x20;
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/addons/{addon UUID}" method="delete" summary="Deletes single object" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
```
{% endswagger-response %}
{% endswagger %}
