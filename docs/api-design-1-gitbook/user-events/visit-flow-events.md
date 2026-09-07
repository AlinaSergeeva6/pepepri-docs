# Visit Flow events

## Events&#x20;

**OnVisitFlowViewLoad** - This event is emitted as soon as client event - onClientVisitFlowLoad completes [see str](../headless-on-client/visit-flow-events.md#the-return-visit-flow-object)

```javascript
Data: {
        AccountUUID: string // The selected account UUID
        Visits: [] // reference to the client event for content of the array
      }
```



**The return visit flow object** - similar to the event's input structure [see structure](../headless-on-client/visit-flow-events.md#the-return-visit-flow-object) or empty array or null in case no visit should be displayed

```javascript
{
    Visits: [] // reference to the client event for content of the array
}
```

**OnVisitFlowStepClick** - This event is emitted on step click, before client event - OnClientVisitFlowStepClick starts. [see structure](../headless-on-client/visit-flow-events.md#onclientvisitflowstepclick)

```javascript
{
    // reference to the client event for content of the object
}
```

**The return visit flow step object** - similar to the event's input structure  [see structure](../headless-on-client/visit-flow-events.md#onclientvisitflowstepclick) or empty step in case no navigation should be performed

```javascript
{
    // reference to the client event for content of the object
}
```
