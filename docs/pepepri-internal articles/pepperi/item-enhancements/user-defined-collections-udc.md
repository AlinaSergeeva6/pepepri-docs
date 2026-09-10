---
title: "User Defined Collections (UDC)"
order: 312
---
# User Defined Collections (UDC)

### Description

*User Defined Collections allow you to upload various data to Pepperi and use it for calculations and as a resource, e.g. in the Insights module.*

### Advantages and disadvantages

!!!success
Allows to upload a wider range of data compared to UDT.
!!!

!!!success
UDC can be used as a Resource in other Pepperi modules (e.g. Insights).
!!!

!!!danger
Once fields are created and records added to UDC, fields cannot be removed in the Pepperi backoffice, and editing options are limited. To remove fields, you'd need to remove data first.

The best way to update fields is through UDC Scheme
!!!

### Creating new UDC

1) Go to Settings -> Configuration -> User Defined Collections
2) Create a new UDC:
-   **Key**: name of UDC;
-   **Description**;
-   **Inherit fields from**: if you're creating UDC for Targets, select a value from the drop-down:
    -   account\_target
    -   user\_target

    Otherwise, leave "None".

-   **Scheme Only**: if true - you won't be able to upload data to this UDC. Such UDC can be used as a template for creating new UDC fields. Also it could be used in VisitFlows UDC: it contains an array of objects which are typed of such Scheme Only collection.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-54.png)

3) To edit UDC configuration: ✏ -> Edit

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-55.png)

---

### Creating UDC fields

1) Select UDC -> Edit;
2) In the "Fields" section click "Add":

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-56.png)

3) Configure the new field:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-57.png)

-   **Key**: name of the field in lower camel case e.g. "salesRep" (*Note: it allows creating a field started with an uppercase character but you won't be able to save such UDC*).

!!!info
The only exception is UDC for targets. Standard Target UDC fields start with uppercase.
!!!

-   **Description**: any;
-   **Type**:
    -   String;
    -   Bool;
    -   Integer;
    -   Double (more details - [https://learn.microsoft.com/en-us/office/vba/language/reference/user-interface-help/double-data-type](https://learn.microsoft.com/en-us/office/vba/language/reference/user-interface-help/double-data-type));
    -   DateTime;
    -   Resource - there will be an option to select the Resource type and the possibility to select additional fields related to this Resource. Details below: Resource Type
    -   ContainedResource:
        -   comes in handy when you want to use a 'Scheme Only' UDC as a Resource;
        -   more details - ContainedResource

!!!info
Be careful selecting types. If you need a field for future calculations (e.g. calculating the sum of line totals), select "Double" or "Integer". If you need to filter Data Queries by User or Account, select Resource type and relevant Resource option.
!!!

-   **Is array**: if ‘true’ – Optional Values field below will be editable;
-   **Mandatory**: if 'true' – this field should be filled when adding data to UDC;
-   **Indexed**: if 'true' – the user can search for values or do aggregation on this field. Note that each indexed field will consume additional storage
-   **Optional Values**: if text box is active, write your options, e.g.:

    ```
    brand1
    brand2
    brand3a
    ```

4) Click "Update" to save the changes:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-58.png)

 Wait till notification appears:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-59.png)

---

### Resource Type

*There are several resource types such as users, items, accounts, other UDCs, etc.*

#### Additional fields:

If you select Indexed=true when creating a new field, the Additional Indexed Fields section will appear.

1) Click "Add" to select additional fields related to the Resource you selected:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-60.png)

2) Select several fields:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-61.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-62.png)

Selected fields will not appear as separate UDC fields in the list:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-63.png)

However, they will be indexed and could be used in different Pepperi modules such as Insights.

#### System level filtering

You can select whether to apply filtering for this field:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-64.png)

"True" enables filtering by this field in different Pepperi modules where UDC is used as a Resource.

#### Entering data into the Resource field

When adding records to UDC, you have to enter UUID in the Resource Type fields. For example, if the Resource Type is account, enter Account UUID:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-65.png)

---

### ContainedResource

Used in 'Scheme Only' UDCs. Example:

1) There is 'Scheme Only' **UDC "Adresses"** with the following fields:

```
{"street": "string", "zipcode": "int"}
```

2) Another **UDC "Users"** contains field "address" with data structure defined in **UDC "Adresses"**:

```
{"userRef": "Resource", "email":"string", "address": "ContainedResource (Adresses)"}
```

-   When uploading data to **UDC "Users"**, you should enter the JSON to the field "address" with the same structure defined in **UDC "Adresses"**:

```
{"userRef": "xxxx-xxx-xxx", "email":"user@mail.com", "address": {"street": "Baker street 221B", "zipcode":12345}}
```

-   Data in the "address" field is validated. In our example, it is not possible to enter string value to "zipcode" as it has an integer type in **UDC "Adresses"**.
-   If in **UDC "Adresses"** the field is mandatory, it should be in JSON as well.
-   If in **UDC "Adresses"** the field has isArray=true, the field "address" in **UDC "Users"** should look similar to this:

```
"address": [{"street": "Baker street 221B"},{"street":...}, ...]
```

---

### Unique document identifier

Each UDC record has its unique key. There are two types of unique identifiers:

**1) Auto generate**;

Generated automatically for each record. Example:

Key

87c24cd8-7310-4d6a-a74f-99a5aebb0d91

**2) based on fields**:

-   create fields on which to base the Key;
-   Mandatory: true

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-66.png)

-   Select "based on fields" from the drop-down and delimiter (@ - by default):

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-67.png)

-   Click "Add":

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-68.png)

-   Select your fields:

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-69.png)

-   Your fields will appear here:

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-70.png)

-   Example:

Key

ecef500a-4dae-48e3-8c69-e216d4406cbd**@**8f46de00-68a1-4d2f-bbca-3e451de7b584**@**true

---

### Adding data to UDC

#### 1️⃣ Manually:

-   edit data:

Click on UDC name

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-71.png)

or "Edit data"

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-72.png)

-   click on "Add":

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-73.png)

-   fill the fields (the fields you set as 'mandatory' should be filled, other fields could be empty):

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-74.png)

-   click "Save";

!!!warning
You can't create a record with the same key which already exists:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-75.png)
!!!

#### 2️⃣ Import file:

-   edit data -> burger menu -> click on "Import":

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-76.png)

-   upload CSV file with data.

!!!info
If there are fields with a Resource type, UUID should be uploaded. Alternatively, you can upload an External ID but in this case "#ExternalID" should be added to the field name:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-77.png)
!!!

CSV example:

47B

[UDC\_Import.csv](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FxDekGuiK18miyXicd4Dq%2FUDC_Import.csv?alt=media&token=bfa0925a-5dc7-4176-a5c5-0fb12f8b3f20)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FxDekGuiK18miyXicd4Dq%2FUDC_Import.csv?alt=media&token=bfa0925a-5dc7-4176-a5c5-0fb12f8b3f20)

#### 3️⃣ iPaaS

You can upload data to UDC via iPaaS.

!!!info
🤔 The dataflow task ran successfully but you don't see any changes? Check the UDC Upload Results in the dataflow log:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-78.png)

 To check details, go to URL address from **URL with upload result data**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-79.png)

 Example:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-80.png)
!!!

#### Adding lines:

-   Dataflow task configuration:

-   Application: Generic Cloud Internal Connector
-   Target Object: Pepperi Export User Defined Collections Data

sub\_type\_id: *UDC name*

Map field names you'd like to add e.g.:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-81.png)

-   Dataflow task example:
    -   Upload data to UDC KBIntExamples2: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92300](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92300)

#### Remove lines:

-   Dataflow task configuration:

-   Application: Generic Cloud Internal Connector
-   Source Object: Pepperi User Defined Collections Data Async
-   Target Object: Pepperi Export User Defined Collections Data

|  |  |  |
| --- | --- | --- |
| pepperi\_export\_async\_udc\_scheme\_name | UDC name | *KBIntExamples2* |
| pepperi\_export\_async\_fields | UDC fields: Key, all mandatory fields | *Key,customersTotal,salesRep* |
| pepperi\_export\_async\_where | condition by which records should be removed | *Hidden='false' AND customersTotal&lt;10* |
| sub\_type\_id | UDC name | *KBIntExamples2* |
| removecols | removing all colunms except for Hidden and Key | *customersTotal,salesRep* |

Hidden: 'true'

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-82.png)

-   Dataflow task example:
    -   Remove records - UDC KBIntExamples2: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92306](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92306)

#### Update lines:

-   Dataflow task configuration:

-   Application: Generic Cloud Internal Connector
-   Source Object: Pepperi User Defined Collections Data Async
-   Target Object: Pepperi Export User Defined Collections Data

|  |  |  |
| --- | --- | --- |
| pepperi\_export\_async\_udc\_scheme\_name | UDC name | *KBIntExamples2* |
| pepperi\_export\_async\_fields | UDC fields: Key, all mandatory fields | *Key,salesRep* |
| pepperi\_export\_async\_where | condition by which records should be removed | *customersTotal=10* |
| sub\_type\_id | UDC name | *KBIntExamples2* |
| removecols | removing all colunms except for Hidden and Key | *customersTotal,salesRep* |

Fields you'd like to update

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-83.png)

-   Dataflow task example:
    -   Update records - UDC KBIntExamples2: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92311](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92311)

#### Get lines:

-   Dataflow task configuration:

-   Application: Generic Cloud Internal Connector
-   Source Object: Pepperi User Defined Collections Data Async

|  |  |  |
| --- | --- | --- |
| pepperi\_export\_async\_where | *exporting condition* | Hidden='false' |
| pepperi\_export\_async\_fields | *UDC fields* | Key,Hidden |
| pepperi\_export\_async\_udc\_scheme\_name | *UDC name* | UDCforKBint |

-   Dataflow task example:
    -   Get UDC KBIntExamples: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92285](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92285)

---

### Rebuild Index

When a new indexed field is created, you won't see data from this field in other Pepperi modules. For this purpose, the Rebuild Index exists. To Rebuild Index:

1) Select UDC:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-84.png)

2) Select "Rebuild Index":

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-85.png)

!!!warning
Running a rebuild will prevent all users from using this UDC until the process ends. This can take up to several minutes.
!!!

!!!danger
It is not recommended to run Rebuild Index for UDC which contains more than 100k records. In such a case, contact RnD.
!!!

---

### UDC Scheme

URL: [https://papi.pepperi.com/v1.0/user\_defined\_collections/schemes](https://papi.pepperi.com/v1.0/user_defined_collections/schemes)

Authorization: Bearer Token

**GET**

Response example:

```
[
{
    "GenericResource": true,
    "ModificationDateTime": "2024-07-09T10:51:08.724Z",
    "SyncData": {
        "Sync": false,
        "SyncFieldLevel": false
    },
    "CreationDateTime": "2024-07-05T12:15:05.701Z",
    "UserDefined": true,
    "Fields": {
        "key2": {
            "Type": "String",
            "Description": "key2",
            "Resource": "",
            "ApplySystemFilter": false,
            "Items": {
                "Type": "String",
                "Mandatory": false,
                "Description": ""
            },
            "Indexed": false,
            "Mandatory": false,
            "OptionalValues": [],
            "AddonUUID": "",
            "IndexedFields": {}
        },
        "sales": {
            "Type": "Integer",
            "Description": "Sales",
            "Resource": "",
            "ApplySystemFilter": false,
            "Items": {
                "Type": "String",
                "Mandatory": false,
                "Description": ""
            },
            "Indexed": true,
            "Mandatory": false,
            "OptionalValues": [],
            "AddonUUID": "",
            "IndexedFields": {}
        },
        "account": {
            "Type": "Resource",
            "Description": "",
            "Resource": "accounts",
            "ApplySystemFilter": false,
            "Items": {
                "Type": "String",
                "Mandatory": false,
                "Description": ""
            },
            "Indexed": true,
            "Mandatory": false,
            "OptionalValues": [],
            "AddonUUID": "fc5a5974-3b30-4430-8feb-7d5b9699bc9f",
            "IndexedFields": {
                "ExternalID": {
                    "Indexed": true,
                    "Type": "String"
                },
                "Name": {
                    "Indexed": true,
                    "Type": "String"
                }
            }
        },
        "key": {
            "Type": "String",
            "Description": "key",
            "Resource": "",
            "ApplySystemFilter": false,
            "Items": {
                "Type": "String",
                "Mandatory": false,
                "Description": ""
            },
            "Indexed": false,
            "Mandatory": false,
            "OptionalValues": [],
            "AddonUUID": "",
            "IndexedFields": {}
        }
    },
    "Description": "UDCforKBint",
    "DocumentKey": {
        "Delimiter": "@",
        "Type": "AutoGenerate",
        "Fields": []
    },
    "Type": "data",
    "ListView": {
        "Context": {
            "ScreenSize": "Tablet",
            "Profile": {},
            "Name": ""
        },
        "Columns": [
            {
                "Width": 10
            },
            {
                "Width": 10
            },
            {
                "Width": 10
            },
            {
                "Width": 10
            }
        ],
        "Type": "Grid",
        "Fields": [
            {
                "ReadOnly": true,
                "Title": "sales",
                "Type": "NumberInteger",
                "FieldID": "sales",
                "Mandatory": false
            },
            {
                "ReadOnly": true,
                "Title": "account",
                "Type": "TextBox",
                "FieldID": "account",
                "Mandatory": false
            },
            {
                "ReadOnly": true,
                "Title": "key",
                "Type": "TextBox",
                "FieldID": "key",
                "Mandatory": true
            },
            {
                "ReadOnly": true,
                "Title": "key2",
                "Type": "TextBox",
                "FieldID": "key2",
                "Mandatory": true
            }
        ]
    },
    "Hidden": false,
    "Lock": "a6cd9411-5e51-48cf-98af-1db40bf8f010",
    "Name": "UDCforKBint",
    "AddonUUID": "122c0e9d-c240-4865-b446-f37ece866c22"
},
{......},
]
```

**POST**

Body example:

```
    {
        "GenericResource": true,
        "ModificationDateTime": "2024-07-05T15:00:24.678Z",
        "SyncData": {
            "Sync": false,
            "SyncFieldLevel": false
        },
        "CreationDateTime": "2024-07-05T12:15:05.701Z",
        "UserDefined": true,
        "Fields": {
            "key2": {
                "Type": "String",
                "Description": "key2",
                "Resource": "",
                "ApplySystemFilter": false,
                "Items": {
                    "Type": "String",
                    "Mandatory": false,
                    "Description": ""
                },
                "Indexed": false,
                "Mandatory": false,
                "OptionalValues": [],
                "AddonUUID": "",
                "IndexedFields": {}
            },
            "sales": {
                "Type": "Integer",
                "Description": "Sales",
                "Resource": "",
                "ApplySystemFilter": false,
                "Items": {
                    "Type": "String",
                    "Mandatory": false,
                    "Description": ""
                },
                "Indexed": true,
                "Mandatory": false,
                "OptionalValues": [],
                "AddonUUID": "",
                "IndexedFields": {}
            },
            "account": {
                "Type": "Resource",
                "Description": "",
                "Resource": "accounts",
                "ApplySystemFilter": false,
                "Items": {
                    "Type": "String",
                    "Mandatory": false,
                    "Description": ""
                },
                "Indexed": true,
                "Mandatory": false,
                "OptionalValues": [],
                "AddonUUID": "fc5a5974-3b30-4430-8feb-7d5b9699bc9f",
                "IndexedFields": {
                    "ExternalID": {
                        "Indexed": true,
                        "Type": "String"
                    },
                    "Name": {
                        "Indexed": true,
                        "Type": "String"
                    }
                }
            },
            "key": {
                "Type": "String",
                "Description": "key",
                "Resource": "",
                "ApplySystemFilter": false,
                "Items": {
                    "Type": "String",
                    "Mandatory": false,
                    "Description": ""
                },
                "Indexed": false,
                "Mandatory": false,
                "OptionalValues": [],
                "AddonUUID": "",
                "IndexedFields": {}
            }
        },
        "Description": "UDCforKBint",
        "DocumentKey": {
            "Delimiter": "@",
            "Type": "AutoGenerate",
            "Fields": []
        },
        "Type": "data",
        "ListView": {
            "Context": {
                "ScreenSize": "Tablet",
                "Profile": {},
                "Name": ""
            },
            "Columns": [
                {
                    "Width": 10
                },
                {
                    "Width": 10
                },
                {
                    "Width": 10
                },
                {
                    "Width": 10
                }
            ],
            "Type": "Grid",
            "Fields": [
                {
                    "ReadOnly": true,
                    "Title": "sales",
                    "Type": "NumberInteger",
                    "FieldID": "sales",
                    "Mandatory": false
                },
                {
                    "ReadOnly": true,
                    "Title": "account",
                    "Type": "TextBox",
                    "FieldID": "account",
                    "Mandatory": false
                },
                {
                    "ReadOnly": true,
                    "Title": "key",
                    "Type": "TextBox",
                    "FieldID": "key",
                    "Mandatory": true
                },
                {
                    "ReadOnly": true,
                    "Title": "key2",
                    "Type": "TextBox",
                    "FieldID": "key2",
                    "Mandatory": true
                }
            ]
        },
        "Hidden": false,
        "Name": "UDCforKBint",
        "AddonUUID": "122c0e9d-c240-4865-b446-f37ece866c22"
    }
```

---

### API

*Allows adding/editing one record per request.*

URL: [https://papi.pepperi.com/v1.0/user\_defined\_collections/](https://papi.pepperi.com/v1.0/user_defined_collections/UDCforKBint)\[sub\_type\_id\]

**GET**

Response example:

```
[
    {
        "ModificationDateTime": "2024-07-09T10:27:36.836Z",
        "Hidden": false,
        "key2": "2222",
        "CreationDateTime": "2024-07-09T10:27:36.836Z",
        "account": "15953404-217f-4c92-966b-c0f1ee3848d7",
        "key": "111",
        "sales": 200,
        "Key": "3009411a-19e3-49ef-abf1-0f031a570074"
    },
    {....}
]
```

**POST**

Body example:

```
{
        "ModificationDateTime": "2024-07-09T12:15:12.163Z",
        "Hidden": false,
        "CreationDateTime": "2024-06-25T15:28:49.333Z",
        "customersTotal": 12,
        "salesRep": "ecef500a-4dae-48e3-8c69-e216d4406cbd",
        "Key": "ecef500a-4dae-48e3-8c69-e216d4406cbd"
    }
```

---

### Data Retention

Data Retention by UDC is now available in Data Retention section in Backoffice:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-86.png)

-   Click Add +
-   Select the UDC and max data retention mohths

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-87.png)

-   Click Add

---

### Possible errors

#### Creating mandatory fields for the UDC that already contains data.

*When data is added to UDC you still can create new fields. However, if you create a "mandatory" field and try to access data, the following error can occur:*

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-88.png)

**Cause**

old records do not have values in the new "mandatory" field.

**Prevention**

-   plan UDC thoroughly and create all needed fields before adding data;
-   before adding new "mandatory" field, remove all the data.

**How to fix**

1) Use UDC Scheme to update the fields that caused the issue:

```
"Indexed": false,
"Mandatory": false
```

2) Go to UDC and remove these fields.

---

#### Killed runtime

*Export UDC can take 5min max which is enough to export about 80-100k records. Otherwise, the export could fail with a "killed runtime" error.*

```
Export File finished with "Failure" status! Error Message: Error: Runtime exited with error: signal: killedRuntime.ExitError
```

**Cause**

UDC contains a great amount of data which takes to much time to be exported.

**How to fix - 1**

Export only neccesary fields:

-   *pepperi\_export\_async\_fields: Key,salesRep*

**How to fix - 2**

Filter out unnecessary data:

-   *pepperi\_export\_async\_where: userRef='xxx-xxx-xxx'*

---

**Errors in the Dataflow task while getting data from UDC**

-   *Failed due to exception: Missing FieldID when trying to parse queryString*: check if fields listed in pepperi\_export\_async\_fields are indexed in the UDC
