---
description: Internal endpoint to create new system account
---

# Internal - Create Private Account



{% swagger method="post" path="/accounts/system" baseUrl="https://api.pepperi.com/v1.0" summary="Internal endpoint to create new system account" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200: OK" description="" %}
````

    {
        "InternalID": 21368532,
        "UUID": "879730f3-68a1-4ac8-9224-d70f87780fe0",
        "ExternalID": "",     
        "Country": "UZ",
        "CreationDateTime": "2022-12-01T09:02:18Z",
        "Hidden": false,
        "ModificationDateTime": "2022-12-01T09:02:18Z",
        "Name": "Chain-{chainUUID}",
        "Status": 2,
        "StatusName": "Submitted",
        "Street": "",
        "Type": "Customer",
        "TypeDefinitionID": 294692,   
        "SystemGeneratedType":6 // chain provate account 

        
    }
```
````
{% endswagger-response %}
{% endswagger %}
