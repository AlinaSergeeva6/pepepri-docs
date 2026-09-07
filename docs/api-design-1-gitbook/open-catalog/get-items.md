# Get Items

{% swagger baseUrl="https://papi.pepperi.com/v1.0" path="/open_catalog/items?where={where}&search_string={searchString}&search_string_fields={fields}&order_by={OrderBy}&page_size={PageSize}&page={PageIndex}&fields={fields}" method="get" summary="Get Items" %}
{% swagger-description %}
This endpoint allows you to get items.
{% endswagger-description %}

{% swagger-parameter in="header" name="Token" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_count" type="string" %}
the total amount on items returns on header
{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" type="string" %}
default return all fields, list comma separated.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="string" %}
default 1
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="string" %}
default 100
{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="search_string" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="search_string_fields" type="string" %}
default all indexed fields, list comma separated.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="order_by" type="string" %}
only indexed fields
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
```
{
  "TotalCount": 25300,
  "Products":
  [
    { 
      "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd3f", //ItemUUID
      "ItemExternalID.Value" : "item1",
      "ItemName.Value" : "Item 1",
      "ItemLongDescription.Value" : "Description of item 1",
      "ItemPrice.Value" : 399.99,
      "UnitPrice.Value": 399.99,
      "UnitPriceAfterDiscount.Value": 349.99,
      "Image.Value": "https://cdn.pepperi.com/WrntyImages/30013037/PortfolioItems/0/56083520_1.jpg?ft=1",
      "ItemTSABrand.Value" : "Adidas",
      "ItemTSANumber.Value" : 5,
      "TSAColor.Value" : "Blue",
      "TSABoolean.Value" : false,
      .
      .
      .
    },
    {  
      "UUID" : "15100f5b-6d63-4123-a2e0-2fa066c1dd32",
      "ItemExternalID.Value" : "item2",
      "ItemName.Value" : "Item 2",
      "ItemLongDescription.Value" : "Description of item 2",
      "ItemPrice.Value" : 199.99,
      "Image.Value": "",
      "ItemTSABrand.Value" : "Adidas",
      "TSAColor.Value" : "Red",
      .
      .
      .
    },
    .
    .
    .
  ]
}
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
get items on specific category will be sent on the where like this:\
CategoryUUID=63500f5b-6d63-4123-a2e0-2fa066c1dd3f
{% endhint %}

where supports only " and ", and the optional operators are:\
Brand.Value=LG , Brand.Value=LG,Apple , Brand.Value!=LG , Brand.Value!=LG,Samsung , Price.Value>10 , Price.Value>=10 , Price.Value<100 , Price.Value<=100 , Price.Value=100 , Price.Value=10,25\
where=Brand.Value=LG,Apple and  Price.Value>=10 and Price.Value<=100
