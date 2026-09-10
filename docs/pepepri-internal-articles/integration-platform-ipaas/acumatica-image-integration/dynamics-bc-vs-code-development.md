---
title: "Dynamics BC - VS Code development"
description: "This article contains overview of data objects in Dynamics BC and initial steps for their configuration"
order: 115
---
# Dynamics BC - VS Code development

*This article contains overview of data objects in Dynamics BC and initial steps for their configuration*

### Data Object Basics

In Dynamics 365 Business Central, data objects are the building blocks used to define and manage data and functionality within the system. Here are some of the primary data objects:

#### Table

-   **Tables**: Core objects that store data. Each table represents a database table where fields (columns) store data entries (rows).
-   **Table Extensions**: Allow customization of existing tables without modifying the original table definition.

#### Page

-   **Pages**: User interface objects used to display and interact with data. Types include List, Card, Worksheet, and Document pages.
-   **Page Extensions**: Allow customization of existing pages to add new fields or actions without changing the original page definition.

#### Report

-   **Reports**: Objects used to format and print data. Reports can be used for documents (like invoices), lists, or detailed data analysis.
-   **Report Extensions**: Allow customization of existing reports to change layouts or add new data without modifying the original report.

#### Codeunit

-   **Codeunits**: Containers for AL code that execute business logic. They can contain functions that are called from other objects like pages, reports, or other codeunits.

#### Query

-   **Queries**: Objects used to retrieve and aggregate data from multiple tables. Useful for creating complex data sets for reports, pages, or external applications.

Every data object has its own `id` and `name`. Both values are required when defining new data object; `id` value is unique inside of specific environment and should be in range, that is set in `app.json` file:

```
// ...
"idRanges": [
  {
    "from": 50100,
    "to": 50149
  }
],
// ...
```

### Query Development

Query is the most used data object for obtaining data from Dynamics BC. Let's take a look at some examples of basic configuration.

#### Simple query

Here is a simple query to get Customer ID (**"No."**) and Customer Name (**"Name"**) from **Customer** table:

```
query 50100 "Customers Info List"
{
    QueryType = Normal;
    Access = Public;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.") { }
            column(Name; Name) { }
        }
    }
}
```

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-541.png)

#### Data join

It is also possible to configure *data join* inside of a query. Here is a query to get Item ID (**"No."**), Item Name (**"Description"**) from **Item** table and Category Description ("**Description"**) from **Item Category** table with joining by Item Category Code. `DataItemLink` is used to link data by keys and `SqlJoinType` defines the type of join (check available values [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-sqljointype-property))

```
query 50101 "Item Info List"
{
    QueryType = Normal;
    Access = Public;

    elements
    {
        dataitem(Item; Item)
        {
            column(No_; "No.") { }
            column(Description; Description) { }
            dataitem(Item_Category; "Item Category")
            {
                DataItemLink = "Code" = Item."Item Category Code";
                SqlJoinType = InnerJoin;

                column(Category_Description; Description) { }
            }
        }
    }
}
```

The example above is commonly used, as **Item** table contains only **Item Category Code** value. And if you need more information about category - you should use data join.

#### Data filtering and aggregate functions

We can also use *filtering* inside of a query. Filtering rules can be defined in `DataItemTableFilter` property. The example below takes records with non-empty **"Item No."** and the **"Location Code"** equal to "MAIN".

Moreover, *aggregate functions* are available with `Method` property (check the full list of them [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-query-totals-grouping))

```
query 50102 "Item Location QTY"
{
    QueryType = Normal;
    Access = Public;

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = "Item No." = filter(<>''), "Location Code" = const('MAIN');
            column(Item_No_;"Item No.") {}
            column(Location_Code; "Location Code") {}
            column(Quantity; Quantity) {
                Method = Sum;
            }
        }
    }
}
```

See more information about query development [here](https://learn.microsoft.com/en-us/training/modules/work-with-queries/?source=recommendations).

### Table Extension Development

Often during the development process there is a need to extend a default table with custom columns. Here is an example of *tablextenstion* that extends **Item** table. As a result, we won't create a new table, but get an additional column in the default Item table.

```
tableextension 50100 Item extends Item
{
  fields
  {
    field(50100; SpecialNote; Text[100])
    {
      Caption = 'Special Note';
      DataClassification = CustomerContent;
    }
  }
}
```

Field must be defined with *id*, *name* and *type*. Click [here](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/library) to see all supported AL language data types. `Caption` property sets the string that is used to identify the field in user interface.

Here is a full list of supported values for `DataClassification` property:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-542.png)

If you're not sure which value to set for *DataClassification* you can use `DataClassification = ToBeClassified`. But in most cases `CustomerContent` is suitable.

See more information about table extension development [here](https://learn.microsoft.com/en-us/training/modules/extend-modify-existing-table/)

### Page Extension Development

Page extensions are used when you need to update default page with some fields. Here is an example of *pageextension* that extends **Item Card** page

```
pageextension 50100 "Item Card" extends "Item Card"
{
  layout
  {
    addafter(Type)
    {
      field(SpecialNote;Rec.SpecialNote)
      {
        ApplicationArea = All;
        Caption = 'Special Note';
        Description = 'Special note about the item';
        ToolTip = 'Specifies a short note about the item';
        Editable = true;
      }
    }
  }
}
```

When creating a page extension you can define the position of new element using keywords like *addafter*, *addbefore*, *addfirst*, *addlast*, *modify* etc.

See more information about page extension development [here](https://learn.microsoft.com/en-us/training/modules/extend-modify-existing-pages/)

### Deploying

Once you've finished with the configuration of some data object, in order to see changes in Dynamics BC, you need to deploy it. In VS Code, use the combination of `Ctrl + Shift + B` to compile your project and create a package. If it's successful - press `F5` to publish the package with debugging. Check VS Code debug console to make sure that there are no issues. Now your changes are available in Dynamics BC.

Let's take a look at the additional query configuration after deploying. As we are using GET-requests for accessing query data, we need to find its endpoint. Open Dynamics BC and search for Web Services. Click on **New**, select required **Object Type** and specify **Object ID**:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-543.png)

Then provide a **Service Name** and click on the checkbox **Published**. After page reloads **OData V4** link will be created - use it as an endpoint to get data from the query.
