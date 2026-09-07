---
description: >-
  Forms addon is a headless addon, therefore forms addon holding state and on
  each operation that the client do, the form emit an event.
---

# Form events

#### Response Body (For all the endpoints)

```
interface FormContainer {
    Form?: FormConfiguration;
    Object?: {[key: string]: unkown}
    FormView: FormView,
    Parameters?: {
        [key: string]: any;
    };
}

interface FormView {
    Key: string;
    Layout?: Partial<PepLayout>;//the things that changed in the layout
    Blocks?: FormViewBlock[];//the blocks that has been changed 
}
```

#### Example

```json
{
    "Object": {
        "Key": "73f750f6-04aa-45ad-8fef-5b57ed9392bc",
        "name": "A"
    },
    "FormView": {
        "Layout": {
            "Sections": [
                {
                    // The unique key of the section
                    // mandatory
                    "Key": "99dfdff5-d042-4f4b-94ec-1d4fb238adba",
                    // the name of the section
                    // to be shown in the UI
                    "Name": "",
                    // The fixed height
                    // or min height when IsHeightFixed=false
                    // The units is rem
                    "Height": 350,
                    // How do the columns split in the section
                    // For 1 part this must be empty
                    // For 2 parts this must be "1/2 1/2" | "1/3 2/3" | "2/3 1/3"
                    // For 3 parts this must be "1/3 1/3 1/3" | "1/2 1/4 1/4" | "1/4 1/2 1/4" | "1/4 1/4 1/2"
                    // For 4 parts this must be "1/4 1/4 1/4 1/4" etc.
                    "Split": "",
                    // The blocks in the section LTR
                    "Columns": [
                        {
                            // optional - default empty column
                            "BlockContainer": {
                                "BlockKey": "99dfdff5-d042-4f4b-94ec-1d4fb238adba",
                                // Hide the block in certain screen sizes
                                // default is empty array
                                "Hide": [
                                    "Desktop",
                                    "Tablet",
                                    "Mobile"
                                ]
                            }
                        }
                    ],
                    // Hide the section in certain screen sizes
                    // default is empty array
                    "Hide": [
                        "Tablet",
                        "Phablet",
                        "Landscape"
                    ]
                }
            ],
            // The Gap between the sections
            // optional§
            "SectionsGap": "sm|md|lg",
            // The Gap between the column in the sections
            // optional
            "CoulmnsGap": "sm|md|lg",
            // The Spacing to the left and right of the page
            // optional
            "HorizontalSpacing": "sm|md|lg",
            // The Spacing to the top and bottom of the page
            // optional
            "VerticalSpacing": "sm|md|lg",
            // The maximum width of the page (in pixels)
            // optional
            "MaxWidth": 1200
        },
        "Blocks": [
            {
                "Key": "99dfdff5-d042-4f4b-94ec-1d4fb238adba",
                "ViewType": "TextBox",
                "View": {
                    "Title": "name",
                    "FieldID": "name", 
                    "Mandatory": true,
                    "Readonly": false
                }
            }
        ]
    }
}
```
