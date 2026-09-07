---
description: >-
  The ABI component is designed to offer a detailed view of changes made to a
  specific property, along with information about the users who implemented each
  change.
---

# Audit Data Field Log

## name = AuditDataFieldLog

#### **hostObject properties** <a href="#hostobject-properties" id="hostobject-properties"></a>

Contains the inputs which will be used, all of them are **required**.

```
{
    //UUID of the addon that wants to display audit data log block
    "AddonUUID": "",
    //Object`s key from adal table
    "ObjectKey": "",
    //The addon that wants to use audit data log block
    "Resource": "",
    //The property for which logs are needed
    "FieldID": "",
    //Title of the ABI
    "Title": ""
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
        (buttonClick)="openAuditDataFieldLogDialog()"
      ></pep-button>
```

**typescript**

```
openAuditDataFieldLogDialog() {
        const dialogRef = this.addonBlockLoaderService.loadAddonBlockInDialog({
            container: this.viewContainerRef,
            name: 'AuditDataFieldLog',
            hostObject: this.hostObject
        });
    }
```
