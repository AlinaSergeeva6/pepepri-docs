---
description: standard pepperi resource, hold the state of darft object
---

# Versions

Versions objects allow the configuration addon to suppoort versioning of configurations.&#x20;

the version object will hold the state of each draft that was published, allowing drafts to restore the state from a specific version.



{% hint style="warning" %}
**policy name for upserting versions is "configurations".**&#x20;

**by default only admin is allowed to call the API for upserting versions.**
{% endhint %}

## creating a version

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/addons/configurations/:addonUUID/:name/versions`

#### Headers

| Name                                                  | Type   | Description |
| ----------------------------------------------------- | ------ | ----------- |
| x-pepperi-secretkey<mark style="color:red;">\*</mark> | String |             |

#### Request Body

| Name                                         | Type         | Description      |
| -------------------------------------------- | ------------ | ---------------- |
| Descripton<mark style="color:red;">\*</mark> | String       | non empty string |
| Draft<mark style="color:red;">\*</mark>      | String       | ref to draft     |
| State<mark style="color:red;">\*</mark>      | VersionState |                  |

{% tabs %}
{% tab title="200: OK " %}
```typescript
{
    Key: "uuid",
    Description: "first draft of accounts view",
    Draft: "RefToDraft",
    AddonUUID: "1b8d8e9c-2477-11ee-be56-0242ac120002",
    ConfigurationSchemaName: "MySchema",
    State: {
        Data: {
            Field1: "a",
            Field2: 2
        },
        Profiles{
            Rep: {
                Id: 123,
                Data: {
                    Field3: 1
                }
            },
            Buyer: {
                Id: 132,
                Data: {
                    Field1: "x",
                    Field3: 2
                }
            },
        }
    }
}
```
{% endtab %}
{% endtabs %}
