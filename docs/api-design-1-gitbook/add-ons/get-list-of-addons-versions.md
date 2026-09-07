# Get List of Addons Versions

{% swagger method="get" path="/addons/versions" baseUrl="https://api.pepperi.com/v1.0" summary="Get lists of addons version" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="where" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_deleted" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="order_by" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_count" type="String" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```json
[
    {
        "UUID": "a7795e6d-1fff-4974-880a-bbfc5a2d511c",
        "Hidden": false,
        "CreationDateTime": "2022-07-06T11:39:37.283Z",
        "ModificationDateTime": "2022-07-06T11:39:37.283Z",
        "Version": "0.0.1",
        "Description": null,
        "Available": false,
        "Phased": true,
        "StartPhasedDateTime": "2022-07-06T11:39:05.74Z",
        "AddonUUID": "49b582ac-07fc-420d-bb60-ff955a44bb92",
        "PhasedFunction": null,
        "PublishConfig": "{}",
        "Count": 0
    }
    ...
]
```
{% endswagger-response %}
{% endswagger %}
