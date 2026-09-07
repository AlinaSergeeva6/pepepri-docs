---
description: >-
  Standard pepperi resource for aggregating notifications from tenants in the
  system level
---

# VAR Notifications (internal)

## define the notification to send

<mark style="color:green;">`POST`</mark> `https://api/pepperi/com/system_health/var/notifications`

DistributorUUID+AddonUUID+Name - creates the key&#x20;

#### Request Body

| Name                                              | Type   | Description                                  |
| ------------------------------------------------- | ------ | -------------------------------------------- |
| Name<mark style="color:red;">\*</mark>            | String | <p>Notification name. </p><p></p>            |
| Description<mark style="color:red;">\*</mark>     | String | A short description of the notification.     |
| Status<mark style="color:red;">\*</mark>          | String | SUCCESS/WARNNING/ERROR                       |
| Message<mark style="color:red;">\*</mark>         | String | The relevant message addon wants to publish. |
| AddonUUID<mark style="color:red;">\*</mark>       | String | The requested addonUUID.                     |
| DistributorUUID<mark style="color:red;">\*</mark> | String | UUID key for the tenant                      |

{% tabs %}
{% tab title="200: OK " %}

{% endtab %}
{% endtabs %}

All notifications are being saved in a Pepperi System table.

On notification status change (ERROR-> SUCCESS)- the notification is becoming Hidden=true and will not be shown.

#### Errors Aggregation

If the number of distributors that failed is below 5, all failure messages are published. Otherwise, only a single error message will be published: "\{{message\}} on \{{num\_of\_distributors\}} distributors", including 5 distributors with the error.

#### Notification Types&#x20;

In general there are 3 types of notifications that can be sent,&#x20;

1. Monitor - monitoring the system every X minute and reports on success or failure, e.g. sync monitor. In this notification type the Notification is sent only on status change and according to the aggregation policy&#x20;
2. System Failure - the addon will send notification in case of an unexpected error that caused a data corruption of some kind and it will remain on status 'error' until a fix procedure will be executed and then it will move to success
3. End User error - phase 2
