---
description: This section will provide documentation for the Base Activities resource
---

# Base Activities

### baseActivities API

baseActivities addon provides a generic resource API (can be viewed [here](../generic-resources/introduction.md)).

### baseActivities schema

```typescript
const schema: AddonDataScheme = {
    Name: "baseActivities",
    Type: 'abstract', // baseActivities cannot be instantiated directly, and can only be extended.
    AddonUUID: "92b9bd68-1660-4998-91bc-3b745b4bab11", // BaseActivities AddonUUID
    SyncData: { 
        "Sync": true,
    },
    DataSourceData: {
        IndexName: "baseActivities"
    },
    GenericResource: true,
    Fields:
    {
    	StatusName: 
        {
            Type: 'String'
        },
    	ActionDateTime: 
        {
            Type: 'DateTime'
        },
    	Account:
        {
            Type: 'String'
        },
    	Creator:
        {
            Type: 'String'
        },
    	Agent:
        {
            Type: 'String'
        }
        ExternalID:
        {
            Type: 'String'
        }
    }
}
```
