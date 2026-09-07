---
description: Allows selection of any resource with configured resource views
---

# Resource Picker

### hostObject properties

#### resource&#x20;

Mandatory. The name of the Generic Resource to pick from.

#### view&#x20;

Optional. The key of the view to present the resource with.&#x20;

If the view does not exist, the block will present an error.

If the view is not configured for the same resource as `resource` the block will present an error.

If no view key is send, the block will present the default view for this resource.

The default view is currently defined as the first view created for this resource.

#### selectedObjectKeys

Optional. An array of the keys of the currently selected objects. Any object that its key is in this array will be shown as selected in the list.

The currently selected object keys will always return in the result unless explicitly de-selected or un-select all was pressed.

If the selectionMode is 'Single' and the array has more than one object, the component will present an error.

Limitation: The picker can only work with up to 100 objects. Both in this parameter and in the output.

#### selectionMode

Optional. 'Multi' or 'Single'. Default is Single.

#### allowNone

Optional. Allow saving with no lines selected. Default is false.

### hostEvents events

event which is fired by the picker component. the event has two optional actions, 'on-save', 'on-cancel'.&#x20;

```json
// on-save' action is fired when the user click the Save button. 
// the 'data' property contains the currenly selected object keys
{    
	'action': 'on-save',
	'data': {
		selectedObjectKeys: [
			'410f0c5a-9428-40e2-abaf-cb06ac493abd',
			'a5289673-c5c8-4bbd-aa5d-1ba0dc272e3c'
		]
	}
}
// 'on-cancel' action is fired when the user click the Cancel button. 
{    
	'action': 'on-cancel',
	'data' : {}
}
```
