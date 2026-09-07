---
description: This section will provide documentation for the Base Surveys resource
---

# Base Surveys

### baseSurveys API

BaseSurveys addon provides a generic resource API (can be viewed [here](../generic-resources/introduction.md)).

For each abstract schema an endpoint exposes the creation functionality for a concrete schema. This endpoint is exposed in a UDC schema creation. The endpoint looks like \{{AddonRelativeURL\}}/api/create\_\{{abstractSchemaName\}}



### baseSurveys schema

```typescript
const schema: AddonDataScheme = {
    Name: "baseSurveys",
    Type: 'abstract', // baseSurveys cannot be instantiated directly, and can only be extended.
    AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a", // Surveys AddonUUID
    Extends: {
        AddonUUID: "92b9bd68-1660-4998-91bc-3b745b4bab11", // baseActivities AddonUUID
        Name: "baseActivities"
    }
    Fields:
    {
	Template:
	{
	    Type: 'Resource',
	    Resource: "baseSurveyTemplates",
	    AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a" // Surveys AddonUUID
	},
	Answers:
	{
	    Type: 'Array',
	    Items: {
		Type: 'ContainedResource',
		Resource: "baseSurveyAnswers",
		AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a" // Surveys AddonUUID
	    }
	},
    }
}
```

### baseSurveyAnswers

```typescript
const schema: AddonDataScheme = {
    Name: "baseSurveyAnswers",
    Type: 'abstract', //baseSurveyTemplates cannot be instantiated directly, and can only be extended.
    AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a", // Surveys AddonUUID
    Fields:
    {
    	Key: {
	    Type: 'Resource',
	    Resource: "baseSurveyTemplateQuestions",
	    AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a", // Surveys AddonUUID
	},
	Answer:
	{
            Type: "Object",
            Fields: {}
	}
    }
}
```

### baseSurveyTemplates schema

```typescript
const schema: AddonDataScheme = {
    Name: "baseSurveyTemplates",
    Type: 'abstract', //baseSurveyTemplates cannot be instantiated directly, and can only be extended.
    AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a", // Surveys AddonUUID
    Fields:
    {
    	Name:
        {
		Type: 'String'
	},
	Description:
	{
		Type: 'String'
	},
	Active:
	{
		Type: 'Bool'
	},
	Sections:
	{
	    Type: "Array",
		Items: {
		    Type: 'ContainedResource',
		    Resource: "baseSurveyTemplateSections",
		    AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a", // Surveys AddonUUID
		}
	},
    }
}
```

### baseSurveyTemplateSections

```typescript
const schema: AddonDataScheme = {
	Name: "baseSurveyTemplateSections",
	Type: 'abstract',
	AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a", // Surveys AddonUUID
	Fields:
	{
	     Name:
		{
		    Type: 'String'
		},
		Title:
		{
		    Type: 'String'
		},
		Description:
		{
		    Type: 'String'
		},
		Questions:
		{
		     Type: "Array",
		     Items: {
		         Type: 'ContainedResource',
			 Resource: "baseSurveyTemplateQuestions",
			 AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a", // Surveys AddonUUID
		     }
		},
	}
}
```

### baseSurveyTemplateQuestions

```typescript
const schema: AddonDataScheme = {
	Name: "baseSurveyTemplateQuestions",
	Type: 'abstract',
	AddonUUID: "dd0a85ea-7ef0-4bc1-b14f-959e0372877a", // Surveys AddonUUID
	Fields:
	{
	    Name:
	    {
		Type: 'String'
	    },
	    Title:
	    {
		Type: 'String'
	    },
	    Description:
	    {
		Type: 'String'
	    },
	    Type:
	    {
		Type: 'String'
	    },
	    Mandatory:
	    {
		Type: 'Bool'
	    }
	}
}

```
