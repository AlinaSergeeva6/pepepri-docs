---
description: >-
  standard pepperi resource, object that hold configuration for a specific
  profile.
---

# Configuration Objects

configuration object hold the configuration for a specific profile.\
configuration objects can be created only via draft publish. once draft is published configuration objects are created per profile.\
configuration objects also expose an API in the cpi side, in order to retrive configuration object by key at runtime.

{% hint style="warning" %}
**policy name for upserting configurations objects is "configurations".**&#x20;

**by default only admin is allowed to call the API for upserting configurations objects.**
{% endhint %}

## upsert a configuration object

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/addons/configurations`

#### Headers

| Name                                                  | Type   | Description |
| ----------------------------------------------------- | ------ | ----------- |
| x-pepperi-secretkey<mark style="color:red;">\*</mark> | String |             |

#### Request Body

| Name                    | Type      | Description                 |
| ----------------------- | --------- | --------------------------- |
| ConfigurationSchemeName | String    | ref to configuration scheme |
| Draft                   | String    | ref to the draft object     |
| Version                 | String    | ref to the version object   |
| Profile                 | String    | ref to the profile object   |
| Data                    | DraftData |                             |

{% tabs %}
{% tab title="200: OK " %}
```typescript
{
    ConfigurationSchemeName: "RefToScheme",
    Draft: "9ce36590-198f-11ee-be56-0242ac120002", //ref
    Version: "b28c0262-198f-11ee-be56-0242ac120002", //ref
    Profile: 123, //ref
    Data: { 
        Field1: "a",
        Field2: 2,
        Field3: 1
    }
    
}
```
{% endtab %}
{% endtabs %}

## upsert a configuration object

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/addons/configurations`

#### Headers

| Name                                                  | Type   | Description  |
| ----------------------------------------------------- | ------ | ------------ |
| x-pepperi-secretkey<mark style="color:red;">\*</mark> | String | fAzPfDngmb8F |

#### Request Body

| Name                    | Type      | Description  |
| ----------------------- | --------- | ------------ |
| ConfigurationSchemeName | String    | kkrr2VgWCCdO |
| Draft                   | String    | UfqjckuPAqqS |
| Version                 | String    | IfaO4sCbTWj4 |
| Profile                 | String    | bE97dx0ChPsN |
| Data                    | DraftData | z5wq5zIxhfcv |

### Client API&#x20;

&#x20;**get by key**

configuration objects hold the specific configuration for the current profile, you can receive this specific configuration object by using the client API for configuration objects.

this client API support  get by key method for the configuration objects

exmaple:

```typescript
const configurationObject = await pepperi.addons.configurations.get(key)
const configuration = configurationObjects.Data
```

### get by resource and configuratino scheme name

in order to get all the configurations of specific addon, you can get all of those configurations by supplying  addonUUID and the name of the configuration schema to the clientAPI&#x20;

example:&#x20;

```typescript
const configurations: ConfigurationObject[] = await pepperi.addons.configurations.uuid(addonUUID)
.scheme(configurationSchemaName).get()

```
