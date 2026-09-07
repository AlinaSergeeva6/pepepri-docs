---
description: ABI component for displaying form of generic resources.
---

# Forms

## name = Forms



## host object properties

{% hint style="info" %}
formKey and form are mutually exclusive. \
objectKey and object are mutually exclusive
{% endhint %}

* formKey: string - a key for the configuration object of the form.
* form: [Form](../../configurations/configuration-models/forms.md)
* objectKey: string - the key of the object (can work only on resource forms)
* object - the object that you want to edit with the from
* parameters - the parameters values object  (for ex. send matching params to configured flow, etc.)



## host events

event which is fired by the forms component. the event has two optional actions, 'on-save', 'on-cancel

```typescript
// 'on-save' action is fired when the user click the Update button. 
// the 'data' property contains the current item with the new values.
{    
	'action': 'on-save',
	'data': {
		"object": {
                	"ModificationDateTime": "2024-02-04T08:08:32.051Z",
	                "Hidden": false,
        	        "CreationDateTime": "2024-01-31T14:34:44.702Z",
                	"exist": true,
	                "name": "a123",
        	        "age": 1,
                	"Key": "c9101c91-67a2-4270-a7e6-16cfbaa711fb"
               }
	}
}
// 'on-cancel' action is fired when the user click the Cancel button. 
{    
	'action': 'on-cancel',
}
```
