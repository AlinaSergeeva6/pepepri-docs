# Get list of add-ons



{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/addons?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}" method="get" summary="Get list of add-ons" %}
{% swagger-description %}
This endpoint retrieves list of all add-ons available in your account
{% endswagger-description %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Var admin only
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
[
  {
    "UUID": "",
    "Type": "",
    "Name": "",
    "Description": "",
    "SystemData": "{ Versions: ....}",
    "CreationDate": "",
    "ModificationDate": "",
    "Hidden": false
  },
  ....
]
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```javascript
{  
standard error
}
```
{% endswagger-response %}
{% endswagger %}
