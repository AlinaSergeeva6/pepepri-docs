# Survey Question Click

### OnClientSurveyQuestionClick&#x20;

When a Survey question is clicked, the survey is recalculated and returned.

### Input

```
{
    SurveyKey: string, // Survey key
    FieldID: string, // The question key 
    Action: string // Can be ('Set' || 'Delete' || 'View')
}
```

### Output

same as [Survey Load output](survey-load.md#output)
