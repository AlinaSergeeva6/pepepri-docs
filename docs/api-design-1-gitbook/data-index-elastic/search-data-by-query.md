# Search Data by Query

{% swagger method="post" path="/v1.0/addons/index/search/{addonUUID}/{resource_name}" baseUrl="https://api.pepperi.com" summary="Search and aggregate data (for type index)" %}
{% swagger-description %}
This endpoint allows to search and analyze data on ElasticSearch.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication " required="true" %}
Bearer authentication token
{% endswagger-parameter %}

{% swagger-parameter in="body" name="KibanaDSL" type="Object" required="true" %}
JSON in Kibana DSL format
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
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
{% endswagger %}

{% swagger method="post" path="/v1.0/addons/shared_index/index/{index_name}/search/{addonUUID}/{resource_name}" baseUrl="https://api.pepperi.com" summary="Search and aggregate data (for type shared_index)" %}
{% swagger-description %}
This endpoint allows to search and analyze data on ElasticSearch.

&#x20;**(parameters and response as in the above endpoint)**
{% endswagger-description %}
{% endswagger %}
