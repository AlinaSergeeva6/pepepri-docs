---
description: This section contains all blocks that are officially exported by addons
---

# Addon Block API

**For all the sub entries the relation name must always be "**<mark style="color:red;">**AddonBlock**</mark>**"**&#x20;

{% hint style="info" %}
**This is a reverse relation which is accessed by its name and not by the relation name**
{% endhint %}

## **Usage**

#### HTML

```html
<label class="body-xs normal ellipsis">Asset Title</label>
 <div #assetsBtnCont class="assets-btn-cont" 
                     [ngStyle]="{'background-image': 'url(' + imageURL + ')'}" 
                     (click)="onOpenblockDialog();">
             <pep-button sizeType="sm" 
                         [styleType]="'regular'" 
                         [value]="'Asset_Button_Title' | translate"  
                         iconName="system_file_upload_cloud">
             </pep-button>
 </div>
```

#### typescript

```javascript
onOpenBlockDialog() {
        const dialogRef = this.addonBlockLoaderService.loadAddonBlockInDialog({
            container: this.viewContainerRef, // view container to hold the addon block
            name: {block_name}, //i.e 'Assets'
            hostObject: this.hostObject, // input object to send data for the block
            hostEventsCallback: (event) => // callback to handle events firing from the addon block
            { 
                this.onHostEvents(event, dialogRef); 
            }
        });
    }
```
