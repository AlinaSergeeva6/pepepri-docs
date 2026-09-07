---
description: Allows selection of any resource with configured resource views
---

# Selection List

## name = SelectionList

### hostObject properties

#### listContainer&#x20;

Mandatory. An object of type [ListContainer](../../headless-on-client/resource-view-event/#listcontainer).\
list container must have a state object with a list key\
if the list key is not a key of a list that exist in the db, you must sent also the list configuration.

#### inDialog

If the list selection should appear in dialog.

#### selectionType

Of type ListSelectionType ('Single' | 'Multi' | 'None')

#### hideSelectAll

If to hide the select all from the list header.

#### cpiEventService

Optional, type: [ICPIEventService](../../headless-on-client/resource-view-event/#icpieventsservice).\
this parameter used to send the events to the cpi side, you can override the list cpi events service behavior with your own behavior.

### hostEvents events

event which is fired by the picker component. the event has two optional actions, 'on-done', 'on-cancel'.&#x20;

```json
// on-done' action is fired when the user click the Done button. 
// the 'data' property contains the currenly selected object keys
{    
	'action': 'on-done',
	'data': {
		selectedObjects: [{
			'Key': '410f0c5a-9428-40e2-abaf-cb06ac493abd',
			// all fields from the view if exist
		},
		{
			'Key': 'a5289673-c5c8-4bbd-aa5d-1ba0dc272e3c',
			// all fields from the view if exist
		}]
		isAllSelected: false,
		whereClause: "Key LIKE %c5%"
	}
}
// 'on-cancel' action is fired when the user click the Cancel button. 
{    
	'action': 'on-cancel',
	'data' : {}
}
```

### Example

```typescript
OnButtonClicked() {    
    const dialogRef = this.addonBlockLoaderService.loadAddonBlockInDialog({
        container: this.viewContainerRef,
        name: 'SelectionList',
        size: 'full-screen',
        hostObject: {
            listContainer: listContainer,
            inDialog: true,
            selectionType: 'Multi',
            hideSelectAll: false
        },
        hostEventsCallback: (eventResult) => { 
            if(eventResult?.action === "on-done") {
               // add logic here.
            }
            dialogRef?.close(eventResult);
        }
    });
```

```typescript
export interface IHeadlessEventsService {
    EmitOnClientListLoad(state: Partial<ListState> | undefined, changes: Partial<ListState>, list?: List) : Promise<ListContainer>
    EmitOnClientListStateChange(state: Partial<ListState>, changes: Partial<ListState>, list?: List): Promise<ListContainer>
    EmitOnClientListButtonClick(state: Partial<ListState>, key: string, list?: List, data?: PepSelectionData): Promise<ListContainer>
}
```

