# Update User

#### Update User - by InternalId Or ExternalID Or UUID

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="users" method="post" summary="Upsert a single user" %}
{% swagger-description %}
Please note - Additional SecurityGroup Field also in the Get - see response
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
    {
        "InternalID": 107200,
        "UUID": "f577c6ac-737e-49fd-839d-e62bf9338f1b",
        "ExternalID": "310603",
        "CreationDateTime": "2014-12-28T12:26:00Z",
        "Email": "yakirc@nirlat.com",
        "FirstName": "יקיר",
        "Hidden": false,
        "IsInTradeShowMode": false,
        "LastName": "כהן",
        "Mobile": "",
        "ModificationDateTime": "2016-08-28T06:44:47Z",
        "Phone": "",
         "Profile": {
            "Data":{  
                "InternalID": 1201,
                "Name": "Rep"
                }
            }
        },
        "Role": {
            "Data":{  
                "InternalID": 282,
                "Name": "יועץ טכני צפון יקיר כהן "
            }
        }
    }
```
{% endswagger-response %}
{% endswagger %}

##



```json
    {
        "InternalID": 107200,
        "UUID": "f577c6ac-737e-49fd-839d-e62bf9338f1b",
        "ExternalID": "310603",
        "Email": "myEmail@myComapnyName.com",
        "FirstName": "myFistrName",
        "LastName": "myLastName",
        "Mobile": "",
        "Phone": "",
        "Profile": {
            "Data":{  
                "InternalID": 1201
                }
            }
        },
        "Role": {
            "Data":{  
                "InternalID": 282 
            }
        }
     
         "IsInTradeShowMode": false,
         "Hidden": false
    }
```
