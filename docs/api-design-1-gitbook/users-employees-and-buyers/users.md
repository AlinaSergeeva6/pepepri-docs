---
description: Generic resource
---

# Users

* New Generic resource on ADAL that union the records of the distributor employees and connected buyers
* Read only resource - implement generic resource api with no upsert&#x20;
* No CPI side
* resources/users

{% swagger method="post" path="/core/users/build" baseUrl="https://api.pepperi.com/v1.0" summary="Build the users ADAL table" %}
{% swagger-description %}

{% endswagger-description %}
{% endswagger %}

### Users Schama

```
const usersSchema: AddonDataScheme = {

    Name: 'users',
    Type: 'data',
    GenericResource: true,
    SyncData:
    {
        Sync: true,
    },
    Fields:
    {
        Email: {
            Type: "String"
        },
        FirstName: {
            Type: "String"
        },
        ExternalID: {
            Type: "String",
            Unique: true
        },
        LastName: {
            Type: "String"
        },
        Name: {
            Type: "String"
        },

        Mobile: {
            Type: "String"
        },
        Phone: {
            Type: "String"
        },
        Profile: {
            Type: "Resource",
            Resource: "profile",
            AddonUUID: config.AddonUUID,
            Indexed: true,
            IndexedFields: {
                Name: {
                    Type: "String",
                    Indexed: true
                }
            }
        },
        UserType: { //Employee or Buyer
            Type: "String"
        }
    }
}
```
