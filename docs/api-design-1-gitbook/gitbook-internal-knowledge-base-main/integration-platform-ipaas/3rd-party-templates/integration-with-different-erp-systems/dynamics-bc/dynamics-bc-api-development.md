# Dynamics BC - API development

### Overview

The Dynamics Business Central API is a web service that allows developers to interact programmatically with Microsoft Dynamics 365 Business Central. API enables the integration of Business Central functionalities with other applications and systems, facilitating operations such as retrieving, creating, updating, and deleting data within Business Central. API supports RESTful principles and uses standard HTTP methods and JSON formatting for data interchange.

APIs in Dynamics BC are categorised into two types: default and custom.

* **Default APIs** are out-of-the-box solutions that provide basic interactive functionality. They are suitable for scenarios where custom fields and data objects are not required.
* **Custom APIs** are created by developers to offer a high level of customisation. These APIs are ideal when the default APIs do not meet specific business requirements or when additional functionality is needed to satisfy customer needs.



### Default API

Here is a short instruction of building API-requests using default API. In order to retrieve data from the system you need to set request method (GET, POST, PATCH etc.) and authenticate using Auth 2.0 (see the detailed instruction [here](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/dynamic-bc/dynamic-bc-oauth-2.0-token-generation)).

{% hint style="info" %}
API examples, that are listed below, are for API v2.0 - the latest Dynamic BC API version. Anyway, some customers may still use v1.0, so don't forget to check it to avoid problems during the development process.
{% endhint %}

The basic principles of API building are the same for both versions. But some syntax can be different - you can find the full list of changes [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/transition-to-api-v2.0). To see the full description of default API, you can also check Microsoft official documentation for [API v.1.0](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v1.0/) and [API v2.0](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/).

* Get list of all available **APIs** (replace `<environment_name>` with your Dynamics BC environment name):

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/
```
{% endcode %}

* Get information about all available **companies**:

{% code title="URL" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies
```
{% endcode %}

{% hint style="info" %}
Every data object in Dynamics BC has its own identifier, which is 28-character unique string in "xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx"-format. When creating request to a definite data object specifying an identifier is a must.
{% endhint %}

When you send a request to get all companies, as a response you'll get:

{% code title="response" %}
```json
{
    "id": "72a94242-0875-ed11-81b5-000d3a21f346",
    "systemVersion": "23.1.13431.13890",
    "name": "CRONUS AU",
    "displayName": "",
    // ...
},
{
    "id": "86d7794b-0875-ed11-81b5-000d3a21f346",
    "systemVersion": "23.1.13431.13890",
    "name": "My Company",
    "displayName": "",
    // ...
}
```
{% endcode %}

{% hint style="success" %}
To get data about accounts, items or any other instances that are related to company, you should specify `<company_id>` in each request.&#x20;
{% endhint %}



#### Accounts (Customers)

{% tabs %}
{% tab title="Get Account List" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/customers
```
{% endcode %}

\-- IPaaS configuration example --\
[https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83251](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83251)
{% endtab %}

{% tab title="Get Account" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/customers(<customer_id>)
```
{% endcode %}
{% endtab %}

{% tab title="Create Account" %}
**Method:** POST

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/customers
```
{% endcode %}

{% code title="Body" %}
```json
{
    "number" : "<customer_external_id>",
    "displayName" : "<customer_name>"
}
```
{% endcode %}
{% endtab %}

{% tab title="Update Account" %}
**Method:** PATCH

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/customers(<customer_id>)
```
{% endcode %}

{% code title="Header" %}
```
If-Match: *
```
{% endcode %}

{% code title="Body" %}
```json
{
    "postalCode": "7000"
}
```
{% endcode %}
{% endtab %}
{% endtabs %}



#### Items

{% tabs %}
{% tab title="Get Items List" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items
```
{% endcode %}

\-- IPaaS configuration example --\
[https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=82743](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=82743)
{% endtab %}

{% tab title="Get Item" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)
```
{% endcode %}
{% endtab %}

{% tab title="Create Item" %}
**Method:** POST

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items
```
{% endcode %}

{% code title="Body" %}
```json
{
    "number" : "<item_external_id>",
    "displayName" : "<item_name>"
}
```
{% endcode %}
{% endtab %}

{% tab title="Update Item" %}
**Method:** PATCH

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)
```
{% endcode %}

{% code title="Header" %}
```
If-Match: *
```
{% endcode %}

{% code title="Body" %}
```json
{
    "displayName": "New Item Name"
}
```
{% endcode %}
{% endtab %}
{% endtabs %}



#### Item Images

{% tabs %}
{% tab title="Get Image Info" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)/picture
```
{% endcode %}

{% hint style="info" %}
Result is a basic information about item image like id, resolution and extension
{% endhint %}
{% endtab %}

{% tab title="Get Image" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)/picture/pictureContent
```
{% endcode %}

In the latest Dynamics BC versions `<picture_id>` is required as well, so the request will be changed to:

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)/picture(<picture_id>)/content
```
{% endcode %}

{% hint style="info" %}
Result is the image in encoded format
{% endhint %}
{% endtab %}
{% endtabs %}

\-- IPaaS configuration example --\
Export Images Full: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90632](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90632)\
Export Images Delta: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=91339](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=91339)



#### Sales Orders

{% tabs %}
{% tab title="Get SO List" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders
```
{% endcode %}
{% endtab %}

{% tab title="Get SO Header" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders(<sales_order_id>)
```
{% endcode %}
{% endtab %}

{% tab title="Get SO Lines" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders(<sales_order_id>)/salesOrderLines
```
{% endcode %}
{% endtab %}

{% tab title="Get SO" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders?$expand=salesOrderLines
```
{% endcode %}
{% endtab %}

{% tab title="Create SO" %}
**Method:** POST

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders
```
{% endcode %}

{% code title="Body" %}
```json
{
  // -- header fields
  "customerNumber": "<customer_external_id>",
  "salesOrderLinesCustom": [
    {
      // -- line fields
      "lineType": "Item",
      "lineObjectNumber": "<item_external_id>"
    }
  ]
}
```
{% endcode %}
{% endtab %}

{% tab title="Update SO" %}
**Method:** PATCH

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders
```
{% endcode %}

{% code title="Header" %}
```json
If-Match: *
```
{% endcode %}

{% code title="Body" %}
```json
{
    "phoneNumber": "123456789"
}
```
{% endcode %}
{% endtab %}
{% endtabs %}

{% hint style="info" %}
You can find more information about interacting with default API [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/).
{% endhint %}



### Custom API

Creating custom API is a process of extending the default API with additional fields and logic, getting a new API instance as a result. The downside of this is that we always need to keep it in sync with the standard API as released by Microsoft. But, because of the fact that APIs get breaking changes rarely, there is not a big risk involved.

To get the code of the standard APIs you'll need to clone the GitHub repository [https://github.com/microsoft/ALAppExtensions](https://github.com/microsoft/ALAppExtensions). It's recommended to create a separate VC Code project and load APIs there. The app with the standard APIs v2 is in the folder `Apps/W1/APIV2/app`. Navigate to `src/pages` and search for needed API code.

#### Sales Order Header API

Let's take a look on an example where we will create custom Sales Order API. The name of the API in this case is _APIV2SalesOrders.Page.al_. Copy the code to your project and do some initial changes (you'll need to perform this algorithm to any copied default API):

* Change the **object ID** (to fit in your object range) and change the **object name** according to your naming conventions.
* Add the **APIPublisher**, **APIGroup** and **APIVersion** properties.
* Change **EntityCaption**, **EntitySetCaption**, **EntityName** and **EntitySetName** properties.

{% code title="SalesOrderCustomAPI.al" overflow="wrap" %}
```
// ...
page 50100 "Sales Order Custom"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Sales Order Custom';
    EntitySetCaption = 'Sales Orders Custom';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'salesOrderCustom';
    EntitySetName = 'salesOrdersCustom';
    ODataKeyFields = Id;
    PageType = API;
    APIPublisher = 'pepperi';
    APIGroup = 'demo';
    SourceTable = "Sales Order Entity Buffer";
    Extensible = false;
    
// ...
```
{% endcode %}

It is important to change the namespace of the API from _Microsoft_ to a custom value. Retaining the default namespace may result in conflicts or errors during deployment from the sandbox to the production environment. Custom namespaces ensure that the API is uniquely identified and avoid potential overlap with default system APIs:

{% code title="SalesOrderCustomAPI.al" %}
```
namespace Pepperi.API.V2;

// ...
```
{% endcode %}



Currently, you may have lots of errors in debug console. To fix them, navigate to your _app.json_ file and add new dependency. Then perform `AL: Download symbols` command:

{% code title="app.json" %}
```json
// ...
"dependencies" : [
    {
        "id": "10cb69d9-bc8a-4d27-970a-9e110e9db2a5",
        "name": "_Exclude_APIV2_",
        "publisher": "Microsoft",
        "version": "21.0.0.0"
    }
]
// ...
```
{% endcode %}



Our next aim is to add a custom field in the header and have possibility to interact with it via HTTP-requests. For Sales Order Header, we should add new fields to **"Sales Header"** and **"Sales Order Entity Buffer"** tables. So, let's create a new table extension, that will add a custom field **Additional Comment** to **"Sales Header"** table:

{% code title="SalesHeaderTableExt.al" overflow="wrap" %}
```
tableextension 50100 SalesHeaderAPI extends "Sales Header"
{
    fields 
        {
            field(10001; AdditionalComment; Text[30])
                {
                      Caption = 'Additional Comment';
                }
        }
}
```
{% endcode %}

And then create another one to add **Additional Comment** to **"Sales Order Entity Buffer"** table:

{% code title="SalesOrderEntityBufferTableExt.al" overflow="wrap" %}
```
tableextension 50101 SalesOrderHeaderCustom extends "Sales Order Entity Buffer"
{
    fields 
        {
            field(10001; AdditionalComment; Text[30])
                {
                      Caption = 'Additional Comment';
                }
        }
}
```
{% endcode %}

{% hint style="info" %}
The **Sales Header** table is the core table where sales document data (e.g., sales orders, quotes, invoices) is stored. The **Sales Order Entity Buffer** table acts as a staging area to temporarily store and process API data before writing it to the core **Sales Header** table.&#x20;
{% endhint %}



Now get back to your **SalesOrderCustomAPI.al** file, scroll to the end of layout section and add newly created **AdditionalComment** field there:

{% code title="SalesOrderCustomAPI.al" overflow="wrap" %}
```
// ...
layout
{
    area(content)
    {
        repeater(Group)
        {
            // Lots of field definitions here ...
        
            field(additionalComment;Rec.AdditionalComment)
            {
                Caption = 'Additional Comment';
                trigger OnValidate()
                begin
                    RegisterFieldSet(Rec.FieldNo(Rec.AdditionalComment));
                end;
            }
        }
    }
}
// ...
```
{% endcode %}



Examples of GET and POST requests:

{% tabs %}
{% tab title="Get Custom SO" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://wiise.api.bc.dynamics.com/v2.0/<environment_name>/api/<api_publisher>/<api_group>/<api_version>/companies(<company_id>)/salesOrdersCustom
```
{% endcode %}



{% code title="Response" overflow="wrap" %}
```
{
    "id": "<sales_order_id>",
    "number": "<sales_order_number>",
    // ...
    "additionalComment": ""
},
// ...
```
{% endcode %}
{% endtab %}

{% tab title="Create Custom SO" %}
**Method:** POST

{% code title="URL" overflow="wrap" %}
```
https://wiise.api.bc.dynamics.com/v2.0/<environment_name>/api/<api_publisher>/<api_group>/<api_version>/companies(<company_id>)/salesOrdersCustom
```
{% endcode %}

{% code title="Body" %}
```
{
    "customerNumber": "sales_order_customer_number",
    "additionalComment": "Test"
}
```
{% endcode %}
{% endtab %}
{% endtabs %}



#### Sales Order Lines API

The process for handling Sales Order Lines is similar but involves different tables. To begin, copy the _APIV2SalesOrders.Page.al_ file and modify the necessary properties at the beginning of the file to suit your requirements.

{% code title="SalesOrderLinesCustomAPI.al" overflow="wrap" %}
```
// ...
page 50101 "Sales Order Lines Custom"
{
    DelayedInsert = true;
    APIVersion = 'v2.0';
    EntityCaption = 'Sales Order Line Custom';
    EntitySetCaption = 'Sales Order Lines Custom';
    PageType = API;
    APIPublisher = 'pepperi';
    APIGroup = 'demo';
    ODataKeyFields = SystemId;
    EntityName = 'salesOrderLineCustom';
    EntitySetName = 'salesOrderLinesCustom';
    SourceTable = "Sales Invoice Line Aggregate";
    SourceTableTemporary = true;
    Extensible = false;
// ...
```
{% endcode %}

The scenario is the same: adding a custom field to **"Sales Line"** and **"Sales Invoice Line Aggregate"** tables. Let's add **Line Comment** field to **"Sales Line"** table:

{% code title="SalesLineTableExt.al" overflow="wrap" %}
```
tableextension 50102 SalesLinesCustom extends "Sales Line"
{
    fields
    {
        field(50100; LineComment; Text[50])
        {
            Caption = 'Line Comment';
        }
    }
}
```
{% endcode %}

And do the same process for **"Sales Invoice Line Aggregate"** table:

{% code title="SalesInvoiceLineAggrTableExt.al" overflow="wrap" %}
```
tableextension 50103 SalesOrderLinesCustom extends "Sales Invoice Line Aggregate"
{
    fields
    {
        field(50100; LineComment; Text[50]
        {
            Caption = 'Line Comment';
        }
    }
}
```
{% endcode %}

{% hint style="info" %}
**Sales Line** table stores the core data for individual sales lines (e.g., items, quantities, prices) tied to sales orders, quotes, or invoices. It ensures that detailed transaction data is recorded and validated within BC's business logic. **Sales Invoice Line Aggregate** table acts as a staging or aggregate table for processing and combining data from multiple sales lines. It is often used to prepare data for API interactions, such as consolidating or transforming it to fit external system requirements.
{% endhint %}



Now get back to your **SalesOrderLinesCustomAPI.al** file, scroll to the end of layout section and add newly created **LineComment** field there:

{% code title="SalesOrderLinesCustomAPI.al" overflow="wrap" %}
```
// ..
layout
{
    area(content)
    {
        repeater(Group)
        {
            // Lots of field definitions here ...
        
            field(lineComment;Rec.LineComment)
            {
                Caption = 'Line Comment';
                trigger OnValidate()
                begin
                    RegisterFieldSet(Rec.FieldNo(Rec.LineComment));
                end;
            }
        }
    }
}
```
{% endcode %}



Examples of GET and POST requests:

{% tabs %}
{% tab title="Get Custom SO with Lines" %}
**Method:** GET

{% code title="URL" overflow="wrap" %}
```
https://wiise.api.bc.dynamics.com/v2.0/<environment_name>/api/<api_publisher>/<api_group>/<api_version>/companies(<company_id>)/salesOrdersCustom(<sales_order_id>)?$expand=salesOrderLinesCustom
```
{% endcode %}



{% code title="Response" overflow="wrap" %}
```
{
    "id": "<sales_order_id>",
    "number": "<sales_order_number>",
    // ...
    "additionalComment": "",
    "salesOrderLinesCustom": [
        {
            "id": "<sales_order_line_id>",
            "itemId": "<item_id>",
            // ...
            "lineComment": ""
        }
    ]
}
```
{% endcode %}
{% endtab %}

{% tab title="Create Custom SO with Lines" %}
**Method:** POST

{% code title="URL" overflow="wrap" %}
```
https://wiise.api.bc.dynamics.com/v2.0/<environment_name>/api/<api_publisher>/<api_group>/<api_version>/companies(<company_id>)/salesOrdersCustom
```
{% endcode %}

{% code title="Body" overflow="wrap" %}
```
{
    "customerNumber": "<customer_number>",
    "additionalComment": "<comment>",
    "salesOrderLinesCustom": [
    @@lines
        {
      	    "lineType": "Item",
            "lineObjectNumber": "<item_id>",
      	    "lineComment": "<line_comment>"
        }
    @@lines
    ]
}
```
{% endcode %}
{% endtab %}
{% endtabs %}
