# Internal: Post Bulk Data

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/elasticsearch/bulk/{type}" method="post" summary="Post Bulk Data" %}
{% swagger-description %}
This endpoint allows to upload documents to ElasticSearch.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Bearer authentication token
{% endswagger-parameter %}

{% swagger-parameter in="query" name="type" type="string" %}
The document type
{% endswagger-parameter %}

{% swagger-parameter in="body" name="URL" type="string" %}
all_activities/transaction_lines/open_catalog
{% endswagger-parameter %}

{% swagger-response status="200" description="successfully retrieved." %}
```
{
  "took" : 78,
  "errors" : false,
  "items" : [
    {
      "index" : {
        "_index" : "53d71abf-fff1-40f1-9a41-264cb8fc8fda", //DistributorUUID
        "_type" : "_doc",
        "_id" : "137112",
        "_version" : 2,
        "result" : "updated",
        "_shards" : {
          "total" : 2,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 2,
        "_primary_term" : 2,
        "status" : 200
      }
    },
    {
      "index" : {
        "_index" : "open_catalog3",
        "_type" : "_doc",
        "_id" : "137156",
        "_version" : 1,
        "result" : "created",
        "_shards" : {
          "total" : 2,
          "successful" : 1,
          "failed" : 0
        },
        "_seq_no" : 2,
        "_primary_term" : 2,
        "status" : 200
      }
    }
  ]
}

```
{% endswagger-response %}

{% swagger-response status="400" description="" %}
```
{
    "errorMessage": "..."
}
```
{% endswagger-response %}
{% endswagger %}

#### JSON Body Example

```
{
    "URL":"https://cdn.staging.pepperi.com/TemporaryFiles/b6e3537e-7cf8-4428-81f6-06626d4a9b75"
}
```
