# Get Single user by UUID

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/users/uuid/{uuid}" method="get" summary="Get Single User by UUID" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="uuid" type="string" %}
The UUID of the user to get
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-response status="200" description="user successfully retrieved." %}
```javascript
{
    "InternalID": 24949,
    "UUID": "7fe3137c-01d8-41f2-9811-9ec37d78c793",
    "ExternalID": "HelloIdo1",
    "CreationDateTime": "2012-11-18T06:06:35Z",
    "Email": "ido1@ido.com",
    "FirstName": "ido",
    "Hidden": false,
    "IsInTradeShowMode": false,
    "LastName": "t",
    "Mobile": "123456",
    "ModificationDateTime": "2020-06-15T09:53:18Z",
    "Phone": "9933ddd",
    "Profile": {
        "Data": {
            "InternalID": 467,
            "Name": "Admin"
        },
        "URI": "/profiles/467"
    },
    "Role": {
        "Data": {
            "InternalID": 252,
            "Name": "root"
        },
        "URI": "/roles/252"
    }
}
```
{% endswagger-response %}

{% swagger-response status="404" description="Could not find a user matching this query." %}
```
{    "message": "our standart error "}
```
{% endswagger-response %}
{% endswagger %}

