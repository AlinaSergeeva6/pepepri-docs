# Insert Document

{% hint style="info" %}
The combination of AddonUUID+DistUUID+table must be unique and will serve as the partition, Key as sorted key&#x20;
{% endhint %}

{% hint style="info" %}
Default values (from schema) are NOT handled
{% endhint %}

{% hint style="info" %}
OwnerUUID - only the same addon that created the document can edit/delete, the addon have to be installed on the distributor
{% endhint %}

{% hint style="info" %}
Hidden data will be deleted after 30 days
{% endhint %}

{% hint style="info" %}
ExpirationDateTime can be used to set a date time in which the document will be deleted.&#x20;

If we set both Hidden (true) and ExpirationDateTime we will use the given expiration and not the default 30 days&#x20;

If we set Hidden false and the item not contains requested ExpirationDateTime  the ExpirationDateTime will be deleted
{% endhint %}

## Insert data in dynamo

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/insert/{AddonUUID}/{table}`

Allows to Insert addon's data in dynamo DB

#### Path Parameters

| Name      | Type   | Description               |
| --------- | ------ | ------------------------- |
| AddonUUID | string | Addon UIID of owner addon |
| table     | string | table name                |

#### Headers

| Name                                                  | Type    | Description                                                                                                                                                       |
| ----------------------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| X-Pepperi-OwnerID                                     | string  | The requested addonUUID (mandatory only for meta\_data - in this case it is different from the URL AddonUUID and will be verified against the document owner id)  |
| X-Pepperi-ActionID                                    | string  | actionUUID for logging                                                                                                                                            |
| X-Pepperi-SecretKey<mark style="color:red;">\*</mark> | string  | addon secret key (the secret key of the AddonUUID from the URL)                                                                                                   |
| x-pepperi-await-indexing                              | boolean | default is false, true means insert the data also to data index (in case of indexed schema)                                                                       |

#### Request Body

| Name | Type   | Description                  |
| ---- | ------ | ---------------------------- |
|      | object | Document that is be inserted |

{% tabs %}
{% tab title="200 successfully retrieved." %}
```
  {
    "Key": "f47ac10b-58cc-4372-a567-0e02b2c3d479", // Key of the inserted records
    "Status": "Error", // "Insert" or "Error"
    "Details": "Object already exists in the database"  // Only present when Status === "Error"
  }
```
{% endtab %}
{% endtabs %}
