---
description: >-
  The assets manager picker is UI component which enable to Upload, Edit or
  Delete an assets of any-kind or to select one an asset and define the data
  which is needed to use it (gallery, slideshow ...)
---

# Assets Manager Picker

### **hostObject properties**

Contains the assets inputs which can be used, all of them are **optional** and have defaults values.

```javascript
{
    // type string - used to define the root folder
    // default - is '/'
    "currentFolder": "/",
    // type number - used to define assets max size
    // default - is 10000000 (10MB)
    "maxFileSize": 10000000 | 5000000 | any number,
    // type boolean - define if show as dialog/manager mode.
    // default - is false
    "inDialog": true | false,
    // type string - define allowed assets types.
    // default - is 'all'
    "allowedAssetsTypes": 'images'| 'documents' | 'all' ,
    // type string - define the list selection mode.
    // default - is multiple
    "selectionType": 'multiple' | 'single',

}
```

### hostEvents events

event which is fired by the assets picker component. the event has two optional actions:          'link-url' & 'close-dialog'.

```
// 'link-url' action is fired when the user click the Done button. 
// the 'url' property contains the asset URL.

{    
	'action': 'link-url',
	'url': 'http://foldername/file.extention'
}
// 'close-dialog' action is fired when the user click the Done button. 
{    
	'action': 'close-dialog',
}
```

## Example

#### HTML

```html
<label class="body-xs normal ellipsis">Asset Title</label>
 <div #assetsBtnCont class="assets-btn-cont" 
                     [ngStyle]="{'background-image': 'url(' + imageURL + ')'}" 
                     (click)="onOpenAssetsDialog();">
             <pep-button sizeType="sm" 
                         [styleType]="'regular'" 
                         [value]="'Asset_Button_Title' | translate"  
                         iconName="system_file_upload_cloud">
             </pep-button>
 </div>
```

#### typescript

```typescript
onOpenAssetsDialog() {
        const dialogRef = this.addonBlockLoaderService.loadAddonBlockInDialog({
            container: this.viewContainerRef,
            name: 'Assets',
            hostObject: this.assetsHostObject,
            hostEventsCallback: (event) => { this.onHostEvents(event, dialogRef); }
        });
    }
```
