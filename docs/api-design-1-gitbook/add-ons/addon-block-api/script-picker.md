---
description: >-
  the script picker is UI component which enables the user to pick a script and
  define the data which is needed to run it (using the RunScript event or run
  script API).
---

# Script Picker

### hostObject properties

#### runScriptData&#x20;

contains the script's data which can be used to emit the RunScript event&#x20;

```json
{
	"ScriptKey": "2dc0d466-df5e-49f8-97e7-e1ba41f79d60",
	"ScriptData": {
		// the script parameter name
		"scriptParameterName": {
			// "static" when the value is the actual value
			// "dynamic" when the value should be replaced in runtime by the 
			// referenced variable 
			"Source": "static" | "dynamic",
			"Value": string
		},
		"myScriptParameter": {
			"Type":  "dynamic",
			"Value": "myBlockVariable"
		}
	}
}
```

#### fields&#x20;

contains a list of variables that their values can be used for the script's parameters in runtime.&#x20;

a variable is defined as the value to the script's parameter, when the parameter's Source property is "dynamic".

```json
{
        // the variable name that its value may be used in runtime as script's
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

### hostEvents events

event which is fired by the script picker component. the event has two optional actions, 'on-save', 'on-cancel'.&#x20;

```json
// on-save' action is fired when the user click the Save button. 
// the 'data' property contains the script's data which can be used to emit 
// the RunScript event. 
// the 'data' property structure (not neccessarly its values) is similar 
// to the 'runScriptData' property (of the hostObject).
{    
	'action': 'on-save',
	'data': {
		"ScriptKey": "2dc0d466-df5e-49f8-97e7-e1ba41f79d60",
		"ScriptData": {
			"scriptParameterName": {
				"Source": "static" | "dynamic",
				"Value": string
			},
			"myScriptParameter": {
				"Type":  "dynamic",
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
