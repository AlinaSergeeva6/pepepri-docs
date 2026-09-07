---
description: Some examples and prosposed solutions based on this design
---

# Examples

### Configurations

The configurations addon is a sync source that implements custom logic to sync configurations. It stores changes to drafts when they are published, which will update the LastSyncDateTime on the configuration source and will force the sync to get the changes.

#### The Configurations Source Object

```json
{
    "Name": "Configurations",
    "AddonUUID": "84c999c3-84b7-454e-9a86-71b7abc96554",
    
    // Configuration changes the object key to DraftKey removing the profile from
    // the key because this is how addons retrieve configurations in the CPI Side
    "KeyFieldID": "Draft",
    
    //
    "DeltaRelativeURL": "/addons/api/84c999c3-84b7-454e-9a86-71b7abc96554/sync-source/get_delta",
    
    //
    "RebuildRelativeURL": "/addons/api/84c999c3-84b7-454e-9a86-71b7abc96554/sync-source/rebuild_cache",
}
```

### Nebula

The Nebula addon will act as both a source and a cache.

I is useful for storing highly connective data, and implementing data access restrictions based on the Febula rules, and reducing the size of data to sync significatly.

#### The Nebula Source Object

```json
{
    "Name": "Nebula",
    "AddonUUID": "",
    "SupportedIncludedResources": ["users", "accounts"]
}
```

### PFS

The PFS will handle the syncrounization of PFS files

It will store the changes to all pfs files data schemes using a sync cache.

#### The PFS Source Object

```
{
    "Name": "PFS",
    
    "AddonUUID": "",
    
    // straight to the cache - no custom logic
    "DeltaRelativeURL": "",
    
    // use crawler
    "RebuildRelativeURL": "",
    
    "Files": [
        {
            // Mandatory
            "URLFieldID": "URL",
        
            // Optional: Field in the object specifying SyncType
            // The field value can be "Device" | "Always"
            // default is "Device"
            "SyncFieldID": "Sync"
        }
    ]
}
```

### Schemes

The Schemes will handle the synchronization of ADAL schemes

It will store the changes to all ADAL schemes data schemes using a sync cache.

```json
{
    "Name": "Schemes",
    "AddonUUID": "d6b06ad0-a2c1-4f15-bebb-83ecc4dca74b",
    "DeltaRelativeURL": "/addons/api/d6b06ad0-a2c1-4f15-bebb-83ecc4dca74b/api/delta",
    "RebuildRelativeURL": "/addons/api/d6b06ad0-a2c1-4f15-bebb-83ecc4dca74b/api/rebuild_cache"
}
```

### Addons

### UDCs without reference fields
