# Survey Field Change

### OnClientSurveyFieldChange&#x20;

When a Survey field is changed (not a question), the survey is recalculated and returned

### input

```
{
    SurveyKey: string, // Survey key
    ChangedFields: [{
        FieldID: string, // The survey property name    
        NewValue: string // The changed value 
    }]
}
```

### output&#x20;

same as [Survey Load output](survey-load.md#output)
