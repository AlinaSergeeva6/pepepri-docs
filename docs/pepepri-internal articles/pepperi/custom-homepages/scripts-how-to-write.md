---
title: "Scripts - How to Write"
order: 279
---
# Scripts - How to Write

This article will guide you through the key aspects of script writing, including general rules, scripts for transactions and pages.

## Navigation:

1.  Scripts for Transactions

    Useful Functions

2.  Scripts for Pages
    1.  Filter resource view data
    2.  Page parameters
    3.  Flow for buttons and banners filtering

3.  How to trigger scripts from workflow

## General rules

1.  Each script MUST have the main function: `export async function main(data) {}`.
    1.  When you create a new script, this function is already present. Do not remove it.

2.  The main function MUST have a `return` statement.
3.  Most of the functions of Pepperi API are available in Scripts (except for `pepperi.app.getContext`).
4.  Pepperi API functions and script unique functions are async, therefore you need to use `await ().`
5.  Performance: Sometimes you need to get data from different sources, e.g. to get several UDTs or UDCs. In this case, use `Promise.all` to handle parallel promises execution.

---

## Scripts for Transactions

!!!danger
Activities do not support Scripts.
!!!

!!!warning
Unlike calculated fields, scripts are run every time the transaction is open even in cases when the transaction doesn't have available workflow transitions (e.g. in Submitted status).
!!!

### Create Script for Transactions

1) Create a script with `transactionUUID` (string) parameter;
2) **Install add-on Transaction Events** (UUID: 316afc44-af38-4354-ac4c-22011cb0ea84). After this, the new "Event" tab will be available in Transaction Type.
3) Go to Settings -> Sales Activities -> Transaction Types and select the transaction for which the Script will be created;
4) Open the "Events" tab:

![](/static/image-152.png)

5) Add new Event:

![](/static/image-153.png)

![](/static/image-154.png)

There are several options for when the Script will be run:

-   on transaction **load:**
    -   the Script will be run early on new transaction creation;
    -   the Script is run before the calculated fields;

-   on transaction **loaded**

!!!info
If you use the '**on load**' event, `transaction.transactionScope.getLines()` will return all items **before** catalog filters. This may affect the performance.

Using the '**on loaded**' will result in items **after** catalog filters.
!!!

-   onTransactionFieldChanged;
-   onTransactionLineFieldChanged;

6) Open the Event:

![](/static/image-155.png)

7) Add **UserScriptBlock** and click on Edit:

![](/static/image-156.png)

1.  Select the script from the dropdown;
2.  In parameters find `transactionUUID` parameter, set "Dynamic" and "TransactionUUID" from the drop-downs:

![](/static/image-157.png)

---

### Useful Functions

!!!info
To open documentation use **cmd** or **ctrl** \+ **LMB** on the function.

For additional information check [Scripts - VS Code](/pepperi/custom-homepages/scripts-vs-code.md) article.
!!!

#### Transaction Functions

1.  Transaction object

There is a special class called DataObject which exists in the scripts runtime.

```
// Get transaction from DataObject
const transaction = await pepperi.DataObject.Get('transactions', transactionUUID);
```

1.  Transaction header fields

-   Account fields:

```
// Using transaction.account
const accountUUID = transaction.account.uuid;
const accountExternalID = await transaction.account.getFieldValue('ExternalID');

// Using transaction.getFieldValue
const accountParentExID = await transaction.getFieldValue('Account.TSAParentExID');
```

-   Transaction fields:

```
// Standard fields
const creationTime = await transaction.getFieldValue('CreationDateTime');
const creatorExternalID = await transaction.getFieldValue('Creator.ExternalID');

// TSA fields
const accountParentExID = await transaction.getFieldValue('Account.TSAParentExID');
```

1.  Transaction line fields

-   getLines()

Allows to get scope items. To get item UUID or ExternalID you need to use **for** loop.

```
// Get transaction items field
const trLines = await transaction.transactionScope.getLines();

// Get item UUID
for (const scopeItem of trLines){
const itemUUID = scopeItem.item.uuid;
}
```

!!!warning
If you use '**on load**' event, getLines() function will return all items **before** catalog filters.

Using the '**on loaded**' will result in items **after** catalog filters.
!!!

-   setLines()

Used to set transaction scope items as an alternative to Settings -> Transaction Items Scope.

```
// Set transaction lines.
// Items that are not included in filteredScopeItems won't be in the transaction scope
await transaction.transactionScope?.setLines(filteredScopeItems);
```

!!!warning
There are rare cases when the 'setFieldValue' function does not save the value, so it is recommended to use **pepperi.app.transactions.update** and **pepperi.api.transactionScopeItems.update** functions.
!!!

#### Unique Functions

1.  As the script is run every time the transaction is open, to control whether the script should run you can use the following function:

```
async function isEditableTransaction(order: Transaction): Promise<boolean> {
    let isEditable = true;
    const transitions = await order.availableTransitions();
    if (transitions.length == 0) {
        const inTransition = await order.inTransition();
        isEditable = inTransition;
    }
    return isEditable;
}
```

#### Resource Functions

1.  Get resource by key.

-   resourceName: UDC name or standard resources like 'accounts', 'items', etc.

```
pepperi.resources.resource(resourceName).key(key).get()
```

1.  Search resource (all properties in the search object are optional)

```
pepperi.resources.resource(resourceName).search({
    Where: 'SQL-like filter',  // i.e. company='1000' AND division='F4'
    OrderBy: 'ModificationDateTime',
    PageSize: number, // any positive number or -1
    Fields: [] // will return all available fields by default
});
```

#### Client Object Functions

1.  Interaction

```
client.alert() - alert window;
client.confirm() - confirm window
```

1.  Navigation

-   navigation functions like navigateTo(), navigateBack(), openBrowser() etc.

```
client.navigateTo({url: 'slug or deeplink'})
```

1.  Sync

```
const syncOptions = {
// optional
// the message to show on the HUD
hudMessage: 'syncing...',

// optional - default is false
// if set to true, the client will continue to sync in the background without waiting for the sync to finish
allowContinueInBackground: false,

// optional - default is true.
// if false, the client will not abort the existing sync and will wait for it to finish (if allowContinueInBackground is false).
// if true, the client will abort the existing sync and will start a new sync.
abortExisting: false, // optional
};

const res = await client.sync(syncOptions);
```

1.  Environment

```
pepperi.environment.user() // to get user object, you can access for example result's uuid or externalID
pepperi.environment.isWebApp() // to identify whether it is webapp
```

---

## Scripts for Pages

### Rich Text script

Used to generate **dynamic HTML** for Rich Text page block. Could be used to display dynamic charts etc.

![](/static/image-158.png)

1.  Create a script with '**configuration**' param, type Object:

    ![](/static/image-159.png)

2.  In the script:
    1.  create the HTML markup,
    2.  at the end of the script assign the HTML to the configuration:

```
data.configuration.RichText = 'your html';
return data;
```

1.  Create a flow that contains that script;
2.  Pages: add a Rich Text block, select flow, and pass configuration.
3.  The HTML will be inserted into the Page.

---

### Filter resource view data

In resource views (e.g. UDC viewers) you can filter incoming data.

#### Resource View

1) Pages -> Resource Views:

![](/static/image-160.png)

2) Add new:

![](/static/image-161.png)

3) "Events" tab -> Add:

![](/static/image-162.png)

4) Select Event: OnResourceListLoad -> Click "Update":

![](/static/image-163.png)

5) Drag and drop "UserScriptsBlock" and select your Script:

![](/static/image-164.png)

6) Set parameter:
-   AccountUUID;
-   ResourceName (e.g. the name of UDC);

![](/static/image-165.png)

#### Script

1.  The script should return the filter object:

```
return {
    "Operation":"IsEqual",
    "ApiName":"division",
    Values:['F3'],
    FieldType: "String"
}
```

!!!danger
As 'ApiName' you can only use:

-   indexed fields
-   CreationDateTime / ModificationDateTime

!!!

1.  You can use **filter concatenation** if needed:

```
function concatFilters(f1, f2, operation) {
    return {
        "Operation":operation, // 'AND', 'OR'
        "LeftNode":f1,
        "RightNode":f2
    };
}
```

---

### Page parameters

You may need to use the '**on load**' flow for the whole page, for example, to get a buyer and account info. This allows to set parameters to the Page URL.

Use case: you're searching for the last transaction created by the customer, getting the UUID of this transaction, and setting the UUID to the page parameter.

1.  Create relevant params on page;
2.  Create a flow with a script that will return an object with params e.g.:

```
{
    transactionUUID: "",
    customerType: "type of customer",
    isMultiAccountBuyer: true, ...
}
```

!!!warning
Object property names must be the same as param names on the page.
!!!

!!!warning
If you use the **boolean** or string value **'true'** in page params, it will be shown in the URL the same: **&isMultiAccountBuyer=true**. However, the boolean value will **not** be saved in the URL. For better compatibility with 'show if' logic, it is **recommended to use string params**.
!!!

---

### Flow for buttons and banners filtering

!!!warning
You can create a flow to manipulate buttons or banners on a page, but it is better to use '**show if**' logic.
!!!

Use case: button "Cart" with a label that shows the total sum of the last transaction (e.g. "Go to Cart (1234.5$)").

#### Pages

1) Page -> Buttons -> Select flow:

![](/static/image-166.png)

2) In Flow Picker -> buttonObj (mandatory parameter):
-   Dynamic;
-   configuration;

![](/static/image-167.png)

Other parameters are optional.

#### Script

1.  Create a script with buttonObj param typeof object and pass 'configuration' to it.
2.  Then you can manipulate labels as you need:

```
data.buttonObj.Buttons[0].Label.Label = Go to Cart (1234.5$);
data.configuration = data.buttonObj;
return data;
```

---

## How to trigger scripts from workflow

To run a script from a workflow (of transaction or program):

1.  Create header checkbox **not** calculated field that starts with 'EmitEvent', for example **TSAEmitEventCalcSomething**.
2.  In events tab of transaction create new event (name of event will be trimmed, e.g. '**CalcSomething**') and add the relevant script.
3.  Pass '**ObjectKey**' to your transactionUUID param and save it.
4.  In workflow add **Alert On Condition** based on this field, trigger state if true (it will never be true unless you update it somehwere, so you will not see this alert) and place it where you need this calculations.
