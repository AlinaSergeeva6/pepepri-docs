---
description: insert multiple objects to a table with a single call
---

# BatchPut

## &#x20;Batch put

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/batch/{addonUUID}/{table}`

Insert up to 25 objects to an ADAL table with a single call.<br>

#### Path Parameters

| Name                                        | Type   | Description                                 |
| ------------------------------------------- | ------ | ------------------------------------------- |
| addonUUID<mark style="color:red;">\*</mark> | string | adonUUID of the addon this table belongs to |
| table<mark style="color:red;">\*</mark>     | string | Table name                                  |

#### Request Body

| Name                                      | Type  | Description                          |
| ----------------------------------------- | ----- | ------------------------------------ |
| Objects<mark style="color:red;">\*</mark> | array | Array of objects to put in the table |

{% tabs %}
{% tab title="200 Process is finished" %}
```
{
"ImportedObjects":
	[
		{
		"Key":"foo",
		"Status":"Insert"
		},
		{
		"Key":"goo",
		"Status":"Error",
		"Details":"Failed to upload object"
		},
	//...
	]
}
```
{% endtab %}

{% tab title="400 Error" %}
```
{'Message': ErrMsg}
```
{% endtab %}
{% endtabs %}

* BatchPut allows for up to 25 objects to be written to the ADAL table in a single call

{% hint style="info" %}
WARNING: BatchPut completely overwrites any existing objects in the database with the same key, and is not merging them together. Any property in the already-existing object that is not included in the new object, will be deleted in the process.
{% endhint %}

Some objects might not be uploaded on the first try. BatchPut retries to upload those failed objects several times utilizing an exponential backoff algorithm for up to 13 seconds total.

Currently only exposed to [DataImport](../data-import-export/data-import.md), accepting only its secret key.

{% hint style="info" %}
* Maximum 25 objects as input
* Maximum 6MB as input
* A single object cannot exceed 400KB
{% endhint %}

{% hint style="info" %}
Object upload is NOT ordered, i.e. the first object in the input array might be uploaded last. Therefore, any object in the input must be independent and not rely on other objects.
{% endhint %}

BatchPut takes as input an array of objects intended for upload to the ADAL table.

```
{
"Objects": 
    [
        {
            'Key': 'foo',
            'Attribute1': 'something',
            'Attribute2': 'something else'
        },
        {
            // ...
        }
    ]
}
```

{% hint style="info" %}
* An input object MUST contain an attribute "Key", with the value being a unique key identifying this object in the ADAL table.&#x20;
* There must not be any duplicate objects (i.e. having the same key) in the input array.

Failing either one of these criteria will result in the failure of the entire operation.
{% endhint %}

BatchPut outputs an array of ImportedObject matching with the input array. This means that output.ImportedObjects\[x] is an ImportedObject describing the operation result of the object input.Objects\[x]. The status of a returned ImportedObject can only be "Inserted" or "Error".
