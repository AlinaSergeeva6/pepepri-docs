# Visit Flow events

## Events&#x20;

#### OnClientVisitFlowLoad

```javascript
{
    ResourceName: string, // The User Defined Collection Name
    AccountUUID: string // The selected account UUID
}
```

#### The return visit flow object

In case there a visit in progress only one visit will be returned

in case of error an empty object will be returned&#x20;

```javascript
{
    Visits: [{
        Key: string, // The visit flow key
        Title: string, // The visit flow Title
        SelectedGroup: number, // Zero base, optional
        Groups: [{
            Title: string, // The group title
            Steps: [{
                Title: string, // The step title
                // can be a legacy type of activities or transactions 
                // or a new resource which inherits base_activity
                // currently on UDCs inheriting survey are supported
                Resource: 'activities' | 'transactions' | 'resource base activity',
                // specific data to be used for the resource creation
                // for activities and transactions it is the ATD name 
                // for survey it is a key of an instance of a resource inheriting survey_template
                ResourceCreationData: string,                
                BaseActivities: string[], // The activities keys in case there are any already created
                Mandatory: boolean, // Whether the step is mandatory
                Disabled: boolean, // Whether the step is disabled
                Completed: boolean, // Whether the step is completed
            }]
        }]        
    }], 
}

```

#### OnClientVisitFlowStepClick&#x20;

Navigate to the pressed activity, either create a new activity or navigate to existing activity

in case there is more than one base activity, VisitFlow will navigate to the first activity.

Save the selected group key on TSAVisitSelectedGroup.  and read it back when&#x20;

OnClientVisitFlowLoad.



```javascript
{
    AccountUUID: string, // The selected account UUID
    Visit: {
       //refer to the description above in the visit array - 
       // here there is only one visit we are working on    
    },
   SelectedStep :{
       GroupIndex: number, // zero base 
       StepIndex: number // zero base 
   }
}
```

#### The return step click object

returns empty object - usually there will be navigation from a step pressed and empty object will be returned in case of error

```
{
}
```
