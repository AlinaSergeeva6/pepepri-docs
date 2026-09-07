---
description: >-
  Will later become Upsert - Create/Update User - by InternalId Or ExternalID Or
  UUID
---

# Create User



{% hint style="info" %}
* The only mandatory field is:  **Email**.&#x20;
* If exceeds users limit  - returns 400 Bad Request - with the number of the licensed users
* ExternalID is unique
* Generates random password&#x20;
* New field both for POST ~~and GET~~:  **SecurityGroup  (see also also new endpoint /security\_groups)**

**Defaults:**&#x20;

1. This function will always connect users to all brands
2. This function will not connected to all Price lists (you can't change it)

**Default fields values** (if not provided)

1. IsInTradeShowMode=false - will NOT connect to all Accounts&#x20;
2. IsAdmin = False
3. Profile = Rep(Root)
4. Role = Root (i.e role with ParentRoleID is null or not exists)
5. Security Group = Default Security Group
{% endhint %}

{% swagger baseUrl="https://papi.pepperi.com/V1.0/" path="createUser" method="post" summary="Create User" %}
{% swagger-description %}
This endpoint allows you to create a user
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Email" type="string" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="ExternalID" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Mobile " type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Phone " type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="FirstName" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="LastName" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Role" type="string" %}
the default is: Root (ie. ParentRoleID is null or not exists)
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Profile" type="string" %}
the default is:  Rep ( the root)
{% endswagger-parameter %}

{% swagger-parameter in="body" name="SecurityGroup " type="string" %}
the default is: Default security group
{% endswagger-parameter %}

{% swagger-parameter in="body" name="IsInTradeShowMode" type="string" %}
the default is: false
{% endswagger-parameter %}

{% swagger-response status="200" description="User successfully created." %}
```javascript
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
        },
        "SecurityGroup":
          "Data":{  
                "UUID": "5eb743eb-d09d-49bb-8afe-ad8e76de6662"
            }
    }
    
```
{% endswagger-response %}

{% swagger-response status="400" description="Verification that email does not exist in the distributor failed" %}
```javascript
{
    "fault": {
        "faultstring": "Cannot create a new employee because email address (testfromAPI2@pepperitest.com) is already in use by another employee",
        "detail": {
            "errorcode": "UnAuthorotized"
        }
    }
}
```
{% endswagger-response %}
{% endswagger %}



##



