---
description: Enables Addons to send Webhooks to publish notifications to
---

# VAR Addons Webhooks (internal)

Sending webhooks is enabled using those endpoints with VAR user credentials, and with VAR system health UI.

## Sending Webhooks for addon notifications:

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0 /system_health/var/webhook`

standard pepperi resource CRUD&#x20;

#### Request Body

| Name                                              | Type      | Description              |
| ------------------------------------------------- | --------- | ------------------------ |
| Webhooks<mark style="color:red;">\*</mark>        | Object\[] | Description below        |
| AddonUUID<mark style="color:red;">\*</mark>       | String    | The requested addonUUID. |
| Name<mark style="color:red;">\*</mark>            | String    | Notification name        |
| DistributorUUID<mark style="color:red;">\*</mark> | String    | UUID key                 |

{% tabs %}
{% tab title="200: OK " %}

{% endtab %}
{% endtabs %}

#### Webhooks

A JSON object, that contains two properties in which the first (webhook) is the requested webhook URL, and the second (DistributorUUIDs ) will be a list of distributor UUIDs that are using the webhook.

in case DistributorUUIDs is empty array the webhook will be published for all distributors

```typescript
// Webhooks example
[
{
    "Webhook": "https://bla.bla.com/mysebhook",
    "DistributorUUIDs": ["ef3e25fe-7ad0-4aea-a01f-aadbeca2ed3c", 
                        "a1f996ad-dbb7-4b4f-807f-992875d28deb"]
                        
},
{
    "Webhook": "https://bla.bla.com/mysebhook",
    "DistributorUUIDs": ["ef3e25fe-7ad0-4aea-a01f-aadbeca2ed3a", 
                        "a1f996ad-dbb7-4b4f-807f-992875d28dec"]
                        
}
{
    "Webhook": "https://bla.bla.com/globalwebhook",
    "DistributorUUIDs": []
}
]
```

