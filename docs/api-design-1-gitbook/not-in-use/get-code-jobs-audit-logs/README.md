# Get List Of Code Job Audit Log Entries

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/audit_log?where=AuditType=CodeJobs" method="get" summary="Get Code Job Audit Log" %}
{% swagger-description %}
In case of Cod
{% endswagger-description %}

{% swagger-parameter in="path" name="" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
[
    "UUID" : "",
    "User" : {"InternalID" :12, "Name" :"", "Email" : ""},
    "CreationDateTime" : "",
    "AuditType": "CodeJobs",
    "AuditInfo"
    {
        {             
            "CodeJob": {"UUID" :"", "Name": ""},
            "RevisedUrl" : "",  // Used ONLY for code : S3 link to previous version
            "Action" : "Published/Updated/Created",  
            "User" :{"UUID" : "", "Email" :""},
            "ActionDateTime" : "",
            "RevisedFields" : 
            {
                "CodeJob" : {"UUID" :"469cc3cb-4ae9-4fc6-b60e-4957bf405ce4"},
                "NextRunTime" : 1565527080000,
                "CronExpression" : "*/2 * * * *",
                "ModificationDateTime" : 1565527031720            
            },
            "Status" : 0
        }
    },
    ...
]
```
{% endswagger-response %}
{% endswagger %}

