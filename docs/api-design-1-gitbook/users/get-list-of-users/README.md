# Get list of users

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/users" method="get" summary="Get Users" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Access Token from the IdP
{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" type="string" %}
specify desired fields to return
{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_deleted" type="boolean" %}
include hidden users in the result (false by default)
{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}
an SQL like query (see below for supported fields)
{% endswagger-parameter %}

{% swagger-parameter in="query" name="order_by" type="string" %}
sort the rows in the result set.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="number" %}
The desired page number
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="number" %}
The desired page size
{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_count" type="boolean" %}
Add to the response header the number of returned objects
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
[
     {
        "InternalID": 242959,
        "UUID": "dc73e0e0-fb66-43b5-85c8-c815a5c4bff3",
        "ExternalID": "",
        "CreationDateTime": "2018-03-11T11:57:07Z",
        "Email": "qaQA@pepperitest.com",
        "FirstName": "qaQA",
        "Hidden": false,
        "IsSupportAdminUser": true,
        "IsUnderMyRole": false,
        "EmployeeType": 2,
        "IsInTradeShowMode": false,
        "Name": "qaQA qaQA",
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
        },
        "SecurityGroup": { 
             "UUID": "fcbc8ee0-2b42-4fa6-8666-389fdf6892ca", 
             "Name": "default group"
         }
    }
]
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```javascript
{    "message": "our standart error"}
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
Note: There following API Names will return only if specified in the `fields` or `where` query parameters
{% endhint %}

| ApiName                                              |
| ---------------------------------------------------- |
| Name                                                 |
| EmployeeType                                         |
| IsSupportAdminUser                                   |
| IsUnderMyRole                                        |
| SecurityGroupUUID - can be used only in the "fields" |
| SecurityGroupName - can be used only in the "fields" |

