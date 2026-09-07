---
description: Get query result from data index
---

# Search data index by query

{% hint style="warning" %}
When requested objects to be returned and not only aggregations, only admin can run this function
{% endhint %}

{% hint style="warning" %}
The maximum number of objects is 10,000&#x20;
{% endhint %}

## Execute data query&#x20;

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/data_queries/{key}/execute`

#### Query Parameters

| Name                                  | Type   | Description       |
| ------------------------------------- | ------ | ----------------- |
| key<mark style="color:red;">\*</mark> | String | The data query ID |

#### Request Body

| Name           | Type    | Description                                                                      |
| -------------- | ------- | -------------------------------------------------------------------------------- |
| VariableValues | Array   | Array containing mapping variables values-in format {\[varName: string]: string} |
| TimeZoneOffset | Integer | Defines the client's time zone offset in minutes                                 |

{% tabs %}
{% tab title="200 Cake successfully retrieved." %}
```
{
    DataQueries:[
      {
        Name: "Data1",
        Groups:["ActionDate"],
        Series: ["Series 1", "Series 2"]
      },
      {
        Name: "Data2",
        Groups:["ActionDate"],
        Series: ["Series 3"]
      }
    ],
    DataSet: [
      { "ActionDate": "Jan", "Series 1": 10, "Series 2": 7, "Series 3": 43},
      { "ActionDate": "Feb", "Series 1": 22, "Series 2": 80 , "Series 3":32},
      { "ActionDate": "Mar", "Series 1": 40, "Series 2": 20 , "Series 3":43},
      { "ActionDate": "Apr", "Series 1": 11, "Series 2": 30 , "Series 3":65},
      { "ActionDate": "May", "Series 1": 32, "Series 2": 40 , "Series 3":81},
      { "ActionDate": "Jun", "Series 1": 50, "Series 2": 13 , "Series 3":10}
    ],
    NumberFormatter:{
      "style":"currency",
       "currency": "USD"
    }
  }
```
{% endtab %}
{% endtabs %}

#### Example for the body:

```
{
    "VariableValues": {
        "var1" : "42",
        "var2" : "string"
    },
    "TimeZoneOffset": 120
}
```

Additional explanation of each DataQueries object:

* Groups: \[] \
  name of the JSON keys containing the groupBy fields. Blank if there is no group by. \
  Example: \[“action date”] &#x20;
* series: \[]   \
  names of the JSON keys containing the breakBy field values + aggregation label/fields (as mentioned in the aggregation above) (= data sets)&#x20;
* When there are multiple Values (chart level) then they will be concatenated to the same output file (according to the group by values)&#x20;
* When there is no breakby then only the aggregation level will be seen.&#x20;

#### Debug the execute data &#x20;

Use the next api &#x20;

{% content-ref url="search-data-index-by-query-debug.md" %}
[search-data-index-by-query-debug.md](search-data-index-by-query-debug.md)
{% endcontent-ref %}
