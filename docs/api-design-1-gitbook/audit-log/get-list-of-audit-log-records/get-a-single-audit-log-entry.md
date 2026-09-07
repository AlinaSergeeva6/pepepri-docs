# Get a Single Audit Log Entry

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/audit_logs/{Audit Log UUID}" method="get" summary="Get a Single Audit Log Entries (response where AuditType=data)" %}
{% swagger-description %}
**Example of Get of a Single Code Job data change**
{% endswagger-description %}

{% swagger-response status="200" description="Response where=AuditType=data" %}
```java
 { 
        "UUID" : "",
        "CreationDateTime" : "", //of the audit log ! not the data object
        "ModificationDateTime" : "",
        "AuditType" : "data",  //OR action
        "Event" : { "Type": "nuclus", "User" : {"InternalID" :12, "Name" :"", "Email" : ""} },
        "SourceAuditLog" : {"UUID" : "",  "AuditType": "action", "EventType" : "sync" }, //e.g: Event such as Sync or Code Job
        "Status" : { "ID": 1, "Name": "Success" }, // { "ID": 0, "Name": "Failure" }
        "AuditInfo":
        {
            "ObjectUUID" :"7b86e560-4761-421c-a04f-2d98d01d2c3b",
            "DataModificationDateTime" : "",
            "Action" : {"ID" :12 , "Name": "Published/Updated/Created",  
            "DataResource":  "code_jobs",
            "NucleusModified": true,
            "AuditComment" : "Changed the cron expression to run every 2 hours",  //Comment added by the user        
            "RevisedFields" :
                        [
                            {
                                "FieldID" : "NextRunTime",
                                "OldValue" : "1565527080000",
                                "NewValue" : "1765527080000"
                            },
                            {
                                "FieldID" : "CronExpression",
                                "OldValue" : "*/2 * * * *",
                                "NewValue" : "*/3 * * * *"
                            }, 
                            ...
                        ]
        }        
    }
```
{% endswagger-response %}
{% endswagger %}
