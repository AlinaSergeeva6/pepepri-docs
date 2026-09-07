# Get Settings Of Object Type

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/Meta_Data/{resourceName}/types/{typeID}/Settings" method="get" summary="Get Settings" %}
{% swagger-description %}
This endpoint allows you to get settings of type definition
{% endswagger-description %}

{% swagger-parameter in="path" name="resourceName" type="string" %}
**Options**: Transactions, Activities.
{% endswagger-parameter %}

{% swagger-parameter in="path" name="typeID" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Authorization token
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
```javascript
{
  "Icon": "icon25",
  "ShowOrderDetails": false,
  "SearchAll": false,
  "ShareOrder": false,
  "MainAction": {
    "ID": 2,
    "Name": "ActivateWorkflow"
  },
  "OrderView": {
    "ID": 9,
    "Name": "BarcodeViewReturnMode"
  },
  "InventoryLimitation": {
    "ID": 2,
    "Name": "Block"
  },
  "CaseQuantityLimitation": {
    "ID": 1,
    "Name": "MarkInRed"
  },
  "CatalogIDs": null,
  "Type": {
    "ID": 0,
    "Name": "None"
  },
  "OriginAccountsData": {
    "IDs": [],
    "Label": "",
    "AllTypes": false,
    "UserAccount": false
  },
  "DestinationAccountsData": {
    "IDs": [
      141068
    ],
    "Label": "",
    "AllTypes": true,
    "UserAccount": false
  },
  "ItemHierarcyDisplay": {
    "ID": 2,
    "Name": "SKUsOnly"
  },
  "TransactionItemsScopeFilterID": 35571,
  "TransactionLinesFilter": {
    "advancedFormula": false,
    "formula": "UnitsQuantity != 0",
    "participatingAPINames": null
  }
}
```
{% endswagger-response %}

{% swagger-response status="404" description="Could not find a cake matching this query." %}
```
{
    our satndard error
}
```
{% endswagger-response %}
{% endswagger %}

