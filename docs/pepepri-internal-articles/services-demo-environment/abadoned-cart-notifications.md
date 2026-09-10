---
title: "Abadoned Cart Notifications"
description: "Estimated time to implement for the new environment - 1h"
order: 20
---
# Abadoned Cart Notifications

*Estimated time to implement for the new environment - 1h*

## Description

This is example of the notification for the Abandoned Cart. It's very similar to the regular [Abandoned Cart Emails](/integration-platform-ipaas/email/send-an-e-mail-about-abandoned-cart-transactions-within-a-pe.md), but now with the notifications.

## Advantages and disadvantages

!!!success
The buyer can always be notified if there are any abandoned carts by e-mail and notification from the application.
!!!

!!!success
This feature works for any user in your environment.
!!!

## Demo - How does it work

The use case for this is, for example, you are a Buyer and you have orders that you created but forgot about and didn't submit them and you want to be notified about it.

1.  You create an order, but you forget about it and don't submit it.
2.  The job will run to search for abandoned orders.
3.  If it finds any abandoned orders, it will send an email and notification to its buyer (you).

## How to copy to another environment

The job will do the following:

1.  Get all abandoned orders and lines from the last 24-48 hours
2.  Send emails to the buyer
3.  Send notifications to the buyer

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Abandoned-Cart-Notification-How-does-it-works.png)

### Get Abandoned Orders

First part of the job is to get all abandoned orders for the last 24-48 hours.

It's a simple 2 dataflow tasks, which takes data using Pepperi API.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Abandoned-Cart-Notification-Get-Abandoned-Orders.png)

### Send Email

This is pretty simple part. We go over all orders and send emails to the buyers.

!!!info
Example on Services Demo Environment -> [Send Emails For Abandoned Cart 24-48 Hours (74348)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74348).
!!!

### Send Notification

We go over all orders and send notifications to their buyers.

!!!info
In case, if you are not familiar with notifications, read this article first -> [Push Notifications](https://kbint.pepperi.com/internal-api/push-notifications).
!!!
