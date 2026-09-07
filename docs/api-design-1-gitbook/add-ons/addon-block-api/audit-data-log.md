---
description: Enable 'show history' property from audit data log.
---

# Audit Data Log

### hostObject properties

Contains the audit data log inputs, all of them are mandatory.&#x20;

```json
{
    //UUID of the addon that wants to display audit data log block
    "AddonUUID": "",
    //Object`s key from adal table
    "ObjectKey": "",
    //The addon that wants to use audit data log block
    "Resource": ""
}
```

### Example

#### typescript

```javascript
onOpenDataLogDialog() {    
    const dialogRef = this.addonBlockLoaderService.loadAddonBlockInDialog({
        container: this.viewContainerRef,
        name: 'AuditDataLog',
        hostObject: this.dataLogHostObject,
        hostEventsCallback: (event) => { this.onHostEvents(event, dialogRef); }
    });
}
```
