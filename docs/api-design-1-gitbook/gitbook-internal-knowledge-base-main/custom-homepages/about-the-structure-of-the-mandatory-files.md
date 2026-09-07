# About the structure of the mandatory files

## **The structure of the mandatory files (can be allocated on a separate page):**

**Addon-homepage-tabs.json structure:**

Available fields:

| Name             | Type             | Value                                                                         | Required | Description                                                   |
| ---------------- | ---------------- | ----------------------------------------------------------------------------- | -------- | ------------------------------------------------------------- |
| Config file type | Array of objects | “Header” or “Body”                                                            | Yes      | Which config file these fields will refer to                  |
| ID               | String           | String                                                                        | Yes      | Object or array name in config.json                           |
| Name             | String           | String                                                                        | Yes      | Name of the ID field in the addon UI                          |
| Table            | Boolean          | True, False                                                                   | Yes      | Field type ID, true - array, false - object                   |
| Fields           | Array of objects | Objects                                                                       | Yes      | An array of objects, where each object is a field description |
| Title            | String           | String                                                                        | Yes      | Name of the ID field in the addon UI                          |
| Type             | String           | All available field types (link to git: , with field types, check out README) | Yes      | Field type                                                    |

**PAY ATTENTION**               Link to git: [https://github.com/PepperiHomePage/DynamicHomePage](https://github.com/PepperiHomePage/DynamicHomePage)\
**Code Example:**

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

| Code                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| var customConfigHeader = {};                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Namespace definition                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| <p>this.context;</p><p>this.accountUUID;</p><p>this.catalogName;</p><p>this.transactionName;</p><p>this.catalogs;</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Global variables                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| this.startup = async function (parentContext, storage)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | The first function to be called in this file                                                                                                                                                                                                                                                                                                                                                                                                              |
| <p>  customConfigHeader.appendConfigFiles = async function (storage) {</p><p>    return await new Promise((resolve) => {</p><p>      var uploadedFiles = 0;</p><p>      var filePaths = [</p><p>        "dynamicHP/header/header_helper.js",</p><p>        "dynamicHP/header/food-header.css"</p><p>      ];</p><p>      var filteredStorage = storage.filter(({Title}) => {</p><p>        return filePaths.includes(Title)</p><p>      })</p><p>      filteredStorage.forEach(el => {</p><p>        var file = '';</p><p>        if (el["URL"].includes('.js')) {</p><p>          file = document.createElement("script");</p><p>          file.src = el["URL"];</p><p>        } else if (el["URL"].includes('.css')) {</p><p>          file = document.createElement("link");</p><p>          file.rel = "stylesheet";</p><p>          file.type = "text/css"</p><p>          file.href = el["URL"];</p><p>        }</p><p>        document.getElementsByTagName("head")[0].appendChild(file);</p><p>        file.onload = function () {</p><p>          uploadedFiles++;</p><p>          if (uploadedFiles == filePaths.length) {</p><p>            resolve(uploadedFiles)</p><p>          }</p><p>        };</p><p>      })</p><p>    })</p><p>  }</p> | <p>Appends files from file storage (storage) to homepage.</p><p>In it, what you need to specify is the path to the files that need to be appended.</p><p>Path structure:"<strong>dynamicHP/</strong>path_to_file"</p><p>All files that are needed to build a header or body are indicated, all file paths are in an array.<br> Example:</p><p>var filePaths = [ "dynamicHP/header/header_helper.js,</p><p>"dynamicHP/header/food-header.css"</p><p>];</p> |
| customConfigHeader.setHeaderSettings()                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | sets the Favicon and Title for the page from the config file (only applicable in dynamic-header-template.js)                                                                                                                                                                                                                                                                                                                                              |

The rest of the functions work exactly the same as in the regular Homepage and can be added as needed.

### &#xD;**Structure editor header config.json and editor\_body config.json:**

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
