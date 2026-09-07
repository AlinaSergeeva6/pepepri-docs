# Get Single Item

{% hint style="info" %}
Mainly in use for the item details screen, returns all field
{% endhint %}

{% swagger baseUrl="https://papi.pepperi.com/v1.0" path="/open_catalog/items/{itemUUID}" method="get" summary="Get Single Item" %}
{% swagger-description %}
This endpoint allows you to get item by UUID.
{% endswagger-description %}

{% swagger-parameter in="header" name="Token" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="itemUUID" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="Item successfully retrieved." %}
```
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
}
```
{% endswagger-response %}
{% endswagger %}
