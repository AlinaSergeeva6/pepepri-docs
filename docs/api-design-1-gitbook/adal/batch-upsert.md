---
description: Upsert a batch of up to 500 objects
---

# Batch Upsert

## Batch Upsert

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/batch/{addonUUID}/{table}`

Upserts an array of up to 500 ADAL objects to a single table.

#### Path Parameters

| Name                                        | Type   | Description                                  |
| ------------------------------------------- | ------ | -------------------------------------------- |
| addonUUID<mark style="color:red;">\*</mark> | String | addonUUID of the addon this table belongs to |
| talbe<mark style="color:red;">\*</mark>     | String | Table name                                   |

#### Headers

| Name                                                  | Type   | Description                                                                                 |
| ----------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------- |
| X-Pepperi-SecretKey<mark style="color:red;">\*</mark> | String | Addon secret key                                                                            |
| x-pepperi-await-indexing                              | String | default is false, true means upsert the data also to data index (in case of indexed schema) |

#### Request Body

| Name                                      | Type   | Description                                        |
| ----------------------------------------- | ------ | -------------------------------------------------- |
| Objects<mark style="color:red;">\*</mark> | Array  | Array of objects to be up                          |
| MaxPageSize                               | number | Maximum objects per page                           |
| WriteMode                                 | String | Merge/Insert/Overwrite- See the description below  |

{% tabs %}
{% tab title="200: OK Operation successfully done" %}
```javascript
    [
        {
            'Key': 'foo1',
            'Status': 'Insert'
        },
        {
            'Key': 'foo2',
            'Status': 'Ignore'
        },
        {
            'Key': 'foo3',
            'Status': 'Update'
        },
        {
            'Key': '',
            'Status': 'Error',
            'Details': 'Table key must exist'
        },
        {
            'Key': 'foo4',
            'Status': 'Error',
            'Details': 'Upload failed'
        }
    ]

```
{% endtab %}

{% tab title="400: Bad Request Error" %}
```javascript
{
    "Message": ErrMsg
}
```
{% endtab %}
{% endtabs %}



{% hint style="info" %}
* Maximum input is 6MB
* A single object cannot exceed 400KB
* Maximum of 500 objects in input
{% endhint %}

### Input:

```
{
    'Objects': 
    [
        {
            'Key': 'foo',
            'Attribute1': 'something',
            'Attribute2': 'something else'
        },
        {
            //...
        }
    ],
    // depricated, use WriteMode!!
    'OverwriteObject': false // false by default. 
    'MaxPageSize': 20 // 100 by default.
    
    // default is Merge
    // if OverwriteObject is true then default is Overwrite
    // Merge - updates existing objects with fields provided
    // Overwrite - replaces existing objects
    // Insert - Insert without updating (ignore already existing objects)
    'WriteMode': Merge|Overwrite|Insert
    
    // currently supported only on Data-Index!
    // leave empty if coonditional update isn't needed - default is empty
    // can only be used with WriteMode: "Merge"
    // fieldID of a field of type DateTime that will be used as a condition when updating a document
    // the document will be updated according to the 'StaleHandlingStrategy'
    'StaleModificationFieldID': string
    
    // default is GreaterThan
    // UpdateIfNewer - the document will be updated only if the value that was sent is greater (later) than the existing one
    // UpdateIfNewerOrEqual - the document will be updated if the value that was sent is greater than or equal to the existing one
    'StaleHandlingStrategy': UpdateIfNewer|UpdateIfNewerOrEqual
}
```

### WriteMode = Merge

Input objects are updated if exist, this means that if an object with the same key already exists his fields are either updated or inserted (if they don't exist). However, the object isn't overwritten meaning existing fields will remain unchanged. Those objects will be indicated in the response with:

> ```
> 'Status': 'Update'
> ```

Input objects are inserted if they do not exist,  this means that if there is no object with the same key in the table a new object will be inserted. Those objects will be indicated in the response with:

> ```
> 'Status': 'Insert'
> ```

Input objects are ignored if they exist and equal, this means that if an object with the same key already exists and all of his fields are the same as the existing object it will be ignored. Those objects will be indicated in the response with:

> ```
> 'Status': 'Ignore'
> ```

### WriteMode = Overwrite

Input objects are inserted or overwritten, this means that all input objects are considered new objects and will be inserted into the table, this will overwrite any object in the database sharing a key with an input object.

Input objects are updated if exist, this means that if an object with the same key already exists he will be replaced with the new object. Those objects will be indicated in the response with:

> ```
> 'Status': 'Update'
> ```

Input objects are inserted if they do not exist,  this means that if there is no object with the same key in the table a new object will be inserted. Those objects will be indicated in the response with:

> ```
> 'Status': 'Insert'
> ```

### WriteMode = Insert

Input objects are inserted if they do not exist,  this means that if there is no object with the same key in the table a new object will be inserted. Those objects will be indicated in the response with:

> ```
> 'Status': 'Insert'
> ```

Input objects that already exist will return an error. This means that if an object with the same key already exists in the table, it won't change but will be indicated with:

> ```
> 'Status': 'Error'
> ```

### MaxPageSize

Controls how many objects at most enter the merging step simultaneously. Optimally, a single page should not exceed 1MB.&#x20;

Therefore, if it is known that each object is large (e.g. 300KB) it is recommended to set MaxPageSize to 2-3. If each object is small (few KB or less) it can be ignored and kept at default (100).

Setting the MaxPageSize to a high number when dealing with large objects might cause a Timeout exception. If this occurs, try to decrease the MaxPageSize.

If Overwrite = true, the MaxPageSize is not considered and can be ignored.

### Output:

Outputs an array of DIMXObjects™, each matching by index an input object (i.e output\[5] is a DIMXObject™ corresponding to the input object input.Objects\[5]).



### Errors:

There are 2 types of errors possible in this operation.&#x20;

* Exceptions - Thrown when the request is invalid, when there are internal errors etc.
* DIMXObject™ error - A DIMXObject™ returned with the status "Error". This means that the specific object associated with this DIMXObject™ has failed a certain validation.

#### Exceptions:

| Error message:                                  | Reason                                                                     |
| ----------------------------------------------- | -------------------------------------------------------------------------- |
| This operation is only available in POST        | The request method was not POST                                            |
| X-Pepperi-SecretKey is required header          | The header X-Pepperi-SecretKey was not found                               |
| Request must contain the 'Objects' property     | Request was made without the 'Objects' property in the request's body      |
| Objects array for upsert is empty               | The given objects array is empty                                           |
| Objects array can contain at most 500 objects   | More than 500 objects were given as input                                  |
| Table schema must be exist, for table = {table} | The combination of "addonUUID" and "table" do not match any existing table |
| OwnerUUID is invalid                            | The secret key doesn't match the AddonUUID                                 |

#### &#x20;DIMXObject™ errors:

| Details                                       |                                                                                                                  |
| --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Indexes is saved word                         | An object to be upserted cannot contain a property called "Indexes"                                              |
| Table key must exist                          | An object to be upserted must contain a non-empty "Key" property                                                 |
| Object's size exceeds 400KB                   | An object to be upserted cannot exceed 400KB                                                                     |
| OwnerUUID is invalid                          | Only in MetaData - After retrieving the object from the table, its OwnerUUID doesn't match the current OwnerUUID |
| Expiration date not valid                     | ExpirationDateTime was explicitly written for this object, but it is invalid (it is earlier than Now)            |
| Failed to obtain object                       | After several attempts, could not retrieve the object with the key {key} (should try again later)                |
| Failed to upload object                       | After several attempts, could not upload the object to the database.                                             |
| Provided list of item keys contain duplicates | In the input objects array, there are 2 or more objects who share the same key.                                  |
| Unknown error occurred                        | Object reached the final resolver with the status "InProgress". Should not happen.                               |
