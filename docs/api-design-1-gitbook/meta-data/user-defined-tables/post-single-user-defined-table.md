# POST single User Defined Table

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/user_defined_tables" method="post" summary="new single UDT" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Authorization token
{% endswagger-parameter %}

{% swagger-parameter in="body" name="" type="object" %}
same as GET object
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
{
  "TableID": "My UDT",
  "MainKeyType": {
    "ID": 35,
    "Name": "Account External ID"
  },
  "SecondaryKeyType": {
    "ID": 0,
    "Name": "Any"
  },
  "CreationDate": "",
  "ModificationDate": "",
  "MemoryMode" : { "Dormant" : true, "Volatile" : false},
  "Hidden" : false
}
```
{% endswagger-response %}
{% endswagger %}

#### Object <a href="#configuration-object" id="configuration-object"></a>

| Attribute        | Type   | Value                                                                                                                                                                 |
| ---------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| MainKeyType      | object | **Options**: { "ID": 0, "Name": "Any"}, { "ID": 23, "Name": "Sales Rep External ID"}, { "ID": 35, "Name": "Account External ID"}, { "ID": 54, "Name": "Catalog Name"} |
| SecondaryKeyType | object | **Options**: { "ID": 0, "Name": "Any"}, { "ID": 23, "Name": "Sales Rep External ID"}, { "ID": 35, "Name": "Account External ID"}, { "ID": 54, "Name": "Catalog Name"} |

