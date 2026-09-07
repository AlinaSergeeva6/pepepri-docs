---
description: Manage the relations between addons
---

# Addon Relations

This mechanism is the method to implement a connection between addons (not notifications - refer to PNS for notifications).\
The connection is anonymous, meaning that there is no coupling between the addon that defines the relation (**host**) and the addon that would like to use it (**hostee**).

## **Examples:**

The following are 2 examples of addons hosting other addons.

#### Import-Export-ATD addon:

The import export ATD addon hosts other addons by calling them when an import or export is performed, allowing them to add data to the exported object that they can then use when it is imported. (eg. **UOM** creates special fields, and ADAL data per ATD that it is installed on)

#### ATD-Editor Addon

The ATD editor addon hosts other addons within it's UI, in its menus and tabs. The addons in the menu are then called for action, and their UI is displayed within the tabs.

## Definitions

#### Relation Name&#x20;

Every hosting addon defines one or multiple relation names that define the connection. \
Every relation name specifies the relation types it supports, and additional parameters in the Relation Names tab.

#### Type

Every relation type defines basic Relation Fields that are common for all relations of this type, and it defines the communication API's (eg. Angular input for Component type).

## Relations Endpoint

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/addons/data/relations`

This is a regular ADAL resource for registering to an Addon Relation&#x20;

{% tabs %}
{% tab title="200 Relation successfully retrieved.
Unique Key = Name + AddonUUID + RelationName" %}
```javascript
[
    {
        "Name": "", // mandatory
        "AddonUUID": "1234" // mandatory
        "RelationName": "ATDExport", // mandatory
        "Type": "AddonAPI" | "NgComponent" | "Navigation", // mandatory
        "Description": "",
         [key: string]: any // additional fields per Type
    }
]
```
{% endtab %}
{% endtabs %}

{% hint style="warning" %}
hosting addons with menus should use the description as the Title\
What do we do about localization? suggestions are welcome
{% endhint %}
