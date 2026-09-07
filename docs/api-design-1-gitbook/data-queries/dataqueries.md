---
description: A resource that handles the aggregated data query details.
---

# DataQueries

{% hint style="warning" %}
**Only admin can call the API to create/update resource**
{% endhint %}

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/data_queries/:key" method="get" summary="Standard ADAL resource" %}
{% swagger-description %}
A standard ADAL resource for create data index queries\
This is the metadata of the query define by the user
{% endswagger-description %}

{% swagger-response status="200" description="A list of the data index queries" %}
<pre class="language-javascript"><code class="lang-javascript">[{
    // generates a guid on create
    "Key": "23112-31323",
    "Name":"Grand total per account group by months",
    // Defines the format to show execute results
    "Style": "Currency"|"Decimal"|"Custom",
    "Currency": "USD",
    "Format": "{\"style\": \"decimal\"}",
    // any resource supported in the data index
    "Resource":  "all_activities",
    "ResourceData": 
    {
    	"ModificationDateTime": "2023-11-09T10:46:01.472Z",
    	"SchemaRelativeURL": "/addons/api/10979a11-d7f4-41df-8993-f06bfd778304/data_index_meta_data/all_activities_schema",
    	"CreationDateTime": "2022-07-31T12:22:39.697Z",
    	"Description": "all_activities relation data",
    	"AddonRelativeURL": "/addons/shared_index/index/papi_data_index/search/10979a11-d7f4-41df-8993-f06bfd778304/all_activities",
    	"Type": "AddonAPI",
    	"UserFieldID": "UUID",
    	"IndexedAccountFieldID": "Account.UUID",
    	"Hidden": false,
    	"AddonUUID": "10979a11-d7f4-41df-8993-f06bfd778304",
    	"IndexedUserFieldID": "Agent.UUID",
    	"AccountFieldID": "UUID",
    	"Name": "all_activities",
    	"Key": "all_activities_10979a11-d7f4-41df-8993-f06bfd778304_DataQueries",
    	"RelationName": "DataQueries"
    }
    // Columns that are aggregated in the result
    // Represents series on a graph (columns - yAxis)
    // certain fields can be split before being aggregated (BreakBy)
    // This will create mutiple colums for one field
    "Series": [
	{
		// unique and mandatory
		"Name":"Grand total sales",
		// will allow using regex as the series label.
		// default value: ‘${label} key which will be replaced with the series break by name or with the series name (if there is no break by). 
		"Label": "${label}",
		// any resource supported in the data index
		"Resource":  "all_activities",
		// A list of fields to aggregate for this column
		// manadatory (at least one in the array)
		"AggregatedFields": [
			{
				// The field to aggregate
				// mandatory
				"FieldID": "GrandTotal",

				// The operation
				// manadatory
				"Aggregator": "Sum" | "Count" | "Average",

				// Name of the field in the result
				// optional 
				"Alias": "",
				// optional - A script should be provided if the aggregator is a script
				"Script": ",
			}
		],
		// If the aggregator is a script it should provide parameters that the script uses
		"AggregatedParams": [
                	{
				"Aggregator": "Sum",
				"FieldID": "",
				"Name": ""
                	}
        	]
		// First level of grouping
		// xAxis on a graph (or catagories)
		// most graphs only support one group
		// optional
		"GroupBy": [
			{
				// The field ID to group by
				// mandatory
				"FieldID": "ActionDate"|"ActivityType"|"CreationDateTime"	// resource fields,
				// Name of the group by field in the result
				"Alias": "ActionDateTime",
				// optional 
				// "Month" is default
				"Interval": "Days" | "Weeks" | "Months" | "Years",
				"Format": "MMM"
                      
			}
		],
		// Group values before aggregating them into buckets
		// Optional
		"BreakBy": 
		{
			// The field ID to break the aggregation by
			// mandatory
			"FieldID": "TSAChain",

			// An interval to group mutiple values in
			// works only for DateTime fields
			"Interval": "Days" | "Weeks" | "Months" | "Years",
			"Format": "MMM"

		},
		"Top": {
            		"Max": 0,
            		"Ascending": false
        	},

		// fields that can be used in a runtime filter
		"DynamicFilterFields": [],

		// A (static) JSON filter to filter the objects by
		// optional
		"Filter": {},

		// Only use object related to the user calling the API
		// optional
		"Scope": {
			// Return only objects where the current user is assign, or where
			// a user under my role is assigned
			// default - Current
			"User": "AllUsers" | "CurrentUser" | "UsersWithTheSameFieldValue"| "UnderCurrentUserRoleHierarchy",   
                	"UserFilterField": "",                  
			// Return only object that the Account is assigned to the current user
			"Account": "AllAccounts" | "CurrentAccount" | "AccountsWithTheSameFieldValue",
		 	"AccountFilterField": ""
		}
	  }
	]
	"Variables": [{
		DefaultValue: "0",
		Key: "aa9a3782-972d-49be-91bd-49f9f1147d95",
		Name: "var1",
<strong>		PreviewValue: "0",
</strong>		Type: "String"
	}]
  }
  ]
</code></pre>
{% endswagger-response %}
{% endswagger %}

