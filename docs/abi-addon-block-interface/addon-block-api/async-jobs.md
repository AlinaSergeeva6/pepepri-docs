---
description: This ABI will show all the executions of a async job on basis of where query.
---

# Async Jobs

## name = AsyncJobs

#### **hostObject properties** <a href="#hostobject-properties" id="hostobject-properties"></a>

Contains the inputs which will be used.

```
{
    // type string - where query
    "where": ""
}
```

### Example <a href="#example" id="example"></a>

**HTML**

```
<pep-button
        value="Click me to open"
        styleType="weak"
        styleStateType="system"
        sizeType="md"
        classNames=""
        [disabled]="false"
        iconPosition="end"
        [visible]="true"
        (buttonClick)="openAsyncJobsDialog()"
      ></pep-button>
```

**typescript**

```
openAsyncJobsDialog() {
        const dialogRef = this.addonBlockLoaderService.loadAddonBlockInDialog({
            container: this.viewContainerRef,
            name: 'AsyncJobs',
            hostObject: this.hostObject
        });
    }
```
