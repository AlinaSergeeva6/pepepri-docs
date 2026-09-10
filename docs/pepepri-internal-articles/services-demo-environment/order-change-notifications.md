---
title: "Order Change Notifications"
description: "Estimated time to implement for the new environment - 4h"
order: 21
---
# Order Change Notifications

*Estimated time to implement for the new environment - 4h*

## Description

This is example of the notifications for the Order Change. It checks which transactions have been modified by ERP and sends a notification to the buyer.

## Advantages and disadvantages

!!!success
The buyer can always be notified of any changes to the order by e-mail and notification from the application.
!!!

!!!success
This feature works for any user in your environment.
!!!

## Demo - How does it work

The use case for this is, for example, you are a Buyer and your order were approved by Rep or changed by ERP and you want to have a notification about it.

1.  Your order was changed by ERP.
2.  The job will run to search for the changed order.
3.  If it finds any changed orders, it will send an email and notification to its buyer (you).

## How to copy to another environment

The job will do the following:

1.  Get Transactions - Get current transactions from an activity type.
2.  Find Changed Transactions - Union 'Get Transactions' and 'Store New Transactions Data' tasks.
3.  Catch Changes - Filter out 'Find Changed Transactions' data.
4.  Get Items and Accounts For Join - Get Items and Accounts from your environment.
5.  Get Transaction Lines - Get transaction lines from 'Catch Changes' task and join items and accounts data.
6.  Send Emails For Changed Orders - Send email to your buyers with changed orders.
7.  Send Notifications For Changed Orders - Send notifications to your buyers with changed orders.
8.  Store New Transactions Data - Update stored data with new transactions.

### Find Changed Orders

First part of the job is to find which orders were actually changed.

To do so, you need to:

1.  Export all current orders.
2.  Join old orders with new orders.
3.  Find only orders that were changed.
4.  Get lines for this orders and join items and accounts data to the lines.

!!!info
This is possible because of one task, that is storing old orders in the sql table. Because of this we can compare our old orders with current orders.
!!!

In the result of this part, we have all orders and lines of this orders, that were changed.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Order-Change-Notification-Find-Changed-Orders.png)

### Send Email

This is pretty simple part. We go over all orders and send emails to their buyers.

!!!info
Example on Services Demo Environment -> [Send Emails For Changed Orders (74324)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74324).
!!!

### Send Notification

We go over all orders and send notifications to their buyers.

!!!info
In case, if you are not familiar with notifications, read this article first -> [Push Notifications](https://kbint.pepperi.com/internal-api/push-notifications).
!!!

### Update Stored Data

After you send emails and notifications, the only thing left to do is save the new orders in the sql table for the next job run.

The task just takes the result from 'Get Transactions' dataflow task and save it to the sql table.

!!!info
Example on Services Demo Environment -> [Store New Transactions Data (74321)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74321).
!!!

## Add New Orders

The last thing is to add new. submitted order to the sql table of stored orders.

For this you need 2 dataflow tasks and 1 webhook.

Dataflow task should do the following:

1.  Get data of new order.
2.  Push then to the sql table.

!!!info
Don't forget to add this two tasks to the job.
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Order-Change-Notification-Add-New-Orders.png)

The webhook should trigger the job.

!!!info
Example on Services Demo Environment -> [Catch B2B order change (Pepperi Notification) (74389)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74389).
!!!

## Possible Problems

One of the possible problems, that could appear, is problems with sql tasks.

!!!info
First of all, make sure your environment is already connected to the sql database. If this is not the case, please contact Services team manager/Support/Success manager.
!!!

So the job is setup that way, that at first it takes data from the sql table and only then it update the sql table. The problem here, that when you will run the job for the first time, it will throw the error, because the sql table doesn't exist.

In order to fix it, first of all, run the job that stores the old orders. Run it even with hardcoded data, the main thing here, that it should create a table.

Only after this, you won't see any issues with this task.

!!!info
On Services Demo Environment this task -> [Store New Transactions Data (74321)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74321).
!!!
