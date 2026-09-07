# Get data by where clause

{% hint style="warning" %}
* Support dot annotation only!
* Max page size is 1000
{% endhint %}

## Get data from ElasticSearch

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/elasticsearch/{type}?fields={fields}&Where={WhereClause}&order_by={orderBy}&page={pageIndex}&page_size={pageSize}&is_distinct={isDistinct}&include_count={isCount}`

This endpoint allows to get data on ElasticSearch.

#### Query Parameters

| Name | Type   | Description                        |
| ---- | ------ | ---------------------------------- |
| type | string | all\_activities/transaction\_lines |

#### Headers

| Name           | Type   | Description                 |
| -------------- | ------ | --------------------------- |
| Authentication | string | Bearer authentication token |

{% tabs %}
{% tab title="200 example of response for:
type=transaction_lines, fields=ItemName, UnitPrice, ItemTSABrand, TSAIsEcoFriendly" %}
```
[
    {
        "ItemName": "Item 456021",
        "UnitPrice": 7375,
        "ItemTSABrand": "Adidas",
        "TSAIsEcoFriendly": true
    },
    {
        "ItemName": "Item 456022",
        "UnitPrice": 635,
        "ItemTSABrand": "Nike",
        "TSAIsEcoFriendly": false
    },
    .
    .
    .
]
```
{% endtab %}

{% tab title="400 " %}
```
{
    "erroeMessage": "..."
}
```
{% endtab %}
{% endtabs %}

##
