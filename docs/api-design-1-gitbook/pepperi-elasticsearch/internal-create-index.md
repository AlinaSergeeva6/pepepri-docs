# Internal: Create Index

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/elasticsearch/create/{index_name}" method="post" summary="Create Index in Pepperi ElasticSearch" %}
{% swagger-description %}
**Only system** addons can call this method\
if an index exists it will throw an error.
{% endswagger-description %}

{% swagger-parameter in="path" name="index_name" type="string" %}
the name of the index to be created&#x20;
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Mapping" type="object" %}
mapping defining how a document, and the fields it contains, are stored and indexed
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Shards" type="number" %}
number of shards, default is 1
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
```
{% endswagger-response %}
{% endswagger %}

{% hint style="danger" %}
Use shards number with caution as it is expensive, each shard should contain 20-50GB (around 5M documents), hence most indices will usually use one shard
{% endhint %}
