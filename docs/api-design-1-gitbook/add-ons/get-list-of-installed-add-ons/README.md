# Get list of installed add-ons

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons/installed_addons" method="get" summary="Get list of installed add-ons" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_deleted" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" type="String" name="order_by" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" type="String" name="page_size" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
[
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
    },
  ...
]
```
{% endswagger-response %}
{% endswagger %}
