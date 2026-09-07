---
description: The pages is enables the user to load a page with blocks.
---

# Pages

### **hostObject properties**

```
{
    // The page key
    pageKey: '0e1af672-d2d0-4e48-b32f-bbb7d8bf29fe',

    // The page default parameters
    pageParams: {
        AccountUUID: '0000fe48-d32f-4672-b2d0-bbf207d8bb00',
        // Other params...
    }
}
```

### hostEvents events

```
// TBD
```

## Example

#### typescript

```typescript
constractor(
    ...
    private viewContainerRef: ViewContainerRef,
    private addonBlockLoaderService: PepAddonBlockLoaderService
) {
    ...
}

...

openPage() {
    const pageHostObject = {
        pageKey: '0e1af672-d2d0-4e48-b32f-bbb7d8bf29fe',
        pageParams: {
            AccountUUID: '0000fe48-d32f-4672-b2d0-bbf207d8bb00'
        }
    };
    
    const dialogRef = this.addonBlockLoaderService.loadAddonBlockInDialog({
        container: this.viewContainerRef,
        name: 'Pages',
        hostObject: pageHostObject,
        hostEventsCallback: (event) => { 
            // handle host events here.
        }
    });
    
```

