---
description: Generic resource
---

# Account Users

* New Generic resource on ADAL that union the records of the the account employees and account buyers connections
* Read only resource - implement generic resource api with no upsert&#x20;
* No CPI side
* resources/account\_users

{% swagger method="post" path="/core/account_users/build" baseUrl="https://api.pepperi.com/v1.0" summary="Build the account users ADAL table" %}
{% swagger-description %}

{% endswagger-description %}
{% endswagger %}

### Account Users Schema

```
const accountUsersSchema: AddonDataScheme = {
    Name: "account_users",
    Type: 'data',
    GenericResource: true,
    SyncData:
    {
        Sync: true,
        Associative:
        {
            FieldID1: 'Account',
            FieldID2: 'User'
        }
    },
    Fields:
    {
        Account:
        {
            Type: "Resource",
            Resource: "accounts",
            AddonUUID: config.AddonUUID,
            Indexed: true,
            IndexedFields: {
                Name: {
                    Type: "String",
                    Indexed: true
                },
                ExternalID: {
                    Type: "String",
                    Indexed: true
                }
            }
        },
        User:
        {
            Type: "Resource",
            Resource: "users",
            AddonUUID: config.AddonUUID,
            Indexed: true,
            IndexedFields: {
                Name: {
                    Type: "String",
                    Indexed: true
                },
                ExternalID: {
                    Type: "String",
                    Indexed: true
                }
            }
        }
    }
}
```
