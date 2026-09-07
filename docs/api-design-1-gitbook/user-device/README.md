---
description: The user device resource.Standard ADAL Resource.
---

# User Device

{% swagger method="post" path="/push_notifications/user_devices" baseUrl="https://papi.pepperi.com/v1.0" summary="register a device to receive notifications." %}
{% swagger-description %}
A User can only register himself.
{% endswagger-description %}

{% swagger-parameter in="body" name="AppKey" required="true" %}
iOS: App Bundle ID

Android: Google API key
{% endswagger-parameter %}

{% swagger-parameter in="body" name="DeviceKey" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" required="true" name="DeviceName" %}
Get from the device                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
{% endswagger-parameter %}

{% swagger-parameter in="body" name="DeviceType" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Token" required="true" %}
For Android: registration ID.

For iOS: The token obtained when confirming receive of messages.

Save encrypted.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="AppName" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="PlatformType" required="true" %}
iOS/Android/Addon
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="User Device registered successfully" %}
```javascript
{
   Key: UserUUID_DeviceID_AppID,// auto-generate, read only
   UserUUID: "", // auto-generate, read only
   AppKey: "",
   AppName: "Pepperi",
   DeviceKey: "",
   DeviceName: "",
   DeviceType: ""
}
```
{% endswagger-response %}
{% endswagger %}

