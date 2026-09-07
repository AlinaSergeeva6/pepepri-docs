---
description: standard pepperi resource, layout configuration of pepperi generic resource
---

# Lists

Lists is a meta data [resource](../../) which represents a configuration for a list of objects for [generic resource](../../generic-resources/) (see above)

it contains following configurations:

* line configuration within the list
* reference for editor of the object&#x20;
* list menu (AKA burger menu)
* line menu (AKA pencil menu)
* search&#x20;
* smart search
* filter
* sorting&#x20;
* parameters
* objectsConfig

## List Configuration Model

The following is the model of the List object to be stored in the configurations. \
To get supported Scheme fields use LIST\_CONFIGURATION\_SCHEME\_FIELDS value from @pepperi-addons/papi-sdk (v 1.81.22).\
\
Each addon that allows configurations of list stores these configuration object in their own data store, usually their own configuration table.&#x20;

Name should not be unique&#x20;

Key should be auto generated



#### ListConfiguration

| Name                                         | Type                         | Description                                                                                                                                           |
| -------------------------------------------- | ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Name<mark style="color:red;">\*</mark>       | String                       | the name of the view                                                                                                                                  |
| SchemaName<mark style="color:red;">\*</mark> | String                       | the resource that the view will display, resource can be abstract                                                                                     |
| SchemaAddonUUID\*                            | String                       | The schema Addon UUID                                                                                                                                 |
| Description                                  | String                       | description of the view                                                                                                                               |
| Views                                        | ListConfigurationView\[]     | <p>The data view of the view.</p><p>Default - all fields will be visible.</p>                                                                         |
| Menu                                         | ListConfigurationMenu        | <p>Data view of the main actions( the new button + the burger menu).</p><p>Default all options will be available.</p>                                 |
| LineMenu                                     | ListConfigurationMenu        | <p>will describe the line menu actions(aka pencil drop down)</p><p>Default all options will be available.</p>                                         |
| Search                                       | ListConfigurationSearch      | <p>Will describe the search configuration.</p><p>Default only Key will be searchable.</p>                                                             |
| SmartSearch                                  | ListConfigurationSmartSearch | <p>Will describe the smart search configuration.</p><p>Default no field will configured for smart search.</p>                                         |
| Filter                                       | JSONFilter                   | <p>will used to filter the data on load.</p><p>Default no filter.</p>                                                                                 |
| Sorting                                      | ListSorting                  | <p>will used to sort the data.</p><p>Default no sorting will be implemented.</p>                                                                      |
| SelectionType                                | String                       | "Single" \| "Multi" \| "None"                                                                                                                         |
| Parameters                                   | ListConfigurationParameter   | <p>Parameters that can be passed into the list at run time.<br>These paramters are applied to the Filter object, or any menu item configuration. </p> |
| ObjectsConfig                                | ObjectsConfig                | Objects config in case that the data is external and not from UDC                                                                                     |

{% tabs %}
{% tab title="200: OK " %}
```typescript
{
    Name: "FirstList",
    SchemaName: "Friends",
    SchemaAddonUUID: "0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa3"
    Views: [
        {
            Key: "7debbfa8-a085-11ed-a8fc-0242ac120002",
            Type: "Grid",
            Title: "FirstView",
            Blocks: [
                {
                    Key: "0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa2"
                    Title: "My name",
                    Width: 10,
                    AvailableViewBlockKey: "Add-1",
                    Configuration: {},
                    Relation: {
                        DrawURL: 'addon-cpi/drawMenuBlock',
                        AddonUUID: '0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa3'
                    },
                    
                },
            ],
        }
    ],
    Menu: {
        Blocks: [
            {
                Key: "0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa4",
                AvailableMenuBlockKey: "Add-1",
                Title: "Add",
                ButtonStyleType: "Strong",
                Configuration: {},
                Relation: {
                    DrawURL: 'addon-cpi/drawMenuBlock',
                    AddonUUID: '0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa3',
                    ExecutionURL: 'addon-cpi/executeMenuBlock'
                }
            }
        ]
    },
    LineMenu: {
        Blocks: [
            {
                Key: '0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa4',
                AvailableMenuBlockKey: "Add-1",
                Title: "Add",
                ButtonStyleType: "Strong",
                Configuration: {},
                Relation: {
                    DrawURL: 'addon-cpi/drawMenuBlock',
                    AddonUUID: '0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa3',
                    ExecutionURL: 'addon-cpi/executeMenuBlock'
                }
            }
        ]
    },
    Search: {
        Fields: [
            {
                FieldID: "Key"
            },
            {
                FieldID: "name"
            }
        ]
    },
    SmartSearch: {
        Fields: [
            {
                FieldID: "name",
                Title: "name",
                Type: "String"
            },
            {
                FieldID: "age",
                Title: "name",
                Type: "String"
            }
        ]
    },
    SelectionType: "Single",
    Sorting: {Ascending: false, FieldID: "name"}
}
```
{% endtab %}
{% endtabs %}

## View &#x20;

```typescript
interface ListConfigurationView {
    Key: string;
    Type: ListViewType
    Title: string;
    Blocks: ListConfigurationViewBlock[]
}

interface ListConfigurationViewBlock {
    Key: string;
    AvailableViewBlockKey: string;
    Title: string;
    Width: number;
    Configuration: any;
    Relation: ListConfigurationViewBlockRelation
}

interface ListConfigurationViewBlockRelation {
    AddonUUID: string;
    DrawURL: string;
    ExecutionURL: string;
}

export type ListViewType = "Grid" | "Card" | "Line";

```

The order of the fields array will be the order of the columns in the list (the K'th element in the array will be the K'th column).

## Menu | Line Menu

```typescript
interface ListConfigurationMenu {
    Blocks: ListConfigurationMenuBlock[];
}

export interface ListConfigurationMenuBlock {
    Key: string;
    AvailableMenuBlockKey: string;
    Title: string;
    ButtonStyleType?: ListMenuButtonStyleType; // Menu usage only - If exist then this is a button
    Configuration: any;
    Relation: ListConfigurationMenuBlockRelation;
}

interface ListConfigurationMenuBlockRelation {
    AddonUUID: string;
    DrawURL: string;
    ExecutionURL: string;
}

type ListMenuButtonStyleType = 'Weak' | 'WeakInvert' | 'Regular' | 'Strong';
```

The order of the fields array will be the order of the items in the menu | line menu (except ButtonStyleType which is a button).

## Search

```typescript
export interface ListConfigurationSearch {
    Fields: ListConfigurationSearchField[];
}

export interface ListConfigurationSearchField {
    FieldID: string;
}

export interface ListConfigurationSmartSearch {
    Fields: ListConfigurationSmartSearchField[];
}

export interface ListConfigurationSmartSearchField {
    FieldID: string;
    Title: string;
    Type: SchemeFieldType
}
```

Search configuration is used to configure search and smart search.\
Every string in the array must match the name of one of the resource fields.\
In the case of smart search the order of the array will be match the order of the fields in the smart search component.

## Sorting

```typescript
interface ListSorting {
    FieldID: string;
    Ascending: boolean;
}
```

## Parameters

```typescript
interface ConfigurationParameter {
    Key: string;
    Type: SchemeFieldType;
    Description?: string;
    DefaultValue: any;
}
```

## ObjectsConfig

```typescript
interface ConfigurationParameter {
    AddonUUID: string;
    ObjectKeyFieldID?: string; // default key
    GetURL: string;
    DeleteURL?: string;
    RestoreURL?: string;
    UpsertURL?: string;
}
```

### **Communication API** <a href="#communication-api" id="communication-api"></a>

**Introduction**

The **ObjectsConfig** is for handle external objects (not form UDC).\
all of the URL properties are CPI Endpoints (should be implemented in the Addon CPI side).

#### GetURL <a href="#blockloadendpoint" id="blockloadendpoint"></a>

This endpoint is called for get the list objects.

The endpoint should be **POST**

**Request Body**

```
{
    // Pepperi SearchBody object 
    Search: {
       Where?: string;
       Page?: number;
       PageSize?: number;
       IncludeCount?: boolean;
       IncludeDeleted?: boolean;
       Fields?: string[];
       OrderBy?: string; 
    }
}
```

**Response Body**&#x20;

```
{
    Objects: any[];
    Count?: number;
}
```

#### DeleteURL / RestoreURL <a href="#blockloadendpoint" id="blockloadendpoint"></a>

This endpoint is called for delete / restore one object from the list objects.

The endpoint should be **POST**

**Request Body**

```
{
    Key: string
}
```

#### UpsertURL <a href="#blockloadendpoint" id="blockloadendpoint"></a>

This endpoint is called for upsert object.

The endpoint should be **POST**

**Request Body**

```
{
    item: any
}
```
