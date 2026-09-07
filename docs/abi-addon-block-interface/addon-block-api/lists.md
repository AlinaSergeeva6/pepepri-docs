---
description: component to display lists
---

# Lists

## name = Lists

### hostObject properties

#### listContainer&#x20;

Mandatory. An object of type [ListContainer](../../headless-on-client/resource-view-event/#listcontainer).\
list container must have a state object with a list key.\
If there are params in the list the state also have to include the parameters property (values of the mappings parameters from the block editor)  \
if the list key is not a key of a list that exist in the db, you must sent also the list configuration.

#### viewsList

Optional

```typescript
[
    key: string,
    title: string,
    parameters: {[key: string]: string } // key, value of the mappings parameters from the block editor   
]
```

this parameter used to show drop down with the optional lists to show.\
and set the parameters in the state when views drop down changes.

#### cpiEventsService

Optional, type: [ICPIEventService](../../headless-on-client/resource-view-event/#icpieventsservice). \
this parameter used to send the events to the cpi side, you can override the list cpi events service behavior with your own behavior.

#### hideSelectAll

Optional, type: boolean, by default false.
