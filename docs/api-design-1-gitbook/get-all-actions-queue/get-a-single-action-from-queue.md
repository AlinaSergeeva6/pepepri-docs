# Get a Single Action from Queue

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/actions_queue/{Action Queue InternalID}" method="get" summary="Single Action From Queue" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200" description="" %}
```java
		{
				"UUID" :  "",
				"InternalID" : 214,
				"ResourceName" : "transactions",
				"TriggeredByObject" : {"InternalID": 3455},
				"ActionID" : "email",  //export/webhook = ENUM as string
				"Status" : {"Code" :1 , "Name" : ""},//1-success/2-in progress/3 - failed/
				"RetryCounter" : 6,
				"CreationDateTime: "",
		    "ModificationDateTime" :""
		}
```
{% endswagger-response %}
{% endswagger %}
