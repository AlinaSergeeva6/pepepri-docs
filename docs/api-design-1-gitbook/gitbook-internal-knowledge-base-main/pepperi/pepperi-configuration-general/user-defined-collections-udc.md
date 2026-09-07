# User Defined Collections (UDC)

### Description

_User Defined Collections allow you to upload various data to Pepperi and use it for calculations and as a resource, e.g. in the Insights module._

### **Advantages and disadvantages**

{% hint style="success" %}
Allows to upload a wider range of data compared to UDT.
{% endhint %}

{% hint style="success" %}
UDC can be used as a Resource in other Pepperi modules (e.g. Insights).
{% endhint %}

{% hint style="danger" %}
Once fields are created and records added to UDC, fields cannot be removed in the Pepperi backoffice, and editing options are limited. To remove fields, you'd need to remove data first.

The best way to update fields is through [#udc-scheme](user-defined-collections-udc.md#udc-scheme "mention")&#x20;
{% endhint %}

### Creating new UDC

1\) Go to Settings -> Configuration -> User Defined Collections

2\) Create a new UDC:&#x20;

* **Key**: name of UDC;
* **Description**;
*   **Inherit fields from**: if you're creating UDC for Targets, select a value from the drop-down:

    * account\_target
    * user\_target

    Otherwise, leave "None".
* **Scheme Only**: if true - you won't be able to upload data to this UDC. Such UDC can be used as a template for creating new UDC fields. Also it could be used in VisitFlows UDC: it contains an array of objects which are typed of such Scheme Only collection.

<div align="left"><figure><img src="../../.gitbook/assets/image (917).png" alt="" width="563"><figcaption></figcaption></figure></div>

3\) To edit UDC configuration: ✏ -> Edit

<div align="left"><figure><img src="../../.gitbook/assets/image (918).png" alt="" width="563"><figcaption></figcaption></figure></div>

***

### Creating UDC fields

1\) Select UDC -> Edit;

2\) In the "Fields" section click "Add":

<div align="left"><figure><img src="../../.gitbook/assets/image (919).png" alt="" width="563"><figcaption></figcaption></figure></div>

3\) Configure the new field:

<div align="left"><figure><img src="../../.gitbook/assets/image (922).png" alt="" width="563"><figcaption></figcaption></figure></div>

* **Key**: name of the field in lower camel case e.g. "salesRep" (_Note: it allows creating a field started with an uppercase character but you won't be able to save such UDC_).

{% hint style="info" %}
The only exception is UDC for targets. Standard Target UDC fields start with uppercase.&#x20;
{% endhint %}

* **Description**: any;
* **Type**:&#x20;
  * String;
  * Bool;
  * Integer;
  * Double (more details - [https://learn.microsoft.com/en-us/office/vba/language/reference/user-interface-help/double-data-type](https://learn.microsoft.com/en-us/office/vba/language/reference/user-interface-help/double-data-type));
  * DateTime;
  * Resource - there will be an option to select the Resource type and the possibility to select additional fields related to this Resource. Details below: [#resource-type](user-defined-collections-udc.md#resource-type "mention")
  * ContainedResource:&#x20;
    * comes in handy when you want to use a 'Scheme Only' UDC as a Resource;
    * more details - [#containedresource](user-defined-collections-udc.md#containedresource "mention")

{% hint style="info" %}
Be careful selecting types. If you need a field for future calculations (e.g. calculating the sum of line totals), select "Double" or "Integer". If you need to filter Data Queries by User or Account, select Resource type and relevant Resource option.
{% endhint %}

* **Is array**: if ‘true’ – Optional Values field below will be editable;
* **Mandatory**: if 'true' – this field should be filled when adding data to UDC;
* **Indexed**: if 'true' – the user can search for values or do aggregation on this field. Note that each indexed field will consume additional storage
*   **Optional Values**: if text box is active, write your options, e.g.:

    ```
    brand1
    brand2
    brand3a
    ```

4\) Click "Update" to save the changes:\
![](<../../.gitbook/assets/image (782).png>)\
Wait till notification appears:

<div align="left"><figure><img src="../../.gitbook/assets/image (778).png" alt=""><figcaption></figcaption></figure></div>

***

### Resource Type

_There are several resource types such as users, items, accounts, other UDCs, etc._

#### Additional fields:

If you select Indexed=true when creating a new field, the Additional Indexed Fields section will appear.&#x20;

1\) Click "Add" to select additional fields related to the Resource you selected:

<div align="left"><figure><img src="../../.gitbook/assets/image (852).png" alt="" width="563"><figcaption></figcaption></figure></div>

2\) Select several fields:

<div align="left"><figure><img src="../../.gitbook/assets/image (854).png" alt="" width="427"><figcaption></figcaption></figure></div>

<div align="left"><figure><img src="../../.gitbook/assets/image (855).png" alt="" width="563"><figcaption></figcaption></figure></div>

Selected fields will not appear as separate UDC fields in the list:

<figure><img src="../../.gitbook/assets/image (860).png" alt=""><figcaption></figcaption></figure>

However, they will be indexed and could be used in different Pepperi modules such as Insights.

#### System level filtering

You can select whether to apply filtering for this field:

<div align="left"><figure><img src="../../.gitbook/assets/image (795).png" alt="" width="391"><figcaption></figcaption></figure></div>

"True" enables filtering by this field in different Pepperi modules where UDC is used as a Resource.&#x20;

#### Entering data into the Resource field

When adding records to UDC, you have to enter UUID in the Resource Type fields. For example, if the Resource Type is account, enter Account UUID:

<div align="left"><figure><img src="../../.gitbook/assets/image (861).png" alt="" width="563"><figcaption></figcaption></figure></div>

***

### ContainedResource

Used in 'Scheme Only' UDCs. Example:

1\) There is 'Scheme Only' <mark style="color:green;">**UDC "Adresses"**</mark> with the following fields:&#x20;

```json
{"street": "string", "zipcode": "int"}
```

2\) Another <mark style="color:purple;">**UDC "Users"**</mark> contains field "address" with data structure defined in <mark style="color:green;">**UDC "Adresses"**</mark>:

```json
{"userRef": "Resource", "email":"string", "address": "ContainedResource (Adresses)"}
```

* When uploading data to <mark style="color:purple;">**UDC "Users"**</mark>, you should enter the JSON to the field "address" with the same structure defined in <mark style="color:green;">**UDC "Adresses"**</mark>:

{% code overflow="wrap" %}
```json5
{"userRef": "xxxx-xxx-xxx", "email":"user@mail.com", "address": {"street": "Baker street 221B", "zipcode":12345}}
```
{% endcode %}

* Data in the "address" field is validated. In our example, it is not possible to enter string value to "zipcode" as it has an integer type in <mark style="color:green;">**UDC "Adresses"**</mark>.
* If in <mark style="color:green;">**UDC "Adresses"**</mark> the field is mandatory, it should be in JSON as well.
* If in <mark style="color:green;">**UDC "Adresses"**</mark> the field has isArray=true, the field "address" in <mark style="color:purple;">**UDC "Users"**</mark> should look similar to this:

```json
"address": [{"street": "Baker street 221B"},{"street":...}, ...]
```

***

### Unique document identifier

Each UDC record has its unique key. There are two types of unique identifiers:&#x20;

**1) Auto generate**;

Generated automatically for each record. Example:

<table data-view="cards"><thead><tr><th>Key</th></tr></thead><tbody><tr><td>87c24cd8-7310-4d6a-a74f-99a5aebb0d91</td></tr></tbody></table>

**2) based on fields**:

* create fields on which to base the Key;
* Mandatory: true

<div align="left"><figure><img src="../../.gitbook/assets/image (809).png" alt="" width="563"><figcaption></figcaption></figure></div>

* Select "based on fields" from the drop-down and delimiter (@ - by default):&#x20;

<div align="left"><figure><img src="../../.gitbook/assets/image (1109).png" alt=""><figcaption></figcaption></figure></div>

* Click "Add":&#x20;

<figure><img src="../../.gitbook/assets/image (1110).png" alt=""><figcaption></figcaption></figure>

*   Select your fields: <br>

    <div align="left"><figure><img src="../../.gitbook/assets/image (1111).png" alt=""><figcaption></figcaption></figure></div>
*   Your fields will appear here: <br>

    <div align="left"><figure><img src="../../.gitbook/assets/image (1112).png" alt=""><figcaption></figcaption></figure></div>
* Example:&#x20;

<table data-view="cards"><thead><tr><th>Key</th></tr></thead><tbody><tr><td>ecef500a-4dae-48e3-8c69-e216d4406cbd<strong>@</strong>8f46de00-68a1-4d2f-bbca-3e451de7b584<strong>@</strong>true</td></tr></tbody></table>

***

### Adding data to UDC

#### <mark style="color:green;">1️⃣</mark> <mark style="color:blue;">Manually:</mark>&#x20;

* edit data:

<table data-view="cards"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td>Click on UDC name</td><td></td><td><img src="../../.gitbook/assets/image (796).png" alt="" data-size="original"></td></tr><tr><td>or "Edit data"</td><td></td><td><img src="../../.gitbook/assets/image (797).png" alt="" data-size="original"></td></tr></tbody></table>

*   click on "Add":<br>

    <div align="left"><figure><img src="../../.gitbook/assets/image (799).png" alt="" width="399"><figcaption></figcaption></figure></div>
*   fill the fields (the fields you set as 'mandatory' should be filled, other fields could be empty): <br>

    <div align="left"><figure><img src="../../.gitbook/assets/image (800).png" alt="" width="563"><figcaption></figcaption></figure></div>
* click "Save";

{% hint style="warning" %}
You can't create a record with the same key which already exists:\
<img src="../../.gitbook/assets/image (802).png" alt="" data-size="original">
{% endhint %}

#### <mark style="color:blue;">2️⃣ Import file:</mark>

* edit data -> burger menu -> click on "Import": \
  ![](<../../.gitbook/assets/image (872).png>)
* upload CSV file with data.

{% hint style="info" %}
If there are fields with a Resource type, UUID should be uploaded. Alternatively, you can upload an External ID but in this case "#ExternalID" should be added to the field name:\
<img src="../../.gitbook/assets/image (873).png" alt="" data-size="original">
{% endhint %}

CSV example:

{% file src="../../.gitbook/assets/UDC_Import.csv" %}

#### <mark style="color:green;">3️⃣</mark> <mark style="color:blue;">iPaaS</mark>

You can upload data to UDC via iPaaS.&#x20;

{% hint style="info" %}
🤔 The dataflow task ran successfully but you don't see any changes? Check the UDC Upload Results in the dataflow log:

![](<../../.gitbook/assets/image (1030).png>)\
To check details, go to URL address from **URL with upload result data**

<img src="../../.gitbook/assets/image (821).png" alt="" data-size="line">\
Example:\
<img src="../../.gitbook/assets/image (822).png" alt="" data-size="original">
{% endhint %}

#### Adding lines:

* Dataflow task configuration:

{% tabs %}
{% tab title="Details" %}
- Application: Generic Cloud Internal Connector
- Target Object: Pepperi Export User Defined Collections Data
{% endtab %}

{% tab title="Settings" %}
sub\_type\_id: _UDC name_
{% endtab %}

{% tab title="Mapping" %}
Map field names you'd like to add e.g.:

<figure><img src="../../.gitbook/assets/image (1071).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

* Dataflow task example:&#x20;
  * Upload data to UDC KBIntExamples2: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92300](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92300)

#### Remove lines:

* Dataflow task configuration:

{% tabs %}
{% tab title="Details" %}
- Application: Generic Cloud Internal Connector
- Source Object: Pepperi User Defined Collections Data Async
- Target Object: Pepperi Export User Defined Collections Data
{% endtab %}

{% tab title="Settings" %}
| pepperi\_export\_async\_udc\_scheme\_name | UDC name                                       | _KBIntExamples2_                       |
| ----------------------------------------- | ---------------------------------------------- | -------------------------------------- |
| pepperi\_export\_async\_fields            | UDC fields: Key, all mandatory fields          | _Key,customersTotal,salesRep_          |
| pepperi\_export\_async\_where             | condition by which records should be removed   | _Hidden='false' AND customersTotal<10_ |
| sub\_type\_id                             | UDC name                                       | _KBIntExamples2_                       |
| removecols                                | removing all colunms except for Hidden and Key | _customersTotal,salesRep_              |
{% endtab %}

{% tab title="Mapping" %}
Hidden: 'true'

<div align="left"><figure><img src="../../.gitbook/assets/image (871).png" alt="" width="460"><figcaption></figcaption></figure></div>
{% endtab %}
{% endtabs %}

* Dataflow task example:&#x20;
  * Remove records - UDC KBIntExamples2: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92306](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92306)

#### Update lines:

* Dataflow task configuration:

{% tabs %}
{% tab title="Details" %}
- Application: Generic Cloud Internal Connector
- Source Object: Pepperi User Defined Collections Data Async
- Target Object: Pepperi Export User Defined Collections Data
{% endtab %}

{% tab title="Settings" %}
| pepperi\_export\_async\_udc\_scheme\_name | UDC name                                       | _KBIntExamples2_          |
| ----------------------------------------- | ---------------------------------------------- | ------------------------- |
| pepperi\_export\_async\_fields            | UDC fields: Key, all mandatory fields          | _Key,salesRep_            |
| pepperi\_export\_async\_where             | condition by which records should be removed   | _customersTotal=10_       |
| sub\_type\_id                             | UDC name                                       | _KBIntExamples2_          |
| removecols                                | removing all colunms except for Hidden and Key | _customersTotal,salesRep_ |
{% endtab %}

{% tab title="Mapping" %}
Fields you'd like to update

<div align="left"><figure><img src="../../.gitbook/assets/image (1029).png" alt=""><figcaption></figcaption></figure></div>
{% endtab %}
{% endtabs %}

* Dataflow task example:&#x20;
  * Update records - UDC KBIntExamples2: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92311](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92311)

#### Get lines:

* Dataflow task configuration:

{% tabs %}
{% tab title="Details" %}
- Application: Generic Cloud Internal Connector
- Source Object: Pepperi User Defined Collections Data Async
{% endtab %}

{% tab title="Settings" %}
| pepperi\_export\_async\_where             | _exporting condition_ | Hidden='false' |
| ----------------------------------------- | --------------------- | -------------- |
| pepperi\_export\_async\_fields            | _UDC fields_          | Key,Hidden     |
| pepperi\_export\_async\_udc\_scheme\_name | _UDC name_            | UDCforKBint    |
{% endtab %}
{% endtabs %}

* Dataflow task example:&#x20;
  * Get UDC KBIntExamples: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92285](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92285)

***

### Rebuild Index

When a new indexed field is created, you won't see data from this field in other Pepperi modules. For this purpose, the Rebuild Index exists. To Rebuild Index:

<table data-view="cards"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td>1) Select UDC: </td><td><img src="../../.gitbook/assets/image (948).png" alt="" data-size="original"></td><td></td></tr><tr><td>2) Select "Rebuild Index":</td><td><img src="../../.gitbook/assets/image (949).png" alt="" data-size="original"></td><td></td></tr></tbody></table>

{% hint style="warning" %}
Running a rebuild will prevent all users from using this UDC until the process ends. This can take up to several minutes.
{% endhint %}

{% hint style="danger" %}
It is not recommended to run Rebuild Index for UDC which contains more than 100k records. In such a case, contact RnD.
{% endhint %}

***

### UDC Scheme

URL: [https://papi.pepperi.com/v1.0/user\_defined\_collections/schemes](https://papi.pepperi.com/v1.0/user_defined_collections/schemes)

Authorization: Bearer Token

<details>

<summary>GET</summary>

Response example:

```json
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



</details>

<details>

<summary>POST</summary>

Body example:

```json
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

</details>

***

### API

_Allows adding/editing one record per request._

URL: [https://papi.pepperi.com/v1.0/user\_defined\_collections/](https://papi.pepperi.com/v1.0/user_defined_collections/UDCforKBint)\[sub\_type\_id]

<details>

<summary>GET</summary>

Response example:

```json
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

</details>

<details>

<summary>POST</summary>

Body example:

```json
{
        "ModificationDateTime": "2024-07-09T12:15:12.163Z",
        "Hidden": false,
        "CreationDateTime": "2024-06-25T15:28:49.333Z",
        "customersTotal": 12,
        "salesRep": "ecef500a-4dae-48e3-8c69-e216d4406cbd",
        "Key": "ecef500a-4dae-48e3-8c69-e216d4406cbd"
    }
```

</details>

***

### Data Retention

Data Retention by UDC is now available in Data Retention section in Backoffice:<br>

<figure><img src="../../.gitbook/assets/image (1262).png" alt=""><figcaption></figcaption></figure>

* Click Add +
* Select the UDC and max data retention mohths

<div align="left" data-full-width="false"><figure><img src="../../.gitbook/assets/image (1263).png" alt="" width="152"><figcaption></figcaption></figure></div>

* Click Add

***

### Possible errors

#### Creating mandatory fields for the UDC that already contains data.

_When data is added to UDC you still can create new fields. However, if you create a "mandatory" field and try to access data, the following error can occur:_&#x20;

<div align="left"><figure><img src="../../.gitbook/assets/image (1075).png" alt=""><figcaption></figcaption></figure></div>

<table data-view="cards"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td><mark style="color:red;"><strong>Cause</strong></mark></td><td>old records do not have values in the new "mandatory" field.</td><td></td></tr><tr><td><mark style="color:green;"><strong>Prevention</strong></mark></td><td><ul><li>plan UDC thoroughly and create all needed fields before adding data;</li><li>before adding new "mandatory" field, remove all the data.</li></ul></td><td></td></tr><tr><td><mark style="color:purple;"><strong>How to fix</strong></mark></td><td>1) Use <a data-mention href="user-defined-collections-udc.md#udc-scheme">#udc-scheme</a> to update the fields that caused the issue: </td><td><pre class="language-json"><code class="lang-json"><strong>"Indexed": false,
</strong>"Mandatory": false
</code></pre><p>2) Go to UDC and remove these fields.</p></td></tr></tbody></table>

***

#### Killed runtime

_Export UDC can take 5min max which is enough to export about 80-100k records. Otherwise, the export could fail with a "killed runtime" error._

{% code overflow="wrap" %}
```
Export File finished with "Failure" status! Error Message: Error: Runtime exited with error: signal: killedRuntime.ExitError
```
{% endcode %}

<table data-view="cards"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td><mark style="color:red;"><strong>Cause</strong></mark></td><td>UDC contains a great amount of data which takes to much time to be exported.</td><td></td></tr><tr><td><mark style="color:purple;"><strong>How to fix - 1</strong></mark> </td><td>Export only neccesary fields:</td><td><ul><li><em>pepperi_export_async_fields: Key,salesRep</em></li></ul></td></tr><tr><td><mark style="color:purple;"><strong>How to fix - 2</strong></mark></td><td>Filter out unnecessary data:</td><td><ul><li><em>pepperi_export_async_where: userRef='xxx-xxx-xxx'</em></li></ul></td></tr></tbody></table>

***

**Errors in the Dataflow task while getting data from UDC**

* _<mark style="color:red;">Failed due to exception: Missing FieldID when trying to parse queryString</mark>_: check if fields listed in pepperi\_export\_async\_fields are indexed in the UDC
