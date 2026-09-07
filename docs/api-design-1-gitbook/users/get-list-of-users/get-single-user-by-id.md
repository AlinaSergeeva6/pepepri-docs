# Get Single User By ID

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/users/{internal_id}" method="get" summary="Get Single User by ID" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="internal_id" type="string" %}
The ID of the user
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="users successfully retrieved." %}
```javascript
{
    "InternalID": 242959,
    "UUID": "dc73e0e0-fb66-43b5-85c8-c815a5c4bff3",
    "ExternalID": "",
    "CreationDateTime": "2018-03-11T11:57:07Z",
    "Email": "qaQA@pepperitest.com",
    "FirstName": "qaQA",
    "Hidden": false,
    "IsInTradeShowMode": false,
    "LastName": "qaQA",
    "Mobile": "",
    "ModificationDateTime": "2018-07-16T13:37:45Z",
    "Phone": "",
    "Profile": {
        "Data": {
            "InternalID": 48176,
            "Name": "Rep"
        },
        "URI": "/profiles/48176"
    },
    "Role": {
        "Data": {
            "InternalID": 4091,
            "Name": "Matrix Qa"
        },
        "URI": "/roles/4091"
    }
}
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```
{    "message": "our standart error "}
```
{% endswagger-response %}
{% endswagger %}

