---
description: Publish message for PNS
---

# Publish message

{% hint style="info" %}
There are different types of messages that are published to the PNS.

**data** - changes in data published by the NUC ADAL or other data sources\
**action** - async addon API calls publish stages in the Job Info object\
**event** - addons can publish events that other addons can susbcribe
{% endhint %}

{% hint style="info" %}
Only the ADAL & NUC can publish **data**\
Only the Addon Async API mechanism can publish **action**\
Only system addons can publish **event**
{% endhint %}

{% hint style="info" %}
**FilterAttributes** available types: string, strings array and number

The Filter policy is applied to the filter attributes. If the filter attribute is an array, then the policy will pass if there is one value that is in both arrays (Union).
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com" path="/v1.0/notification/publish" method="post" summary="Publish message for PNS" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" type="string" %}
addon uuid
{% endswagger-parameter %}

{% swagger-parameter in="header" name="X-Pepperi-SecretKey" type="string" %}
addon key
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Type" type="string" %}
action/data/adal
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Message" type="object" %}
json message
{% endswagger-parameter %}

{% swagger-parameter in="body" name="FilterAttributes" type="object" %}
filter attributes that matches to the subscribe filter policy 
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
```
{
    "Success": true
}
```
{% endswagger-response %}
{% endswagger %}

The addon subscription relative URL will be invoked (POST) with the body:

```javascript
{
    "Type": "",
    "Message": {},
    "FilterAttributes": { 
         [key: string]: number | string | string[]
    }
}
```

Below is a list of known notifications that are published in the PNS

### Type: 'data'

data changes published from the NUC & ADAL & PAPI

```javascript
{
    "Type": "data",
    "FilterAttributes": { 
         "ModifiedFields": ["Name", "IsFixedDiscount"],//List of the fields that was changed (contain all the fields and not only the fields you subscribe to)
         "AddonUUID":"", // 00000000-0000-0000-0000-00000000c07e for nucleus, use lower case
         "ModifiedObjects": [], // list of Object keys
         "Resource": "activities",
         "Action": "update/insert/remove",
         "UserUUID": "649f264b-3135-429a-862a-7212abfe3f66",
         //All the fields you subscribe to in the filter policy- this property will be added only if subscribed to specific fields. 
         "SubscriptionModifiedFields": ["IsFixedDiscount"] 
    },
    "Message": {
				"ActionUUID": "9c9f3576-8d80-48d2-aea6-f11bc3ee263c",
				"ModifiedObjects": [
					{
						"ObjectKey": "dad3e433-eb39-400f-ae4e-7c3864f148ea",
						"ObjectModificationDateTime": "2021-03-10T12:30:45.627",
						"ModifiedFields": [
							{
								"FieldID": "IsFixedDiscount",
								"NewValue": false,
								"OldValue": true
							}
						]
					},
					{
						"ObjectKey": "0f39d939-ff4c-43a7-92e6-17851a407170",
						"ObjectModificationDateTime": "2021-03-10T12:30:45.627",
						"ModifiedFields": [
							{
								"FieldID": "Name",
								"NewValue": "a",
								"OldValue": "b"
							}
						]
					}
				]
    } 
}
```

```javascript
// expample for add-on's change version
{
    "Type": "data",
    "FilterAttributes": { 
         "ModifiedFields": ["Version"],
         "AddonUUID":"00000000-0000-0000-0000-00000000a91",
         "Resource": "installed_addons",
         "Action": "update",
         "UserUUID": "649f264b-3135-429a-862a-7212abfe3f66"
    },
    "Message": {
				"ActionUUID": "9c9f3576-8d80-48d2-aea6-f11bc3ee263c",
				"ModifiedObjects": [
					{
						"ObjectKey": "{{INSTALLED_ADDON_UUID}}",
						"ObjectModificationDateTime": "2021-03-10T12:30:45.627",
						"ModifiedFields": [
							{
								"FieldID": "Version",
								"NewValue": "0.0.2",
								"OldValue": "0.0.1"
							}
						]
					}
				]
    } 
}
```

```javascript
// expample for add-on uninstall
{
    "Type": "data",
    "FilterAttributes": { 
         "ModifiedFields": ["Hidden"],
         "AddonUUID":"00000000-0000-0000-0000-00000000a91",
         "Resource": "installed_addons",
         "Action": "update",
         "UserUUID": "649f264b-3135-429a-862a-7212abfe3f66"
    },
    "Message": {
				"ActionUUID": "9c9f3576-8d80-48d2-aea6-f11bc3ee263c",
				"ModifiedObjects": [
					{
						"ObjectKey": "{{INSTALLED_ADDON_UUID}}",
						"ObjectModificationDateTime": "2021-03-10T12:30:45.627",
						"ModifiedFields": [
							{
								"FieldID": "Hidden",
								"NewValue": true,
								"OldValue": false
							}
						]
					}
				]
    } 
}
```

### Type: 'action' - irrelevant maybe?

```javascript
{
    "Type": "action",
    "FilterAttributes": { 
         "Status": "New" | "InProgress" | "Success" | "Failure" | "InRetry",
         "UserUUID": "649f264b-3135-429a-862a-7212abfe3f66",
         "AddonUUID": "9c9f3576-8d80-48d2-aea6-f11bc3ee263c",
         "AddonRelativeURL": "", // no query params
    },
    "Message": {
				"ActionUUID": "9c9f3576-8d80-48d2-aea6-f11bc3ee263c",
				"ObjectURL": "addon/data/adal-uuid/executions/key",
				
    } 
}
```

### Type: 'event'

Events published from addons

```javascript
{
    "Type": "event".
    "FilterAttributes": { 
         "UserUUID": "649f264b-3135-429a-862a-7212abfe3f66",
         "AddonUUID": "9c9f3576-8d80-48d2-aea6-f11bc3ee263c",
         "Name": "any event name defined by the addon",
         addition fields per event
    },
    "Message": {
				"ActionUUID": "9c9f3576-8d80-48d2-aea6-f11bc3ee263c",
				"ObjectURL": "addon/data/adal-uuid/executions/key",
         addition fields per event				
    } 
}
```
