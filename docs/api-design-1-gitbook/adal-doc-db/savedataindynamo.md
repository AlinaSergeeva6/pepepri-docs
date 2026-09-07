# Upsert Document

{% hint style="info" %}
Don't use for operative data, recommended for addon's meta data
{% endhint %}

{% hint style="info" %}
the combination of AddonUUID+DistUUID+table must be unique and will serve as the partition, Key1 as sorted key&#x20;
{% endhint %}

{% hint style="info" %}
The Document Size is limited to 400Kb (including the keys)
{% endhint %}

{% hint style="info" %}
CreationDateTime

ModificationDateTime

Hidden (including Expiration Date - TTL)  - after one month that the hidden was set to true the document  will be deleted&#x20;

OwnerUUID - only the same addon that created the document can edit/delete, the addon have to be installed on the distributor
{% endhint %}

{% hint style="info" %}
The Addons Data Layer will perform the following

1. Merge - merge data in case of partial update
2. publish -  call PNS (i.e. publish) with the relevant Audit Object (update/insert and send only changes)
3. dates - manage the modification and creation date time
4. hidden - (including Expiration Date - TTL)  - after one month that the hidden was set to true the document  will be deleted&#x20;
5. OwnerUUID - internal field that will not be returned - or consider to define it as readonly


{% endhint %}

{% hint style="info" %}
SecretKey uses for security, checking that the requested addon in the current addon. It is part of the client object - Client.AddonSecretKey
{% endhint %}

{% hint style="info" %}
Hidden data will be deleted after 30 days
{% endhint %}

{% hint style="info" %}
ExpirationDateTime can be used to set a date time in which the document will be deleted.&#x20;

If we set both Hidden (true) and ExpirationDateTime we will use the given expiration and not the default 30 days&#x20;

If we set Hidden false and the item not contains requested ExpirationDateTime  the ExpirationDateTime will be deleted
{% endhint %}

{% hint style="info" %}
ExpirationDateTime is not supported for cp&#x69;_&#x6D;et&#x61;_&#x64;ata items
{% endhint %}



## Save data in dynamo

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/{AddonUUID}/{table}`

Allows save addon's data in dynamo DB

#### Path Parameters

| Name  | Type   | Description     |
| ----- | ------ | --------------- |
| table | string | Key in dynamoDB |

#### Headers

| Name                                                  | Type    | Description                                                                                                                                                       |
| ----------------------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| X-Pepperi-OwnerID                                     | string  | The requested addonUUID (mandatory only for meta\_data - in this case it is different from the URL AddonUUID and will be verified against the document owner id)  |
| X-Pepperi-ActionID                                    | string  | actionUUID for logging                                                                                                                                            |
| X-Pepperi-SecretKey<mark style="color:red;">\*</mark> | string  | addon secret key (the secret key of the AddonUUID from the URL)                                                                                                   |
| x-pepperi-await-indexing                              | boolean | default is false, true means upsert the data also to data index (in case of indexed schema)                                                                       |

#### Request Body

| Name | Type   | Description                           |
| ---- | ------ | ------------------------------------- |
|      | object | Same object as returned in the "get"  |

{% tabs %}
{% tab title="200 successfully retrieved." %}
```
the updated object is returned
```
{% endtab %}
{% endtabs %}

## Create or Update&#x20;

<mark style="color:orange;">`PUT`</mark> `https://api.pepperi.com/v1.0/addons/data/{AddonUUID}/{table}/{key}`

Same as POST but this will overwrite the complete document \
There is no need to provide "key" inside the document, if one is provided it must be the same as the {key} in the url

#### Path Parameters

| Name | Type   | Description |
| ---- | ------ | ----------- |
|      | string |             |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}
