---
description: abstract schema - generic resource
---

# Buyers

Buyer is an "external user" belongs to a chain or to the distributor. if activated it has a login user (represented by a reference field on the object).

A buyer can be created or/and assigned to accounts by chain-manager or employee (chain-manager is also a buyer).&#x20;

**Buyers API**

Will implement generic resource [api](../../generic-resources/introduction.md)&#x20;

{% hint style="info" %}
Assigning a buyer to a chain is changing the "Chain" property on the buyer.
{% endhint %}

{% swagger method="post" path="/resources/buyers" baseUrl="https://api.pepperi.com/v1.0" summary="" %}
{% swagger-description %}
The body is the buyers fields + Type
{% endswagger-description %}

{% swagger-parameter in="body" required="true" name="Type" type="String" %}
The name of the buyer's concrete schema
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```
{
        "Key": "5bc41dd8-19d8-4155-b110-9df1a8b22bbe",
        "ExternalID": "",
        "CreationDateTime": "2015-04-22T09:46:14Z",
        "Email": "ltthanop@gmail.com_Old",
        "FirstName": "Sue Thong ซื่อตรงการแว่น",
        "Hidden": false,
        "LastName": "",
        "ModificationDateTime": "2023-03-21T10:19:09Z",
        "Phone": "",
        "Type": "Buyers",
        "Chain": "56b4f378-ce11-11ed-afa1-0242ac120002",
        "Profile":"d60c4184-dd9f-4221-a9d3-0cd67cecd40e",
        "User": "bff067bb-0eaa-450e-bd41-aba03986018f"
        "SecurityGroup": ""
}
```
{% endswagger-response %}
{% endswagger %}

**Buyers schema**:

```
{ 

    Name: "buyers", 
    Type: 'abstract', 
    GenericResource: true,
    Fields: { 
        Key: { 
            Type: "String" 
        }, 
        ExternalID: { 
            Type: "String",
            Indexed: true,
            Unique: true 
        }, 
        FirstName: { 
            Type: "String", 
            Indexed: true 
        }, 
        LastName: { 
            Type: "String", 
            Indexed: true 
        }, 
        Email: { 
            Type: "String", 
            Indexed: true,
            Unique: true
        }, 
        Profile: { 
            Type: "Resource", 
            Resource: "profiles", 
            AddonUUID: AddonUUID, // core-resources addon
            Indexed: true,
            IndexedFields: {
                
            }
        }, 
        SecurityGroup: { 
            Type: "String" 
        }, 
        Phone:{
            Type: "String" 
        },
        Chain: { 
            Type: "Resource", 
            Resource: "chains", 
            AddonUUID: AddonUUID, // buyer-management addon 
            Indexed: true 
        }, 
        User: { 
            Type: "Resource", 
            Resource: "users", 
            AddonUUID: AddonUUID, // core-resources addon
            Indexed: true 
        } 
    } 
} 
```

