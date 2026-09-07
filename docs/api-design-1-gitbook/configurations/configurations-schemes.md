---
description: >-
  standart pepperi resource, scheme for describing the fields of the
  configuration objects.
---

# Configurations Schemes

Configuration scheme objects used to define the schema of the configuration objects them, and hold the metadata for those configuration objects.\
the configuration scheme will hold the layout of the fields inside the configuration object, and if the configuration objects should be synced or not.\
configuration scheme should have unique name per addon.<br>

in the configuration scheme you can also decide if you want to sync the data or not.

* Name - the name of the scheme
* Fields - the fields of the configuration objects
* Sync - is the data need to be synced or not
* AddonUUID - the addon UUID of the owner.



{% hint style="warning" %}
**policy name for upserting configurations schemes is "configurations".**&#x20;

**by default only admin is allowed to call the API for upserting configurations schemes.**
{% endhint %}

## upsert  a configuration scheme

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/addons/configurations/schemes`

#### Headers

| Name                                                  | Type   | Description |
| ----------------------------------------------------- | ------ | ----------- |
| x-pepperi-secretkey<mark style="color:red;">\*</mark> | String |             |

#### Request Body

| Name                                        | Type                | Description                   |
| ------------------------------------------- | ------------------- | ----------------------------- |
| Name<mark style="color:red;">\*</mark>      | String              | Name of the scheme            |
| Fields<mark style="color:red;">\*</mark>    | ConfigurationFields | Description of the editor     |
| AddonUUID<mark style="color:red;">\*</mark> | String              |                               |
| Sync<mark style="color:red;">\*</mark>      | Sync                | Profile that editor belong to |

{% tabs %}
{% tab title="200: OK " %}
```json
{
    Key: "7e6c261a-09bd-11ee-be56-0242ac120002_Views", //AddonUUID_Name
    Name: "Views",
    AddonUUID: "7e6c261a-09bd-11ee-be56-0242ac120002",
    Fields: {
        Field1: {
                Type: "String"
            },
        Field2: {
                Type: "NumberInteger",
                PerProfile: true
            },
        Field3: {
                Type: "String"
            }
    },
    Sync: {
        SyncData: true
    }
}
```
{% endtab %}
{% endtabs %}

## Configuration Fields&#x20;

the fields that the configuration objects will hold

<pre class="language-typescript"><code class="lang-typescript"><strong>interface ConfigurationFields{
</strong>    [key: string]: {Type: string, PerProfile?: boolean}
}
</code></pre>

### Sync

if the data get synced or not

```typescript
interface Sync{
    SyncData: boolean
}

```
