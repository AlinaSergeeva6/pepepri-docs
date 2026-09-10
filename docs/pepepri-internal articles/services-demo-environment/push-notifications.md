---
title: "Push Notifications"
order: 22
---
# Push Notifications

## Description

Notifications is a new feature available in Pepperi.

It allows to send notifications to the webapp and mobile application. Notifications are fully customizable. You can send any information you want, it could be related to the orders, invoices, etc.

![](/static/Push-Notifications-Webapp.png)

**Notifications on a webapp.**

![](/static/Push-Notifications-Device.jpg)

**Notifications on a mobile device.**

!!!info
In order to install notification add-on, please contact Services team manager/Support/Success manager.
!!!

## Advantages and disadvantages

!!!success
You can notify your reps and buyers about new orders, changes, etc. And they will get a notification, without being in the application itself.
!!!

!!!success
It works both in the web app and in the mobile app. Supports both iOS and Android.
!!!

!!!success
You can send notifications manually using webapp or automate using IPaaS and Notification API.
!!!

## Demo - How does it work

Use case for this, for example, you are a Rep and you want to have a notification if you have new order which waiting for your approval.

1.  The buyer, submit the order. The order goes to approval status.
2.  It triggers the webhook with dataflow tasks and sends the data to the Notification API.
3.  Rep receives a notification on their devices.

![](/static/Push-Notifications-Dataflow-tasks.png)

## How to copy to another environment

Copy **Send Notification** folder with all dataflow tasks.

It's divided on 2 parts.

1.  Get Token For Notification - Get Pepperi token for authorization.

## Get Pepperi Token

`GET` `https://integration.pepperi.com/prod/api/PepperiApi/GetIdpToken`

Get pepperi token and use it in the Notification API request.

#### Headers

| Name | Type | Description |
| --- | --- | --- |
| Authorization\* | String | Authorization with client Idp token |

```
{
   "Data": "",             // Token
   "BaseException": ""     // Exception
}
```

1.  Push Notification - HTTP request, which is triggering the notification.

## Push Notification

`POST` `https://papi.pepperi.com/v1.0/push_notifications`

Push notification for a specific user. You should profide title and body of the notification and user UUID. The request body uses the JSON format.

#### Headers

| Name | Type | Description |
| --- | --- | --- |
| Authorization\* | String | Authorization with bearer token |

#### Request Body

| Name | Type | Description |
| --- | --- | --- |
| Title\* | String | Title of the notification |
| UserUUID\* | String | UUID of the user, which will get the notification |
| Body\* | String | Content of the notification |
| NavigationPath | String | Navigate to destination path (Pepperi domain) when notification is clicked. For example: /list/all\_activities |

```
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
