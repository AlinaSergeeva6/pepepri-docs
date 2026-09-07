---
description: Get query result from data index - for internal use
---

# Search data index by query - Admins only



{% hint style="warning" %}
Only admin can run this function
{% endhint %}

{% hint style="warning" %}
The maximum number of objects is 10,000&#x20;
{% endhint %}

{% swagger baseUrl="https://papi.pepperi.com" path="/data_queries/{key}/execute_debug" method="post" summary="Execute data query with additional options" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="VariableValues" type="Array" %}
Array containing mapping variables values-in format {[varName: string]: string}
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Series" type="String" %}
The series name we want to execute
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Fields" type="String[]" %}
Array of fields 
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Page" type="Integer" %}
one base, the default is 1
{% endswagger-parameter %}

{% swagger-parameter in="body" name="PageSize" type="Integer" %}
The default is 0, Is page was requested, the default page size will be 100
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Filter" type="object" %}
Additional filter to filter by
{% endswagger-parameter %}

{% swagger-parameter in="body" name="UserID" type="String" %}
Allows impersonation - scope filters will apply for this user instead of the current user. NOTE: the format of this field has to match to the UserFieldID defined in 

[data-queries.md](../../add-ons/addons-link-table/relation-names/data-queries.md "mention")

 relation.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="key" required="true" %}
The data query ID
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
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
    },
    // will be returned only if page size is not 0
    Objects:[]
  }
```
{% endswagger-response %}
{% endswagger %}

#### Example for the body:

```
{
    "VariableValues": {
        "var1" : "42",
        "var2" : "string"
    },
    "Filter": {
         "Operation": "AND",
                "LeftNode": {
                    "ApiName": "AccountUUID",
                    "FieldType": "Guid",
                    "Operation": "IsEqual",
                    "Values": "f1a2f11a-de5f-47a5-9712-d6c1db513601",
                },
                "RightNode": {
                    "ApiName": "Transaction.Account.TSAChain",
                    "FieldType": "String",
                    "Operation": "IsEqual",
                    "Values": "AccountChainplaceholder",
                }
    }
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

&#x20;

&#x20;
