# Get List Of Generic Lists

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/lists/{resourceName}" method="get" summary="Get List Of Generic Lists" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="resourceName" type="string" %}
**Options**: All\_activities, Accounts, Users, Catalogs.
{% endswagger-parameter %}

{% swagger-parameter in="path" name="where" type="string" %}
an SQL like query
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Authorization token
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
```javascript
[
    {
        "InternalID": 36140,
        "UUID": "994234b2-3c32-490e-a6db-8a9b9c3d5e5b",
        "Name": "Customers",
        "CreationDateTime": "2020-08-09T07:19:09.147",
        "ModificationDateTime": "2020-08-09T07:19:09.147",
        "Description": "Customers",
        "Hidden": false,
        "Filter": {
            "ExpressionId": 2,
            "ApiName": "ParentExternalID",
            "Operation": "IsEmpty",
            "Values": []
        },
        "Sort": [
            {
                "Field": "ExternalID",
                "Ascending": true
            }
        ]
    }
]
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```
{
   our standard error object
}
```
{% endswagger-response %}
{% endswagger %}

