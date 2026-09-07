# Page Load

**OnClientPageLoad** - When a page load, the page is calling to all the blocks Endpoint ([BlockLoadEndpoint](../../addon-relations/addons-link-table/relation-names/page-block.md)) and the block can return [data](./).\
if the data contains "ChangedParameters" then the page will call all the consumers blocks Endpoint ([BlockLoadEndpoint](../../addon-relations/addons-link-table/relation-names/page-block.md)) of these parameters and return all the blocks data back to the client.

This event data is.

```
{
    // Page key - for runtime usage (in that case 'Page' property is not supplied).
    PageKey: string,
    // The page object - for edit mode usage (in that case 'PageKey' property is not supplied).
    Page: {}, 
    State: {
        // The page parameters (the object represent { key, value }).
        PageParameters: {
            // Example Data
            'AcountID': '123'
        },
        
        // All the blocks state (the object represent { key, value }).
        BlocksState: { 
            // Example Data
            '11111111-d042-4f4b-94ec-1d4fb238adba': { A: 1, B: 2 }, 
            '22222222-d042-4f4b-94ec-1d4fb238adba': { 
                accounts: { 
                    optionalValues: [{
                        key: 'account1', value: 'account 1'
                    }, {
                        key: 'account2', value: 'account 2'
                    }],
                    currentAccountKey: 'account1'
                }
            }
        }
    },
}
```

## The return page object

```json
{
    "State": {
        "PageParameters": {
            // Example Data
            'AcountID': '123'
        },
        // All the blocks state (the object represent { key, value }).
        "BlocksState": { 
            // Example Data
            '11111111-d042-4f4b-94ec-1d4fb238adba': { A: 1, B: 2 }, 
            '22222222-d042-4f4b-94ec-1d4fb238adba': { 
                accounts: { 
                    optionalValues: [{
                        key: 'account1', value: 'account 1'
                    }, {
                        key: 'account2', value: 'account 2'
                    }],
                    currentAccountKey: account1
                }
            }
        }
    },
    "PageView": {
        "Key": "610bdf75-d66e-4126-bfc4-0bb74eeabcab",

        // optional
        "Name": "MyPage",
        
        // optional
        "Description": "",

        // A list of the blocks on the page
        // note: When parameter change the blocks will be only those that consume this change.
        "Blocks": [
            {
                // A Key of the block instance 
                "Key": "99dfdff5-d042-4f4b-94ec-1d4fb238adba",
                
                // Data from the relation object needed for loading the block.
                "RelationData": {
                    "Name": "GalleryBlock",
                    "AddonUUID": "a6f4fd84-d539-41a5-9ff6-946bddebf4d1",
                },
                
                // The block's editor configuration or the calculated configuration that the BlockLoadEndpoint returned.
                "Configuration": { 
                },
                
                // The block's editor ConfigurationPerScreenSize or the calculated ConfigurationPerScreenSize that the BlockLoadEndpoint returned.
                // optional
                "ConfigurationPerScreenSize": {
                    "Tablet": {
                        // the blocks configuration
                    },
                    "Mobile": {
                        // the blocks configuration
                    }
                },
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
    },
    "AvailableBlocksData": [{
        "RelationName": "GalleryBlock",
        "RelationAddonUUID": "a6f4fd84-d539-41a5-9ff6-946bddebf4d1",
        "RelationSchema": {} // pepperi schema - optional
        "PageRemoteLoaderOptions": {
            "RemoteEntry": "http://.../.../addon_block.js",
            "ModuleName": "WebComponents",
            "ElementName": "xxx-element-a6f4fd84-d539-41a5-9ff6-946bddebf4d1",
            // Optional
            "EditorElementName": "xxx-editor-element-a6f4fd84-d539-41a5-9ff6-946bddebf4d1"
        }
    }]
}
```
