# Survey Load

### OnClientSurveyLoad&#x20;

Loading Survey data based on the predefined template

### Input

```
{
    SurveyKey: string // Survey key
}
```

### Output

```
{
    "SurveyKey": "80e58d1d-96cf-411d-992e-e3c11617b3f8", // The survey key
    "SurveyTemplateKey": "80e58d1d-96cf-411d-992e-e3c11617b3f9", // The template key
    "Name": "My survey", // Mandatory
    "Description": "My test survey", // Optional
    "Active": true,
    "ActiveDateRange": {
        "From": "1-1-2020", // Optional
        "To": "1-1-2032" // Optional
    }, // Optional
    "Sections": [{
        "Key": "Section_1_key", // Mandatory
        "Title": "Section title", // Mandatory
        "Description": "Description of section 1", // Optional
        "Questions": [{
            "Key": "Question_1_Key",
            "Title": "Question title",
            "Description": "Description of question 1", // Optional,
            "Type": "short-text|long-text|single-selection-dropdown|single-selection-radiobuttons
                    |multiple-selection-dropdown|multiple-selection-checkboxes|boolean-toggle
                    |number|decimal|currency|percentage|date|datetime|photo|signature",
            "Mandatory": true,
            "ShowIf": {}, // Optional, TODO: This is show if object,
            "Value": any,
            "Visible": true
        }] // Mandatory
    }], // Mandatory
    "StatusName": "Submitted | InCreation"
}

```
