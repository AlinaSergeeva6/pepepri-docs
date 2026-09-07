# Push Notifications

## Description

Notifications is a new feature available in Pepperi.

It allows to send notifications to the webapp and mobile application. Notifications are fully customizable. You can send any information you want, it could be related to the orders, invoices, etc.

<div><figure><img src="../../../.gitbook/assets/Push Notifications - Webapp.png" alt=""><figcaption><p><strong>Notifications on a webapp.</strong></p></figcaption></figure> <figure><img src="../../../.gitbook/assets/Push Notifications - Device.jpg" alt=""><figcaption><p><strong>Notifications on a mobile device.</strong></p></figcaption></figure></div>

{% hint style="info" %}
In order to install notification add-on, please contact Services team manager/Support/Success manager.
{% endhint %}

## **Advantages and disadvantages**

{% hint style="success" %}
You can notify your reps and buyers about new orders, changes, etc. And they will get a notification, without being in the application itself.
{% endhint %}

{% hint style="success" %}
It works both in the web app and in the mobile app. Supports both iOS and Android.
{% endhint %}

{% hint style="success" %}
You can send notifications manually using webapp or automate using IPaaS and Notification API.
{% endhint %}

## **Demo - How does it work**

Use case for this, for example, you are a Rep and you want to have a notification if you have new order which waiting for your approval.

1. The buyer, submit the order. The order goes to approval status.
2. It triggers the webhook with dataflow tasks and sends the data to the Notification API.
3. Rep receives a notification on their devices.

<figure><img src="../../../.gitbook/assets/Push Notifications - Dataflow tasks.png" alt=""><figcaption></figcaption></figure>

## **How to copy to another environment**

Copy **Send Notification** folder with all dataflow tasks.

It's divided on 2 parts.

1. Get Token For Notification - Get Pepperi token for authorization.&#x20;

## Get Pepperi Token

<mark style="color:blue;">`GET`</mark> `https://integration.pepperi.com/prod/api/PepperiApi/GetIdpToken`

Get pepperi token and use it in the Notification API request.

#### Headers

| Name                                            | Type   | Description                         |
| ----------------------------------------------- | ------ | ----------------------------------- |
| Authorization<mark style="color:red;">\*</mark> | String | Authorization with client Idp token |

{% tabs %}
{% tab title="200: OK " %}
```json
{
   "Data": "",             // Token
   "BaseException": ""     // Exception
}
```
{% endtab %}
{% endtabs %}

2. Push Notification - HTTP request, which is triggering the notification.

## Push Notification

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/v1.0/push_notifications`

Push notification for a specific user. You should profide title and body of the notification and user UUID.\
The request body uses the JSON format.

#### Headers

| Name                                            | Type   | Description                     |
| ----------------------------------------------- | ------ | ------------------------------- |
| Authorization<mark style="color:red;">\*</mark> | String | Authorization with bearer token |

#### Request Body

| Name                                       | Type   | Description                                                                                                    |
| ------------------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------- |
| Title<mark style="color:red;">\*</mark>    | String | Title of the notification                                                                                      |
| UserUUID<mark style="color:red;">\*</mark> | String | UUID of the user, which will get the notification                                                              |
| Body<mark style="color:red;">\*</mark>     | String | Content of the notification                                                                                    |
| NavigationPath                             | String | Navigate to destination path (Pepperi domain) when notification is clicked. For example: /list/all\_activities |

{% tabs %}
{% tab title="200: OK " %}
```json
{
	"ModificationDateTime": "",
	"Read": false,
	"CreationDateTime": "",
	"CreatorName": "",
	"Body": "",
	"Title": "",
	"Hidden": false,
	"CreatorUUID": "",
	"UserUUID": "",
	"ExpirationDateTime": "",
	"Key": "",
	"NavigationPath": ""
}
```
{% endtab %}
{% endtabs %}
