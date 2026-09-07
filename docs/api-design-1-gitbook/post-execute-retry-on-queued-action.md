# Post - Execute Retry On Queued Action

{% hint style="warning" %}
Execute - Adds A New Record to the Queue list - does not change the existing one
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/actions_queue/{Action Queue UUID}/retry" method="post" summary="Execute Retry on Queued Actions" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200" description="" %}
```java
{
				"UUID":""
				"InternalID" : "",
				"ResourceName" : "transactions".
				"TriggeredByObject" : {"InternalID" : ""},
				"ActionID" : "email",  //export/webhook = ENUM as string
				"Status" : {"Code" :2 , "Name" : "{failed, in progress, succed}"}
				"RetryCounter" : 6,
				"CreationDateTime: "",
				"ModificationDateTime" :""
}
```
{% endswagger-response %}
{% endswagger %}
