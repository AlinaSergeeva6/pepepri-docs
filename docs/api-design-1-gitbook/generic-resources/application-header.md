---
description: >-
  Header: GUI (graphical user interface) element, contains a collection of
  buttons at the top of our applications. It typically contains a collection of
  menu items (optionally) and buttons.
---

# Application Header

### Description

Application header  addon give the ability to build custom header object.  this object return as json to our devices from the ''OnClientAppHeaderLoad" client event. if there is no mapped header slug the device will get a default json header.

### Header priority

The header build priority is:

1. Mapped Header - from the application header addon.
2. Custom Header - js header.
3. Default Header - return from the application header if there is no mapped header.



### Fields

_**Name**_**:**

* **Description:** Header name.
* **Type:** string
* **Mandatory**: true
* **Default Value**: empty string.

_**Description**_**:**

* **Description:** Header description.&#x20;
* **Type:** string
* **Mandatory**: false
* **Default Value**: empty string

**Key:**

* **Description:**  UUID - used for edit or delete exiting header.
* **Type:** string
* **Mandatory**: false
* **Default Value**: null

_**Draft**_**:**

* **Description:** show if header saved on draft table.
* **Type:** bool
* **Mandatory**: false
* **Default Value**: false

_**Published**_**:**

* **Description:** show if header saved on published table.
* **Type:** bool
* **Mandatory**: false
* **Default Value**: false

_**Hidden**_**:**

* **Description:** Used for deleting an header.
* **Type:** bool
* **Mandatory**: false
* **Default Value**: false

_**Buttons**_**:**

* **Description:**  array of Buttons&#x20;
* **Type:** Buttons

```
 {
            "Key": string = ""
            "Type": string = "" //'Notification' | 'Settings' | 'SystemAvatar' |
                                // 'Support' | 'Announcekit' | 'Regular';
            "Icon": {
                "Type": "System",
                "Name": "bell"
            }
            "Badge": {
                "Visible": true/false,
                "Title": ""
            }
            "Visible": true|false,
            "Enabled": true|false,
        }
```

* **Mandatory**: false
* **Default Value**: empty array.

_**Menu**_**:**

* **Description:**  array of Menu items&#x20;
* **Type:** MenuButtonData

```
menuItem   {
                "Type": "Group", /* Group | Button | Seperator */
                "Title": string,
                "Key": "string" // used to edit & delete menu items
                "HierarchyLevel" // 0 | 1 | 2 - set item level.
                "Visible": boolean,
                "Enabled": boolean,
                "Items" : [ 
                                /*contain menu items*/ 
                ]
           }
```

* **Mandatory**: false
* **Default Value**: empty array.
