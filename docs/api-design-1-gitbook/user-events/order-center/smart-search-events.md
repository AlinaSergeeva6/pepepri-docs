---
description: Smart Search allows filtering of items in the Order Center.
---

# Smart Search events

For more details about Smart Search - [https://support.pepperi.com/hc/en-us/articles/201855058-Smart-Search-Items-and-Accounts](https://support.pepperi.com/hc/en-us/articles/201855058-Smart-Search-Items-and-Accounts)

### Events

**OnSmartSearchLoad -** the event is fired on entering to the Order Center and on tab selection inside Order Center. The returned result is a list of all smart search fields to hide.



**Event Data**

```json
{
    TransactionKey: String, 
    PageParams: {
        CurrentTab: String
    },
    SmartSearchView: {
        Fields: [{
            FieldID: String,
            Visible: Boolean
        }]
    }
}
```

In order to control which filters will be displayed, an event is emitted and the returned value are the names of all filters to hide.&#x20;

\
**Expected return value**

```
{
    SmartSearchView: {
        Fields: [{
            FieldID: String,
            Visible: Boolean
        }]
    }
}
```



## Usage Example

A script will be hooked on the event and will use a UDC.\
The UDC contains an object with the specific configurations of which filters to hide on each tabKey, transaction and catalog.



**UDC**

```
{
    "configurations": [
        {
            "atdID": 320977,
            "dynamicSearch": [
                {
                    "catalog": "d4d1341a-45a7-4bd1-9435-8d85ed0469db",
                    "filters": [
                        {
                            "tabKey": {
                                "JsonFilter": "0c9f4848-de06-4e71-9c80-3e433c027d62"
                            },
                            "fieldsToHide": [
                                "ItemTSAPackaging",
                                "ItemTSASeason"
                            ]
                        },
                        {
                            "tabKey": {
                                "JsonFilter":"ec96edbb-40d0-46a6-a862-852756c067fc","Parent": {"DynamicFilter":"Item.MainCategory","Value":"RAZ-Brand"}
                            },
                            "fieldsToHide": [
                                "ItemTSAPackaging",
                                "ItemTSASeason"
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
```



**Script**

```typescript
export async function main(data)  {

    const tran = await pepperi.DataObject.Get("transactions", data.TransactionKey);
    const atdID = tran?.typeDefinition?.internalID
    const catalogID = tran?.catalog?.uuid

    const udc = await pepperi.resources.resource('DynamicFilter').get({});
    let configOb = udc[0];
    configOb = JSON.parse(configOb.config);
    let fieldsToHide;

    configOb.configurations.filter(config => config.atdID = atdID)[0].dynamicSearch
    .filter(search => search.catalog === catalogID).map(search => search.filters
    .filter(filter => {
        const stringified = JSON.stringify(filter['tabKey'])
        if(stringified === data.PageParams.CurrentTab) {
            fieldsToHide = filter.fieldsToHide
        }
    }))
    
    data.SmartSearchView.Fields.forEach((field) => {
        if(fieldsToHide.includes(field.FieldID)) {
            field.Visible = false
        }
    })
    
    return {smartSearchView: data.SmartSearchView}
}
```



&#x20;
