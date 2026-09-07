# Get single add-on by id



{% hint style="info" %}
even if the add-on is hidden it should be returned. Unlike the get of list of add-on
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/addons/{addon UUID}" method="get" summary="Get single add-on" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Var admin
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
