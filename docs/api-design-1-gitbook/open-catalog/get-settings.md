# Get Configurations

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/open_catalog/configurations" method="get" summary="Get Configurations" %}
{% swagger-description %}
This endpoint allows you to get open catalog settings.
{% endswagger-description %}

{% swagger-parameter in="header" name="Token" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="Open Catalog configurations successfully retrieved." %}
```
{
    "ConfigurationsURL": "https://cdn.pepperi.com/30013037/CustomizationFile/5a91e30a-28f7-4406-b7fa-281648f6c9bd/configurations.json"
}


the file json is from this format:
{
    "DataViews" : {
        "OrderCenterView3" : {}, //medium
        "OrderCenterView1" : {}, //lines
        "OrderCenterItemDetails" : {}, //item details
        "OrderCenterSearch" : {}, //search string 
        "SmartSearch" : {}, //filters,
        "OrderViewsMenu": {}, //optional views
        "OrderCenterUserSort": {} //sort
    },
    "Currency":"$",
    "CategoriesTree": [
    {   
      "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd11",
      "Path": "Man",
      "ExternalID" : "category1",
      "Name" : "Category 1",
      "SortIndex" : 0,
      "ParentUUID" : "",
      "Nodes":[
        {   
          "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd14",
          "Path": "Man/Shoes",
          "ExternalID" : "category4",
          "Name" : "Category 4",
          "SortIndex" : 0,
          "ParentUUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd11",
          "Nodes":[
            {   
              "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd15",
              "Path": "Man/Shoes/Sneakers",
              "ExternalID" : "category5",
              "Name" : "Category 5",
              "SortIndex" : 0,
              "ParentUUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd14",
              "Nodes":[]
            }
          ]
        }
      ]
    },
    {   
      "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd12",
      "Path": "Women",
      "ExternalID" : "category2",
      "Name" : "Category 2",
      "SortIndex" : 0,
      "ParentUUID" : "",
      "Nodes":[
        {   
          "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd16",
          "Path": "Woman/Shoes",
          "ExternalID" : "category6",
          "Name" : "Category 6",
          "SortIndex" : 0,
          "ParentUUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd12",
          "Nodes":[]
        }
      ]
    },
    {   
      "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd13",
      "Path": "Children",
      "ExternalID" : "category3",
      "Name" : "Category 3",
      "SortIndex" : 0,
      "ParentUUID" : "",
      "Nodes":[]
    }
  ]
}
```
{% endswagger-response %}
{% endswagger %}

