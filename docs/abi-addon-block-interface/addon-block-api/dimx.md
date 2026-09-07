---
description: Gives your component DIMX functionality (file import / export)
---

# DIMX

### hostObject properties

The hostObject for DIMX is the description of the resource we wish to export from/import to:

#### DIMXAddonUUID&#x20;

The UUID of the addon this resource belongs to

```typescript
{"DIMDAddonUUID": '[ADDONUUID]'}
```

#### DIMXResource&#x20;

The name of the resource/table we export from/import to

```json
{"DIMXResource": '[RESOURCENAME]'}
```

### hostEvents events

DIMXProcessDone

```typescript
// DIMXProcessDone is fired when all active processes are done. Its data contains
// ProcessedFiles, which is an array of the results and status of all processed
// files.
{    
	'action': 'DIMXProcessDone',
	'data': {
		"ProcessedFiles":[
			{
		                "FileName": "filename.json", 
		                "Status": "done",
		                "ReturnedObject": {
	    				"URI": "www.somewhere.pep/files/filename.json"
				},
		                "Action": "export"
        		},
        		{
        			//...
        		}
        	]
	}
}


```

## DIMX Helper Service

**PepDIMXHelperService** simplifies the use of DIMX in your component, so you should (and probably have to) use it!

The following is an example on how to add DIMX functionality to your component using PepDIMXHelperService. These should be implemented in your '####.component.ts' file:

Imports-

```typescript
import { ViewContainerRef } from "@angular/core";
import { PepDIMXHelperService } from '@pepperi-addons/ngx-composite-lib';
```

Constructor-

```typescript
constructor(
        private viewContainerRef: ViewContainerRef,
        private dimxService: PepDIMXHelperService
    ) {
    // The hostObject for DIMX is the description of
    // the resource we wish to export from/import to
        const dimxHostObject = {
            DIMXAddonUUID: '[ADDONUUID]', // EDIT THIS
            DIMXResource:  '[RESOURCE]'    // EDIT THIS
        };
        
        this.dimxService.register(viewContainerRef, dimxHostObject, (onDIMXProcessDoneEvent: any) => {
            // Callback to be used when "DIMXProcessDone" event is emitted
            // Look at the event section to see the value format
        });
    }
```

Using import and export:

```typescript
// Import:

/*
 interface DIMXImportOptions {
    OverwriteObject?: boolean;
    Delimiter?: string;
    OwnerID?: string;
    ActionID?: string;
}
*/

const importOptions: DIMXImportOptions = {
    // Edit this to use options
}

this.dimxService.import(importOptions);

// Export:
interface DIMXExportOptions {
    DIMXExportFormat?: string;
    DIMXExportIncludeDeleted?: boolean;
    DIMXExportFileName?: string;
    DIMXExportWhere?: string;
    DIMXExportFields?: string;
    DIMXExportDelimiter?: string;
    ActionID?: string;
}

const exportOptions: DIMXExportOptions = {
    // Edit this to use options
}

this.dimxService.export(exportOptions);
```
