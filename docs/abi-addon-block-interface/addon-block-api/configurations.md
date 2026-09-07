---
description: >-
  ABI component for displaying a list of drafts, with deleting and publishing
  drafts of a specific configuration scheme.
---

# Configurations

## name = ConfigurationList

## host object properties

* **addonUUID** - string, the owner's uuid of the [configuration scheme](../../configurations/configurations-schemes.md)
* **configurationSchemaName** - string, the name property in the configuration scheme
* **title** - string, optional, the title of the list
* **emptyMsg** - string, optional, the message that will be displayed if there are no [drafts](../../configurations/drafts.md)
* **lineMenu** -  {Visible: boolean, Title: string, Key: string, Type: "System" | "Addon"}\[]
* **menu** - {Visible: boolean, Title: string, Key: string, Type: "System" | "Addon", ButtonStyleType?: PepButtonStyleType}\[]
* **inlineMode** - boolean, optional, whether the list reside on the whole page, or inline with the rest of the UI components. default value is **true.**

## defaults:

```typescript
const lineMenu = [
    {
        Visible: true,
        Title: 'Delete',
        Key: 'delete',
        Type: 'System',
    },
    {
        Visible: true,
        Title: 'Duplicate',
        Key: 'duplicate',
        Type: 'System'
    },
    {
        Visible: true,
        Title: 'Import',
        Key: 'import',
        Type: 'System'
    },
    {
        Visible: true,
        Title: 'Export',
        Key: 'export',
        Type: 'System'
    },
    {
        Visible: true,
        Title: 'Edit',
        Key: 'edit',
        Type: 'Addon'
    }
]

const menu = [
    {
        Visible: true,
        Title: 'Add',
        Key: 'add',
        Type: 'Addon'
        ButtonStyleType: "Strong"
    }
]         
```

## host events

* **onMenuItemClick** - will fired when the user press edit.\
  input: {action: 'Edit', data: {Key: string\}} // the key of the [draft](../../configurations/drafts.md)

```typescript
{
    action: 'edit', //the key of the menu block
    data: {
            Key: 'b401993e-40e7-11ee-be56-0242ac120002' //will send key only on line menu click
    }
}

//example 2 
{
    action: 'add',
    data: {}
}
```

