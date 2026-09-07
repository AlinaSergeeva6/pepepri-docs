# Get Categories

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/categories?where={where}&page={page_index}&page_size={page_size}&fields={fields}" method="get" summary="Get Categories" %}
{% swagger-description %}
This endpoint allows you to get categories.
{% endswagger-description %}

{% swagger-parameter in="path" name="id" type="string" %}
ID of the cake to get, for free of course.
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="Category successfully retrieved." %}
```
[
  {  
    "OpenCatalogUUID" : "23100f5b-6d63-1187-a2e0-2fa066c1ddab",
    "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd31",
    "Path": "Men",
    "ExternalID" : "category1",
    "Name" : "Category 1",
    "Description" : "Description of category 1",
    "Images": 
      {
        "Small" : "/path/to/small/image1.jpg",
        "Large" : "/path/to/big/image1.jpg",
      },
    "SortIndex" : 0,
    "ParentUUID" : ""
  },
  {  
    "OpenCatalogUUID" : "23100f5b-6d63-1187-a2e0-2fa066c1ddab",
    "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd32",
    "Path": "Women",
    "ExternalID" : "category2",
    "Name" : "Category 2",
    "Description" : "Description of category 2",
    "Images": 
      {
        "Small" : "/path/to/small/image2.jpg",
        "Large" : "/path/to/big/image2.jpg",
      },
    "SortIndex" : 0,
    "ParentUUID" : ""
  },
  .
  .
  .
]
```
{% endswagger-response %}
{% endswagger %}

