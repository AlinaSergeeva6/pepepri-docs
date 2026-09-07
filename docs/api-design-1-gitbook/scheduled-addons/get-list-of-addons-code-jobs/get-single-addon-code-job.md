# Get Single Addon Code Job

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/code_jobs/{Code Job UUID}" method="get" summary="Get Single Code Job" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="code job id" type="string" %}
UUID
{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_deleted" type="boolean" %}
default false
{% endswagger-parameter %}

{% swagger-parameter in="query" name="full_mode" type="boolean" %}
PHASE #2 - DEFAULT TRUE!! since its only one object
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
   {
       "UUID" : "",
       "CodeJobName" : "",
       "Type": "AddonJob", //Read only
       "Description" : "",
       "Owner" : { "UUID" : ""} ,  //Currently - addon UUID
       "CronExpression" : "",
       "NextRunTime" : "",
       "IsScheduled" : true,
       "CodeJobIsHidden" : false,
       "AddonPath" : "addon_file_name",
       "AddonUUID" : "", /
       "ExecutionMemoryLevel" : 4, // default for addons
       "NumberOfTries": 2
       "CreationDateTime" :"",
       "ModificationDateTime" : "",
       "FunctionName": "" 
   }
```
{% endswagger-response %}
{% endswagger %}

