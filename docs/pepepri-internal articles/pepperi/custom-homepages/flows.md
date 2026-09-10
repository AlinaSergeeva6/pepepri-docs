---
title: "Flows"
description: "This article contains basic information about flows and overview of logic blocks"
order: 276
---
# Flows

*This article contains basic information about flows and overview of logic blocks*

## General Info

Flow is a list of successive actions which will be performed in defined moment of time. Actions are defined by Logic Blocks that are used inside a flow.

Flows have to be assigned to events, and when event is fired, flow will run and execute defined actions, for example navigate user to an order or run a custom script.

!!!info
Currently, flows can be used in pages and transactions (activities are not supported)
!!!

### Creating a flow

To create a flow, you need:

1.  To have installed “Flows” and “Logic Blocks” addons.
2.  Open Settings -> Configuration -> Flows
3.  Click “Add” to create a new flow, or open one of the existing flows.
4.  In “General” tab you can configure its name and description (we had some bugs if it has no description).
5.  In “Parameters” tab you can define parameters of the flow. This provides a flow with ‘context’ regarding its execution. For example, you can pass id of an account, for which order has to be created, or a slug name to redirect a user.
6.  In “Steps” tab you can define logic blocks (by drag and drop) to be executed. Block actions are executed one after another (not in parallel), from top to bottom.
7.  After finishing the work with a flow, don’t forget to click “Update”. Now you can test your updates (if possible) by selecting relevant flow and in “Edit” menu clicking “Test”.

!!!warning
## Important!

Don’t forget to **publish** the **flow**, otherwise your changes won’t take effect
!!!

!!!warning
### Important!

After creating a new user who should have access to existing flows, you **must republish** those flows.

Otherwise the new user will not see the flows and you will get an error in the logs.
!!!

![](/static/Screenshot-2025-02-14-at-17.50.25.png)

Edit menu of a flow

### Flow variables

#### Variable types

Each flow variable must have a type. Type is usually set when creating a parameter, however you can change it later (not recommended). Currently, next types are available:

-   String
-   Bool
-   Integer
-   Double
-   Object – special type to store data. There is a structure that can be applied to this type of parameter, you can use it if you know that you will store a specific resource type in there, for example, account. Otherwise, leave the structure with “Any”.

#### Variable Accessibility

The Variable Accessibility feature enables you to classify variables as either external or internal, defining their intended usage within the flow. When marked as external, a parameter is accessible by external components using the flow picker. When marked as internal, parameter is hidden from external entities, though available during the flow run time.

Use “internal” type when you just want to store some intermediate results.

## Flows with pages

### General overview

Flows are widely used while creating a page. A flow can populate page parameters when page is opened or open an order when buyer clicks on some banner etc.

There are 2 main events, a flow can be assigned to:

-   **On load** – when a page (or page block) is loaded. This is useful for setting page parameters. Event is fired when a page begins to load but not visible for user yet.
-   **On parameter change** – when page parameter is changed. In most cases it will be AccountUUID parameter, which can be changed by Filter block dropdown. Event is fired when value of at least one page parameter is changed.

Flows take parameters on input, but they also can output values. This is done in one of 2 ways:

1.  By a script using “UserScriptsBlock” logic block:

![](/static/Screenshot-2025-02-11-at-14.28.27.png)

!!!info
In case of using scripts, you don‘t even have to create the corresponding parameter in the flow.
!!!

1.  With logic blocks that have “Save result in” part:

![](/static/Screenshot-2025-02-11-at-15.35.38.png)

!!!info
In order for it to work, parameters with exactly same name should be created in ”Manage parameters” page section.
!!!

![](/static/Screenshot-2025-02-11-at-15.40.23.png)

Parameters output can be useful when you use “**Show if**” logic on blocks that support it (Gallery, Slideshow, Banners, Buttons, Filter). For example, you want to hide some specific slides based on certain condition, and show show the slide when AccountTSAXXX = "Test". To achieve that, you need:

-   Create On Load flow for the page.
    -   Flow parameters:
        -   accountUUID – string
        -   searchResult – object (“accounts” or “any” type)
        -   XXX – name of parameter which you want to set (in the page parameters it should be exactly same name)

    -   Use “Search Data” and “Extract Value” blocks to get the required data

-   Assign the flow to **On Load** and **On parameter change** page events
-   In the block that supports “Show if”, you can now use your new parameter to filter sub-blocks

### Dynamic badges and buttons text

You can now easily use flows to set dynamic values in some page elements. Currently supported are Buttons (button text and button badge) and Banners (1st and 2nd titles)

To achieve this, you need:

1.  Create a new flow
    1.  Flow needs to have at least one parameter - the one you will set the value with
    2.  In this flow, you need to get required value (e.g. using Search Data, Extract Value and Build Text blocks) and output final value to a flow parameter

2.  Assign the flow to On Load and On Change events of the page blocks that supports it
    1.  Provide you parameter, which holds final value, with one of the dynamic options available. When using buttons it is text and badge text, when banners - 1st and 2nd title.
    2.  In the dropdown, dynamic options are available, each of them consists of dynamic sub-element type and element uuid, e.g. 1st Title\_2694170d-1f2a-4f5c-968d-d27166dd8307

![](/static/Screenshot-2025-02-24-at-12.31.52.png)

Example of dynamic badge that shows AccountName:

![](/static/Screenshot-2025-02-24-at-13.49.31.png)

### Best practices of using flows with pages

1.  Flows provide a variety of ways to implement required logic. Every feature that is provided by Logic Blocks can be replaced with a custom script inside of “UserScriptsBlock” logic block. However, try to avoid using scripts as much as possible, this will improve readability and facilitate maintenance in future.
2.  Try to store only common values as page parameters. Do not overflow the page parameters with lots of params that are used only for other blocks. If you need to get QuantitiesTotal of latest created transaction for banners – get the value inside of a dedicated flow for this banners block.

## Flows in transactions

Flows can be used to do some calculations in transactions. Activities do not support flows.

There are 3 events, a flow can be assigned to:

-   **Transaction Loaded** – when transaction is loaded, but view is not rendered yet. It runs after catalog filters are done and calculated fields execution is finished. Available dynamic parameters:
    -   TransactionUUID - string. Current transaction UUID.
    -   IsTransactionEditable - boolean. Scripts are running even on submitted transaction. With help of this param, you can identify whether you need to run script’s main logic.

-   **Transaction Field Changed** – runs when selected transaction header field has changed its value. Available dynamic parameters:
    -   TransactionUUID – string
    -   IsTransactionEditable - boolean
    -   FieldID – string. APIname of the field that has changed.
    -   NewValue – string. Updated value.
    -   OldValue – string. Old value which was stored in field before the change.

-   **Transaction Line Field Changed** \- runs when selected transaction line field has changed its value. Available dynamic parameters:
    -   TransactionLineUUID – string. UUID of transaction line that was changed
    -   TransactionUUID – string
    -   IsTransactionEditable - boolean
    -   FieldID – string.
    -   NewValue – string.
    -   OldValue – string.

!!!warning
Events based on field change are fired only when changing field value manually in UI.
!!!

### Assigning flows to transaction

1.  Make sure you have installed “ATD Events” addon
2.  Go to Settings -> Sales Activities -> Transaction Types
3.  Edit the transaction you want to use flows with
4.  Open “Events” tab. You may also see “Events (deprecated)” tab, it had similar purpose to the “Events” tab, but there was direct assignment of scripts to events (instead of flows).

![](/static/Screenshot-2025-02-18-at-16.13.42.png)

1.  Click “Add” and select event type and field (if event is based on field change)
2.  Select relevant flow and populate parameters
3.  Save the event handler

!!!danger
### Important!

Always **save** events after editing them.

Clicking **Cancel** does **not** discard changes — it triggers the saving of the event **with empty / cleared parameters**, which will cause **errors** during transaction processing.
!!!

### How to build a flow for transaction

Most probably you will use scripts with custom logic. More details on how to build a script is described in the article

[![Logo](/static/image) Scripts - How to Write | Internal Knowledge Basekbint.pepperi.com](https://kbint.pepperi.com/pepperi/pepperi-configuration-general/scripts/scripts-how-to-write)

If your transaction is using PPM Pricing addon, in the available Logic Blocks you will find “Calculate price” block which is also has to be used for transaction flow. However, more on this you can read in dedicated article for PPM Pricing

[![Logo](/static/image) Pricing Module (PPM) Add-on | Internal Knowledge Basekbint.pepperi.com](https://kbint.pepperi.com/article-drafts/pricing-module-ppm-add-on)

![](/static/Screenshot-2025-02-12-at-18.42.15.png)

In general, your **On Load** transaction flow may look like this:

![](/static/Screenshot-2025-02-12-at-18.50.20.png)

Parameters: transactionUUID – string.

## Logic Blocks overview and usage

This list may be updated in the future, as new logic blocks are being developed by RnD.

**Flows library**

You can import commonly used flows from the flows library. You need to click burger menu -> Import from library -> select and import flows you need.

![](/static/Screenshot-2025-02-14-at-10.13.26.png)

### Active Transaction

This block is basically doing a search on transactions with provided parameters to find the latest open transaction.

!!!warning
If it didn’t find the transaction, new one will NOT be created automatically.
!!!

![](/static/Screenshot-2025-02-12-at-19.10.54.png)

All the input parameters can be whether dynamic or you can select them manually (e.g. transaction type or status list), but it is better to make them dynamic. You can define default values to the flow parameters, so you will not need to specify commonly used values.

!!!warning
If you want to make “Status” dynamic, please provide it with correct values. It has to be Status IDs separated by commas or semicolons, e.g. 1,4 (InCreation, OnHold) or 1;4;16 (InCreation, OnHold, InPlanning).
!!!

This block is better to use in pair with **Create Transaction** block. You should place the “Create Transaction” after “Active transaction” block. “Create Transaction” block should be disabled when your transaction id param (transactionUUID) is not empty, so it will run only when no transaction was found.

![](/static/Screenshot-2025-02-18-at-16.34.26.png)

### Build Text

The block is used to build text string with ability to use dynamic parameters values.

In the Input text you need to write a template with dynamic values inside of curly braces. You can add as many dynamic params as you need, e.g. `Account {accountName} has {currencySymbol} {openDebt} of open debts`

![](/static/Screenshot-2025-02-19-at-19.50.19.png)

This block is especially useful when you need to insert some dynamic text into buttons or banners.

### Calculate price

The “Calculate price” becomes available to use after installing Pricing addon. It is used to trigger pricing calculations by addon. The block must be used only in flows that are going to be used in transactions.

Currently, there are 3 available options to calculate pricing for:

-   **Order center and cart** – runs pricing calculations for scope and cart items. It is recommended to be used in transaction On Load flow.
-   **All cart items** – runs pricing only for cart items. May be useful when you want to recalculate pricing for cart items before submitting the order (as there is probably no need to calculate pricing for scope items in this scenario). How to trigger an event from workflow before submit is described in this [article](https://kbint.pepperi.com/pepperi/pepperi-configuration-general/scripts/scripts-how-to-write#how-to-trigger-scripts-from-workflow) (it is applicable for flows also).
-   **Current item** – runs pricing calculations only for item that was somehow changed. It has to be used only in “Transaction Line Field Changed“ event.

![](/static/Screenshot-2025-02-18-at-16.37.18.png)

!!!info
You don’t have to provide transactionUUID or transactionLineUUID as parameters for this block, it is resolved automatically.
!!!

### Create Activity

This logic block is creating a new activity for specified account.

![](/static/Screenshot-2025-02-13-at-10.45.42.png)

!!!warning
There is no logic block like “Active Activity”, so you cannot find an existing one. However, you can configure “Validate History” in activity workflow instead.
!!!

### Create Survey

This logic block is designed to create a survey for the provided template. To use it, your environment needs to have surveys installed. More on how to install and use you can read in the [article](https://kbint.pepperi.com/services-demo-environment/features/surveys-feature)

![](/static/Screenshot-2025-02-13-at-10.50.23.png)

!!!warning
The block just creates a record in MySurveys UDC for specified template. To open the survey, you have to use “Navigate To” block and redirect user to the survey.
!!!

### Create Transaction

This block creates a new transaction for specified account and catalog.

![](/static/Screenshot-2025-02-13-at-10.58.35.png)

!!!info
Even if the block has created a new transaction and user is navigated to it, workflow of the transaction is still working. And if you have a “Validate History” action in between New->In Creation, it may still redirect user to an existing transaction.
!!!

### Extract Value

This logic block is used to get (or aggregate) the value from parameters of “object” type.

This block is often used after “Search Data” block.

Aggregation Type – currently only 2 options are available “sum” and “count”. Leave it empty if you don’t need the aggregation.

!!!info
“sum” aggregation type is supported only for number type fields. Saving output for both types is available only into ‘Integer’ or ‘Double’ type params. “Count” is just counting number of records in the object.
!!!

![](/static/Screenshot-2025-02-13-at-11.01.21.png)

**Usage:** for example, you need to get some AccountTSAXXX of first available account. To implement this, you need to use “Search Data” block and save result of search into “object” type parameter. After it, you need to use an “Extract Value” block and there are 2 possible ways to get it:

1.  In case your parameter type of “object” has a structure of ‘accounts’, you can select the path type to be “Field”, and in the dropdown you need to select the field you want to get. It will retrieve the value from the first object in array.
2.  Or generic solution. In the path type select “Static” and input the next value: \[0\].TSAXXX in case you have an array of objects. Where \[0\] - is an index of first array element, and through dot ‘.’ you can access its properties.

### Filter – Get Values

This block is used to return dropdown values for “Filter” page block. We can either define options manually or they will be found by search. In case of search, we need to select resource to search in, key field and display field.

In case you need some complicated logic or complex titles, this block can be replaced with custom script which returns an array of options in next format: `[{ Key: string, Title: string }]`, e.g. `[{Key: “xxx-xxx-xxx”, Title: “Account test”}]`.

Eventually, your script should return an object like this: `{Options: [{Key: “123”, Title: “Option1”},{Key: “321”, Title: “Option2”}...]}`

![](/static/Screenshot-2025-02-13-at-12.52.09.png)

### Navigate To

This block is used for navigating user to selected view/page/list etc inside the Pepperi application. Currently, next navigation types are supported:

-   Account Dashboard - opens account dashboard - accounts/home\_page/{{UUID}}
-   Accounts – opens list with accounts - list/accounts
-   Activities
    -   All lists - list/all\_activities
    -   Single List – manually selected activity list. Note, that you cannot dynamically pass the list name.

-   Activity – navigates user to the activity by its UUID.
-   Back – just navigates user to the previous page
-   Contacts – opens list with contacts - list/contacts
-   Custom – any custom deeplink you can build. This is a universal option for navigation.
-   Home – navigate to homepage
-   Items – opens list with items - list/items
-   Slug – navigate user to the slug
-   Survey – open surveys page with survey by uuid.
-   Transaction – navigates user to transaction by UUID. There are several possible options of view which will be opened:
    -   Cart – opens order cart form - transactions/cart/{{UUID}}
    -   Header – opens order details form - transactions/details/{{UUID}}
    -   Item Details – opens item details form per specific item - transactions/item\_details/{{UUID}}/{ITEM\_UUID}}
    -   Matrix - opens matrix view for specific item - transactions/matrix/{{UUID}}/{ITEM\_UUID}}
    -   Order Center – opens order center view - transactions/scope\_items/{{UUID}}

-   Users – opens list with users - list/users

### Open external

The block is used for opening external links or applications that are associated with the links in the user’s operating system. The link will be opened in a new tab.

![](/static/Screenshot-2025-02-13-at-14.59.05.png)

### Rich Text – Find & Replace

The block is used to replace some static content with dynamic values in “Rich Text” page block.

It performs a global replacement, meaning it will find and replace all the occurrences.

To use it, you need to create a flow with at least 1 parameter of “object” type. Then you need to assign this flow to a “Rich Text” page block OnLoad flow and pass “configuration” object to your parameter.

For example, you have a static content inside of Rich Text block: `<h1> New title {dynamic}</h1>` and you want to replace ‘{dynamic}’ with something else, for example with ‘new text’. Here is an example on how to configure the block:

![](/static/Screenshot-2025-02-13-at-15.14.22.png)

!!!info
If you just add the block to the flow and try to save it, you will get an error, because it contains “&” in the block title, you need to remove this symbol. Block title must satisfy next pattern "^(\[Sa-zA-Z0-9-\_ \])\*$"
!!!

If you need to replace several static content patterns, just use a new block for each replacement.

### Search Data

The block allows to perform search on resources (accounts, users, items, UDCs etc.), transactions and activities.

Block allows retrieving multiple records (by search) or getting a single record (by get).

**Multiple Resource Querying**: Support for querying multiple resources (e.g., Transactions, Activities) within a single Logic Block.

![](/static/image-210.png)

**Dynamic Filtering**: Filters can be applied based on runtime flow parameters, enabling more flexible data retrieval.

![](/static/image-211.png)

**Resource Inclusion**: Search scope now includes Activities and Transactions.

![](/static/image-212.png)

Example of **Search Data Block Configuration**:

![](/static/Screenshot-2025-02-13-at-15.34.58.png)

!!!info
You can create as much search blocks as you need, they will be executed in parallel and won’t really harm performance.
!!!

![](/static/Screenshot-2025-02-13-at-15.36.56.png)

### Set Field Value

The block is used to update the field of a certain object (currently supported are transactions, activities and transactionLines).

The block is time consuming, so it is intended to be used only once in a flow. However, you can add as many updates inside this block as you need

Enhances automation by dynamically setting field values based on flow logic.

![](/static/Screenshot-2025-02-13-at-16.04.13.png)

### UserScriptsBlock

This block is used to run a custom script. You need to select the script itself and pass the required parameters. In order to better understand scripts, refer to this [article](https://kbint.pepperi.com/pepperi/pepperi-configuration-general/scripts).

---

### How to Add Flow to Flow Library

1.  Create Flow that you want to add to Flow library in your test environment
2.  Export JSON of this Flow

![](/static/Знімок-екрана-2025-02-26-о-18.22.14.png)

Edit menu of a Flow

1.  Log in to Pepperi as Eyal var: [eyal.w@pepperi.com](mailto:eyal.w@pepperi.com) ➡️ Pepperi Var
2.  Open Settings -> Configuration -> Flows
3.  Click “Add” to create a new flow.
4.  Add name and description to the Flow
5.  There are 2 types of Flows you can choose: Added by PS and Approved by R&D

-   Added by PS: visible for support users only – support\_user=true
-   Approved by R&D: visible for regular admin users

![](/static/Знімок-екрана-2025-02-26-о-18.31.56.png)

Flow Add View

1.  Import the previously exported JSON of a Flow
2.  Click Create

---

### How to Import Flow from Flow Library

1.  Open Settings -> Configuration -> Flows
2.  Click Menu button
3.  Choose Import from Library

    ![](/static/Знімок-екрана-2025-02-26-о-18.51.02.png)

4.  Choose the Flow you need and click Select

!!!warning
Don’t forget to publish the flow, otherwise your changes won’t take effect
!!!

![](/static/Screenshot-2025-02-14-at-17.50.25.png)

Edit menu of a flow

### Flow Publish Logs

-   **Publishing Requirement**:
    -   Flows must be published to apply changes; a description is required before publishing.

    ![](/static/image-213.png)

-   **Version History**:
    -   View all publishing history for a flow by selecting it and clicking "Version History."

    ![](/static/image-214.png)

-   **Rollback and Compare Changes**:
    -   Options to rollback to a previous version or compare changes between versions.

    ![](/static/image-215.png)

    -   Example: Compare Current Version vs. Selected Version.
    -   Timestamped entries (e.g., 04/17/2025 12:38 PM).
