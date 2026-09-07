---
description: An example of a cpi-node addon
---

# Example

#### File

```javascript
// cpi-side.js
export async function load() {

    // get meta data from ADAL
    const obj = getObject();

    // obj is the Data object on the configuration. 
    // Can be used to pass meta data to cpi-side
    const selectedTSA = obj.APIName;
    
    // you can use client api
    const accounts = await pepperi.api.accounts.search({
        fields: ['UUID', 'Name', selectedTSA]
    });
    
    // you can subscribe to events
    pepperi.events.on('ButtonPressed') //...
    
}
```
