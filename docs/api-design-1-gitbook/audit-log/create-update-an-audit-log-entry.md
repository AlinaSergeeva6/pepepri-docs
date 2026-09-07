# Create and Update an Audit Log Entry

{% hint style="warning" %}
**OwnerID Header MUST BE presented at every request** - **this will prevent manipulating the audit log (Only our internal requests which will be server side and will use our internal function which allow inserting to log without Owner UUID)**

&#x20;**`X-Pepperi-OwnerID :  <the OwnerID>`**
{% endhint %}

{% hint style="warning" %}
This API Endpoint can only be used by Admin User - any other user type will get 401 Unauthorized HTTP Status Code
{% endhint %}

{% hint style="info" %}
The Event's User Object id Read-Only - So that in POST and PUT it is taken from the Authorization Header &#x20;
{% endhint %}

## Create an Audit Log Entry  (AuditType=data)

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/audit_logs`

**Example of items data change by Sync**

#### Path Parameters

| Name | Type   | Description             |
| ---- | ------ | ----------------------- |
|      | object | See Object Sample Below |

{% tabs %}
{% tab title="200 " %}
```
Same as GET sinlge Log response.
```
{% endtab %}
{% endtabs %}

#### Example of items data changed by sync

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
            "DataModificationDateTime" :"",
            "DataResource":  "items",
            "Action" : {"ID" :12 , "Name": "Updated",  
            "DBModified": true,
            "NucleusModified": true,
            "RevisedFields" :
                        [
                            {
                                "FieldID" : "TSAMyCategory",
                                "OldValue" : "Nike",
                                "NewValue" : "Adidas"
                            },
                            {
                                "FieldID" : "Description",
                                "OldValue" : "Men Shoes 1",
                                "NewValue" : "Men Shoes 2"
                            }, 
                            ...
                        ]
        }     
    }
```



## Update an Audit Log Entry  (AuditType=data)

<mark style="color:orange;">`PUT`</mark> `https://api.pepperi.com/v1.0/audit_log/{Audit Log UUID}`

**Example of items data change by Sync**

#### Path Parameters

| Name | Type   | Description                |
| ---- | ------ | -------------------------- |
|      | string | UUID of an Audit Log Entry |

#### Request Body

| Name | Type   | Description      |
| ---- | ------ | ---------------- |
|      | object | Same as in POST  |

{% tabs %}
{% tab title="200 " %}
```
Same as GET sinlge Log response.
```
{% endtab %}
{% endtabs %}

{% hint style="info" %}
Please note : UUID is taken from the Path parameter - and does not need to be presented in Body - but it should raise exception only if its not = to the one in Path&#x20;
{% endhint %}
