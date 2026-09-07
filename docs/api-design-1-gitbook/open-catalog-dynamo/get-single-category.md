# Get Single Category

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/categories/{UUID}" method="get" summary="Get Category" %}
{% swagger-description %}
This endpoint allows you to get category.
{% endswagger-description %}

{% swagger-parameter in="path" name="id" type="string" %}
ID of the cake to get, for free of course.
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-response status="200" description="Category successfully retrieved." %}
```
{  
  "OpenCatalogUUID" : "23100f5b-6d63-1187-a2e0-2fa066c1ddab",
  "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd3f",
  "Path": "Man",
  "ExternalID" : "category1",
  "Name" : "Category 1",
  "Description" : "Description of category 1",
  "Images": 
    {
      "Small" : "/path/to/small/image.jpg",
      "Large" : "/path/to/big/image.jpg",
    },
  "SortIndex" : 0,
  "ParentUUID" : ""
}
```
{% endswagger-response %}
{% endswagger %}

