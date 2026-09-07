# Survey events

## Events&#x20;

**OnSurveyDataLoad** - This event is fired before data load, no return value will use for this event

Fired from [OnClientSurveyLoad](survey-events.md#events) event.

Event data is

```
{
    SurveyKey: string // Survey key
}
```



**OnSurveyViewLoad** - This event is fired after the data load and before it returned the view , the returned result with "SurveyView" ([see structure](../headless-on-client/survey-events/#the-return-survey-object)) will override and returned to the view.

Fired from [OnClientSurveyLoad](survey-events.md#events) event.

Event data is

```
{
    SurveyView: any // The merged Survey & Template
}
```



**OnSurveyFieldChanged** - This event is fired after survey field changed (Status, etc.), the returned result with "SurveyView" ([see structure](../headless-on-client/survey-events/#the-return-survey-object)) will override and returned to the view.

Fired from [OnClientSurveyFieldChange](../headless-on-client/survey-events/#events) event.

Event data is

```
{
    SurveyView: any // The merged Survey & Template
    ChangedFields: [{
        FieldID: string, // The survey property name    
        NewValue: string,// The changed value
        OldValue: string // The old value
    }]
}
```



**OnSurveyQuestionChanged** - This event is fired after survey question changed, the returned result with "SurveyView" ([see structure](../headless-on-client/survey-events/#the-return-survey-object)) will override and returned to the view.

Fired from [OnClientSurveyQuestionChange](../headless-on-client/survey-events/#events) event.

Event data is

```
{
    SurveyView: any // The merged Survey & Template
    ChangedFields: [{
        FieldID: string, // The question key 
        NewValue: string,// The changed value
        OldValue: string // The old value 
    }]
}
```
