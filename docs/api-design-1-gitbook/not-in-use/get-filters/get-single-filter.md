# Get Single Filter

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/filters/{filter_id}" method="get" summary="Get Cakes" %}
{% swagger-description %}
This endpoint allows you to get free cakes.
{% endswagger-description %}

{% swagger-parameter in="path" name="filter_id" type="string" %}
ID of the filter to get
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
```javascript
{
  "InternalID": 35660,
  "Name": "hadatTests",
  "CreationDateTime": "2020-07-15T03:52:37.87Z",
  "ModificationDateTime": "2020-07-15T03:52:37.87Z",
  "Hidden": false,
  "Description": "123",
  "Data": {
    "ComplexId": 2,
    "Operation": "AND",
    "LeftNode": {
      "ExpressionId": 1,
      "ApiName": "TSAAcumaticaDiscountEntries",
      "Operation": "Contains",
      "Values": [
        "1"
      ]
    },
    "RightNode": {
      "ExpressionId": 2,
      "ApiName": "Item.AccountInStockQuantity",
      "Operation": ">",
      "Values": [
        "2"
      ]
    }
  },
  "Sort": null,
  "DataType": {
    "ID": 0,
    "Name": "None"
  },
  "ContextObject": {
    "UUID": null,
    "Type": {
      "ID": 54,
      "Name": "Catalog"
    }
  },
  "UUID": "5464a736-cb8d-43ea-8617-44d7884e0a37"
}
```
{% endswagger-response %}

{% swagger-response status="404" description="Could not find a cake matching this query." %}
```
{    "message": "Ain't no cake like that."}
```
{% endswagger-response %}
{% endswagger %}

