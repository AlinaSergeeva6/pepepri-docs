---
description: >-
  Event UI component which gives the users ability to register for events and
  define logic to run when this event occurs using pre defined logic blocks
---

# Events

## hostObject properties

### PossibleEvents

list of events the block opener supports.

{% code title="Schema" overflow="wrap" lineNumbers="true" %}
```json
[{
    "EventKey": string, // Name of the event to register.
    "Title": string, // title that will be seen in the list of available fields
    "EventFilter": { // Filter object to pass the interceptor in the cpi node
        [key: string]: string
    },
    "Fields": [{ // whether this event happens on a specific field. i.e 'SetFieldValue'
        "Title": string,
        "FieldID": string
    }],
    "EventData": Schema.Fields
}]

```
{% endcode %}

{% code title="Example" overflow="wrap" lineNumbers="true" %}
```json
[{
    "Title": "before loading transaction scope",
    "EventKey": "PreLoadTransactionScope",
    "EventFilter": {
        "DataObject": {
            "typeDefinition":{
                "internalID":267286
            }
        }
    },
    "EventData": {
        "DataObject": {
            "Type": "Object",
            "Fields": {
                "uuid": {
                    "Type":"String"
                },
                "hidden": {
                    "Type": "Bool"
                },
                "typeDefinition": {
                    "Type": "Object",
                    "Fields": {
                        "name": {
                            "Type": "String"
                        }
                    }
                }
            }
        }
    }
},
{
    "Title": "Incrementing field's value",
    "EventKey": "IncrementFieldValue",
    "EventFilter": {
        "DataObject": {
            "typeDefinition":{
                "internalID":267286
            }
        }
    },
    "Fields": [{
        "FieldID": "TSAInventory",
        "Title": "Invetory"
    },
    {
        "FieldID": "UnitsQuantity",
        "Title": "Quantity field"
    },
    {
        "FieldID": "UnitPriceAfterDiscount",
        "Title": "Price after discount"
    }],
    "EventData": {
        "FieldID": {
            "Type": "String"
        }
        "DataObject": {
            "Type": "Object",
            "Fields": {
                "uuid": {
                    "Type":"String"
                },
                "hidden": {
                    "Type": "Bool"
                },
                "typeDefinition": {
                    "Type": "Object",
                    "Fields": {
                        "name": {
                            "Type": "String"
                        }
                    }
                }
            }
        },
        "Value": {
            "Type": "String"
        }
    }
}]
```
{% endcode %}

### AddonUUID

uuid of the opener addon for filtering logic blocks purposes.

### Name

another key for representing a group of addons for filtering logic blocks purposes

## hostEvents

currently there are no host events available for this addon block

## Example

{% code title="Html" lineNumbers="true" %}
```html
<div #eventContainer></div>
```
{% endcode %}

{% code title="TypeScript" overflow="wrap" %}
```typescript
@ViewChild('eventContainer', { read: ViewContainerRef }) eventsContainer: ViewContainerRef;

ngOnInit() {
    this.addonBlockLoaderService.loadAddonBlockInContainer({
        container: this.eventsContainer,
        name: 'Events',
        hostObject: this.eventsHostObject
    })
}
```
{% endcode %}
