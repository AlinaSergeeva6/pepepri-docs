---
title: "Dynamics BC - API development"
order: 114
---
# Dynamics BC - API development

### Overview

The Dynamics Business Central API is a web service that allows developers to interact programmatically with Microsoft Dynamics 365 Business Central. API enables the integration of Business Central functionalities with other applications and systems, facilitating operations such as retrieving, creating, updating, and deleting data within Business Central. API supports RESTful principles and uses standard HTTP methods and JSON formatting for data interchange.

APIs in Dynamics BC are categorised into two types: default and custom.

-   **Default APIs** are out-of-the-box solutions that provide basic interactive functionality. They are suitable for scenarios where custom fields and data objects are not required.
-   **Custom APIs** are created by developers to offer a high level of customisation. These APIs are ideal when the default APIs do not meet specific business requirements or when additional functionality is needed to satisfy customer needs.

### Default API

Here is a short instruction of building API-requests using default API. In order to retrieve data from the system you need to set request method (GET, POST, PATCH etc.) and authenticate using Auth 2.0 (see the detailed instruction [here](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/dynamic-bc/dynamic-bc-oauth-2.0-token-generation)).

!!!info
API examples, that are listed below, are for API v2.0 - the latest Dynamic BC API version. Anyway, some customers may still use v1.0, so don't forget to check it to avoid problems during the development process.
!!!

The basic principles of API building are the same for both versions. But some syntax can be different - you can find the full list of changes [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/transition-to-api-v2.0). To see the full description of default API, you can also check Microsoft official documentation for [API v.1.0](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v1.0/) and [API v2.0](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/).

-   Get list of all available **APIs** (replace `<environment_name>` with your Dynamics BC environment name):

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/
```

-   Get information about all available **companies**:

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies
```

!!!info
Every data object in Dynamics BC has its own identifier, which is 28-character unique string in "xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx"-format. When creating request to a definite data object specifying an identifier is a must.
!!!

When you send a request to get all companies, as a response you'll get:

response

```
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

!!!success
To get data about accounts, items or any other instances that are related to company, you should specify `<company_id>` in each request.
!!!

#### Accounts (Customers)

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/customers
```

\-- IPaaS configuration example -- [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83251](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83251)

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/customers(<customer_id>)
```

**Method:** POST

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/customers
```

Body

```
{
    "number" : "<customer_external_id>",
    "displayName" : "<customer_name>"
}
```

**Method:** PATCH

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/customers(<customer_id>)
```

Header

```
If-Match: *
```

Body

```
{
    "postalCode": "7000"
}
```

#### Items

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items
```

\-- IPaaS configuration example -- [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=82743](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=82743)

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)
```

**Method:** POST

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items
```

Body

```
{
    "number" : "<item_external_id>",
    "displayName" : "<item_name>"
}
```

**Method:** PATCH

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)
```

Header

```
If-Match: *
```

Body

```
{
    "displayName": "New Item Name"
}
```

#### Item Images

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)/picture
```

!!!info
Result is a basic information about item image like id, resolution and extension
!!!

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)/picture/pictureContent
```

In the latest Dynamics BC versions `<picture_id>` is required as well, so the request will be changed to:

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/items(<item_id>)/picture(<picture_id>)/content
```

!!!info
Result is the image in encoded format
!!!

\-- IPaaS configuration example -- Export Images Full: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90632](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90632) Export Images Delta: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=91339](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=91339)

#### Sales Orders

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders
```

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders(<sales_order_id>)
```

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders(<sales_order_id>)/salesOrderLines
```

**Method:** GET

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders?$expand=salesOrderLines
```

**Method:** POST

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders
```

Body

```
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

**Method:** PATCH

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders
```

Header

```
If-Match: *
```

Body

```
{
    "phoneNumber": "123456789"
}
```

!!!info
You can find more information about interacting with default API [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/api-reference/v2.0/).
!!!

### Custom API

Creating custom API is a process of extending the default API with additional fields and logic, getting a new API instance as a result. The downside of this is that we always need to keep it in sync with the standard API as released by Microsoft. But, because of the fact that APIs get breaking changes rarely, there is not a big risk involved.

To get the code of the standard APIs you'll need to clone the GitHub repository [https://github.com/microsoft/ALAppExtensions](https://github.com/microsoft/ALAppExtensions). It's recommended to create a separate VC Code project and load APIs there. The app with the standard APIs v2 is in the folder `Apps/W1/APIV2/app`. Navigate to `src/pages` and search for needed API code.

#### Sales Order Header API

Let's take a look on an example where we will create custom Sales Order API. The name of the API in this case is *APIV2SalesOrders.Page.al*. Copy the code to your project and do some initial changes (you'll need to perform this algorithm to any copied default API):

-   Change the **object ID** (to fit in your object range) and change the **object name** according to your naming conventions.
-   Add the **APIPublisher**, **APIGroup** and **APIVersion** properties.
-   Change **EntityCaption**, **EntitySetCaption**, **EntityName** and **EntitySetName** properties.

SalesOrderCustomAPI.al

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

It is important to change the namespace of the API from *Microsoft* to a custom value. Retaining the default namespace may result in conflicts or errors during deployment from the sandbox to the production environment. Custom namespaces ensure that the API is uniquely identified and avoid potential overlap with default system APIs:

SalesOrderCustomAPI.al

```
namespace Pepperi.API.V2;

// ...
```

Currently, you may have lots of errors in debug console. To fix them, navigate to your *app.json* file and add new dependency. Then perform `AL: Download symbols` command:

app.json

```
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

Our next aim is to add a custom field in the header and have possibility to interact with it via HTTP-requests. For Sales Order Header, we should add new fields to **"Sales Header"** and **"Sales Order Entity Buffer"** tables. So, let's create a new table extension, that will add a custom field **Additional Comment** to **"Sales Header"** table:

SalesHeaderTableExt.al

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

And then create another one to add **Additional Comment** to **"Sales Order Entity Buffer"** table:

SalesOrderEntityBufferTableExt.al

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

!!!info
The **Sales Header** table is the core table where sales document data (e.g., sales orders, quotes, invoices) is stored. The **Sales Order Entity Buffer** table acts as a staging area to temporarily store and process API data before writing it to the core **Sales Header** table.
!!!

Now get back to your **SalesOrderCustomAPI.al** file, scroll to the end of layout section and add newly created **AdditionalComment** field there:

SalesOrderCustomAPI.al

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

Examples of GET and POST requests:

**Method:** GET

URL

```
https://wiise.api.bc.dynamics.com/v2.0/<environment_name>/api/<api_publisher>/<api_group>/<api_version>/companies(<company_id>)/salesOrdersCustom
```

Response

```
{
    "id": "<sales_order_id>",
    "number": "<sales_order_number>",
    // ...
    "additionalComment": ""
},
// ...
```

**Method:** POST

URL

```
https://wiise.api.bc.dynamics.com/v2.0/<environment_name>/api/<api_publisher>/<api_group>/<api_version>/companies(<company_id>)/salesOrdersCustom
```

Body

```
{
    "customerNumber": "sales_order_customer_number",
    "additionalComment": "Test"
}
```

#### Sales Order Lines API

The process for handling Sales Order Lines is similar but involves different tables. To begin, copy the *APIV2SalesOrders.Page.al* file and modify the necessary properties at the beginning of the file to suit your requirements.

SalesOrderLinesCustomAPI.al

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

The scenario is the same: adding a custom field to **"Sales Line"** and **"Sales Invoice Line Aggregate"** tables. Let's add **Line Comment** field to **"Sales Line"** table:

SalesLineTableExt.al

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

And do the same process for **"Sales Invoice Line Aggregate"** table:

SalesInvoiceLineAggrTableExt.al

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

!!!info
**Sales Line** table stores the core data for individual sales lines (e.g., items, quantities, prices) tied to sales orders, quotes, or invoices. It ensures that detailed transaction data is recorded and validated within BC's business logic. **Sales Invoice Line Aggregate** table acts as a staging or aggregate table for processing and combining data from multiple sales lines. It is often used to prepare data for API interactions, such as consolidating or transforming it to fit external system requirements.
!!!

Now get back to your **SalesOrderLinesCustomAPI.al** file, scroll to the end of layout section and add newly created **LineComment** field there:

SalesOrderLinesCustomAPI.al

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

Examples of GET and POST requests:

**Method:** GET

URL

```
https://wiise.api.bc.dynamics.com/v2.0/<environment_name>/api/<api_publisher>/<api_group>/<api_version>/companies(<company_id>)/salesOrdersCustom(<sales_order_id>)?$expand=salesOrderLinesCustom
```

Response

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

**Method:** POST

URL

```
https://wiise.api.bc.dynamics.com/v2.0/<environment_name>/api/<api_publisher>/<api_group>/<api_version>/companies(<company_id>)/salesOrdersCustom
```

Body

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
