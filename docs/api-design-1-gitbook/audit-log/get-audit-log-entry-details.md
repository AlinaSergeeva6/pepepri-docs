# Get List of Audit Log Entry Line Details

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/audit_logs/{UUID}/lines" method="get" summary="Get Audit Log Entry Line Details" %}
{% swagger-description %}
The Line Objects are our standard - user can add more fields - as this is a "Free" JSON object
{% endswagger-description %}

{% swagger-parameter in="path" name="" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
[
    {        
        "CreationDateTime" : "2020-07-16T19:20:30.45Z",
        "Text": "started running function XYZ..."
    },
    {
        "CreationDateTime" : "2020-07-16T19:24:13.45Z",
        "Text": "ended running function XYZ..."
    },
    ....
]
```
{% endswagger-response %}
{% endswagger %}
