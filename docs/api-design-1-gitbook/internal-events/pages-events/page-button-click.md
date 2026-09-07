# Page Button Click

**OnClientPageButtonClick** - When a block button is clicked, the page is calling to this block Endpoint ([BlockButtonClickEndpoint](../../addon-relations/addons-link-table/relation-names/page-block.md)) and the block can return [data](../../headless-on-client/pages-events/).\
if the data contains "ChangedParameters" then the page will call all the consumers blocks Endpoint ([BlockStateChangeEndpoint](../../addon-relations/addons-link-table/relation-names/page-block.md)) of these parameters and return only the changed data back to the client.

This event data is.

```
{
    // Page key - for runtime usage (in that case 'Page' property is not supplied).
    PageKey: string,
    // The page object - for edit mode usage (in that case 'PageKey' property is not supplied).
    Page: {},
    BlockKey: string,
    ButtonKey: string,
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
            '33333333-d042-4f4b-94ec-1d4fb238adba': { 
                Accounts: { 
                    optionalValues: [{
                        key: 'account1', value: 'account 1'
                    }, {
                        key: 'account2', value: 'account 2'
                    }],
                    currentAccountKey: account1
                }
            }
        }
    }
}
```

## The return page object - [see here](page-state-change.md#the-return-page-object)
