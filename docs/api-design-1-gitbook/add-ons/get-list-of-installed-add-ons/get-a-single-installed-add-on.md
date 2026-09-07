# Get a single installed add-on

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons/installed_addons/{UUID}" method="get" summary="Get a single installed add-on" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
{
    "UUID": "",
        "Addon": {
            "UUID": "",
            "Name": "",
            "Description": "",
            "SystemData": "",
            "Hidden": false,
            "Type": 1,
            "CreationDate": "",
            "ModificationDate": ""
        },
        "Version": "",
        "SystemData": "",
        "AdditionalData": "{}",
        "Hidden": false,
        "PublicBaseURL": "",
        "AutomaticUpgrade": true,
        "CreationDate": "",
        "ModificationDate": "",
        "LastUpgradeDateTime": ""
    }
```
{% endswagger-response %}
{% endswagger %}
