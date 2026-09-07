---
description: of Contacts, Accounts, Users, Activities, Items
---

# Get Data Views

{% hint style="warning" %}
Phase#1 - Items and Accounts
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/{resource name}/data_views" method="get" summary="Get array of Data Views Meta Data" %}
{% swagger-description %}
retrieves view of Contacts, Accounts, Users, Activities, Items
{% endswagger-description %}

{% swagger-response status="200" description="" %}
```javascript
[
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
  },
  ....
]
```
{% endswagger-response %}

{% swagger-response status="404" description="Could not find a cake matching this query." %}
```javascript
{
    our standard error object
}
```
{% endswagger-response %}
{% endswagger %}

