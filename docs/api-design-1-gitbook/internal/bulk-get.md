---
description: Get multiple objects from a table with a single call
---

# 😥 BulkGet (Archived)

{% swagger baseUrl="https://api.pepperi.com" path="/v1.0/addons/data/bulk_get/{addonUUID}/{table}" method="post" summary="Bulk Get" %}
{% swagger-description %}
Get up to 100 objects from an ADAL table with a single call.
{% endswagger-description %}

{% swagger-parameter in="path" name="addonUUID" type="string" required="true" %}
addonUUID of the addon this table belongs to
{% endswagger-parameter %}

{% swagger-parameter in="path" name="table" type="string" required="true" %}
Table name
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Keys" type="array" required="true" %}
Array of keys to search for in table.
{% endswagger-parameter %}

{% swagger-response status="200" description="Process is finished" %}
```
{
    "Objects":
    [
        {
        'Key': 'foo1',
        'Attribute1': true,
        'Attribute2': 4
        },
        {
        'Key': 'foo2',
        'Attribute1': false,
        'Attribute2': 1337
        }
    ],
    "UnprocessedKeys":
    {
        "Keys":
        [
            'foo3',
            'foo4'
        ]
    }
}
```
{% endswagger-response %}

{% swagger-response status="400" description="Input is corrupted" %}
```
{'Message': ErrMsg}
```
{% endswagger-response %}

{% swagger-response status="500" description="Something went wrong" %}
```
{'Message': ErrMsg}
```
{% endswagger-response %}
{% endswagger %}

BulkGet can be provided with up to 100 keys to retrieve items from an ADAL table. However, there is a limit of 6MB on the returned value. That means that if all 100 objects total to over 6MB, only some of them will return. All keys that failed to retrieve an object for that reason, will be included in the return object as an array of "UnprocessedKeys".

{% hint style="info" %}
* Maximum 100 keys as input. Requesting more will result in the failure of the entire operation.
* Maximum 6MB as return value. It is possible that not all objects will return.
{% endhint %}

{% hint style="info" %}
If while trying to retrieve an object, it is found that the object doesn't exist in the ADAL table, it will not be returned and its key will not be found in UnprocessedKeys.
{% endhint %}

{% hint style="info" %}
Objects are returned in an un-ordered way, meaning that it is possible for the first returned object to correspond to the last key in the request, and vice versa.
{% endhint %}

BulkGet takes as input an array of keys intended for retrieval from the ADAL table:

```
{
"Keys":
    [
    "foo1",
    "foo2",
    // ...
    "fooN" //up to 100 keys
    ]
}
```

{% hint style="info" %}
There must be NO duplicates in the request. That means, the input array may not contain a certain key more than once. A duplicate key will cause the entire operation to fail.
{% endhint %}

BulkGet outputs an object in the following format:

```
{
"Objects":
    [{},{},...,{}],
"UnprocessedKeys":
    {
    "Keys": ["", "", ..., ""]
    }
}
```

The value of "UnprocessedKeys" can then be used to make another request to BulkGet for the rest of the objects.
