---
description: Pepperi standard resource.
---

# File

Get a file by its key.

## Geta single file/folder from a specific key

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/addons/pfs/{AddonUUID}/{SchemaName}/{key}`

Refer to GetFiles for the returned payload - unlike files it will return a specific file

## Upsert a single File/Folder

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/pfs/{AddonUUID}/{SchemaName}`

Refer to GetFiles for the Body that needs to be uploaded - note that it must be a single file and not array like in GetFiles.

#### Headers

| Name                                                   | Type   | Description      |
| ------------------------------------------------------ | ------ | ---------------- |
|  X-Pepperi-SecretKey<mark style="color:red;">\*</mark> | String | Addon secret key |

{% hint style="info" %}
Only addons can create Files/Folders - Secret Key is mandatory for POST&#x20;
{% endhint %}

{% hint style="info" %}
When using POST to create a new file without passing a URI parameter, the returned object will have a PresigendURL field. This URL can be used to PUT larger files on PFS.

The PresignedURL will be valid for 24 hours, during which a file can be PUT.
{% endhint %}



