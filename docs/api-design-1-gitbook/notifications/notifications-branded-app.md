---
description: >-
  Standard ADAL Resource. In order to send notification messages to mobile
  endpoints, you must first create a platform application.  Each
  platform(Android/iOS) has a unique application.
---

# Internal: Notifications - Branded App

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/v1.0/push_notifications/platforms`

#### Request Body For iOS

| Name                                         | Type   | Description                                                                                                                                                                                                                       |
| -------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Type<mark style="color:red;">\*</mark>       | String | "iOS"                                                                                                                                                                                                                             |
| Credential<mark style="color:red;">\*</mark> | String | The .p8 file that you download from your Apple developer account when you create an authentication key                                                                                                                            |
| AppleSigningKeyID                            | String | <p>The ID that's assigned to your signing key.</p><p>To find this value, in your Apple developer account, choose <strong>Certificates, IDs &#x26; Profiles</strong>, and choose your key in the <strong>Keys</strong> section</p> |
| AppleTeamID                                  | String | <p>The ID that's assigned to your Apple developer account team.</p><p>This value is provided on the <strong>Membership</strong> page in your Apple developer account</p>                                                          |
| AppKey                                       | String |  Bundle ID. To find this value, in your Apple developer account, choose **Certificates, IDs & Profiles**, choose **App IDs** in the **Identifiers** section, and choose your app.                                                 |

```javascript
// Example for iOS request body

{
    "Credential": "", // .p8 file content
    "AppleSigningKeyID": "",
    "AppleTeamID": "",
    "AppKey": "com.yourapp.bundleid",
    "Type": "iOS"
}
```

#### Request Body For Android

| Name                                         | Type   | Description                                                            |
| -------------------------------------------- | ------ | ---------------------------------------------------------------------- |
| Type<mark style="color:red;">\*</mark>       | String | "Android"                                                              |
| Credential<mark style="color:red;">\*</mark> | Object | An object containing the private key file content from Firebase        |
| AppKey                                       | String | The application key identifying the specific app (e.g., `com.apiKey`). |

```javascript
// Example Android request body
{
    "Credential": {} // The content of the private key file from Firebase
    "AppKey": "com.apiKey",  // Application key
    "Type": "Android",      // Platform type
    "Key": "Android_com.apiKey"  // Unique key for the Android application
}
```

***

{% tabs %}
{% tab title="200: OK" %}
```javascript
{
    "ResponseMetadata": {
        "RequestId": ""
    },
    "PlatformApplicationArn": ""
}
```
{% endtab %}
{% endtabs %}

