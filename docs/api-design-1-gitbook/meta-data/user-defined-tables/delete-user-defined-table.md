# Delete User Defined Table

{% hint style="info" %}
The response can be true/false, in case that the UTD property "Hidden" is "true", the response will be false.
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/user_defined_tables/{tableID}" method="delete" summary="delete UDT" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="tableID" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Authorization token
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
true
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```
{
    our standart error
}
```
{% endswagger-response %}
{% endswagger %}

