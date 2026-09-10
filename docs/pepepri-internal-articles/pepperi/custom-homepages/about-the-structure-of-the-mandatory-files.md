---
title: "About the structure of the mandatory files"
order: 287
---
# About the structure of the mandatory files

## The structure of the mandatory files (can be allocated on a separate page):

**Addon-homepage-tabs.json structure:**

Available fields:

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| Name | Type | Value | Required | Description |
| Config file type | Array of objects | “Header” or “Body” | Yes | Which config file these fields will refer to |
| ID | String | String | Yes | Object or array name in config.json |
| Name | String | String | Yes | Name of the ID field in the addon UI |
| Table | Boolean | True, False | Yes | Field type ID, true - array, false - object |
| Fields | Array of objects | Objects | Yes | An array of objects, where each object is a field description |
| Title | String | String | Yes | Name of the ID field in the addon UI |
| Type | String | All available field types (link to git: , with field types, check out README) | Yes | Field type |

**PAY ATTENTION** Link to git: [https://github.com/PepperiHomePage/DynamicHomePage](https://github.com/PepperiHomePage/DynamicHomePage) **Code Example:**

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

The "Body" array will look the same way.

**The structure of dynamic-header-template.js and dynamic-body-template.js:**

|  |  |
| --- | --- |
| Code | Description |
| var customConfigHeader = {}; | Namespace definition |
| this.context;<br><br>this.accountUUID;<br><br>this.catalogName;<br><br>this.transactionName;<br><br>this.catalogs; | Global variables |
| this.startup = async function (parentContext, storage) | The first function to be called in this file |
| customConfigHeader.appendConfigFiles = async function (storage) {<br><br>return await new Promise((resolve) => {<br><br>var uploadedFiles = 0;<br><br>var filePaths = \[<br><br>"dynamicHP/header/header\_helper.js",<br><br>"dynamicHP/header/food-header.css"<br><br>\];<br><br>var filteredStorage = storage.filter(({Title}) => {<br><br>return filePaths.includes(Title)<br><br>})<br><br>filteredStorage.forEach(el => {<br><br>var file = '';<br><br>if (el\["URL"\].includes('.js')) {<br><br>file = document.createElement("script");<br><br>file.src = el\["URL"\];<br><br>} else if (el\["URL"\].includes('.css')) {<br><br>file = document.createElement("link");<br><br>file.rel = "stylesheet";<br><br>file.type = "text/css"<br><br>file.href = el\["URL"\];<br><br>}<br><br>document.getElementsByTagName("head")\[0\].appendChild(file);<br><br>file.onload = function () {<br><br>uploadedFiles++;<br><br>if (uploadedFiles == filePaths.length) {<br><br>resolve(uploadedFiles)<br><br>}<br><br>};<br><br>})<br><br>})<br><br>} | Appends files from file storage (storage) to homepage.<br><br>In it, what you need to specify is the path to the files that need to be appended.<br><br>Path structure:"**dynamicHP/**path\_to\_file"<br><br>All files that are needed to build a header or body are indicated, all file paths are in an array. Example:<br><br>var filePaths = \[ "dynamicHP/header/header\_helper.js,<br><br>"dynamicHP/header/food-header.css"<br><br>\]; |
| customConfigHeader.setHeaderSettings() | sets the Favicon and Title for the page from the config file (only applicable in dynamic-header-template.js) |

The rest of the functions work exactly the same as in the regular Homepage and can be added as needed.

### Structure editor header config.json and editor_body config.json:

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
