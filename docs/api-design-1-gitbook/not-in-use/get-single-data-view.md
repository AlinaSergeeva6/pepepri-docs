---
description: Phase#1 - Items and Accounts
---

# Get single Data View

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/{resource name}/data_views/{data view UUID}" method="get" summary="Get Single Data View Meta Data" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200" description="" %}
```java
 {
    "ID": "GUID",
    "Name": "MyName",
    "Description" : "",
    "Filter": {our standard filter object - same as JS Client API},// can be postponded if its problematic
    "Sort": {our standard sort object- same as JS Client API},// can be postponded if its problematic
    "ViewType": {
      "ID": "",
      "Name": ""
    }
  }
```
{% endswagger-response %}
{% endswagger %}
