---
title: "Addon Homepage Editor"
order: 288
---
# Addon Homepage Editor

**REMARK** **Dynamic Homepage** is a homepage with the ability to change any part of it without changing its source code. All of its variable parts are displayed in the custom addon interface. The developer can decide himself which parts of the homepage should be changeable and which will not.

## Installation

**IMPORTANT**! All customers **should have already installed** addon with the last version available.

To make sure you’re using the newest version:

1.  Open Addon Manager

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Open-Addon-Manager.png)

2\. Check whether you have these parameters in the query for the url pass

```
?support_user=true
```

3\. Find addon ‘Homepage Editor’

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/find-addon-‘Homepage-Editor’.png)

#### Here you can check which version of the editor you have got right now, and which one is available

## Addon Overview

After verifying the version or installation of the addon, first of all, in the sidebar, you should see the sections for the addon.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/After-verifying-the-version-or-installation-of-the-addon,-first-of-all,-in-the-sidebar,-you-should-see-the-sections-for-the-addon..png)

**Header Editor** – allows to change the config header file

**Body Editor** – allows to change the config body file

**Menu Editor** – allows to load/delete templates and images, etc. (**is not displayed on the screenshot**, since it can only be opened under certain conditions).

**IMPORTANT!** Menu editor is initially not visible for the customer in order to prevent a customer from setting up the page of the addon. There are **two ways to get access to Menu Editor**:

### Option 1

1.  After opening **Header or Body Editor**, add this query to the url pass: **?admin=true**.
2.  In the menu, the ‘Open Menu’ button will show up, it will redirect to the setup page.

### Option 2

1.  After opening **Header or Body Editor**, change the last path of the url from /header\_editor or /body\_editor to /menu\_editor.
2.  The url should look like this - /settings/c22c0b9a-53f2-4412-97e312ee23de7d78/**menu\_editor**

## Menu Editor

There are 3 buttons in top right corner. **The first button** redirects the user to the git repository with various templates that can be used immediately, the **2nd and 3rd buttons** redirect the user back to **Header and Body editors.**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-100.png)

Menu Editor page has 2 tabs:

**Homepage Profiles** – user can create his/her own profiles for the homepage

**(Do not confuse it with user profiles, they are completely different and are not related to each other.)**

**Settings** – **users** can setup/update/remove template, upload/remove images, etc.

Settings tab is also divided into blocks, each block is responsible for a specific functionality of the homepage:

**Addon Homepage Configuration** is used to setup metadata/UI of the Editor.

#### Remark

***What does it mean? For example, the client wants to add new functionality and it should be configurable from the UI. In order to do it, you can specify which part of the template will be configurable and how, it can be done in the metadata file, which is called addon-homepage-tabs.json. It can be regular text – you’ll see an input for it, or selector with different options – you’ll see a dropdown, etc.***

You can configure all parts of the template, it’s just matter of time and requirement. Once you start working with it, you will get it ;)

**Template** – upload/update/remove template from client database.

**Images** - upload/update/remove images. It can be used when our client has already got the images they want to use, in such case you can just upload them to the database and get links of all images immediately.

**User-Images** – shows the number of images that were uploaded though the Editors. To not overload the database with the images that are not already in use, user can remove them here. It is best to keep the database clean and not store files/images that user does not use.

**Web App Files** – shows the number of web app main bar files that were created in the addon. The same as with User-Images, this block is used for cleaning up a database from not used web app main bar files.

## Setup Template

**Repository With Templates and Template Structure**

1.  open a git repository (already described above) and download any template.

The repository has different branches, each branch is a separate template for a customer. Name of the branch is the name of the customer.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-101.png)

**IMPORTANT!** If you work with a new customer, who has different layout or a new functionality, please try to notify people responsible for git, to add your customer template to the repository.

All templates have the same structure, which looks like this:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-102.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-103.png)

Template folder structure Root folder structure

#### The mandatory files are:

\- **Addon-homepage-tabs.json** – metadata for the UI of the Editors. It Indicates which fields are present in the config files and what are the types of these fields. User needs that to indicate them in the addon UI. It is created based on editor\_header\_config.json and editor\_body\_config.json.

\- **The template folder and all files in it** – consists of files that create a template

**dynamic-header-template.js** – building a header **dynamic-body-template.js** – building a body **editor\_header\_config.json** – config file for a header template **editor\_body\_config.json** – config file for a body template

\- **Test folder** – should consist of the same 4 files listed above as in the template folder.

**The Template and Test folders must have the same JSON files** The rest of the files are optional and can be added if necessary

**PAY ATTENTION** check out: [**About the structure of the mandatory files**](https://kbint.pepperi.com/about-the-structure-of-the-mandatory-files)

## Upload Template

After you downloaded your template from a repository, you’re ready to upload it.

upload/remove stuff with template is done in the **Settings** tab.

### Add Addon Homepage Configuration file

Upload addon homepage configuration file in the Addon Homepage Configuration block. (Remember, the template is called - **addon-homepage-tabs.json**)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-104.png)

### Create Homepage Profile

After doing this, you will be redirected to the Homepage Profiles tab, where you can create your first profile.

At first you will see that there is a table with all your profiles. Now you can create your first profile.

**Important**! The first profile is always called **Buyer**, because default setting of the template work only with the Buyer profile. You can create another profile after the Buyer one.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-105.png)

**Click ‘Add Profile’, the dialog will show up. Put profile name and description and click ‘Add’.**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-106.png)

**After Homepage Profile will be create you’ll see the updated table.**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-107.png)

Besides Name and Description fields, there are 3 more fields:

Header File Name – name of the header web app main bar file that is related to this homepage profile.

Body File Name – name of the body web app main bar file that is related to this homepage profile.

Date – when this homepage profile was created.

Before the next step, quick explanation about Header/Body File Name.

So each time, when you create a homepage profile, web app main bar files are created, and they need to be assigned to the user profile. These files are used to define which **homepage profile** will be used for a **user profile**.

## Assign the Homepage Profile to the User Profile

After homepage profile is created, you need to assign the created files to the user profile, which should see a template.

Open WebApp Main Bar page

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-108.png)

Here you should see the user profiles. If you don’t see a profile that you want to use with the template, on the top right of the page, add a profile you need.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-109.png)

Edit the profile and put the files from your homepage profile to the layout (Reminder – the files have the same name as homepage profile), in this order - header -> body.

1.  Header

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-110.png)

2\. Body

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-111.png)

Now your homepage profile is connected to the user profile.

**Important**! The body file will work **ONLY with Buyer** and its child user-profiles, Admin and Rep won’t work. Only the header file.

## Add Template Files

Now go back to the Menu Editor, open Settings tab and Template block

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-112.png)

Each zip file from git repository has a zip file with all necessary files already prepared for the upload.

Use it to upload the template.

Now your template is uploaded and ready to use.

Login as buyer that has the same profile as we connected before and see a template.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-113.png)

## Different Homepage Profiles

After the first homepage profile were created, you can create as many as you want different homepage profiles. The homepage profiles with the same name are not supported.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-114.png)

After you have more than one homepage profile, in Header/Body Editors on top, you will see a dropdown, where you can switch to config file to different profile.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-115.png)

**Important!** All changes are work only for the profile that are displayed on top.

**Important!** All ‘Cancel’, ‘Save’, ‘Publish’ buttons works ONLY for the selected profile. So if you make changes in one profile, then switch to the another and there click on save, it will save ONLY the selected profile and after refresh a page, the changes you made for the first profile WONT be saved.

## Header/Body Editors

After a setup was complete, now in both Editors, you’ll see a lot of the fields and different parts of the template that could be modified/changed/removed. Review everything, change something, save it, see the results in the user that you login as buyer.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-116.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-117.png)

## Save, Import, Export Config File

Header/Body Editor pages have a few features on top right side of the page. From the left to the right

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-118.png)

Last modification date – is the time, when the config files were modified for the last time

Menu:

**Import Config –** allows to import prepared config file.

**Important!** The name of the config file must be either **editor\_header\_config.json or editor\_body\_config.json**, depending on which editor is used to export

**Export Config** – allows to download the config file

**Cancel** – cancels all changes in the test config file. (Takes config from production file and change test config with production data)

**Save** – Save test config file

**Publish** – Save test and production config file. (Production config file, it’s json file which is located in the /template folder)

## Test and Production Config Files

**Important**! About test and prod config files. If you remember, template folders that were downloaded from the git repository, have js, json files and a test folder. There is the same json files as in the parent folder.

It’s used when you want to make some change in the template from the Editors, BUT you don’t want to see it in the production right away.

How to test it? 1. Make some changes in the Editors, click Save.

2\. Open a buyer with the template and add this query to the url **?test=1**

Production template has a url: https://app.pepperi.com/HomePage

Test template has a url: [https://app.pepperi.com/HomePage?test=1](https://app.pepperi.com/HomePage?test=1)

And you will see a changes you just did, but the regular user won’t see any changes. Like this you can test everything regarding texts, images, etc.

## Important Things To Remember When Working With Addon Homepage!

\- When you change a template code and you’re ready to upload your new template, MAKE SURE you correctly created a zip file of your template.

1\. Zip file **SHOULD NOT** contain addon-homepage-tabs.json file

2\. It should be from the root folder, like on the picture, select all folders and make a zip file of them.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-119.png)

\- In your client in production and you need to make some changes in the template code, be really careful with it, because in order to reupload a template, you need to remove the old one first. Always have a backup of the old one.

\- The first profile is always called Buyer, because default setting of the template only works with the Buyer profile.

\- The body web app main bar file will work ONLY with Buyer and its child user-profiles, Admin and Rep won’t work, only header file.

\- All ‘Cancel’, ‘Save’, ‘Publish’ buttons work ONLY for the selected profile. So if you make changes in one profile, then switch to the another and there click on save, it will save ONLY the selected profile and after refresh a page, the changes you made for the first profile WONT be saved.

\- If you’re working with new customer, which have a different layout or a new functionality, please try to notify people responsible for git, to add your customer template to the repository.

\- If you noticed a bug in the addon or you think some additional features can be added here, notify people responsible for the addon to discuss this and make this addon better.

## The structure of the mandatory files

**Addon-homepage-tabs.json structure**

Available fields:

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| Name | Type | Value | Required | Description |
| Config file type | Array of objects | “Profiles”, “Header” or “Body” | Yes | Which config file these fields will refer to |
| ID | String | String | Yes | Object or array name in config.json |
| Name | String | String | Yes | Name of the ID field in the addon UI |
| Table | Boolean | True, False | Yes | Field type ID, true - array, false - object |
| Fields | Array of objects | Objects | Yes | An array of objects, where each object is a field description |
| Title | String | String | Yes | Name of the ID field in the addon UI |
| Type | String | All available field types (link to git: , with field types, check out README) | Yes | Field type |

Code example:

```
{
  "Header": [
    {
      "ID": "General Info",
      "Name": "General Info",
      "Table": false,
      "Fields": [
        {
          "ID": "Logo URL",
          "Title": "Logo URL",
          "Type": "image"
        },
        {
          "ID": "Favicon URL",
          "Title": "Favicon URL",
          "Type": "image"
        },
        {
          "ID": "Tab Title",
          "Title": "Tab Title",
          "Type": "text"
        },
        {
          "ID": "Main Transaction",
          "Title": "Main Transaction",
          "Type": "text"
        },
        {
          "ID": "Main Catalog",
          "Title": "Main Catalog",
          "Type": "text"
        }
      ]
    }
  ]
}
```

The "**Body**" array will look the same way.

## The structure of dynamic-header-template.js and dynamic-body-template.js

|  |  |
| --- | --- |
| Code | Description |
| var customConfigHeader = {}; | Namespace definition |
| this.context;<br><br>this.accountUUID;<br><br>this.catalogName;<br><br>this.transactionName;<br><br>this.catalogs; | Global variables |
| this.startup = async function (parentContext, storage) | The first function to be called in this file |
| customConfigHeader.appendConfigFiles = async function (storage) {<br><br>return await new Promise((resolve) => {<br><br>var uploadedFiles = 0;<br><br>var filePaths = \[<br><br>"dynamicHP/header/header\_helper.js",<br><br>"dynamicHP/header/food-header.css"<br><br>\];<br><br>var filteredStorage = storage.filter(({Title}) => {<br><br>return filePaths.includes(Title)<br><br>})<br><br>filteredStorage.forEach(el => {<br><br>var file = '';<br><br>if (el\["URL"\].includes('.js')) {<br><br>file = document.createElement("script");<br><br>file.src = el\["URL"\];<br><br>} else if (el\["URL"\].includes('.css')) {<br><br>file = document.createElement("link");<br><br>file.rel = "stylesheet";<br><br>file.type = "text/css"<br><br>file.href = el\["URL"\];<br><br>}<br><br>document.getElementsByTagName("head")\[0\].appendChild(file);<br><br>file.onload = function () {<br><br>uploadedFiles++;<br><br>if (uploadedFiles == filePaths.length) {<br><br>resolve(uploadedFiles)<br><br>}<br><br>};<br><br>})<br><br>})<br><br>} | Appends files from file storage (storage) to homepage.<br><br>In it, what you need to specify is the path to the files that need to be appended.<br><br>Path structure:"**dynamicHP/**path\_to\_file"<br><br>All files that are needed to build a header or body are indicated, all file paths are in an array. Example:<br><br>var filePaths = \[ "dynamicHP/header/header\_helper.js,<br><br>"dynamicHP/header/food-header.css"<br><br>\]; |
| customConfigHeader.setHeaderSettings() | sets the Favicon and Title for the page from the config file (only applicable in dynamic-header-template.js) |

The rest of the functions work exactly the same as in the regular Homepage and can be added as needed.

## Structure editor header config.json and editor_body config.json

Addon-homepage-tabs is built on the basis of config files, in the config file the developer decides what he wants to make dynamic, the entire config file can be changed through the addon.

The config file can contain only objects or arrays.

If this is an **object**, then in addon-homepage-tabs to this field, the **table** value must be **false**

If it is an array, then in addon-homepage-tabs to this field, the **table** value must be **true**

The array consists of objects, the same structure, all the keys of the objects must be the same and must converge with the fields in addon-homepage-tabs

Example:

```
{
  "GeneralInfo": {
    "TransactionType": "Sales Order",
    "Catalog": "Default Catalog",
    "ChatURL": ""
  },
  "Carousel": [
    {
      "Title": "Title 1",
      "Description": "",
      "DeepLink": "/Transactions/scope_items/{{UUID}}",
      "ButtonText": "Button 1",
      "ImageURL": "http://storage.pepperi.com/Beauty_demo/3.jpg"
    },
    {
      "Title": "Title 2",
      "Description": "",
      "DeepLink": "/Transactions/scope_items/{{UUID}}",
      "ButtonText": "Button 2",
      "ImageURL": "http://storage.pepperi.com/Beauty_demo/4.jpg"
    },
    {
      "Title": "Title 3",
      "Description": "",
      "DeepLink": "/Transactions/scope_items/{{UUID}}",
      "ButtonText": "Button 3",
      "ImageURL": "http://storage.pepperi.com/Beauty_demo/5.jpg"
    }
  ]
}
```

An example addon-homepage-tabs file for this config:

```
{
  "Body": [
    {
      "ID": "General Info",
      "Name": "General Info",
      "Table": false,
      "Fields": [
        {
          "ID": "Transaction Type",
          "Title": "Transaction Type",
          "Type": "text"
        },
        {
          "ID": "Catalog",
          "Title": "Catalog",
          "Type": "text"
        },
        {
          "ID": "Chat URL",
          "Title": "Chat URL",
          "Type": "text"
        }
      ]
    },
    {
      "ID": "Carousel",
      "Name": "Carousel",
      "Table": true,
      "Fields": [
        {
          "ID": "Title",
          "Title": "Title",
          "Type": "text"
        },
        {
          "ID": "Description",
          "Title": "Description",
          "Type": "text"
        },
        {
          "ID": "DeepLink",
          "Title": "DeepLink",
          "Type": "text"
        },
        {
          "ID": "ButtonText",
          "Title": "ButtonText",
          "Type": "text"
        },
        {
          "ID": "Image URL",
          "Title": "Image URL",
          "Type": "image"
        }
      ]
    }
  ]
}
```
