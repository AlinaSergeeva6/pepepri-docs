---
description: Delete table and the data in it
---

# Purge - Drop Table

## &#x20;Drop table

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/schemes/{TableName}/purge`

Delete the entire table permanently \
Works like "truncate" and if truncate is successful by removing all items the schema will be deleted as well

#### Path Parameters

| Name      | Type   | Description         |
| --------- | ------ | ------------------- |
| TableName | string | which table to drop |

#### Headers

| Name                | Type   | Description             |
| ------------------- | ------ | ----------------------- |
| X-Pepperi-OwnerID   | string | addon owner uuid        |
| X-Pepperi-SecretKey | string | addon secret key        |
| X-Pepperi-ActionID  | string | action uuid for logging |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}

