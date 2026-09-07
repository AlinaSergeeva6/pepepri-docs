# Get Single Code Job Execution

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/code_jobs/{code job uuid}/executions/{execution UUID}" method="get" summary="Get Single Code Job Execution By UUID" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
    {
        "UUID" : "881951ad-c2bd-4df1-8c88-80c5dabc0a37",
        "CodeJob" : { "UUID" : "7daf16c1-c4b3-4096-b06a-6e03051f750f" } ,
        "StartDateTime" : "2019-07-07T12:58:13Z",
        "EndDateTime" : "2019-07-07T12:58:13Z",
        "ExecutionMemoryLevel" : 2,
        "ResultObject" : {}, Should include Success , 3 Error, and SummaryMessage
        "IsPublished" :false,  // if its "draft test run"
        "IsScheduled" : false  // is the log created from scheduler or manual
    }
```
{% endswagger-response %}
{% endswagger %}
