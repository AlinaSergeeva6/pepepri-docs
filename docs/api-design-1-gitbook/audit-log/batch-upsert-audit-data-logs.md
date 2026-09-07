---
description: This is a batch upsert operation into the audit data logs.
---

# Batch Upsert Audit Data Logs

### Batch Upsert Audit Data Logs <a href="#batch-upsert" id="batch-upsert"></a>

`POST` https://api.pepperi.com/v1.0/batch/audit\_data\_logs

Upserts an array of audit data logs into elastic search.

\
**Headers**

| Name                  | Type   | Description      |
| --------------------- | ------ | ---------------- |
| X-Pepperi-SecretKey\* | String | Addon secret key |
| X-Pepperi-OwnerID     | String |                  |

**Request Body**

| Name      | Type  | Description               |
| --------- | ----- | ------------------------- |
| Objects\* | Array | Array of objects to be up |

{% tabs %}
{% tab title="200: OK Operation successfully done" %}
```
[
        {
            'Key': '', // ObjectKey
            'Status': 'Insert'
        },
        {
            'Key': '',
            'Status': 'Error',
            'Details': '' // Error Details
        }    
]

```
{% endtab %}

{% tab title="400: Bad Request Error" %}
```
{
    "Message": ErrMsg
}
```
{% endtab %}
{% endtabs %}

{% hint style="info" %}
* Maximum of 500 objects in input
* Validate if secret key is same as owner id
* Validate if "AddonUUID" in object is equal to owner id (Validation is bypassed if the owner is an addon with permission to add all audit data logs)
{% endhint %}

#### Input: <a href="#input" id="input"></a>

```
{
    'Objects': 
    [
        {
            "Source": "Android|iOS|Web", // mandatory
            "ActionUUID": "8825e6f4-b47f-4f45-9545-89fc65769e05",
            "ActionType": "insert|update",
            "ObjectKey": "98a7a422-a0a7-4333-9c30-67bca8f3ea4d",
            "ObjectModificationDateTime": "2024-10-07T14:59:48Z,
            "AddonUUID": "",
            "Resource": "MyTasks",
            "UpdatedFields": [
                {
                    "FieldID": "Status",
                    "NewValue": "1",
                    "OldValue": "2"
                }
            ]
        },
        {
            //...
        }
    ]
}
```

#### Errors: <a href="#errors" id="errors"></a>

These are the types of errors possible in this operation.

* Exceptions - Thrown when the request is invalid, when there are internal errors etc.

**Exceptions:**

| Error message:                                   | Reason                                                                |
| ------------------------------------------------ | --------------------------------------------------------------------- |
| This operation is only available in POST         | The request method was not POST                                       |
| X-Pepperi-SecretKey is required header           | The header X-Pepperi-SecretKey was not found                          |
| Objects array is mandatory and must not be empty | The given 'Objects' array is empty or does not exists in request body |
| Objects array can contain at most 500 objects    | More than 500 objects were given as input                             |
| Secret key is invalid                            | If the secret key is not valid                                        |
