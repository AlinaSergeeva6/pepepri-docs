# Page State Change

**OnClientPageStateChange** - When a block state is changed, the page is calling to the block Endpoint ([BlockStateChangeEndpoint](../../addon-relations/addons-link-table/relation-names/page-block.md)) and the block can return [data](../../headless-on-client/pages-events/).\
if the data contains "ChangedParameters" then the page will call all the consumers blocks Endpoint ([BlockStateChangeEndpoint](../../addon-relations/addons-link-table/relation-names/page-block.md)) of these parameters and return only the changed data back to the client.

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
                    currentAccountKey: account1
                }
            }
        }
    },
    Changes: {
        // Here we hold only one state (the state of the block that made the change).
        BlocksState: { 
            // Example Data
            '22222222-d042-4f4b-94ec-1d4fb238adba': { 
                accounts: {
                    currentAccountKey: account2
                }
            }
        },
    }
}
```

## The return page object

```json
{
    "State": {
        // The page parameters (the object represent { key, value }).
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
                    currentAccountKey: account2
                }
            }
        }
    },
    "PageView": {
        "Key": "610bdf75-d66e-4126-bfc4-0bb74eeabcab",

        // A list of the changed blocks
        // note: When parameter change the blocks will be only those that consume this change.
        "Blocks": [
            {
                // A Key of the block instance 
                "Key": "22222222-d042-4f4b-94ec-1d4fb238adba",
                
                // Data from the relation object needed for loading the block.
                "RelationData": {
                    "Name": "GalleryBlock",
                    "AddonUUID": "a6f4fd84-d539-41a5-9ff6-946bddebf4d1",
                },
                
                // The configuration or the calculated configuration that the BlockLoadEndpoint returned.
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
    }
}
```
