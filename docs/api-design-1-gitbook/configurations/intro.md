---
description: introduction to configurations addon
---

# Intro

### Goal

to supply unified infrastructure for creating syncable configurations.

### Objects:

* [configuration schemes](configurations-schemes.md)
* [drafts](drafts.md)
* [versions](versions.md)
* [configuration objects](configuration-objects.md)



### High Level:

with the configuration addon we can create configuration objects, in order to do so we need to

1. create configuration scheme that will define the layout of the configuration object
2. create a draft that will help us edit and create configuration objects
3. publish the draft in order to create those configuration objects

### Example

we are going to create configuration objects, each object will hold configuration of a person. person have name, id and age.\
\
in order to to do so, we first needs to create a configuration scheme that should define the interface of person configuration.

```typescript
//the input type is defined inside the papi sdk package, and called ConfigurationScheme
await papiClient.addons.data.configurations.schemes.upsert({
        Name: 'Person', //the name of the configuration scheme
        AddonUUID: AddonUUID, //the addonUUID of the addon that own this configuration
        //the interface of the configurations object
        Fields: {
            Name: {
                Type: "String",
            },
            Age: {
                Type: "Integer"
            },
            ID: {
                Type: "String"
            }
        },
        //if this configurations should be synced or not.
        Sync: {
            SyncData: true
        }
})
```

after we have created the configuration scheme for person configurations, we can now create a draft object that will help us to create and edit the configuration objects

so now we will create a draft that will hold the data for each profile.\
in order to make our life easier, the data property will hold the shared data between all profiles configuration, and if we want to add/override some field in the configuration of a specific profile we can do that through the profiles array.\
this is how we creating our draft:

```typescript
await papiClient.addons.data.configurations.addonUUID(AddonUUID)
.scheme('Persons').drafts.upsert({
        Key: "c78bbd36-35e8-11ee-9f19-325096b39f47" //if is not supplied it will be auto generated
        ConfigurationSchemaName: 'Person'
        AddonUUID: AddonUUID,
        Name: "Yossi"
        Data: {
            Name: "Name",
            Age: 120,
            ID: "GeneralID"
        },
        Description: "draft",
        Profiles: [
            {
                "Key": "51c5c372-35e7-11ee-be56-0242ac120002", //key for rep profile
                "Data": {
                    Name: "Rep",
                }
            },
            {
                "Key": "c9ef1358-35e7-11ee-a0ea-325096b39f47" //key for buyer profile
                "Data":{
                    Name: "Buyer",
                    ID: "BuyerID"
            }
        ]
    })
})
```

the profiles hierarchy also define the data that will be in the configuration object of each profile\
for example in our case buyer and admin are inherit from rep profile, so for now the data of the profiles looks like that<br>

```typescript
repData = {
    Name: "Rep",
    Age: 120,
    ID: "GeneralID"
}
buyerData = {
    Name: "Buyer",
    Age: 120,
    ID: "BuyerID"
},
adminData = {
    Name: "Rep",
    Age: 120,
    ID: "GeneralID"
}
//the admin data looks exactly like rep's data because admin inherit from rep and
//we didn't override nothing at the admin rep
```

now we have a draft, and we have its key so using the key of the draft we can publish the draft.\
publishing the draft will create configuration object per profile and will create a version object.\
this is how we can publish the draft:

```typescript
papiClient.addons.data.configurations.addonUUID(AddonUUID)
.scheme(Person).drafts.key("c78bbd36-35e8-11ee-9f19-325096b39f47").publish("first publish")
```

now we have configuration objects per profile, and they are syncable(because on the configuration scheme we set SyncData to true).\
so if we are on the cpi side and we want to get the configuration object we can use the global pepperi object in order to get the configuration object by key of the draft.\
for example:

```typescript
await pepperi.addons.configurations.get("c78bbd36-35e8-11ee-9f19-325096b39f47")
```

### Import/Export

For a Configuration to be imported and exported using DIMX, it is required to create an export relation for it. Details can be found in the dedicated [DataImportResource](../addon-relations/addons-link-table/relation-names/data-import/) and [DataExportResource](../addon-relations/addons-link-table/relation-names/data-export.md) pages.&#x20;

{% hint style="warning" %}
IMPORTANT: for configurations, the [Source](../addon-relations/addons-link-table/relation-names/data-export.md#additional-parameters) property must be set to "configurations" otherwise the import/export will always fail.
{% endhint %}
