# Get single add-on by id

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons/{addon UUID}" method="get" summary="Get single add-on" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
{
    "UUID": "",
    "Type": "",
    "Name": "",
    "Description": "",
    "SystemData": "{ Versions: ....}",
    "CreationDate": "",
    "ModificationDate": "",
    "Hidden": false   
}
```
{% endswagger-response %}
{% endswagger %}
