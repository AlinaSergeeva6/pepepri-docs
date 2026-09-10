---
title: "No Orders For 2 Weeks Notifications"
description: "Estimated time to implement for the new environment - 2h"
order: 19
---
# No Orders For 2 Weeks Notifications

*Estimated time to implement for the new environment - 2h*

## Description

This is example of the notification for the No Orders For 2 Weeks. It check when buyers placed orders and if the last order were made more than 2 weeks ago, then it will send emails and trigger notifications for this buyers.

## Advantages and disadvantages

!!!success
The buyer can always be notified if they didn't place any orders for the last 2 weeks by e-mail and notification from the application.
!!!

!!!success
This feature works for any user in your environment.
!!!

## Demo - How does it work

The use case for this is, for example, you want your buyer to be notified if they haven't placed orders for more than 2 weeks.

1.  The last order placed by buyer were more than 2 weeks ago.
2.  The job will run to check if the last order was indeed more than 2 weeks old.
3.  If it finds any buyers like this, it will send an email and notification to them.

## How to copy to another environment

The job will do the following:

1.  Get All Buyers - Get all buyers from your environment.
2.  Get Last Orders - Get all orders from the last 2 weeks.
3.  Get Accounts Without Orders - Get all accounts, which has not any order for the last 2 weeks.
4.  Get Skipped Accounts and Merge with Accounts Without Orders - Get skipped accounts and join them with accounts without orders.

!!!info
**Skipped Accounts** are accounts that have already received email and notifications, so they should be skipped until they have no orders from the last 2 weeks.
!!!

1.  Get Buyers Without Orders - Search for buyers, that doesn't have any orders for the last 2 weeks.
2.  Send Emails and Notifications - Send emails and notifications for these buyers.
3.  Save Accounts, that should be skipped for the next run - Save accounts that were already used for the last orders check and don't use them in the next run, until they have no orders from the last 2 weeks.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/No-Orders-For-2-Weeks-Notifications-How-Does-It-Work.png)

### Get Data From Pepperi

First part of the job is to get all necessary data for this job.

You need to take:

-   All buyers, Buyers without orders.
-   All accounts.
-   All orders for the last 2 weeks.
-   Store accounts we already send emails and notifications to.

!!!info
We store the accounts in a sql table to understand which accounts we are already send emails and notifications to, for the next job run, in order to skip them.
!!!

Using all of this data, we can find which of the buyers didn't place any orders for the last 2 weeks.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/No-Orders-For-2-Weeks-Notifications-Get-Data-From-Pepperi.png)

### Send Email

This is pretty simple part. We go over all of the buyers and send emails to them.

!!!info
Example on Services Demo Environment -> [Send Emails For No Orders (74357)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74357).
!!!

### Send Notification

We go over all of the buyers and send notifications to them.

!!!info
In case, if you are not familiar with notifications, read this article first -> [Push Notifications](https://kbint.pepperi.com/internal-api/push-notifications).
!!!

### Update Stored Data

After you send emails and notifications, the only thing left to do is save the accounts in the sql table for the next job run.

The task simply takes the result from the task which has all the accounts we have sent emails to and stores them in a sql table.

!!!info
Example on Services Demo Environment -> [Store Skipped Accounts (74361)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74361).
!!!

## Possible Problems

One of the possible problems, that could appear, is problems with sql tasks.

!!!info
First of all, make sure your environment is already connected to the sql database. If this is not the case, please contact Services team manager/Support/Success manager.
!!!

So the job is setup that way, that at first it takes data from the sql table and only then it update the sql table. The problem here, that when you will run the job for the first time, it will throw the error, because the sql table doesn't exist.

In order to fix it, first of all, run the job that stores the accounts. Run it even with hardcoded data, the main thing here, that it should create an sql table.

Only after this, you won't see any issues with this task.

!!!info
Example on Services Demo Environment -> [Store Skipped Accounts (74361)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74361).
!!!
