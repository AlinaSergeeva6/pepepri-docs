# Get Code Job Executions

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/code_jobs/{code job uuid}/executions" method="get" summary="Get Code Job Execution List" %}
{% swagger-description %}
 
{% endswagger-description %}

{% swagger-parameter in="query" name="order_by" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="is_deleted" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="is_distinct" type="boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="number" %}
by default= 100 maximum is 250
{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="number" %}
by default returns the 1st page
{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
[
    {
        "UUID" : "881951ad-c2bd-4df1-8c88-80c5dabc0a37",
        "CodeJob" : { "UUID" : "7daf16c1-c4b3-4096-b06a-6e03051f750f" } ,
        "StartDateTime" : "2019-07-07T12:58:13Z",
        "EndDateTime" : "2019-07-07T12:58:13Z",
        "MemoryLevelConsumed" : 2,
        "ResultObject" : {}, Should include Success , 3 Error, and SummaryMessage
        "IsPublished" :false,  // if its "draft test run"
        "IsScheduled" : false  // is the log created from scheduler or manual
    },
    ....
]
```
{% endswagger-response %}
{% endswagger %}
