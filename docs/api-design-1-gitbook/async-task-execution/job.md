---
description: >-
  standard pepperi resource - actions table, this is the resource that represent
  async task execution
---

# Job

{% hint style="info" %}
Currently there is no POST method

There are two ways to create this resource:

1. using async addon api
2. creating scheduled code job
{% endhint %}

{% swagger method="get" path="/v1.0/addons/jobs" baseUrl="https://api.pepperi.com" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" required="false" %}
requested addon uuid - to filter according to the executed addon 
{% endswagger-parameter %}
{% endswagger %}

```javascript
[
{ 
        "Key" : "", // ActionUUID
        "Status" : "Success",
        "Version" : "3.2.101", // this is the async addon version
        "UserUUID" : "e9d48ad0-576b-4a8e-a8d7-8ab08e7abf44",
        "NumberOfTry" : 1,
        "CallbackUUID": "", //obsolete
        "NumberOfTries" : 1, // Maximum number of tries
        "CodeJobUUID": "", // scheduled job uuid (if exist)
        "AddonUUID" :"",
        "AddonPath": "file path", 
        "AddonFunctionName": "func",
        "AddonVersion": "1.2.101" // only in case a specific version was requested
         "Request" : {
              "path" : "", // Relative url path
              "method" : "POST"/"GET",
              "originalUrl" : "",
              "header" :"",
              "query" : { }, // request query parameters
              "body" : { } // request body objects
          },
          "ResultObject" : {}, // the object returned from the function execution 
          "ErrorMessage" : "", // if exist
          "FunctionPath": "", // exexuted path, calculated in InProgress status
        }        
    }
    ]
```

{% swagger method="get" path="/v1.0/addons/jobs/{Action_UUID}" baseUrl="https://api.pepperi.com" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200: OK" description="" %}
```javascript
{ 
        "Key" : "", // ActionUUID
        "Status" : "Success",
        "Version" : "3.2.101", // this is the async addon version
        "UserUUID" : "e9d48ad0-576b-4a8e-a8d7-8ab08e7abf44",
        "NumberOfTry" : 1,
        "CallbackUUID": "", //obsolete
        "NumberOfTries" : 1, // Maximum number of tries
        "CodeJobUUID": "", // scheduled job uuid (if exist)
        "AddonUUID" :"",
        "AddonPath": "file path", 
        "AddonFunctionName": "func",
        "AddonVersion": "1.2.101" // only in case a specific version was requested
         "Request" : {
              "path" : "", // Relative url path
              "method" : "POST"/"GET",
              "originalUrl" : "",
              "header" :"",
              "query" : { }, // request query parameters
              "body" : { } // request body objects
          },
          "ResultObject" : {}, // the object returned from the function execution 
          "ErrorMessage" : "", // if exist
          "FunctionPath": "", // exexuted path, calculated in InProgress status
        }        
    }
```
{% endswagger-response %}
{% endswagger %}
