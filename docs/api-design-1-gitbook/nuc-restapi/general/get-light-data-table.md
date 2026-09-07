---
description: Internal endpoints for the legacy WACD/CPAPI service
---

# Get Light Data Table

### LightDataTable&#x20;

This Object is used by the nucleus to return data in an efficient JSON which is not a standard JSON&#x20;

```json
// example of Light Data Table JSON
{
       "Headers": [
              {
                     "ColumnName": "ExternalID"
              },             {
                     "ColumnName": "Stock"
              },             {
                     "ColumnName": "Price"
              }
       ],
       // Rows is array of array (Matrix) where each line defines and object and each cell is the property of the object
       // each object is defined by the Headers index - Name and Type 
       // Rows [3][2] is an object that its name is Headers[2]."ColumnName" and its type is Headers[2].ColumnType
       "Rows": {
              "m_Rows": [
                      {
                             "ItemsArray": ["val1","123","6.89"]
                      },
                      {
                             "ItemsArray": ["val2","1423","16.29"]
        
                      }
               ],
              "Count": 2
       }
}
```

## Sync Transaction Lines&#x20;

## Create a new user

<mark style="color:green;">`POST`</mark> `/`wcad/resources/order\_items

\<Description of the endpoint>

**Headers**

| Name          | Value              |
| ------------- | ------------------ |
| Content-Type  | `application/json` |
| Authorization | `Bearer <token>`   |

**Body**

| Name   | Type          | Description  |
| ------ | ------------- | ------------ |
| `Keys` | List\<string> | list of keys |

**Response**

{% tabs %}
{% tab title="200" %}
```json
Light Data Table for the given keys
```
{% endtab %}

{% tab title="400" %}
```json
{
  "error": "Invalid request"
}
```
{% endtab %}
{% endtabs %}

### Real Example

{% embed url="http://localhost:8070/V1/RestAPI.svc/wcad/order_items?agent_key=aaa&modification_date=2021-06-25T18:11:30.736Z" fullWidth="false" %}

returns the following:

```json
{
         "Headers": [
            {
                "ColumnName": "ObjectID.ID"
            },
            {
                "ColumnName": "CreationDate"
            },
            {
                "ColumnName": "ModificationDate"
            },
            {
                "ColumnName": "Order.ObjectID.ID"
            },
            {
                "ColumnName": "PortfolioItem.ObjectID.ID"
            },
            {
                "ColumnName": "PortfolioItemExID"
            },
            {
                "ColumnName": "TSAttributes"
            },
            {
                "ColumnName": "PortfolioItemTSAttributes"
            },
            {
                "ColumnName": "UnitPrice"
            },
            {
                "ColumnName": "UnitPriceAfterDiscount"
            },
            {
                "ColumnName": "UnitFinalPrice"
            },
            {
                "ColumnName": "IsFixedUnitPriceAfterDiscount"
            },
            {
                "ColumnName": "IsFixedDiscount"
            },
            {
                "ColumnName": "UnitQuantity"
            },
            {
                "ColumnName": "ChildrenUnitQuantity"
            },
            {
                "ColumnName": "DiscountPercentage"
            },
            {
                "ColumnName": "DeliveryDate"
            },
            {
                "ColumnName": "Remark"
            },
            {
                "ColumnName": "Remark2"
            },
            {
                "ColumnName": "Remark3"
            },
            {
                "ColumnName": "Remark4"
            },
            {
                "ColumnName": "UnitOfMeasureItem.ObjectID.ID"
            },
            {
                "ColumnName": "SpecialOfferLeadingOrderPortfolioItem.ObjectID.ID"
            },
            {
                "ColumnName": "SuppressedSpecialOffer"
            },
            {
                "ColumnName": "OrderPackage.ObjectID.ID"
            },
            {
                "ColumnName": "Distributor.ObjectID.ID"
            },
            {
                "ColumnName": "ReadOnly"
            },
            {
                "ColumnName": "LineNumber"
            },
            {
                "ColumnName": "IsDuplicated"
            },
            {
                "ColumnName": "Set.ObjectID.ID"
            },
            {
                "ColumnName": "Hidden"
            },
            {
                "ColumnName": "UUID"
            },
            {
                "ColumnName": "Archive"
            },
            {
                "ColumnName": "WriteToNucleusTime"
            }
        ],
        "Rows": {
            "m_Rows": [
                {
                    "ItemArray": [
                        "814065434",
                        "1698563683",
                        "1698563692",
                        "87560674",
                        "55318957",
                        "17O72TlfbM",
                        "<A><a id=\"386593\" v=\"true\" /><a id=\"395873\" v=\"\" /><a id=\"398888\" v=\"LineDDOrEqual\" /><a id=\"405221\" v=\"35\" /><a id=\"458525\" v=\"test\" /><a id=\"513606\" v=\"false\" /><a id=\"827692\" v=\"{&quot;AppliedRules&quot;:[]}\" /></A>",
                        "<A />",
                        "3",
                        "3",
                        "3",
                        "False",
                        "True",
                        "12",
                        "0",
                        "0",
                        "1698526800",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "True",
                        "",
                        "1110703",
                        "False",
                        "0",
                        "False",
                        "",
                        "False",
                        "cd609b7d-da01-4992-bd25-1fe6b0dd6aa5",
                        "False",
                        "1698563692"
                    ]
                },
                {
                    "ItemArray": [
                        "814065435",
                        "1698563682",
                        "1698563692",
                        "87560674",
                        "55318981",
                        "0VZYFqDqRf",
                        "<A><a id=\"386593\" v=\"true\" /><a id=\"395873\" v=\"\" /><a id=\"398888\" v=\"LineDDOrEqual\" /><a id=\"405221\" v=\"35\" /><a id=\"458525\" v=\"test\" /><a id=\"513606\" v=\"false\" /><a id=\"827692\" v=\"{&quot;AppliedRules&quot;:[]}\" /></A>",
                        "<A />",
                        "6",
                        "6",
                        "6",
                        "False",
                        "True",
                        "5",
                        "0",
                        "0",
                        "1698526800",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "True",
                        "",
                        "1110703",
                        "False",
                        "0",
                        "False",
                        "",
                        "False",
                        "d9859b68-344e-4b8a-b254-c273de0ad75a",
                        "False",
                        "1698563692"
                    ]
                }
            ],
            "Count": 2
        }
    
  }
```

