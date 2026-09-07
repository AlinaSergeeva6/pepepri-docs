---
description: Standard charts Pepperi resource
---

# Charts

{% swagger baseUrl="https://papi.pepperi.com/V1.0/" path="charts" method="get" summary="" %}
{% swagger-description %}
Chart resource contains a JS file which is the actual chart. (refer to the chart interface for more information). This file will not be synced to the devices and in order to view charts, you must be online.

Note that the returned URL will not be the URL that was given in the POST but the copied file (i.e. a link to pepperi CDN). If in the POST we provide the same pepperi CDN as will be in the GET we should not be updating the file.&#x20;
{% endswagger-description %}

{% swagger-response status="200" description="" %}
```javascript
[
	{ 
		"Key": "1234-567890-43213", // generate new guid   
		"Name": "my-chart", 
		"Description": "my chart",
		// you can post either http or base64, GET will always be https to CDN
		// Mandatory only on Create, URL of the file that contains the chart (according to Chart interface) 
		// this file will be copied to pepperi CDN
		"ScriptURI": "https://cdn.pepperi.com/1110703/CustomizationFile/1.js" 
		"ReadOnly": true
	}
]
```
{% endswagger-response %}
{% endswagger %}

