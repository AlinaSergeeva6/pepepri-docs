---
description: Standard Pepperi Resource
---

# 👩‍⚕️ 👩⚕ 👩⚕ Health Monitor

### Testing and Validation

Before deploying your notification and webhook configurations, thoroughly test each component to verify that notifications are sent and received as expected. Validate all parameters and ensure that the system behaves correctly under various conditions to maintain reliability and efficiency.

### Documentation and Support

Keep your documentation up-to-date, detailing all aspects of your notification and webhook setups. Provide clear instructions for users and administrators to understand and manage the notification systems effectively. Additionally, ensure support channels are available for addressing any issues or queries that may arise.

## Immediate health monitor notification

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/system_health/notifications`

#### Headers

| Name                                                  | Type   | Description             |
| ----------------------------------------------------- | ------ | ----------------------- |
| X-Pepperi-OwnerID<mark style="color:red;">\*</mark>   | String | The requested addonUUID |
| X-Pepperi-SecretKey<mark style="color:red;">\*</mark> | String | Addon secret key        |

#### Request Body

| Name                                          | Type      | Description                                                |
| --------------------------------------------- | --------- | ---------------------------------------------------------- |
| Name<mark style="color:red;">\*</mark>        | String    | Name (Max size is 256 bytes)                               |
| Status<mark style="color:red;">\*</mark>      | String    | <p>Object Status.</p><p>SUCCESS / WARNING / ERROR</p>      |
| Message<mark style="color:red;">\*</mark>     | String    | Information about object status (Max size is 20,000 bytes) |
| Description<mark style="color:red;">\*</mark> | String    | Description (Max size is 1000 bytes)                       |
| BroadcastChannel                              | String\[] | Tenant/ System/ Addons (default)/ External                 |
| UserUUID                                      | String    | Phase 2 - If the notification is specific to a user        |

{% tabs %}
{% tab title="200: OK Data successfully retrieved." %}

{% endtab %}
{% endtabs %}

### ~~Notification Webhook~~

~~If sending NotificationWebhook, message will be published to the given webhook according to SendNotification.~~&#x20;

~~One can change NotificationWebhook and SendNotification using system health UI -> Edit object.~~

~~Pay attention that if changing NotificationWebhook from UI while SendNotification is Always- no message will be published until sending new data to the relevant endpoint.~~

### ~~User Webhhok~~

~~If sending UserWebhook, the given message will be published to the given webhook.~~

~~When using this option, need to provide only Name, Description, Status and Message- the data will be published only once, to the given webhook, and both NotificationWebhook and SendNotification will be ignored.~~

### ~~Default Webhook~~

~~If sending both NotificationWebhook and DefaultWebhook- message will be published only to NotificationWebhook.~~



~~IMPORTANT- on status change, message will be published to the relevant Pepperi channels **only** for system addons. In any other case, message will be published to the given UserWebhook (if provided).~~

### BroadcastChannel

Defines which webhook type to send notifications to:

1. Tenant - Sends notifications to the webhooks that the user configured in system health UI. There are two webhooks, default and specific to a notification, if specific webhook was defined it will be used, otherwise the default will be used
2. System - Sends notification to Pepperi System. Pepperi uses its own webhook to push notifications to internal system. Furthermore, the system aggregates notifications to avoid DDOS meaning that message on the same notification will be sent only once every 5 minutes and will not be sent per tenant in case more than 5 tenants reported the same message (explained in detail [here](var-notifications-internal.md)).
3. Addons (default)- uses the webhooks defined by the addon on the Pepperi System (explained [here](var-addons-webhooks-internal.md)).
4. External - Sends notifications directly to OpsGenie without any aggregation or suppression.\
   Each notification creates or updates an OpsGenie alert immediately. When Status is\
   'SUCCESS', the corresponding alert is closed.

Notifications will be broadcast to channels sent in the array, for example if \['User', 'System'] is sent both User and System methods will be used to broadcast the notification &#x20;

### ~~System Health UI Actions~~

~~With system health UI, one can change Name, Description, Status, Message, NotificationWebhook, SendNotification, and add a default webhook.~~

### Webhook Body:

```json
{
  "ModificationDateTime": "",
  "Name": "",
  "Description": "",
  "Status": "",
  "Message": ""
}
```
