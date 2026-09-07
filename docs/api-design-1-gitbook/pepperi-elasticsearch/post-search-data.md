# Internal: Post Search Data

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/elasticsearch/search/{type}" method="post" summary="Post Search Data" %}
{% swagger-description %}


&#x20;                                                                                                                                                                                                                        &#x20;
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Bearer authentication token
{% endswagger-parameter %}

{% swagger-parameter in="query" name="type" type="boolean" %}
The document type
{% endswagger-parameter %}

{% swagger-parameter in="body" name="JSONBody" type="string" %}
all_activities/transaction_lines/open_catalog
{% endswagger-parameter %}

{% swagger-response status="200" description="successfully retrieved." %}
```
{    
  "took" : 86,
  "timed_out" : false,
  "_shards" : {
    "total" : 5,
    "successful" : 5,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 5,
      "relation" : "eq"
    },
    "max_score" : 6.660574,
    "hits" : [
      {
        "_index" : "53d71abf-fff1-40f1-9a41-264cb8fc8fda", //DistributorUUID
        "_type" : "_doc",
        "_id" : "item_2e0ff0f5-13f8-4f84-89cf-324f65989f7e",
        "_score" : 6.653074,
        "_source" : {
          "Type" : "open_catalog_item",
          "Price" : 129.99,
          "CategoryUUID" : "0513b815-0000-4f16-97ef-2062d8dbde34",
          "UUID" : "2e0ff0f5-13f8-4f84-89cf-324f65989f7e",
          "Name" : "Item1"
        }
      },
      {
        "_index" : "53d71abf-fff1-40f1-9a41-264cb8fc8fda",
        "_type" : "_doc",
        "_id" : "item_93857ae4-edb3-443e-8bc5-92a3982fc92a",
        "_score" : 6.653074,
        "_source" : {
          "Type" : "open_catalog_item",
          "Price" : 25.00,
          "CategoryUUID" : "0513b815-0000-4f16-97ef-2062d8dbde34",
          "UUID" : "93857ae4-edb3-443e-8bc5-92a3982fc92a",
          "Name" : "Item2"
        }
      },
      .
      .
      .
    ]
  }
}
```
{% endswagger-response %}

{% swagger-response status="400" description="" %}
```
{
    "erroeMessage": "..."
}
```
{% endswagger-response %}
{% endswagger %}

#### JSON Body Example

```
{
  "size": 100,                     //page_size
  "from": 0,                       //page_index
  "track_total_hits": true,        //include_count
  "query": {
    "bool": {
      "must": [
        {
        "match" : { "MainCategory": "Apple" }
        }
      ]
    }
  },
  "sort" : [
    { "ItemName": {"order" : "asc"} }
  ]
}
```
