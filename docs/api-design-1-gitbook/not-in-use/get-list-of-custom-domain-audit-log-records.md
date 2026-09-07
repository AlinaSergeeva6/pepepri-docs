# Get List Of Branded App Audit Log Entries

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/audit_log?where=AuditType=BrandedApp" method="get" summary="Get list of audit log entries for specific branded app" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
[
    { 
        "UUID" : "",
        "User" : {"InternalID" :12, "Name" :"", "Email" : ""},
        "CreationDateTime" : "",
        "AuditType": "BrandedApp",
        "AuditInfo"
        {
             "ClientID" : "pepperi.webapp.dermalogicasb.pepperi.com",
             "ClientType" : "web",
             "ClientURL" : "https://dermalogicasb.pepperi.com",
             "BrandedAppUUID" : "d284d0c1-c97c-4ff9-2516-08d714fe9946",
             "Email" : "cs.admin@dermalogica.com",
             "Category" : "Branded App",/?? is it still needed now??
             "Type" : "client_created",
             "ActionDateTime" : "2019-07-30T15:00:52Z",
             "RemoteIpAddress" : "207.232.14.52"
         }        
    }
    ...
]
```
{% endswagger-response %}
{% endswagger %}
