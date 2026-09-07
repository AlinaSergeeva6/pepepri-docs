---
description: The Pages resource
---

# Pages

A standard pepperi resource that supports get & post

{% hint style="warning" %}
Does not support where clause and fields
{% endhint %}

{% hint style="info" %}
Soft limits per page - number of block 15 and max page size 150KB&#x20;
{% endhint %}

## Pages resource

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/pages`

#### Path Parameters

| Name | Type   | Description |
| ---- | ------ | ----------- |
|      | string |             |

{% tabs %}
{% tab title="200 " %}
```json
[
    {
        // Regular ADAL fields
        "Hidden": false,
        "CreationDateTime": "2021-07-22T13:00:11.360Z",
        "ModificationDateTime": "2021-07-22T13:00:11.360Z",

        // unique key. 
        // created on first upsert
        "Key": "610bdf75-d66e-4126-bfc4-0bb74eeabcab",

        // optional
        "Name": "MyPage",
        
        // optional
        "Description": "",

        // optiona; - List of Parameters for initialize the page.
        "Parameters": [{
            "Key": string,
            "Type": 'String',
            "Description": string, // Optional
            "DefaultValue": any // Optional
        }],
        
        // optional - a flow to run in "OnClientPageLoad" client event.
        "OnLoadFlow": {
        },
        
        // A list of the blocks on the page
        // We might want to move the actual data of each block to a seperate internal resource
        "Blocks": [
            {
                // A Key of the block instance 
                "Key": "99dfdff5-d042-4f4b-94ec-1d4fb238adba",

                // ******** DEPRECATED ********
                // A copy of the relation object when this block was added the page
                "Relation": {
                    "Name": "GalleryBlock",
                    "SubType": "Ng12",
                    "AddonUUID": "a6f4fd84-d539-41a5-9ff6-946bddebf4d1",
                    "AddonRelativeURL": "/addon_block",
                    "ModuleName": "MyModule",
                    "ComponentName": "MyComponent",
                    "Schema": // pepperi schema - optional
                },
                // ******** DEPRECATED ********
                
                "Configuration": {
                    "Resource": "GalleryBlock", // Block Relation.Name
                    "AddonUUID": "a6f4fd84-d539-41a5-9ff6-946bddebf4d1", // Block Addon UUID
                    "Data": {
                        // the blocks configuration (base configuration)
                    }
                },
                
                // this will override the base configuration (Configuration.Data)
                // in the specific ScreenSize
                // optional
                "ConfigurationPerScreenSize": {
                    "Tablet": {
                        // the blocks configuration
                    },
                    "Mobile": {
                        // the blocks configuration
                    }
                },

                // The block relation configuration
                // optional
                "PageConfiguration": {
                    "Parameters": [
                        {
                            // the key of the expected parameter
                            "Key": "ItemUUID",
                      
                            // the type of the expected parameter
                            "Type": "String",

                            // optional: default false
                            "Produce": true,

                            // optional: default false
                            "Consume": true,
                        }
                    ]
                }
            }
        ],

        // A list of sections in the page
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
                                "Hide": ["Desktop", "Tablet", "Mobile"]
                            }
                        }
                    ],

                    // Hide the section in certain screen sizes
                    // default is empty array
                    "Hide": ["Tablet", "Phablet", "Landscape"]
                }
            ],

            // The Gap between the sections
            // optional
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
        }
    }
]
```
{% endtab %}
{% endtabs %}

## Pages resource

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/pages`

#### Path Parameters

| Name | Type   | Description  |
| ---- | ------ | ------------ |
|      | string | SCwjHTS098st |
