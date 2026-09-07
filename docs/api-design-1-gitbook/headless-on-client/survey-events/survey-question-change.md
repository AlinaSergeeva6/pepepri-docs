# Survey Question Change

### OnClientSurveyQuestionChange&#x20;

When a Survey question is changed, the survey is recalculated and returned.

### Input

```
{
    SurveyKey: string, // Survey key
    ChangedFields: [{
        FieldID: string, // The question key 
        NewValue: string // The changed value 
    }]
}
```

### Output

same as [Survey Load output](survey-load.md#output)
