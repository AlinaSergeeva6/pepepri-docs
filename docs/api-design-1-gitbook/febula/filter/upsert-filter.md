---
description: Upsert a filter object
---

# Upsert Filter

{% swagger method="post" path="/addons/febula/filters" baseUrl="https://api.pepperi.com/v1.0" summary="UPSERT/GET filters" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Key" %}
Unique key of the filter
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Name" required="true" %}
Name of the filter
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Resource" required="true" %}
Name of the resource this filter filters
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Field" required="true" %}
Name of the field this filter returns
{% endswagger-parameter %}

{% swagger-parameter in="body" name="PreviousField" %}
Name of the field this filter filters by
{% endswagger-parameter %}

{% swagger-parameter in="body" name="PreviousFilter" type="Reference" %}
We chain the current filter to the previous filter
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" %}

{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-SecretKey" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="get successful" %}
```javascript
[
        {
            Key: "fe069636-fbd8-4764-8157-87694583ead4",
            Name: "CurrentUser",
            Resource: "users",
            Field: "UserUUID"
        },
        {
            Key: "fe069636-fbd8-4764-8157-87694583ead5",
            Name: "myBUs",
            Resource: "Users_BU",
            Field: "BU",
            PreviousField: "User",
            PreviousFilter: "fe069636-fbd8-4764-8157-87694583ead4"
        },
        {
            Key: "fe069636-fbd8-4764-8157-87694583ead6",
            Name: "myWarehouses",
            Resource: "Warehouses",
            Field: "WarehouseID",
            PreviousField: "BU",
            PreviousFilter: "fe069636-fbd8-4764-8157-87694583ead5"
        }
]
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="post failed" %}
```javascript
{
    // Response
}
```
{% endswagger-response %}
{% endswagger %}
