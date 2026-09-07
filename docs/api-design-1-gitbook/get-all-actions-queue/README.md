# Get List of Actions Queue

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/actions_queue" method="get" summary="List of Actions Queue" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="include_count" type="boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_deleted" type="boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="order_by" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="number" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="number" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
[
		{
				"UUID" :  "",
				"InternalID" : 214,
				"ResourceName" : "transactions",
				"TriggeredByObject" : { "InternalID": 3455},
				"ActionID" : "email",  //export/webhook = ENUM as string
				"Status" : {"Code" :1 , "Name" : ""},//1-success/2-in progress/3 - failed/
				"RetryCounter" : 6,
				"CreationDateTime: "",
		    "ModificationDateTime" :""
		},
		...
]
```
{% endswagger-response %}
{% endswagger %}
