# Get List Of Archived Objects By Resource (not implemented)

{% hint style="warning" %}
all API names on activities/transactions and Account.ExternalID and Agent.EmailSupports only activities, transactions and all\_activities resources
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/maintenance/archived/{resource name}" method="get" summary="Get List Of Archived Objects By Resource Name" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="include_deleted" type="boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="number" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="number" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="order_by" type="string" %}
Agent.Email, Account.ExternalID, ModificationDateTime 
{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}
all API names on activities/transactions
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
[
    {
        "UUID" : "",
        "ModificationDateTime": "",
        "CreationDateTime": "",
        "ActionDateTime": "",
        "Agent" : 
            {
             "UUID" : "",
             "InternalID" : 121,
             "ExternalID" :"" ,
             "Email" : ""
             },
        "Account" :
            {
              "UUID" : "",
              "InternalID" : 121,
              "ExternalID" :"" 
             },
        "Type": { "ID" : 232, "Name" : ""},
        "Status": {"ID" :2}
    },
    ...
]
```
{% endswagger-response %}
{% endswagger %}
