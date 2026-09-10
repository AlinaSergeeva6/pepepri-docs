---
title: "Implementing Dynamic Nested Pages"
description: "This article looks at an example of implementing dynamic nested pages, using Scripts, Flows and Pages."
order: 57
---
# Implementing Dynamic Nested Pages

*This article looks at an example of implementing dynamic nested pages, using Scripts, Flows and Pages.*

!!!info
To complete the steps described in this article, please be sure all needed addons are installed on your environment (Scripts, Flows, Logic Blocks, Application Header (if it's needed), Pages & all of the needed page blocks).
!!!

## General Introduction

Sometimes Buyer Homepage should contain some pages similar by structure, but different by data. In that case, you don't need to create 100 similar pages. You can create just one page, which will load the data dynamically based on passed page parameters.

!!!info
You can check the described example on Drew Estate (NetSuite) (7792) (30015810).

Admin: SupportAdminUser\_30015810@Wrnty.com Buyer: pepperiBuyer@drewEstate.com
!!!

!!!danger
PLEASE make sure you don't change anything there!
!!!

For Example, we want to have "News" and "Education" pages.

#### News Page Overview

For News page we want to have some different categories of news. Based on selected category we should see the data in the Gallery block: all of the gallery items should be updated with correct images and text.

![](/static/image-823.png)

News page: New Products category

![](/static/image-824.png)

News Page: Active Promotion category

We also would like to have another page which will show some additional information for any of the gallery items. For example, the user clicked "Trick or Treat Deals: Acid Blondies" gallery item. He should be navigated to another page, where the main image from the clicked element will be the first image on current page, and at the bottom there will be rendered any html code that we saved in our data storage:

![](/static/image-825.png)

Trick or Treat Deals: Acid Blondies - article page 1

![](/static/image-826.png)

Trick or Treat Deals: Acid Blondies - article page 2

!!!warning
We also want the "Go Back" button to redirect user to the previous page. To make it happen, please make sure the WebApp Platform addon's version is 18.3.3 or higher.
!!!

#### Education Page Overview

Education page is very similar to the News page, it also have a gallery, but it has no sections (no filter block) and the action on click for each gallery item should open an external link:

![](/static/image-827.png)

Education Page

![](/static/image-828.png)

Education Page: Gallery Item On Click - Opening an External Link example

Both pages will be just one page connected to one slug. The data on that page will be refreshed based on passed page parameters.

### Getting Support Admin User Email

The support admin email is used in this case, because if the Script addon's version is 0.8.10 or higher - you couldn't work with Scripts in Backoffice if you're using some other admin user than the support admin.

To get the support admin user email for your environment:

1.  Find the organization ID, which is the second number in IPAAS Account Info. For example, in Drew Estate (NetSuite) (7792) (30015810) it's 30015810.
2.  Add the organization ID to the next string instead of "ORGID": SupportAdminUser\_ORGID@Wrnty.com. In our case, we will get SupportAdminUser\_30015810@Wrnty.com.

### Related Articles

Please check out the next articles (especially if you're new to Scripts / Flows / Pages), which might be in use and useful before all the next steps:

[Scripts](/pepperi/custom-homepages/scripts.md)[Scripts - How to Write](/pepperi/custom-homepages/scripts-how-to-write.md)[Pages with flows](/pepperi/custom-homepages/pages-with-flows.md)[Debugging Scripts and Flows](/pepperi/custom-homepages/debugging-scripts-and-flows.md)[Adding Dynamic Data to the Page](/add-ons-manuals/pricing-module-ppm-add-on/adding-dynamic-data-to-the-page.md)

## Storing The Data For Dynamic Page

You can choose any way to store the data as soon as you can get it in the scripts. For example, it could be UDT, UDC, etc.

In this example we will use UDTs. The client have possibility to add pages data to UDTs via activities. You can check them in activity types list.

We're using PORTAL-NEWS activity type to add data for News page (Homepage Activity NEWS UDT), and PORTAL-EDUCATION activity type to add data for Education page (Homepage Activity EDUCATION UDT):

![](/static/image-829.png)

Homepage Activity NEWS UDT

![](/static/image-830.png)

Homepage Activity EDUCATION UDT

The MainKey & SecondaryKey aren't important in this case. All of the data is in the Value column. Every row in UDT is separate gallery item.

!!!info
You can form the data in Value column as you wish as soon as you could parse it in the script and form the page correctly.
!!!

This is how the one row from the Homepage Activity NEWS UDT looks like:

> Active Promotion~[https://drewestate.box.com/shared/static/3nw8vpm5hnw10kuzkyy50cyzgfsx0oy9.jpg](https://drewestate.box.com/shared/static/3nw8vpm5hnw10kuzkyy50cyzgfsx0oy9.jpg)~DDRP, DDDP, DDCP, NAS-Wholesale~Trick or Treat Deals: Acid Blondies~~<br><br>
>
> **\>> Shop the deals &lt;&lt;**
>
> <br><br><br>
>
> ![](/static/Trick-or-Treat-deals_Blondies5MC.jpg)
>
> ~1

```
Active Promotion~https://drewestate.box.com/shared/static/3nw8vpm5hnw10kuzkyy50cyzgfsx0oy9.jpg~DDRP, DDDP, DDCP, NAS-Wholesale~Trick or Treat Deals: Acid Blondies~~<br\><br\><span  class="article__custom-link"><p><span style="font-size:16px"><strong><span style="background-color:#f1c40f">&nbsp; &nbsp;&gt;&gt; Shop the deals &lt;&lt;&nbsp;&nbsp;</span></strong></span></span></p><br\><br\><br\><p><img alt="" src="https://drewestate.box.com/shared/static/vbl9ulybb1hw8tl4l0gmraj7mz2vkz2m.jpg" style="height:1294px; width:1000px" /></p>~1
```

Basically, all the data is divided by "~" symbol here.

!!!danger
Be cautious while using "~" as a delimiter in UDT. If UDT row has a value with "~" inside and the row was updated with new data - the previous UDT Value will not be overwritten fully with the new value. Only the first element before '~' will be overwritten.

For Example: We have a UDT row like: MainKey: 'MK'; SecondaryKey: 'SK'; Value: 'V1~V2~V3'.

If we will try to do pepperi.api.userDefinedTables.upsert with the next data: MainKey: 'MK'; SecondaryKey: 'SK'; Value: 'AnotherV1~AnotherV2' - the expected result is that the row's Value with the same MainKey and SecondaryKey will be overwritten (new Value is 'AnotherV1~AnotherV2').

But sometimes while using "~" as a delimeter the upsert doesn't work as expected - it updates only the first value-entry (text before the first entry of "~"). So the result will be: MainKey: 'MK'; SecondaryKey: 'SK'; Value: 'AnotherV1~AnotherV2~V2~V3'.
!!!

1.  *Active Promotion* - the name of the category. We will get all the needed rows from the UDT and look for all unique category names for forming filter block's options source:

    ![](/static/image-831.png)

2.  [*https://drewestate.box.com/shared/static/3nw8vpm5hnw10kuzkyy50cyzgfsx0oy9.jpg*](https://drewestate.box.com/shared/static/3nw8vpm5hnw10kuzkyy50cyzgfsx0oy9.jpg) - the src for the main image for gallery item;
3.  *DDRP, DDDP, DDCP, NAS-Wholesale* - the list of accounts programs for which this row should be presented on the page (it could be any parameter, for example, account type);
4.  *Trick or Treat Deals: Acid Blondies* - the title for the gallery item;
5.  There is a missed parameter after the title - it's description for gallery item;
6.  ```
    &lt;br\>&lt;br\>&lt;span  class="article__custom-link">&lt;p>&lt;span style="font-size:16px">&lt;strong>&lt;span style="background-color:#f1c40f">&nbsp; &nbsp;&gt;&gt; Shop the deals &lt;&lt;&nbsp;&nbsp;&lt;/span>&lt;/strong>&lt;/span>&lt;/span>&lt;/p>&lt;br\>&lt;br\>&lt;br\>&lt;p>&lt;img alt="" src="https://drewestate.box.com/shared/static/vbl9ulybb1hw8tl4l0gmraj7mz2vkz2m.jpg" style="height:1294px; width:1000px" />&lt;/p>
    ```

    It's the HTML code for article body (the page which will be opened after gallery item click);

7.  *1* - the number in order inside the Active Promotion category.

So you can form all the needed data in any form and you can add as many data as you want.

## Creating Dynamic Page

!!!info
You can check out the described "Dynamic UDT Page" page in Page Builder section.
!!!

### Layout

Firstly, as we created an empty page, we need to form the layout. So we want the page to have:

-   a page title (will be changed based on page parameter value);
-   a filter block for changing the category if we're on the News page (we will hide it if it's not News page);
-   a dynamic gallery.

Let's suppose we will have 10 gallery items (10 rows in the UDT) for News page, and we should have only 3 gallery items (3 rows in the UDT) for Education page. We also should update the amount of visible gallery items every time as we change the category on the News page.

Unfortunatelly, we cannot add more gallery items to the gallery block using scripts and flows than it already is in this gallery block in page builder. For example, if we have two gallery items added in page builder - then we cannot add a script to get all needed rows from the UDT and if the amount is more than 2, for example, 10 - just update the configuration of the gallery block with 8 more gallery items:

![](/static/image-832.png)

We cannot do it because every gallery item has unique Key which is generated not on our side, but in the moment when we add a new gallery item to the gallery block **in Page Builder ONLY**.

So for now all we can do to have a possibility to have different amount of gallery items is to add manually in Page Builder as many gallery items as you could add. Just think what the maximum amount of gallery items could possibly be in your case and add this amount to the gallery.

!!!warning
For now just add 5-10 gallery items, because in the future each of them will have an on click flow connected. When you have the flow created - you can add it to the one gallery item and just do a duplication as many times as you want.
!!!

### Parameters

!!!info
If you're new to Pages, you may find it helpful to learn more about Page Parameters. You can explore the topic further in the article below.
!!!

[Adding Dynamic Data to the Page](/add-ons-manuals/pricing-module-ppm-add-on/adding-dynamic-data-to-the-page.md)

Based on the data in UDTs, we should have the next Page Parameters:

1.  **tableName** - the name of the UDT;
2.  **tableMainkey** - the mainKey of the rows we should get from UDT;
3.  **udtData** - stringified data from the UDT - we will save already prepared data to this variable, for example, in the format of an array of objects;
4.  **pageTitle** - the title to be visible at the top of the page;
5.  **activeButton** - current active category's title (is needed only for News page, so could be ignored for Education page)

We also will need AccountUUID here, because we want to be sure the Account Program works only with rows which current account should see. The AccountUUID parameter is a hidden page parameter which is always on the page, so we don't need to create it.

### Page OnLoad Flow

#### Page OnLoad Flow

!!!info
To check the described flow: Flows -> Dynamic UDT Page On Load flow.
!!!

In this flow we should use a script to get and prepare data from UDT.

We will need the next flow parameters to be created:

1.  **tableName** - String - External;
2.  **tableMainKey** - String - External;
3.  **accountUUID** - String - External;
4.  **pageTitle** - String - External;
5.  **activeButton** - String - External.

The same parameters should be created for the script.

!!!info
To check the described script: Scripts -> Get UDT Data for Dynamic Page.
!!!

```
/* VISIBILITY RULES (ONLY FOR NEWS, EDUCATION, RESOURCES, EVENTS pages)
 * Allow or not allow to show items on pages
 * @params: string - programPriceList string, for example DDRP;DDDP;DDCP|Sales List;
 * @returns boolean
 */
function checkVisibilityRules(
  programPriceList = "",
  TSACProgram = "",
  PriceLevelName = ""
) {
  const [programs, priceLists] = programPriceList.split("|");

  // VISIBILITY RULES
  if (programs && !programs.toLowerCase().includes(TSACProgram.toLowerCase())) {
    return false;
  } else if (
    priceLists &&
    !priceLists.toLowerCase().includes(PriceLevelName.toLowerCase())
  ) {
    return false;
  }

  return true;
}

async function getAccountUUID() {
  let accountUUID = "";

  const accounts = await pepperi.api.accounts.search({
    fields: ["UUID"],
    filter: {
      FieldType: "String",
      ApiName: "ParentExternalID",
      Operation: "IsEqual",
      Values: [""],
    },
  });

  if (accounts.objects.length > 0) {
    accountUUID = accounts.objects[0].UUID;
  } else {
    console.log("could not find any accounts");
    await client.alert("No Accounts", "Could not find any accounts");
  }
  return accountUUID;
}

function getAccount(uuid: string) {
  return pepperi.DataObject.Get("accounts", uuid);
}

async function getPreparedUdtData(
  name,
  mainKey,
  pageTitle,
  accountTSACProgram,
  accountPriceLevelName
) {
  let finalList: Array&lt;object> = [];

  let udtData = await pepperi.api.userDefinedTables.getList({
    table: name,
    mainKey: mainKey,
  });

  if (udtData.success && udtData.objects.length) {
    // preparing the data
    if (pageTitle === "NEWS" || pageTitle === "EVENTS") {
      udtData.objects.forEach((item) => {
        let ArticleCategory = item.mainKey.split("-")[1].toLowerCase();
        let InternalID = item.secondaryKey;
        let [
          TSACategoryDropdown,
          TSAImageURL,
          TSAProgramPriceList,
          TSAArticleTitle,
          TSAArticleBody,
          TSAArticleBodyHTMLRaw,
          TSASortOrder,
        ] = item.value.split("~");

        if (
          checkVisibilityRules(
            TSAProgramPriceList,
            accountTSACProgram,
            accountPriceLevelName
          )
        ) {
          finalList.push({
            ArticleCategory,
            InternalID,
            Title: TSACategoryDropdown,
            TSAImageURL,
            TSAProgramPriceList,
            TSAArticleTitle,
            TSAArticleBody,
            TSAArticleBodyHTMLRaw,
            TSASortOrder,
          });
        }
      });
    } else {
      udtData.objects.forEach((item) => {
        let ArticleCategory = item.mainKey.split("-")[1].toLowerCase();
        let [
          TSATitle,
          TSASubAttribute1,
          TSASubAttribute2,
          TSAFileType,
          TSAProgramPriceList,
          TSAImageURL,
          TSAFileURL,
          TSASortOrder,
        ] = item.value.split("~");

        if (
          checkVisibilityRules(
            TSAProgramPriceList,
            accountTSACProgram,
            accountPriceLevelName
          )
        ) {
          finalList.push({
            ArticleCategory,
            TSAArticleTitle: TSATitle,
            TSASubAttribute1,
            TSASubAttribute2,
            TSAFileType,
            TSAProgramPriceList,
            TSAImageURL,
            TSAFileURL,
            TSASortOrder,
          });
        }
      });
    }

    return finalList;
  } else {
    return [];
  }
}

export async function main(data) {
  let accountUUID = data.accountUUID;
  let activeButton = data.activeButton;
  const tableName = data.tableName;
  const tableMainKey = data.tableMainKey;
  const pageTitle = data.pageTitle;

  if (!accountUUID) {
    accountUUID = await getAccountUUID();
  }

  // get account data
  const account = await getAccount(accountUUID);
  const [accountTSACProgram, accountPriceLevelName] = await Promise.all([
    account.getFieldValue("TSACProgram"),
    account.getFieldValue("PriceLevelName"),
  ]);

  // get and prepare udt data
  let udtData = await getPreparedUdtData(
    tableName,
    tableMainKey,
    pageTitle,
    accountTSACProgram,
    accountPriceLevelName
  );

  udtData = udtData.sort(
    (item1, item2) => item1.TSASortOrder - item2.TSASortOrder
  );

  data.udtData = JSON.stringify(udtData);
  data.activeButton = activeButton ? activeButton : udtData[0]["Title"];

  return data;
}
```

**Code explanation:**

1.  lines 6-24: function-helper to check if the row from UDT should be visible for current account;
2.  lines 26-46: function-helper to get UUID of the first connected account; it is needed in case we don't have the **accountUUID** yet;
3.  lines 48-50: function-helper to get account fields;
4.  lines 52-142: function to get data from UDT and prepare it as array of objects;
5.  lines 144-179: the main function; here we're getting parameters -> if we have no **accountUUID** - we're getting it with getAccountUUID function -> getting account data -> getting needed account fields -> getting prepared UDT data -> sorting it -> setting stringified udtData to corresponding page parameter -> if we have no **activeButton** - set the Tittle of the first object of udtData array into it.

!!!warning
If you need to save some object-typed data to the page parameter (for example, array of objects) you need firstly to stringify it, because **all of the page parameters are strings**. Then you can get the value of this parameter in another page element flow and just do JSON.parse().
!!!

When the script is done, we're adding it to the flow:

![](/static/image-833.png)

Then we're adding the flow to the page OnLoad flow:

![](/static/image-834.png)

### Page Title - Rich Text Block OnLoad Flow

We have a Rich Text for Page Title and the pageTitle page parameter which contains a string. We need to create an OnLoad Flow for this Rich Text block to add an HTML code with current pageTitle value.

!!!info
To check described flow: Flows -> Dynamic UDT Page - Set Title.
!!!

We will need the next flow parameters to be created:

1.  **configObj** - Object - External - it's the configuration object of the Rich Text block;
2.  **text** - String - External - the text we should show in Rich Text block;
3.  **htmlTag** - String - External - the HTML tag where we need to add the passed text, for example, h3.

The same parameters should be created for the script.

!!!info
To check the described script: Scripts -> Dynamic UDT Page - Set Title.
!!!

```
export async function main(data) {
    const text = data.text;
    const htmlTag = data.htmlTag;

    let root = data.configObj;

    if (root.hasOwnProperty('RichText')) {
        root.RichText = `<${htmlTag}>${text}</${htmlTag}>`;
    }

    data.configuration = root;

    return data;
}
```

**Code explanation:**

If the configuration object of Rich Text block was successfully retrieved - it will have RichText property. So we're checking if we have such a property and if so - setting HTML code to it, which is passed text inside passed htmlTag. After that we're updating configuration object with new data.

Adding this script to the flow:

![](/static/image-835.png)

Adding the flow to the Rich Text OnLoad flow:

![](/static/image-836.png)

### Category Selection - Filter Block - Options Source Flow

To get options for category selection we will need to create a flow and a script.

!!!info
To check described flow: Flows -> Dynamic UDT Page - Section Filter Get Source.
!!!

We will need the next flow parameters to be created:

1.  **tableName** - String - External;
2.  **tableMainKey** - String - External;
3.  **pageTitle** - String - External;
4.  **accountUUID** - String - External.

The same parameters should be created for the script.

We need all these parameters because sometimes filter block loads before the page OnLoad flow is finished. That's why we will get the udt data in the same way as we do on Page Load, get unique categories (if it's News page), form array of objects (**data.Options** - will be described further in this article) and return it.

!!!info
To check the described script: Scripts -> Dynamic UDT Page - Section Filter Get Source.
!!!

```
/* VISIBILITY RULES (ONLY FOR NEWS, EDUCATION, RESOURCES, EVENTS pages)
 * Allow or not allow to show items on pages
 * @params: string - programPriceList string, for example DDRP;DDDP;DDCP|Sales List;
 * @returns boolean
 */
function checkVisibilityRules(
  programPriceList = "",
  TSACProgram = "",
  PriceLevelName = ""
) {
  const [programs, priceLists] = programPriceList.split("|");

  // VISIBILITY RULES
  if (programs && !programs.toLowerCase().includes(TSACProgram.toLowerCase())) {
    return false;
  } else if (
    priceLists &&
    !priceLists.toLowerCase().includes(PriceLevelName.toLowerCase())
  ) {
    return false;
  }

  return true;
}

async function getAccountUUID() {
  let accountUUID = "";

  const accounts = await pepperi.api.accounts.search({
    fields: ["UUID"],
    filter: {
      FieldType: "String",
      ApiName: "ParentExternalID",
      Operation: "IsEqual",
      Values: [""],
    },
  });

  if (accounts.objects.length > 0) {
    accountUUID = accounts.objects[0].UUID;
  } else {
    console.log("could not find any accounts");
    await client.alert("No Accounts", "Could not find any accounts");
  }
  return accountUUID;
}

function getAccount(uuid: string) {
  return pepperi.DataObject.Get("accounts", uuid);
}

async function getPreparedUdtData(
  name,
  mainKey,
  pageTitle,
  accountTSACProgram,
  accountPriceLevelName
) {
  let finalList: Array&lt;object> = [];

  let udtData = await pepperi.api.userDefinedTables.getList({
    table: name,
    mainKey: mainKey,
  });

  if (udtData.success && udtData.objects.length) {
    // preparing the data
    if (pageTitle === "NEWS" || pageTitle === "EVENTS") {
      udtData.objects.forEach((item) => {
        let ArticleCategory = item.mainKey.split("-")[1].toLowerCase();
        let InternalID = item.secondaryKey;
        let [
          TSACategoryDropdown,
          TSAImageURL,
          TSAProgramPriceList,
          TSAArticleTitle,
          TSAArticleBody,
          TSAArticleBodyHTMLRaw,
          TSASortOrder,
        ] = item.value.split("~");

        if (
          checkVisibilityRules(
            TSAProgramPriceList,
            accountTSACProgram,
            accountPriceLevelName
          )
        ) {
          finalList.push({
            ArticleCategory,
            InternalID,
            Title: TSACategoryDropdown,
            TSAImageURL,
            TSAProgramPriceList,
            TSAArticleTitle,
            TSAArticleBody,
            TSAArticleBodyHTMLRaw,
            TSASortOrder,
          });
        }
      });
    } else {
      udtData.objects.forEach((item) => {
        let ArticleCategory = item.mainKey.split("-")[1].toLowerCase();
        let [
          TSATitle,
          TSASubAttribute1,
          TSASubAttribute2,
          TSAFileType,
          TSAProgramPriceList,
          TSAImageURL,
          TSAFileURL,
          TSASortOrder,
        ] = item.value.split("~");

        if (
          checkVisibilityRules(
            TSAProgramPriceList,
            accountTSACProgram,
            accountPriceLevelName
          )
        ) {
          finalList.push({
            ArticleCategory,
            TSAArticleTitle: TSATitle,
            TSASubAttribute1,
            TSASubAttribute2,
            TSAFileType,
            TSAProgramPriceList,
            TSAImageURL,
            TSAFileURL,
            TSASortOrder,
          });
        }
      });
    }

    return finalList;
  } else {
    return [];
  }
}

function getUniqueData(array, keyName = "Title") {
  const uniqueData = new Set();

  return array.reduce((acc, obj) => {
    if (!uniqueData.has(obj[keyName])) {
      uniqueData.add(obj[keyName]);
      acc.push(obj[keyName]);
    }
    return acc;
  }, []);
}

export async function main(data) {
  let options: any = [];
  let accountUUID = data.accountUUID;
  const tableName = data.tableName;
  const tableMainKey = data.tableMainKey;
  const pageTitle = data.pageTitle;

  if (!accountUUID) {
    accountUUID = await getAccountUUID();
  }

  // get account data
  const account = await getAccount(accountUUID);
  const [accountTSACProgram, accountPriceLevelName] = await Promise.all([
    account.getFieldValue("TSACProgram"),
    account.getFieldValue("PriceLevelName"),
  ]);

  // get and prepare udt data
  let udtData = await getPreparedUdtData(
    tableName,
    tableMainKey,
    pageTitle,
    accountTSACProgram,
    accountPriceLevelName
  );

  let uniqueTitles = [];

  if (udtData[0].hasOwnProperty("Title") ) {
    // if it's news or events
    uniqueTitles = getUniqueData(udtData, "Title");

    uniqueTitles.forEach((title) => {
      options.push({
        Key: title,
        Title: title
      });
    });
  }

  let newData: any = {};
  newData.Options = options;

  return newData;
}
```

**Code explanation:**

All of the functions-helpers and udt data retrievals are the same as in Page OnLoad script.

The only new function-helper is getUniqueData - this function returns an array of unique strings which are taken from the passed property (in this case - "Title" property).

The format of options source for filter block is:

```
data.Options = [
     { Key: 'New Products', Title: 'New Products' },
     { Key: 'Active Promotion', Title: 'Active Promotion' },
     ...
];
```

That's why at the end of the script's main function we're getting unique titles from the udt rows - these titles are unique categories. And then we're forming options in needed format.

Then we're adding this script to the flow and adding the flow to the Filter block + adding some settings to this Filter block in Page Builder:

![](/static/image-837.png)

1.  **Page parameter key** - activeButton - it's a page parameter which will be updated with a new value (the value of the Key property) everytime the user selects another value from dropdown;
2.  **Options source** - the flow which was created in previous steps;
3.  **Hide when no options** - when the options source is empty, the filter block will be hidden (is needed to hide if it's Education page);
4.  **Use first value** - when the value for this filter is not set, it will use the first option as default.

### Gallery Block

#### Block OnLoad Flow

!!!info
To check described flow: Flows -> Dynamic UDT Page - Gallery Load.
!!!

In this flow we will get udtData from the page parameter (we have a stringified data there in the moment of the Gallery block loading, because the Page OnLoad flow was already finished at that time), filter only needed gallery items and show them on the screen.

To achieve that we will add a script to the flow. But firstly we need to create the next flow parameters:

1.  **activeButton** - String - External;
2.  **udtData** - String - External;
3.  **galleryObj** - Object - External - gallery configuration object.

Exactly the same parameters should be created for the script.

!!!info
To check described script: Scripts -> Dynamic UDT Page - Gallery Load.
!!!

```
export async function main(data) {
  let activeButton = data.activeButton;
  let udtData = JSON.parse(data.udtData);

  let filteredData = udtData;
  if (!udtData[0].hasOwnProperty("TSASubAttribute2")) {
    // if news or events
    filteredData = udtData.filter((el) => el.Title === activeButton);
  }
  filteredData = filteredData.sort(
    (item1, item2) => item1.TSASortOrder - item2.TSASortOrder
  );

  let root = data.galleryObj;
  let cardsToShow: Object[] = [];

  if (root.Cards.length > 0) {
    let cards = root.Cards;
    cards.forEach((card, index) => {
      let newCard = card;

      if (index &lt; filteredData.length) {
        newCard = {
          ...newCard,
          Title: filteredData[index]["TSAArticleTitle"],
          Description: filteredData[index].hasOwnProperty("TSASubAttribute2")
            ? `${
                filteredData[index]["TSASubAttribute1"]
                  ? `${filteredData[index]["TSASubAttribute1"]}
                  ` // to move to the new line
                  : ""
              }${
                filteredData[index]["TSASubAttribute2"]
                  ? `${filteredData[index]["TSASubAttribute2"]}
                  ` // to move to the new line
                  : ""
              }${
                filteredData[index]["TSAFileType"]
                  ? `${filteredData[index]["TSAFileType"]}`
                  : ""
              }`
            : "",
          AssetURL: filteredData[index]["TSAImageURL"],
        };

        if (
          filteredData[index]["ArticleCategory"]
            .toLowerCase()
            .includes("news") ||
          filteredData[index]["ArticleCategory"]
            .toLowerCase()
            .includes("events")
        ) {
          newCard.Filter = {
            ShowCard: true,
            Use: true,
            FilterObj: `{\"ExpressionId\":\"1\",\"ApiName\":\"activeButton\",\"FieldType\":\"String\",\"Operation\":\"IsEqual\",\"ValueType\":\"Static\",\"Values\":[\"${filteredData[index]["Title"]}\"]}`,
          };
        } else {
          newCard.Filter = { ShowCard: true, Use: false, FilterObj: null };
        }

        cardsToShow.push(newCard);
      }
    });

    root.Cards = cardsToShow;

    root.GalleryConfig.Card.Height =
      filteredData[0]["ArticleCategory"] === "news" ||
      filteredData[0]["ArticleCategory"] === "events"
        ? 20
        : filteredData[0]["ArticleCategory"] === "education"
        ? 60
        : filteredData[0]["ArticleCategory"] === "resources"
        ? 35
        : 20;
  }

  data.configuration = root;

  return data;
}
```

**Code explanation:**

1.  lines 2-3: getting activeButton and parsed udtData;
2.  lines 5-9: getting only needed udtData lines based on the existence of the TSASubAttribute2 (if TSASubAttribute2 doesn't exist - it's either news or events page, which are two pages with categories);
3.  lines 10-12: sorting filtered data by TSASortOrder value;
4.  line 15: initializing the array which will contain the gallery items (cards), which we should show on the page;
5.  lines 17-78: if we have some cards in current gallery configuration object - then we can loop over all of those cards. If current gallery card's index is < than amount of objects in filteredData array - then we can form a new card and push it to the cardsToShow array. Here we can update title, description, styles and even filter object. So this is the time when we're setting the filter object for every card which should be shown on the News or Events page, where we should filter the cards by currently selected section in filter block, which is connected to the activeButton page parameter.

You can use the next template for filtering. You can just add there your values, stringify it and set it to the card.Filter.

```
{
    "ExpressionId": "1",
    "ApiName": "", // page parameter name
    "FieldType": "String",
    "Operation": "IsEqual",
    "ValueType": "Static",
    "Values": [
        "" // the value the page parameter should be equal to, if the card should be shown
    ]
}
```

When the script is done - it should be added to the flow, and then the flow should be added to the Gallery Block OnLoad flow.

!!!warning
Do not forget to check the "Same as OnLoad" checkbox under the On Change Flow section here.
!!!

The result is the next:

![](/static/image-838.png)

![](/static/image-839.png)

#### Gallery Item OnClick Flow

We also want to have different actions to be performed on gallery item click based on current page.

To achieve it we need to create a flow which will be connected to every gallery item in the gallery block.

!!!info
To check described flow: Flows -> Dynamic UDT Page - Gallery Item On Click.
!!!

Flow Parameters to create:

1.  **activeButton** - String - External;
2.  **udtData** - String - External;
3.  **pageTitle** - String - External;
4.  **articlePageSlug** - String - Internal - parameter for News or Events page (pages with sections);
5.  **externalLink** - String - Internal - parameter for all the pages without sections;
6.  **galleryItemId** - String - External - the id of the current gallery item. It is needed because we cannot get the config object just for current one gallery item - we can only get the full gallery block configuration object. But we still need to know which exactly the gallery item it is. The only possible way to do it for now is to add such a parameter to the flow, then create one gallery item, add this flow to it and set galleryItemId = 0 - it's the first gallery item. Then we can duplicate it, to create as many gallery items as you wish and update the galleryItemId to have unique id for every such an item. For example, we have 3 gallery items with the same flow added and galleryItemId is 0 for the first one, 1 for the second one and 2 for the third one.

The same parameters should be added for the script.

!!!info
To check described script: Scripts -> Dynamic UDT Page - Gallery Item On Click.
!!!

```
export async function main(data) {
  const udtData = JSON.parse(data.udtData);
  const activeButton = data.activeButton; // active section / filter
  const galleryItemId = +data.galleryItemId;
  const pageTitle = data.pageTitle;

  // getting filtered data
  let filteredData = udtData;
  if (!udtData[0].hasOwnProperty("TSASubAttribute2")) {
    // if news or events
    filteredData = udtData.filter((el) => el.Title === activeButton);
  }
  filteredData = filteredData.sort(
    (item1, item2) => item1.TSASortOrder - item2.TSASortOrder
  );

  // getting data for current gallery item
  const galleryItemData = filteredData[galleryItemId];

  if (pageTitle === "NEWS" || pageTitle === "EVENTS") {
    let articlePageSlug = "";

    let articleBody = "";
    let itemImageURL = "";
    let itemTitle = "";

    if (
      galleryItemData.hasOwnProperty("TSAArticleBody") &&
      galleryItemData.TSAArticleBody.length
    ) {
      articleBody = JSON.stringify(
        encodeURIComponent(galleryItemData.TSAArticleBody)
      );
      itemImageURL = galleryItemData.TSAImageURL;
      itemTitle = galleryItemData.TSAArticleTitle;
    } else if (
      galleryItemData.hasOwnProperty("TSAArticleBodyHTMLRaw") &&
      galleryItemData.TSAArticleBodyHTMLRaw.length
    ) {
      articleBody = JSON.stringify(
        encodeURIComponent(galleryItemData.TSAArticleBodyHTMLRaw)
      );
      itemImageURL = galleryItemData.TSAImageURL;
      itemTitle = galleryItemData.TSAArticleTitle;
    }

    if (articleBody) {
      articlePageSlug = "article?";

      if (articleBody) {
        if (articlePageSlug.slice(-1) !== "?") {
          articlePageSlug += "&";
        }

        articlePageSlug += `articleBody=${articleBody}`;
      }

      if (itemImageURL) {
        if (articlePageSlug.slice(-1) !== "?") {
          articlePageSlug += "&";
        }

        articlePageSlug += `itemImageURL=${itemImageURL}`;
      }

      if (itemTitle) {
        if (articlePageSlug.slice(-1) !== "?") {
          articlePageSlug += "&";
        }

        articlePageSlug += `itemTitle=${itemTitle}`;
      }
    }

    data.articlePageSlug = articlePageSlug;
  } else {
    let externalLink = galleryItemData.hasOwnProperty("TSAFileURL")
      ? galleryItemData.TSAFileURL
      : "";

    data.externalLink = externalLink;
  }

  return data;
}
```

**Code explanation:**

1.  lines 2-15: getting the data from the page and filtering udt data to have only needed lines;
2.  line 18: getting data for currently clicked gallery item using galleryItemId;
3.  line 20: if page is News or Events (pages with sections);
4.  lines 23-75: forming the needed data to get slug with page parameters for article page;
5.  lines 76-82: if it's the page without sections - we're forming the External Link to navigate to, instead of article page.

When the script is finished - we will have either articlePageSlug parameter not empty or externalLink parameter. They cannot both be not empty at the same time. We can use it for configuring the next steps in the flow.

**Navigate To (Navigate To Article Page)**

This action is a default flow logic block Navigate To which will navigate to the article slug:

![](/static/image-840.png)

Then we're setting it as Disabled and configuring the rule. This block will be disabled only if the rule returns true. In our case, we should not navigate to article page if the articlePageSlug is empty:

![](/static/image-841.png)

**Open External (Open external link)**

The next logic block which we want to add is Open External. We want it to open an external link in a new tab:

![](/static/image-842.png)

Then we need to add disabled rule for this block too. It should be disabled if the externalLink is empty:

![](/static/image-843.png)

As a result we have different actions performed based on current page's type. So the page without sections, for example Education, works fine now:

![](/static/image-844.png)

But we still need to create an Article page to see the detailed data of the items on the Events page and all of the other pages with sections.

## Creating Dynamic Article Page

!!!info
You can check the described page: Page Builder -> Dynamic Article Page.
!!!

### Layout

The layout for the article page is the next. We have "Go Back" button at the top of the page, which should navigate us to the previous page; under the button there is a gallery block with one image with title - the main image of the item which was clicked before on dynamic UDT page; and at the bottom of the page we have a Rich Text block with HTML code with some description of the current item:

![](/static/image-845.png)

![](/static/image-846.png)

### Parameters

Previously we were forming the slug to navigate to the article page - we were forming the parameters there too. So now we should create all of them on the Article Page:

1.  **itemTitle** - the title of the main gallery item;
2.  **itemImageURL** - the image URL for the main gallery item;
3.  **articleBody** - the HTML code of the article which should be shown in the Rich Text block.

All of these parameters were found in Gallery Item On Click script on Dynamic UDT Page, so we don't need to get data from UDT again or do something on Article Page Load. We already have all the needed data for forming page blocks.

### Go Back Button

To navigate to the previous page we should create a flow.

!!!info
You can check the described flow: Flows -> Navigate To Previous Page.
!!!

!!!danger
The Navigate To Previous Page flow will work only if the version of the WebApp Platform addon is 18.3.3 or higher.
!!!

Navigate To Previous Page Flow

We don't need any parameters in this flow, we just need to add 'Navigate To' logic block and select "Back" as a navigation type:

![](/static/image-847.png)

### Gallery OnLoad Flow

!!!info
You can check the described flow: Flows -> Dynamic Article Page - Gallery On Load.
!!!

For Gallery OnLoad flow we will need to create the next parameters:

1.  **itemTitle** - String - External;
2.  **itemImageURL** - String - External;
3.  **configObj** - Object - External.

The same parameters should be created for the script.

!!!info
You can check the described script: Scripts -> Dynamic Article Page - Gallery On Load.
!!!

```
export async function main(data) {
    const itemTitle = data.itemTitle;
    const itemImageURL = data.itemImageURL;

    let root = data.configObj;

    if (root.hasOwnProperty('Cards') && root.Cards.length) {
        root.Cards[0].Title = itemTitle;
        root.Cards[0].AssetURL = itemImageURL;
    }

    data.configuration = root;

    return data;
}
```

We will always have only one gallery item here, so all what we need to do is to set new title and asset URL (image URL) for the first card in the configuration object.

### Rich Text OnLoad Flow

!!!info
You can check the described flow: Flows -> Dynamic Article Page - Set Description.
!!!

For Rich Text OnLoad flow we will need to create the next parameters:

1.  **htmlText** - String - External;
2.  **configObj** - Object - External.

The same parameters should be created for the script.

!!!info
You can check the described script: Scripts -> Dynamic Article Page - Set Description.
!!!

```
export async function main(data) {
    const htmlText = data.htmlText;

    let root = data.configObj;

    if (root.hasOwnProperty('RichText')) {
        root.RichText = htmlText.slice(1, -1);
    }

    data.configuration = root;

    return data;
}
```

All we need to do is to add the htmlText to the RichText property of the configuration object. On 7th line we're using .slice() method to get an html without the first and the last symbols, because the data in UDT was added with some empty symbols there. You should check your data first, so perhaps you don't need it in the code.

The final result for the News page:

All of the categories are the values in the filter block - we can change the category and the gallery will be reloaded with needed gallery items:

![](/static/image-848.png)

If the user clicks on one of the gallery items - he would be redirected to the article page:

![](/static/image-849.png)

![](/static/image-850.png)

User also can return from the article page to the News page.

## Conclusion

You can use it as an example and create your unique dynamic pages with custom parameters, data storing process and format etc.

As a result we get a dynamic page which either have or haven't filter block based on current page type. It also has the gallery block where the items are dynamically updated with needed data based on current selected section from the filter (if the filter is visible). Also each gallery item have the same flow, but it performs different actions depending on the type of the current page.

Such solution is complicated on the first look, but it reduces the amount of pages which is needed to be created and make all of the data-related processes to be dynamic, instead of having hardcoded values and having separate page for each data entry.
