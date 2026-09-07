# Get totals

{% hint style="warning" %}
* Support dot annotation only!
{% endhint %}

{% hint style="info" %}
Supported aggregation:

* Sum
* Avg
* Min
* Max
* Count

**Aggregation format - as sql:**\
sum(apiName1), avg(apiName2) ...
{% endhint %}

## Get Totals

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/elasticsearch/totals/{type}?select={aggregationsAndApiNames}&where={WhereClause}&group_by={groupBy}`

This endpoint allows to get data on ElasticSearch.

#### Query Parameters

| Name | Type   | Description                        |
| ---- | ------ | ---------------------------------- |
| type | string | all\_activities/transaction\_lines |

#### Headers

| Name           | Type   | Description                  |
| -------------- | ------ | ---------------------------- |
| Authentication | string | Bearer authentication token  |

{% tabs %}
{% tab title="200 example of response for: 
select=min(ItemPrice),max(ItemPrice), group_by=ItemMainCategory" %}
```
[
    {
        "min_ItemPrice": 15.00,
        "max_ItemPrice": 4099.99,
        "ItemMainCategory": "Apple"
    },
    {
        "min_ItemPrice": 109.99,
        "max_ItemPrice": 1600.00,
        "ItemMainCategory": "LG"
    },
    {
        "min_ItemPrice": 290.00,
        "max_ItemPrice": 2299.99,
        "ItemMainCategory": "Samsung"
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
