# Get List of Job Info objects

{% hint style="info" %}
it needs to support query by : ID list , StatusCode , CreationDate&#x20;

If SQL cannot be supported here we need to add specific query params&#x20;
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/bulk/jobinfo?where=ID in (8364915,8364916)" method="get" summary="" %}
{% swagger-description %}
Returns list of Job Info objects by SQL clause
{% endswagger-description %}

{% swagger-parameter in="query" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
[
  {
    "ID": 34579344,
    "CreationDate": "2019-01-16T13:13:28Z",
    "ModificationDate": "2019-01-16T13:13:29Z",
    "Status": "In Progress",
    "StatusCode": 2,
    "Records": 0,
    "RecordsInserted": 0,
    "RecordsIgnored": 0,
    "RecordsUpdated": 0,
    "RecordsFailed": 0,
    "TotalProcessingTime": 0.0,
    "OverwriteType": 4,
    "Error": ""
  },
  ...
]
```
{% endswagger-response %}
{% endswagger %}
