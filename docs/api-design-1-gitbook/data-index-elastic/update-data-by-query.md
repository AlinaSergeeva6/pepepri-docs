# Update Data by Query

## Update data (for type index)

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/v1.0/addons/index/update/{Addon UUID}/{resource_name}`

This endpoint allow to update data in the index by a query

#### Headers

| Name                | Type   | Description              |
| ------------------- | ------ | ------------------------ |
| X-Pepperi-SecretKey | String | The addonUUID secret key |

#### Request Body

| Name   | Type   | Description                                         |
| ------ | ------ | --------------------------------------------------- |
| Script | String | The scrip of what and how to update                 |
| Query  | String | The query to update the data by - Kibana DSL format |

{% tabs %}
{% tab title="200: OK Data was update successfully " %}
```javascript
{
  "took" : 14,
  "timed_out" : false,
  "total" : 1,
  "updated" : 1,
  "deleted" : 0,
  "batches" : 1,
  "version_conflicts" : 0,
  "noops" : 0,
  "retries" : {
    "bulk" : 0,
    "search" : 0
  },
  "throttled_millis" : 0,
  "requests_per_second" : -1.0,
  "throttled_until_millis" : 0,
  "failures" : [ ]
}

```
{% endtab %}
{% endtabs %}

## Update data (for type shared\_index)

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/v1.0/addons/shared_index/index/{index_name}/update/{Addon UUID}/{resource_name}`

This endpoint allow to update data in the index by a query&#x20;

&#x20;**(parameters and response as in the above endpoint)**

#### JSON Body Example&#x20;

```
{
  "query": { // the query to update the data by
    "bool":{ 
      "must":{
        "terms":{
          "UUID":["a7197061-9d76-465d-abd3-df30ea21452e","f71970c1-9d76-415d-abd3-df30ea214531"]
          }
        }
      }
  },
  "script": { // the script of what and how to update
    "source": "ctx._source['CategoryUUID']='Category1'"
  }
}
```
