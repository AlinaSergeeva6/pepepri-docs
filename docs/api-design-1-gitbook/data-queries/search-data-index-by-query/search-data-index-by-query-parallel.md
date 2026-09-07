---
description: >-
  Get query result from data index - allows executing multiple queries
  parallelly
---

# Search data index by query - parallel



{% swagger method="post" path="/data_queries/execute/bulk" baseUrl="https://papi.pepperi.com" summary="Parallel execution of queries" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="QueriesData" type="Array" required="true" %}
A list of objects, where each object contains a query key and a VariableValues object (as defined in the regular execute body).
{% endswagger-parameter %}

{% swagger-parameter in="body" name="TimeZoneOffset" type="Integer" %}
Defines the client's time zone offset in minutes
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
A list of execute-response objects.

The order of the responses will be according to the queries order in "QueriesData".
{% endswagger-response %}
{% endswagger %}

#### Example for the body:

```json
{
    "QueriesData": [
        {
            "Key": "e73932cf-f11b-4664-b5cc-664faf311b3d",
            "VariableValues": {
                "var1": "42",
                "var2": "string"
            }
        }
    ],
    "TimeZoneOffset": 120
}
```
