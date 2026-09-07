---
description: >-
  Tips and tricks with example for making the data on the Page to be dynamically
  updated based on Page Parameters
---

# Adding Dynamic Data to the Page

{% hint style="info" %}
To accomplish all of the next steps you need to be sure that all of the needed Pages addons (Pages, Flows, Scripts, all of the page blocks which you want to use) are installed.
{% endhint %}

## Page Parameters Introduction

Firstly, you need to understand how page parameters work.

Page parameter is a variable, which have:

1. **Name** - the name of the variable, which will be shown in the page's URL (mandatory)
2. **Description** - the description of what should contain this variable
3. **Default Value** - the value which will be setted to the variable <mark style="color:orange;">if the user didn't provide custom value or it wasn't updated by flows</mark>

You can check the list of the page parameters by opening needed page and clicking on "Manage parameters" button:

<figure><img src="../../.gitbook/assets/image (1013).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If the page was just created, you will see that the list of parameters is empty. However, there is always at least one parameter on any Page - it's **AccountUUID**. You can't see it in the list, because you have no rights to update it there somehow (change name / description / default value), but you can use it for saving accountUUID value, so you don't need to create a new variable for it.
{% endhint %}

The main purpose of page parameters is **to be able to access the data in it from** **any block** on the page.

## Creating Needed Page Parameters

{% hint style="info" %}
You can check the example with admin@igdesigngroup.com.au, B2B Homepage.

Buyer is nadia.y@pepperi.com (IG Design).
{% endhint %}

For example, we need to have a page with Order Total banner, which should show the total sum of the last active transaction, and it should be updated based on active account on the page.



To achieve it we need to create the next page parameters:

1. transactionType - we will look for the active transaction with such a type; default value is "Buyer Order" (set here the transaction type which should be used in your page).
2. catalogExId - the ExternalID of the catalog which should we use, default value is "Default Catalogue"  (set here thecatalog ExternalID which should be used in your page).
3. transactionUUID - the UUID of active transaction for current active account - we will find a value with Flows and scripts so we could use it in any page block; default value is not defined.
4. isMultiAccount - is needed if we have account filter block and only if we want to hide it when we have only one available account. We will save the value to this variable, but you can not use it if you don't need to hide filter block on the page. Default value is not defined.

The 5th parameter is AccountUUID, so we don't need to create it.

## Flows Introduction

Flow is a list of succesive actions which will be performed on page in defined moment of time.

### On Load Flow

The most common place where you can put the flow is On Load action. The page itself and most of the page blocks (gallery, slideshow, banners, etc.) have possibility to add On Load Flow.

{% hint style="info" %}
On Load is the moment of loading of the page element or the page itself. When the user open the page - the On Load flow of the page and all added On Load flows on page blocks will be runned.
{% endhint %}

### On Parameter Change Flow

On Parameter Change Flow is the flow which will be runned after changes on the page.

{% hint style="info" %}
For now change on the page is page parameter update with filter block.
{% endhint %}

On Parameter Change Flow is available for Page itself only.

### Flow Structure

Every flow should have name and description (we had some bugs if it have no description).

In Parameters tab you can add all needed variables.

#### Flow's Variables

Flow's variable is very similar to Page's variable, but it have possibility to set variable type:

1. String
2. Bool
3. Integer
4. Double
5. Object

The main feature of flow's variables is The Variable Accessibility.

{% hint style="info" %}
The Variable Accessibility feature enables you to classify variables as either external or internal, defining their intended usage within the flow. When marked as external, a parameter is accessible by external components using the flow picker. When marked as internal, parameter is hidden from external entities, though available during the flow run time
{% endhint %}

<figure><img src="../../.gitbook/assets/image (1014).png" alt=""><figcaption></figcaption></figure>

All of added variables you can use in Flow Steps (Steps tab).

#### Flow's Steps



In Steps tab you can add some logic blocks which should be performed when the flow is runned.

In the example we will use the next logic blocks:

1. Active Transaction - the action which will look for last active transaction based on added accountUUID, transactionType, catalogExId and transaction statuses. If there is active transaction - it will automatically update the transactionUUID **flow parameter** with transaction UUID, and when the flow is finished - it will update **the page parameter** transactionUUID with new value.
2. Get Values - the action which helps to automatically get the list of values based on provided filters.
3. UserScriptsBlock - the block which has possibility to select script which should be runned.

## Scripts Introduction

To know more about Scripts check the article below:

{% content-ref url="../../scripts/" %}
[scripts](../../scripts/)
{% endcontent-ref %}

## Filter Block For Account Selection

To see dynamic update of page data you will need the filter block which triggers page parameter change action. In this example you need to add Filter Block for account selection to load different data based on current active account.

{% hint style="info" %}
If buyer have only one account connected you might want to hide the account filter block on the page. To do it you will need **isMultiAccount** page variable which was described in previous parts of the article, so make sure it's created if you need it.
{% endhint %}

Add Filter Block to the page:

<figure><img src="../../.gitbook/assets/image (1015).png" alt=""><figcaption></figcaption></figure>

Then go to the Content tab and create new filter.

Add title and select AccoutUUID as Page parameter key - it means that on every change of the value in this filter it will update AccountUUID page parameter with new value too.

Check "Use first value" checkbox - it will set the first account as currently selected on page load

<figure><img src="../../.gitbook/assets/image (1016).png" alt=""><figcaption></figcaption></figure>

### Get Accounts For Filter Flow

To load the accounts list to the filter block you will need to create "Get Accounts For Filter" flow. It will be added to the filter block as Options Source.

Go to the Flows, click Add button, paste to both Name and Description "Get Accounts For Filter".

We don't need any parameters in this flow, so open Steps tab.

Add "Get Values" logic block and set the next values:

1. Resource: accounts
2. Key field: Key - it's the UUID of the account
3. Display title field - Name
4. Add filter for Hidden = false
5. Click "Done"

<figure><img src="../../.gitbook/assets/image (1017).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Get Value logic block can be used for getting a list of some similar elements, for example, accounts. In this case the list will be presented by Account Names, but the representative value for each element will be Account UUID.
{% endhint %}

Save the changes by clicking on Update button and go back to the page.

Edit filter block which was previously added to the Page, go to the Content tab, open "Select Account" filter and add "Get Accounts For Filter" flow as Options Source

<figure><img src="../../.gitbook/assets/image (1018).png" alt=""><figcaption></figcaption></figure>

As the flow is added you should see that the filter have the list of the account names now

<figure><img src="../../.gitbook/assets/image (1019).png" alt=""><figcaption></figcaption></figure>

## Page On Load - Page Parameter Change Flow

Now we need to create the Flow which will be runned on both Page Load and Page Parameter Change actions.

Go to the Flows, click Add button, add flow name and description (in the example it's "B2B Homepage On Load").

### B2B Homepage Get AccountUUID Script

On Page Load we don't know for sure if we will have accountUUID value in the page parameter, so we will need a script to check it and if we have no value there - get it with pepperi.api.

1. Go to the Scripts, click Add button
2. Add name and description (in example it's "B2B Homepage Get AccountUUID")
3. Add parameter accountUUID, type is String
4. Add the code below

{% code lineNumbers="true" %}
```typescript
export async function main(data)  {
    let accountUUID = data.accountUUID;
    let isMultiAccount = '';
  
    if (!accountUUID) {
      const accounts = await pepperi.api.accounts.search({
        fields: ['UUID'],
        filter: {
          FieldType: 'String',
          ApiName: "ParentExternalID",
          Operation: "IsEqual",
          Values: [""],
        }
      })
  
      if (accounts.objects.length > 0) {
        accountUUID = accounts.objects[0].UUID;

        if (accounts.objects.length > 1) {
          isMultiAccount = 'true';
        }
      } else {
        console.log('could not find any accounts');
        await client.alert('No Accounts', 'Could not find any accounts');
      }
    }

    if (accountUUID.length) {
      data.accountUUID = accountUUID;
    }

    data.isMultiAccount = isMultiAccount;
    
    return data;
  }
```
{% endcode %}

This code will use pepperi.api function to get the first account UUID only if we haven't accountUUID value on the page.

{% hint style="info" %}
It also will set "true" string to the isMultiAccount variable, so if you want to use it for hiding the account filter if we have only one account, you should add Internal isMultiAccount variable to the Page On Load flow, so it will be updated by script and then on the page.
{% endhint %}

### Adding Parameters To The Flow

Go to the flow, open the Parameters tab and add the next variables:

1. accountUUID - External (the value will be taken from the page firstly, and if it's undefined - will be populated with the first connected account's UUID using pepperi.api in script)
2. catalogExId - External (is needed for last active transaction search)
3. transactionType - External (is needed for last active transaction search)
4. transactionUUID - Internal (the value will be populated by flow logic block as result of last active transaction search)
5. <mark style="color:orange;">isMultiAccount - Internal (add it only if you need to use it for hiding account filter)</mark>

### Adding Steps To The Flow

#### Adding B2B Homepage Get AccountUUID Script

1. Add UserScriptsBlock
2. Select "B2B Homepage Get AccountUUID" script
3. Add dynamic parameter accountUUID as accountUUID
4. click Save

<figure><img src="../../.gitbook/assets/image (1020).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
For better understanding of what exactly script is added to the flow you will need to update the step's name from "UserScriptsBlock" to the name which you will undertand, in this example it will be better to name it the same as the name of the script, but <mark style="color:orange;">**WITHOUT SPACES**</mark> - "B2BHomepageGetAccountUUID". <mark style="color:orange;">**The UserScriptsBlock cannot have any symbols except english letters in its name**</mark>.
{% endhint %}

#### Adding Active Transaction Action

1. Add Active Transaction logic block
2. Add dynamic parameters and set static status code for transaction search (status is In Creation in example) and click Done
3. Click Update to save changes in flow

<figure><img src="../../.gitbook/assets/image (1022).png" alt=""><figcaption></figcaption></figure>

### Adding Flow To On Load And Page Parameter Change Actions

1. Go back to the Page
2. Select "B2B Homepage On Load" flow as On Load Flow
3. Pass dynamic page parameters to the flow parameters
4. Click Save
5. Do steps 2-4 again, but for On Parameter Change Flow&#x20;

<figure><img src="../../.gitbook/assets/image (1023).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
We can use different flows for Page On Load and Page Parameter Change actions, but in this example the parameter change will be triggered by accountUUID page parameter update via Filter Block. So basically, we need the page to do the same actions as on page load - check if we have something in AccountUUID parameter and if no - get the first accountUUID plus get last active transaction UUID.
{% endhint %}

## Configuring Page Element With Dynamic Data

You can choose any page block which have On Load and On Change actions available to update data in it dynamically. We will use Banner block in this example.

1. Add Banner block to the page
2. You can configure some titles ans styles if you want

{% hint style="warning" %}
You may have several banners / elements in the block. For adding dynamic update of the data you need to know the exact element in the block you want to change, you need to know its number in the list (the first index is 0).

For example, you have 3 banners and you want to update title in the second banner dynamically, then you should work with banner which index is 1.
{% endhint %}

We have only one banner in the banner block, so its index is 0

<figure><img src="../../.gitbook/assets/image (1024).png" alt=""><figcaption></figcaption></figure>

### Configuring Banner On Load - On Parameter Change Flow

The same as it was for the page itself, we could use different flows for different actions, but in the example we need to do the same actions both on banner load and on parameter change, so we sill use one flow for both actions.

Go to the Flows and click Add, then enter name and description and click Add (the flow is "B2B Homepage Banner Order Total On Load" in example).

#### Adding Parameters To The Flow

Go to the Parameters tab and add the next parameters:

1. accountUUID - External (we will use it for getting last active transaction, because sometimes the page block's on load flow finishing faster than page's on load flow)
2. catalogExId - External (have the same purpose as accountUUID)
3. transactionType - External (have the same purpose as accountUUID)
4. transactionUUID - Internal (is needed for saving transactionUUID via Active Transaction logic block)
5. totalField - External, String (is needed for passing the API name of the pepperi transaction total field)
6. bannerObj - _External, **Object**_ (is needed for getting page block configuration object)

{% hint style="info" %}
Every page block has its own configuration object, which we can get from the page when we're adding flow and if we're using variable with object type.
{% endhint %}

The example of configuration object is:

{% code lineNumbers="true" fullWidth="false" %}
```json
{
  "Banners": [
    {
      "FirstTitle": {
        "Label": "Order Total",
        "Style": "body",
        "FontWeight": "normal",
        "Position": "start",
        "Use": false,
        "Size": "lg"
      },
      "ClickedArea": "banner",
      "Filter": { "Use": false, "FilterObj": null, "ShowBanner": true },
      "Color": "system-primary",
      "SecondTitle": {
        "Label": "$1,024",
        "Style": "heading",
        "FontWeight": "bold",
        "Position": "start",
        "Use": true,
        "Size": "xl"
      },
      "Style": "weak",
      "UseFlow": false,
      "Icon": {
        "UseIcon": true,
        "Position": "end",
        "Url": "some icon url"
      },
      "id": 0,
      "ButtonKey": "bb03bf2a-9fc7-489c-b88a-cd0a93752a28"
    }
  ],
  "BannerConfig": {
    "Structure": {
      "BorderRadius": "md",
      "Padding": "md",
      "OuterPadding": { "PaddingValue": "0", "IsUniform": true },
      "MaxColumns": 2,
      "Gap": "md"
    },
    "OnChangeFlowSameAsOnLoad": true,
    "OnLoadFlow": "some on load flow"
  }
}
```
{% endcode %}

Here we can see the Banners key, which have an array of similar objects - banners configurations. We have 1 banner here, so we can use this object in scripts to get and update some labels, titles and other things.

#### Adding Active Transaction Step

1. Go to the Steps tab
2. Add  Active Transaction action
3. Add dynamic parameters as in the previous parts of the article
4. Save changes

#### B2B Homepage Banner Order Total On Load Script

For Banner On Load - On Parameter Change flow you will need a script to update banners configuration object (in this example - to set transaction totals value to the second title of the banner).

1. Go to the Scripts and click Add button
2. In this example both name and description is "B2B Homepage Banner Order Total On Load"
3. Add the next parameters:\
   transactionUUID - is needed for getting transaction totals value\
   totalField - is needed for getting value by api name\
   bannerObj (object) - is needed for getting banner configuration object
4. Add the code below and  save changes

{% code lineNumbers="true" %}
```typescript
export async function main(data)  {
    let totalField = data.totalField;
    let transactionUUID: string = data.transactionUUID;
    let transaction: any = await getTransaction(transactionUUID);

    let totalsValue = '0.00';
    let currency: string = '$';

    if (transactionUUID && transactionUUID !== '') {
        totalsValue = await transaction.getFieldValue(totalField);
        totalsValue = formatNumberWithSeparators(totalsValue);
        currency = await transaction.getFieldValue('Currency');
    }
    
    let root = data.bannerObj;
    
    if (root.Banners.length) {
        root.Banners[0].SecondTitle.Label = `${currency}${totalsValue}`;
    }
    
    data.configuration = root;
    return data;
}

function getTransaction(uuid: string) {
    return pepperi.DataObject.Get('transactions', uuid);
}

/** Function to format numbers with decimal & thousand separators
 * @return formatted value
*/
function formatNumberWithSeparators(number, decimalSeparator = '.', thousandSeparator = ',') {
    const parts = number.toFixed(2).split('.');
    const integerPart = parts[0];
    const decimalPart = decimalSeparator + parts[1];
  
    // Add thousand separators to the integer part
    const formattedIntegerPart = integerPart.replace(/\B(?=(\d{3})+(?!\d))/g, thousandSeparator);
  
    return formattedIntegerPart + decimalPart;
}
```
{% endcode %}

Explanation:

4th line: calling getTransaction function which will return basically all transaction header level data

9-13th lines: if we have transactionUUID (we have transaction data), then we're getting totals data by using .getFieldValue() method (this method and pepperi.DataObject.Get() are defined in scripts overall). Retrieved totals value we're sending to the formatNumberWithSeparators function to get formatted value (thousands are separated by "," and decimals are separated by "." by default, it could be changed). Getting Currency field to get transaction currency.

15th line: starting working with bannerObj as root variable.

17-19ths lines: if we have some banners on the page added, then we should take the first one from the list (index 0), take its SecondTitle and make its Label to have totals formatted string.

21-22th line: data - is the object that we get in the beginning of the script, we need to return it to the flow with updated data, so then all of these data will be returned to the page when the flow is finished. We're setting the updated banner configuration object to the configuration and returning it to the page.

{% hint style="info" %}
**configuration** - is the name of configuration object of the block on the page.
{% endhint %}

<figure><img src="../../.gitbook/assets/image (1025).png" alt=""><figcaption></figcaption></figure>

#### Adding Script To The Flow

1. Go to the "B2B Homepage Banner Order Total On Load" flow
2. Open Steps tab
3. Add UserScriptsBlock and select "B2B Homepage Banner Order Total On Load" script
4. Add dynamic parameters
5. Click Save
6. If you want - rename the added step, do not forget that it shouldn't have any symbols except english letters
7. Save changes in the flow

<figure><img src="../../.gitbook/assets/image (1026).png" alt=""><figcaption></figcaption></figure>

### Adding Banner On Load - On Parameter Change Flow

1. Go to the page
2. Edit Banner block
3. Go to General tab
4. Select B2B Homepage Banner Order Total On Load flow as On Load flow
5. Pass the next parameters:\
   catalogExId = catalogExId (dynamic)\
   transactionType = transactionType (dynamic)\
   accountUUID = AccountUUID (dynamic)\
   totalField = GrandTotal (static, you can pass any transaction field you want here)\
   bannerObj = configuration (dynamic)
6. Click Save
7. Check "Same as OnLoad" checkbox to use the same flow for On Page Parameter Change action
8. Save all changes on the page and publish it

<figure><img src="../../.gitbook/assets/image (1028).png" alt=""><figcaption></figcaption></figure>

