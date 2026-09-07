---
description: >-
  This article contains basic information about flows and overview of logic
  blocks
---

# Flows

## General Info&#x20;

Flow is a list of successive actions which will be performed in defined moment of time. Actions are defined by Logic Blocks that are used inside a flow. &#x20;

Flows have to be assigned to events, and when event is fired, flow will run and execute defined actions, for example navigate user to an order or run a custom script. &#x20;

{% hint style="info" %}
Currently, flows can be used in pages and transactions (activities are not supported)
{% endhint %}

### Creating a flow

To create a flow, you need:

1. To have installed “Flows” and “Logic Blocks” addons.&#x20;
2. Open Settings -> Configuration -> Flows&#x20;
3. Click “Add” to create a new flow, or open one of the existing flows.&#x20;
4. In “General” tab you can configure its name and description (we had some bugs if it has no description).&#x20;
5. In “Parameters” tab you can define parameters of the flow. This provides a flow with ‘context’ regarding its execution. For example, you can pass id of an account, for which order has to be created, or a slug name to redirect a user. &#x20;
6. In “Steps” tab you can define logic blocks (by drag and drop) to be executed. Block actions are executed one after another (not in parallel), from top to bottom.&#x20;
7. After finishing the work with a flow, don’t forget to click “Update”. Now you can test your updates (if possible) by selecting relevant flow and in “Edit” menu clicking “Test”.&#x20;

{% hint style="warning" %}
## Important!

Don’t forget to **publish** the **flow**, otherwise your changes won’t take effect
{% endhint %}

{% hint style="warning" %}
### Important!

After creating a new user who should have access to existing flows, you **must republish** those flows.

Otherwise the new user will not see the flows and you will get an error in the logs.
{% endhint %}

<figure><img src="../.gitbook/assets/Screenshot 2025-02-14 at 17.50.25.png" alt="" width="347"><figcaption><p>Edit menu of a flow</p></figcaption></figure>

### Flow variables

#### **Variable types**&#x20;

Each flow variable must have a type. Type is usually set when creating a parameter, however you can change it later (not recommended). Currently, next types are available:&#x20;

* String&#x20;
* Bool&#x20;
* Integer&#x20;
* Double&#x20;
* Object – special type to store data. There is a structure that can be applied to this type of parameter, you can use it if you know that you will store a specific resource type in there, for example, account. Otherwise, leave the structure with “Any”.  &#x20;

#### **Variable Accessibility**&#x20;

The Variable Accessibility feature enables you to classify variables as either external or internal, defining their intended usage within the flow. When marked as external, a parameter is accessible by external components using the flow picker. When marked as internal, parameter is hidden from external entities, though available during the flow run time. &#x20;

Use “internal” type when you just want to store some intermediate results.



## Flows with pages

### General overview

Flows are widely used while creating a page. A flow can populate page parameters when page is opened or open an order when buyer clicks on some banner etc.&#x20;

There are 2 main events, a flow can be assigned to:&#x20;

* **On load** – when a page (or page block) is loaded. This is useful for setting page parameters. Event is fired when a page begins to load but not visible for user yet.&#x20;
* **On parameter change** – when page parameter is changed. In most cases it will be AccountUUID parameter, which can be changed by Filter block dropdown. Event is fired when value of at least one page parameter is changed.&#x20;



Flows take parameters on input, but they also can output values. This is done in one of 2 ways:&#x20;

1. By a script using “UserScriptsBlock” logic block:

<figure><img src="../.gitbook/assets/Screenshot 2025-02-11 at 14.28.27.png" alt="" width="563"><figcaption></figcaption></figure>

{% hint style="info" %}
In case of using scripts, you don‘t even have to create the corresponding parameter in the flow.
{% endhint %}

2. With logic blocks that have “Save result in” part:

<figure><img src="../.gitbook/assets/Screenshot 2025-02-11 at 15.35.38.png" alt="" width="563"><figcaption></figcaption></figure>

{% hint style="info" %}
In order for it to work, parameters with exactly same name should be created in ”Manage parameters” page section.
{% endhint %}

<figure><img src="../.gitbook/assets/Screenshot 2025-02-11 at 15.40.23.png" alt="" width="563"><figcaption></figcaption></figure>

Parameters output can be useful when you use “**Show if**” logic on blocks that support it (Gallery, Slideshow, Banners, Buttons, Filter). For example, you want to hide some specific slides based on certain condition, and show show the slide when  <kbd>AccountTSAXXX = "Test"</kbd>. To achieve that, you need:

* Create On Load flow for the page. &#x20;
  * Flow parameters:&#x20;
    * accountUUID – string&#x20;
    * searchResult – object (“accounts” or “any” type)&#x20;
    * XXX – name of parameter which you want to set (in the page parameters it should be exactly same name)&#x20;
  * Use “Search Data” and “Extract Value” blocks to get the required data&#x20;
* Assign the flow to **On Load** and **On parameter change** page events &#x20;
* In the block that supports “Show if”, you can now use your new parameter to filter sub-blocks&#x20;

### Dynamic badges and buttons text

You can now easily use flows to set dynamic values in some page elements. Currently supported are Buttons (button text and button badge) and Banners (1st and 2nd titles)

To achieve this, you need:

1. Create a new flow
   1. Flow needs to have at least one parameter - the one you will set the value with
   2. In this flow, you need to get required value (e.g. using Search Data, Extract Value and Build Text blocks) and output final value to a flow parameter
2. Assign the flow to <kbd>On Load</kbd> and <kbd>On Change</kbd> events of the page blocks that supports it
   1. Provide you parameter, which holds final value, with one of the dynamic options available. When using buttons it is text and badge text, when banners - 1st and 2nd title.
   2. In the dropdown, dynamic options are available, each of them consists of dynamic sub-element type and element uuid, e.g. <kbd>1st Title\_2694170d-1f2a-4f5c-968d-d27166dd8307</kbd>

<figure><img src="../.gitbook/assets/Screenshot 2025-02-24 at 12.31.52.png" alt="" width="375"><figcaption></figcaption></figure>

Example of dynamic badge that shows AccountName:

<figure><img src="../.gitbook/assets/Screenshot 2025-02-24 at 13.49.31.png" alt="" width="369"><figcaption></figcaption></figure>

### Best practices of using flows with pages

1. Flows provide a variety of ways to implement required logic. Every feature that is provided by Logic Blocks can be replaced with a custom script inside of “UserScriptsBlock” logic block.  However, try to avoid using scripts as much as possible, this will improve readability and facilitate maintenance in future.&#x20;
2. Try to store only common values as page parameters. Do not overflow the page parameters with lots of params that are used only for other blocks. If you need to get QuantitiesTotal of latest created transaction for banners – get the value inside of a dedicated flow for this banners block.&#x20;



## Flows in transactions

Flows can be used to do some calculations in transactions. Activities do not support flows.

There are 3 events, a flow can be assigned to:

* **Transaction Loaded** – when transaction is loaded, but view is not rendered yet. It runs after catalog filters are done and calculated fields execution is finished. Available dynamic parameters:&#x20;
  * TransactionUUID - string. Current transaction UUID.&#x20;
  * IsTransactionEditable - boolean. Scripts are running even on submitted transaction. With help of this param, you can identify whether you need to run script’s main logic.&#x20;
* **Transaction Field Changed** – runs when selected transaction header field has changed its value. Available dynamic parameters:&#x20;
  * TransactionUUID – string&#x20;
  * IsTransactionEditable - boolean&#x20;
  * FieldID – string. APIname of the field that has changed.&#x20;
  * NewValue – string. Updated value.&#x20;
  * OldValue – string. Old value which was stored in field before the change.&#x20;
* **Transaction Line Field Changed** - runs when selected transaction line field has changed its value. Available dynamic parameters:&#x20;
  * TransactionLineUUID – string. UUID of transaction line that was changed&#x20;
  * TransactionUUID – string&#x20;
  * IsTransactionEditable - boolean&#x20;
  * FieldID – string.&#x20;
  * NewValue – string.&#x20;
  * OldValue – string.&#x20;

{% hint style="warning" %}
Events based on field change are fired only when changing field value manually in UI.
{% endhint %}

### Assigning flows to transaction

1. Make sure you have installed “ATD Events” addon&#x20;
2. Go to Settings -> Sales Activities -> Transaction Types&#x20;
3. Edit the transaction you want to use flows with&#x20;
4. Open “Events” tab. You may also see “Events (deprecated)” tab, it had similar purpose to the “Events” tab, but there was direct assignment of scripts to events (instead of flows).&#x20;

<figure><img src="../.gitbook/assets/Screenshot 2025-02-18 at 16.13.42.png" alt="" width="375"><figcaption></figcaption></figure>

5. Click “Add” and select event type and field (if event is based on field change)
6. Select relevant flow and populate parameters
7. Save the event handler

{% hint style="danger" %}
### Important!

Always **save** events after editing them.

Clicking **Cancel** does **not** discard changes — it triggers the saving of the event **with empty / cleared parameters**, which will cause **errors** during transaction processing.
{% endhint %}

### How to build a flow for transaction

Most probably you will use scripts with custom logic. More details on how to build a script is described in the article&#x20;

{% embed url="https://kbint.pepperi.com/pepperi/pepperi-configuration-general/scripts/scripts-how-to-write" %}

If your transaction is using PPM Pricing addon, in the available Logic Blocks you will find “Calculate price” block which is also has to be used for transaction flow. However, more on this you can read in dedicated article for PPM Pricing&#x20;

{% embed url="https://kbint.pepperi.com/article-drafts/pricing-module-ppm-add-on" %}

<figure><img src="../.gitbook/assets/Screenshot 2025-02-12 at 18.42.15.png" alt="" width="253"><figcaption></figcaption></figure>

In general, your **On Load** transaction flow may look like this:

<figure><img src="../.gitbook/assets/Screenshot 2025-02-12 at 18.50.20.png" alt="" width="375"><figcaption></figcaption></figure>

Parameters: transactionUUID – string.



## Logic Blocks overview and usage

This list may be updated in the future, as new logic blocks are being developed by RnD.

**Flows library**

You can import commonly used flows from the flows library. You need to click burger menu -> Import from library -> select and import flows you need.

<figure><img src="../.gitbook/assets/Screenshot 2025-02-14 at 10.13.26.png" alt="" width="350"><figcaption></figcaption></figure>

### Active Transaction

This block is basically doing a search on transactions with provided parameters to find the latest open transaction.

{% hint style="warning" %}
If it didn’t find the transaction, new one will NOT be created automatically.
{% endhint %}

<figure><img src="../.gitbook/assets/Screenshot 2025-02-12 at 19.10.54.png" alt="" width="375"><figcaption></figcaption></figure>

All the input parameters can be whether dynamic or you can select them manually (e.g. transaction type or status list), but it is better to make them dynamic. You can define default values to the flow parameters, so you will not need to specify commonly used values.

{% hint style="warning" %}
If you want to make “Status” dynamic, please provide it with correct values. It has to be Status IDs separated by commas or semicolons, e.g. <kbd>1,4</kbd> (InCreation, OnHold) or <kbd>1;4;16</kbd> (InCreation, OnHold, InPlanning).
{% endhint %}

This block is better to use in pair with **Create Transaction** block. You should place the “Create Transaction” after “Active transaction” block. “Create Transaction” block should be disabled when your transaction id param (transactionUUID) is not empty, so it will run only when no transaction was found.

<figure><img src="../.gitbook/assets/Screenshot 2025-02-18 at 16.34.26.png" alt="" width="375"><figcaption></figcaption></figure>

### Build Text

The block is used to build text string with ability to use dynamic parameters values.&#x20;

In the <kbd>Input text</kbd> you need to write a template with dynamic values inside of curly braces. You can add as many dynamic params as you need, e.g. `Account {accountName} has {currencySymbol} {openDebt} of open debts`

<figure><img src="../.gitbook/assets/Screenshot 2025-02-19 at 19.50.19.png" alt="" width="375"><figcaption></figcaption></figure>

This block is especially useful when you need to insert some dynamic text into buttons or banners.

### Calculate price

The “Calculate price” becomes available to use after installing Pricing addon. It is used to trigger pricing calculations by addon. The block must be used only in flows that are going to be used in transactions.

Currently, there are 3 available options to calculate pricing for:

* **Order center and cart** – runs pricing calculations for scope and cart items. It is recommended to be used in transaction On Load flow. &#x20;
* **All cart items** – runs pricing only for cart items. May be useful when you want to recalculate pricing for cart items before submitting the order (as there is probably no need to calculate pricing for scope items in this scenario). How to trigger an event from workflow before submit is described in this [article](https://kbint.pepperi.com/pepperi/pepperi-configuration-general/scripts/scripts-how-to-write#how-to-trigger-scripts-from-workflow) (it is applicable for flows also).&#x20;
* **Current item** – runs pricing calculations only for item that was somehow changed. It has to be used only in “Transaction Line Field Changed“ event.&#x20;

<figure><img src="../.gitbook/assets/Screenshot 2025-02-18 at 16.37.18.png" alt="" width="375"><figcaption></figcaption></figure>

{% hint style="info" %}
You don’t have to provide transactionUUID or transactionLineUUID as parameters for this block, it is resolved automatically.
{% endhint %}

### Create Activity

This logic block is creating a new activity for specified account.

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 10.45.42.png" alt="" width="375"><figcaption></figcaption></figure>

{% hint style="warning" %}
There is no logic block like “Active Activity”, so you cannot find an existing one. However, you can configure “Validate History” in activity workflow instead.
{% endhint %}

### Create Survey

This logic block is designed to create a survey for the provided template. To use it, your environment needs to have surveys installed. More on how to install and use you can read in the [article](https://kbint.pepperi.com/services-demo-environment/features/surveys-feature)

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 10.50.23.png" alt="" width="375"><figcaption></figcaption></figure>

{% hint style="warning" %}
The block just creates a record in MySurveys UDC for specified template. To open the survey, you have to use “Navigate To” block and redirect user to the survey.
{% endhint %}

### Create Transaction

This block creates a new transaction for specified account and catalog.

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 10.58.35.png" alt="" width="375"><figcaption></figcaption></figure>

{% hint style="info" %}
Even if the block has created a new transaction and user is navigated to it, workflow of the transaction is still working. And if you have a “Validate History” action in between New->In Creation, it may still redirect user to an existing transaction.
{% endhint %}

### Extract Value

This logic block is used to get (or aggregate) the value from parameters of “object” type.&#x20;

This block is often used after “Search Data” block. &#x20;

Aggregation Type – currently only 2 options are available “sum” and “count”. Leave it empty if you don’t need the aggregation.&#x20;

{% hint style="info" %}
“sum” aggregation type is supported only for number type fields. Saving output for both types is available only into ‘Integer’ or ‘Double’ type params. “Count” is just counting number of records in the object.
{% endhint %}

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 11.01.21.png" alt="" width="375"><figcaption></figcaption></figure>

**Usage:** for example, you need to get some <kbd>AccountTSAXXX</kbd> of first available account. To implement this, you need to use “Search Data” block and save result of search into “object” type parameter. After it, you need to use an “Extract Value” block and there are 2 possible ways to get it:

1. In case your parameter type of “object” has a structure of ‘accounts’, you can select the path type to be “Field”, and in the dropdown you need to select the field you want to get. It will retrieve the value from the first object in array.&#x20;
2. Or generic solution. In the path type select “Static” and input the next value: \[0].TSAXXX in case you have an array of objects. Where \[0] - is an index of first array element, and through dot ‘.’ you can access its properties.&#x20;

### Filter – Get Values

This block is used to return dropdown values for “Filter” page block. We can either define options manually or they will be found by search. In case of search, we need to select resource to search in, key field and display field. &#x20;

In case you need some complicated logic or complex titles, this block can be replaced with custom script which returns an array of options in next format: `[{ Key: string, Title: string }]`, e.g. `[{Key: “xxx-xxx-xxx”, Title: “Account test”}]`. &#x20;

Eventually, your script should return an object like this: `{Options: [{Key: “123”, Title: “Option1”},{Key: “321”, Title: “Option2”}...]}`&#x20;

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 12.52.09.png" alt="" width="375"><figcaption></figcaption></figure>

### Navigate To

This block is used for navigating user to selected view/page/list etc inside the Pepperi application. Currently, next navigation types are supported:

* Account Dashboard - opens account dashboard - <kbd>accounts/home\_page/\{{UUID\}}</kbd>
* Accounts – opens list with accounts - <kbd>list/accounts</kbd>
* Activities&#x20;
  * All lists - <kbd>list/all\_activities</kbd>
  * Single List – manually selected activity list. Note, that you cannot dynamically pass the list name.&#x20;
* Activity – navigates user to the activity by its UUID.&#x20;
* Back – just navigates user to the previous page&#x20;
* Contacts – opens list with contacts - <kbd>list/contacts</kbd>&#x20;
* Custom – any custom deeplink you can build. This is a universal option for navigation.&#x20;
* Home – navigate to homepage&#x20;
* Items – opens list with items - <kbd>list/items</kbd>&#x20;
* Slug – navigate user to the slug&#x20;
* Survey – open surveys page with survey by uuid. &#x20;
* Transaction – navigates user to transaction by UUID. There are several possible options of view which will be opened:&#x20;
  * Cart – opens order cart form - <kbd>transactions/cart/\{{UUID\}}</kbd>&#x20;
  * Header – opens order details form - <kbd>transactions/details/\{{UUID\}}</kbd>&#x20;
  * Item Details – opens item details form per specific item - <kbd>transactions/item\_details/\{{UUID\}}/{ITEM\_UUID\}}</kbd>&#x20;
  * Matrix - opens matrix view for specific item - <kbd>transactions/matrix/\{{UUID\}}/{ITEM\_UUID\}}</kbd>&#x20;
  * Order Center – opens order center view - <kbd>transactions/scope\_items/\{{UUID\}}</kbd>&#x20;
* Users – opens list with users - <kbd>list/users</kbd>&#x20;



### Open external

The block is used for opening external links or applications that are associated with the links in the user’s operating system. The link will be opened in a new tab.

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 14.59.05.png" alt="" width="375"><figcaption></figcaption></figure>

### Rich Text – Find & Replace

The block is used to replace some static content with dynamic values in “Rich Text” page block. &#x20;

It performs a global replacement, meaning it will find and replace all the occurrences.&#x20;

To use it, you need to create a flow with at least 1 parameter of “object” type. Then you need to assign this flow to a “Rich Text” page block OnLoad flow and pass “configuration” object to your parameter.&#x20;

For example, you have a static content inside of Rich Text block: `<h1> New title {dynamic}</h1>` and you want to replace ‘<kbd>{dynamic}</kbd>’ with something else, for example with ‘<kbd>new text</kbd>’. Here is an example on how to configure the block:&#x20;

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 15.14.22.png" alt="" width="375"><figcaption></figcaption></figure>

{% hint style="info" %}
If you just add the block to the flow and try to save it, you will get an error, because it contains “&” in the block title, you need to remove this symbol. Block title must satisfy next pattern "^(\[Sa-zA-Z0-9-\_ ])\*$"
{% endhint %}

If you need to replace several static content patterns, just use a new block for each replacement.

### Search Data

The block allows to perform search on resources (accounts, users, items, UDCs etc.), transactions and activities.&#x20;

Block allows retrieving multiple records (by search) or getting a single record (by get).

**Multiple Resource Querying**: Support for querying multiple resources (e.g., Transactions, Activities) within a single Logic Block.

<figure><img src="../.gitbook/assets/image (749).png" alt="" width="563"><figcaption></figcaption></figure>

**Dynamic Filtering**: Filters can be applied based on runtime flow parameters, enabling more flexible data retrieval.

<figure><img src="../.gitbook/assets/image (750).png" alt="" width="563"><figcaption></figcaption></figure>

**Resource Inclusion**: Search scope now includes Activities and Transactions.

<figure><img src="../.gitbook/assets/image (752).png" alt=""><figcaption></figcaption></figure>

Example of **Search Data Block Configuration**:&#x20;

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 15.34.58.png" alt="" width="375"><figcaption></figcaption></figure>

{% hint style="info" %}
You can create as much search blocks as you need, they will be executed in parallel and won’t really harm performance.
{% endhint %}

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 15.36.56.png" alt="" width="375"><figcaption></figcaption></figure>

### Set Field Value

The block is used to update the field of a certain object (currently supported are transactions, activities and transactionLines). &#x20;

The block is time consuming, so it is intended to be used only once in a flow. However, you can add as many updates inside this block as you need&#x20;

Enhances automation by dynamically setting field values based on flow logic.

<figure><img src="../.gitbook/assets/Screenshot 2025-02-13 at 16.04.13.png" alt="" width="375"><figcaption></figcaption></figure>

### UserScriptsBlock

This block is used to run a custom script. You need to select the script itself and pass the required parameters. In order to better understand scripts, refer to this [article](https://kbint.pepperi.com/pepperi/pepperi-configuration-general/scripts).

***

### How to Add Flow to Flow Library

1. Create Flow that you want to add to Flow library in your test environment
2. Export JSON of this Flow

<figure><img src="../.gitbook/assets/Знімок екрана 2025-02-26 о 18.22.14.png" alt="" width="132"><figcaption><p>Edit menu of a Flow</p></figcaption></figure>

3. Log in to Pepperi as Eyal var: [eyal.w@pepperi.com](mailto:eyal.w@pepperi.com) ➡️ Pepperi Var
4. Open Settings -> Configuration -> Flows&#x20;
5. Click “Add” to create a new flow.
6. Add name and description to the Flow
7. There are 2 types of Flows you can choose: Added by PS and Approved by R\&D

* Added by PS: visible for support users only – support\_user=true
* Approved by R\&D: visible for regular admin users

<figure><img src="../.gitbook/assets/Знімок екрана 2025-02-26 о 18.31.56.png" alt="" width="375"><figcaption><p>Flow Add View</p></figcaption></figure>

8. Import the previously exported JSON of a Flow
9. Click Create

***

### How to Import Flow from Flow Library

1. Open Settings -> Configuration -> Flows&#x20;
2. Click Menu button
3.  Choose Import from Library

    <figure><img src="../.gitbook/assets/Знімок екрана 2025-02-26 о 18.51.02.png" alt="" width="153"><figcaption></figcaption></figure>


4. Choose the Flow you need and click Select

{% hint style="warning" %}
Don’t forget to publish the flow, otherwise your changes won’t take effect
{% endhint %}

<figure><img src="../.gitbook/assets/Screenshot 2025-02-14 at 17.50.25.png" alt="" width="347"><figcaption><p>Edit menu of a flow</p></figcaption></figure>

### Flow Publish Logs

*   **Publishing Requirement**:

    * Flows must be published to apply changes; a description is required before publishing.

    <figure><img src="../.gitbook/assets/image (753).png" alt=""><figcaption></figcaption></figure>
*   **Version History**:

    * View all publishing history for a flow by selecting it and clicking "Version History."

    <figure><img src="../.gitbook/assets/image (754).png" alt=""><figcaption></figcaption></figure>
*   **Rollback and Compare Changes**:

    * Options to rollback to a previous version or compare changes between versions.

    <figure><img src="../.gitbook/assets/image (755).png" alt=""><figcaption></figcaption></figure>

    * Example: Compare Current Version vs. Selected Version.
    * Timestamped entries (e.g., 04/17/2025 12:38 PM).
