# Get Filters

{% swagger baseUrl="https://papi.pepperi.com/v1.0" path="/open_catalog/filters?where={where}&search_string={searchString}&search_string_fields={fields}&fields={fields}&distinct_fields={distinctFields}" method="get" summary="Get Filters" %}
{% swagger-description %}
This endpoint allows you to get filters
{% endswagger-description %}

{% swagger-parameter in="header" name="Token" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="search_string" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="search_string_fields" type="string" %}
only indexed fields, list comma separated.
{% endswagger-parameter %}

{% swagger-parameter in="query" name="distinct_fields" type="string" %}
fields for smart search, list comma separated.\
only string type fields.
{% endswagger-parameter %}

{% swagger-response status="200" description="successfully retrieved." %}
```
[
  {
    "APIName" : "ItemTSABrand",
    "Values" : [
      {
        "value" : "LG",
        "doc_count" : 145
      },
      {
        "value" : "Samsung",
        "doc_count" : 102
      },
      {
        "value" : "Apple",
        "doc_count" : 13
      }
    ]
  },
  {
    "APIName" : "TSAColor",
    "Values" : [
      {
        "value" : "Blue",
        "doc_count" : 84
      },
      {
        "value" : "White",
        "doc_count" : 78
      },
      {
        "value" : "Red",
        "doc_count" : 78
      },
      {
        "value" : "Black",
        "doc_count" : 67
      }
    ]
  },
  {
    "APIName" : "TSASecondColor",
    "Values" : [
      {
        "value" : "Blue",
        "doc_count" : 84
      },
      {
        "value" : "White",
        "doc_count" : 78
      },
      {
        "value" : "Red",
        "doc_count" : 78
      },
      {
        "value" : "Black",
        "doc_count" : 67
      }
    ]
  }
  .
  .
  .
]
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
The fields values are objects.\
Therefore for query parameters on field's value need to use {fieldName}.Value
{% endhint %}
