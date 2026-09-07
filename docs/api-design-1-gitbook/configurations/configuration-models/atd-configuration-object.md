---
description: The configuration object description of an ATD
---

# ATD Configuration Object

```
{
    "Events": [
        {
            "EventKey": "OnTransactionLoaded",
            "FieldID": "",
            "Flow": {
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
        }
    ]    
}
```

### Draft Key

The Key of the draft containing the data of the ATD events should be the UUID of the ATD

### Events

Array of events, each described in the following way:



#### EventKey

Specifies the type of event this configuration pertains to. The `EventKey` distinguishes between different event triggers, defining the specific scenario or action that initiates the event handling process. For example: OnTransactionLoaded, OnTransactionLoaded, etc.

#### FieldID

Names the field associated with the event, if applicable. Certain events are triggered by actions on specific fields, such as increments or decrements. This property identifies the field in question, adding specificity to the event's context.

### Flow

Object of type [runFlowData](../../abi-addon-block-interface/addon-block-api/flowpicker.md#runflowdata).

<br>
