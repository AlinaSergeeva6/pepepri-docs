# Pepperi ElasticSearch Entry

## ElasticSearch Introduction

Elasticsearch is a distributed document store. Instead of storing information as rows of columnar data, Elasticsearch stores complex data structures that have been serialized as JSON documents. When a document is stored, it is indexed and fully searchable in near real-time.\
\
Elasticsearch uses a data structure called an inverted index - an index can be thought of as an optimized collection of documents and each document is a collection of fields, which are the key-value pairs that contain your data.\
\
The real power of ElasticSearch comes from being able to easily access the full suite of search capabilities - from complex search abilities to advanced analyzing of data by aggregations queries.\
Elasticsearch provides a full Query DSL (Domain Specific Language) based on JSON to define those queries.

## ElasticSearch On Pepperi

New Pepperi developments will use ElasticSearch as their search engine, therefore a new API is set to work with ElasticSearch that will determine the structure logic suitable for Pepperi.\
\
PepperiElasticSearch will have an indexes per distributor.\
Each index can contain several types of documents, according to the needs of the new developments.\
The elasticsearch\_type options will be limited according to the relevant projects, for now the supported types are: open\_catalog, all\_activities and transaction\_lines.\
\
When the PepperiElasticSearch addon is installed two new indexes are created, when the PepperiElasticSearch addon is uninstalled those indexes are deleted. Those indexes are:

* {DistributorUUID} - for data visualization
* oc-{DistributorUUID} - for open catalog

\
Those indexes mapping is dynamic- meaning a new document uploaded will get his fields indexed and type will be decided by ElasticSearch unless this field was previously mapped, or mapped on 'POST Mapping' call. \
While those indexes are created they will be hardcoded mapped with the following fields: ElasticSearchType, ElasticSearchSubType and UUID.\
\
Each document unique value is the \_id, so we will use this field as our identifier to make sure we don't duplicate data on our index. The \_id should also allow work with multiple versions of the same type and the Open Catalog project should allow multiple catalogs.\
To handle those requests the \_id will be: ElasticSearchType+ElasticSearchSubType(if exist)+UUID.\
\
The supported API calls will be: &#x20;

* Post data - upload data to ElasticSearch\
  https://papi.pepperi.com/v1.0/elasticsearch/bulk/{elasticsearch\_type}
* Delete data \
  http://papi.pepperi.com/v1.0/elasticsearch/delete/{elasticsearch\_type}
* Update data\
  http://papi.pepperi.com/v1.0/elasticsearch/update/{elasticsearch\_type}
* Searching and Analyzing of data\
  https://papi.pepperi.com/v1.0/elasticsearch/search/{elasticsearch\_type}
* Mapping new field on index\
  https://papi.pepperi.com/v1.0/elasticsearch/mapping/{elasticsearch\_type}
* Get data by where clause\
  https://papi.pepperi.com/v1.0/elasticsearch/{elasticsearch\_type}?fields={fields}\&Where={whereClause}\&order\_by={orderBy}\&page={pageIndex}\&page\_size={pageSize}\&is\_distinct={isDistinct}\&include\_count={isCount}
* Get totals\
  https://papi.pepperi.com/v1.0/elasticsearch/totals/{elasticsearhc\_type}?select={aggregationsAndApiNames}\&where={whereClause}\&group\_by={groupBy}<br>

API call for clear index - meaning deleting the index (all data and mapping on index will be deleted) and create clear new index instead. Clear chosen index, of the data\_index or open\_catalog.

* Clear Index\
  https://papi.pepperi.com/v1.0/elasticsearch/clear/{index\_type}

{% hint style="info" %}
An ElasticSearch on Pepperi API call will receive the relevant index from the token.
{% endhint %}

## API Calls Examples of Searching and Analyzing

```
URL: https://papi.pepperi.com/v1.0/elasticsearch/search/{type}
```

Search items from MainCategory "Apple", and sort by Item Name desc

```
{
  "query": {
    "bool": {
      "must": [
        {
        "match" : { "MainCategory":"Apple" }
        }
      ]
    }
  },
  "sort" : [
    { "ItemName": {"order" : "asc"} }
  ]
}
```

Same search items by now return with paging, and include count&#x20;

```
{
  "size": 100,                     //page_size
  "from": 0,                       //page_index
  "track_total_hits": true,        //include_count
  "query": {
    "bool": {
      "must": [
        {
        "match" : { "MainCategory":"Apple" }
        }
      ]
    }
  },
  "sort" : [
    { "ItemName": {"order" : "asc"} }
  ]
}
```

Group items by MainCategory. Will return all the existing MainCategory values of items on this index and for each the count of items with this MainCategory.

```
{
  "aggs": {
    "values": {
      "terms": { "field": "MainCategory" } 
    }
  }
}
```

Group items by MainCategory while filtering on another item field.&#x20;

```
{
  "query": {
    "bool": {
      "must": [
        {
        "match" : { "TSAColor":"Blue" }
        }
      ]
    }
  },
  "aggs": {
    "values": {
      "terms": { "field": "MainCategory" } 
    }
  }
}
```

Group items by ranges of ItemPrice. Will return three buckets that show the count of items belongs to this range.

```
{
  "aggs": {
    "item_price_ranges": {
      "range": {
        "field": "ItemPrice",
        "ranges": [
          { "to": 100.00 },
          { "from": 100.00, "to": 200.00 },
          { "from": 200.00 }
        ]
      }
    }
  }
}
```

Calculate the average value of number field on item. Will return the average value of all the items.

```
{
  "size":0,
  "aggs": {
    "avg_item_price": { 
      "avg": { "field": "ItemPrice" } 
    }
  }
}
```

There are a lot of search and analyze options, that can cover a lot of scenarios. For more information about the syntax and more search abilities you can use ElasticSearch guide:\
[https://www.elastic.co/guide/en/elasticsearch/reference/7.x/index.html](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/index.html)
