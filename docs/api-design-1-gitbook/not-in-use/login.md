# Get List of Login Audit Log Entries

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/audit_log?where=AuditType=Login" method="get" summary="Get list of login audit log entries" %}
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
        "AuditType": "Login",
        "AuditInfo"
    {
              "ActivityID" : "0HLO0I0KSPFPE:00000006",
              "Error" : "invalid password",
              "ClientData" : {
                "Browser" : "chrome",
                "PepperiVersion" : "16_00"
              },
              "ClientID" : "pepperi.webapp.app.sandbox.pepperi.com",
              "AuthenticationMethod" : "pwd",
              "IdentityProvider" : "pepperi",
              "IsLoginByPepperiAdmin" : false
    }        
    }
    ...
]
```
{% endswagger-response %}
{% endswagger %}
