---
description: >-
  Event UI component which gives the user ability to select a predefined flow
  and set it's parameters
---

# FlowPicker

## hostObject properties

#### runFlowData&#x20;

contains the script's data which can be used to emit the RunScript event&#x20;

```json
{
	"FlowKey": "2dc0d466-df5e-49f8-97e7-e1ba41f79d60",
	"FlowParams": {
		"param1": {
			"Source": "static",
			"Value": "hi"
		},
		"param2": {
			"Source":  "dynamic",
			"Value": "myBlockVariable"
		}
	}
}
```

#### fields&#x20;

contains a list of variables that their values can be used for the flow's parameters in runtime.&#x20;

a variable is defined as the value to the script's parameter, when the parameter's Source property is "dynamic".

The dynamic values are passed to the flow runner in the data parameter of the client API.

```json
{
        // the variable name that its value may be used in runtime as a flow
        // parameter value. 
        "variableName": {
                // the type of the variable
                "Type": "String|Bool|Integer|Double"
        },
        // note in the previous json, the mapping of "myScriptParameter" parameter 
        // to "myBlockVariable" variable
        "myBlockVariable": {
                "Type": "Bool"
        }
}
```

### hostEvents

event which is fired by the script picker component. the event has two optional actions, 'on-done', 'on-cancel'.&#x20;

```json
// on-done' action is fired when the user click the Save button. 
// the 'data' property contains the flow run data which can be used to run the flow
{    
	'action': 'on-done',
	'data': {
		"FlowKey": "2dc0d466-df5e-49f8-97e7-e1ba41f79d60",
		"FlowParams": {
			"param1": {
				"Source": "static" | "dynamic",
				"Value": string
			},
			"param2": {
				"Source":  "dynamic",
				"Value": "myBlockVariable"
			}
		}
	}
}
// 'on-cancel' action is fired when the user click the Cancel button. 
{    
	'action': 'on-cancel',
	'data' : {}
}
```

## Example

{% code title="TypeScript" overflow="wrap" %}
```typescript

ngOnInit() {
const dialogRef = this.addonLoaderService.loadAddonBlockInDialog({
            container: this.viewContainer, // parameter of type ViewContainerRef
            name: 'FlowPicker',
            hostObject: {
                // previous flow picker result
                runFlowData: { 
		"FlowKey": "2dc0d466-df5e-49f8-97e7-e1ba41f79d60",
		"FlowParams": {
			"param1": {
				"Source": "static" | "dynamic",
				"Value": string
			},
			"param2": {
				"Source":  "dynamic",
				"Value": "myBlockVariable"
			}
		}
		// list of fields which will be available for dynamic mapping
                fields: {
                    myBlockVariable: {
                        Type: 'String'
                    },
                }
            },
            hostEventsCallback: (event) => {
                console.log('inside host event callback. event:', event);
                dialogRef.close();
            },
            size: 'regular'
        })
    }
}
```
{% endcode %}
