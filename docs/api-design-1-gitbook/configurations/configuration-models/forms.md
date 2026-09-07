---
description: The configuration object for the forms
---

# Forms

Forms is a meta data [resource](../../) which represents a configuration for a list of objects for [generic resource](../../generic-resources/) (see above)

it contains following configurations:

* line configuration within the form
* reference for editor of the object&#x20;
* layout
* blocks
* parameters

## Form Configuration Model

The following is the model of the form object to be stored in the configurations. \
To get supported Scheme fields use FORM\_CONFIGURATION\_SCHEME\_FIELDS value from @pepperi-addons/papi-sdk (v 1.81.22). \
\
Each addon that allows configurations of form stores these configuration object in their own data store, usually their own configuration table.&#x20;

Key should be auto generated



#### FormConfiguration

| Name                                     | Type                          | Description                                                                                                                |
| ---------------------------------------- | ----------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| SchemaName\*                             | String                        | the resource that the view will display, resource can be abstract                                                          |
| SchemaAddonUUID\*                        | String                        | The schema Addon UUID                                                                                                      |
| Layout<mark style="color:red;">\*</mark> | PepLayout                     |                                                                                                                            |
| Blocks<mark style="color:red;">\*</mark> | FormConfigurationViewBlock\[] |                                                                                                                            |
| Parameters                               | FormConfigurationParameter    | <p>Parameters that can be passed into the Form at run time.<br>These paramters are applied to any view configuration. </p> |



{% tabs %}
{% tab title="200: OK " %}
```typescript
{
    SchemaName: "accounts",
    SchemaAddonUUID: "0e2ae613-a26a-4c26-81fe-13bdd2e4a333"
    Layout: {
        Sections: [
            {
                Key: "0e2ae613-a26a-4c26-81fe-13bdd2e4a555",
                Name: "Section 1"
                Split: "1/2 1/2", 
                Columns: [
                    {
                        BlockContainer: {
                            BlockKey: "0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa2" 
                        }
                    }
                ]
            }
        ],
        SectionsGap: "sm",
        ColumnsGap: "sm",
        HorizontalSpacing: "sm",
    }
    Blocks: [
        {
            Key: "0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa2"
            Title: "My name",
            AvailableViewBlockKey: "Add-1",
            Configuration: {},
            Relation: {
                DrawURL: 'addon-cpi/drawViewBlock',
                AddonUUID: '0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa7'
            },
                        
        },
    ]
}
```
{% endtab %}
{% endtabs %}

### Layout

```typescript
interface PepLayout { //exactly as pep layout
    Sections: PepLayoutSection[]
    //The gap between sections
    SectionsGap?: "sm" | "md" | "lg"
    //The gap between columns inside the sections
    ColumnsGap?: "sm" | "md" | "lg"
    // The Spacing to the left and right of the page
    HorizontalSpacing?: "sm" | "md" | "lg"
    //The maximum width of the form
    MaxWidth?: number
}

interface PepLayoutSection {
    Key: string
    Name: string
    Height: number //in rem
    // Split: For 1 part this must be empty
    // For 2 parts this must be "1/2 1/2" | "1/3 2/3" | "2/3 1/3"
    // For 3 parts this must be "1/3 1/3 1/3" | "1/2 1/4 1/4" | "1/4 1/2 1/4" | "1/4 1/4 1/2"
    // For 4 parts this must be "1/4 1/4 1/4 1/4" etc.
    Split: string 
    // The blocks in the section LTR
    Columns: PepLayoutSectionColumn[]
    // Hide the section in certain screen sizes
    // default is empty array
    Hide: ("Tablet" | "Phablet" | "Landscape")[] 
}

interface PepLayoutSectionColumn {
    BlockContainer: {
        BlockKey: string 
        Hide: ("Tablet" | "Phablet" | "Landscape")[] 
    }
}
```

### FormViewBlock

```typescript
type FormConfigurationViewBlock = {
   Key: "5e2ae61b-a26a-4c26-81fe-13bdd2e4aaa2"
   Title: "My name",
   AvailableViewBlockKey: "Add-1",
   Configuration: {},
   Relation: FormConfigurationViewBlockRelation
}

interface FormConfigurationViewBlockRelation {
   Name: string
   AddonUUID: string;
   DrawURL: string;
}
```

