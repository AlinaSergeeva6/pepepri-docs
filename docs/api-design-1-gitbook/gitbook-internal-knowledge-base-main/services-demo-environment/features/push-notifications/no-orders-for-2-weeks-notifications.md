---
description: Estimated time to implement for the new environment - 2h
---

# No Orders For 2 Weeks Notifications

## **Description**

This is example of the notification for the No Orders For 2 Weeks. It check when buyers placed orders and if the last order were made more than 2 weeks ago, then it will send emails and trigger notifications for this buyers.&#x20;

## Advantages and disadvantages

{% hint style="success" %}
The buyer can always be notified if they didn't place any orders for the last 2 weeks by e-mail and notification from the application.
{% endhint %}

{% hint style="success" %}
This feature works for any user in your environment.
{% endhint %}

## Demo - How does it work&#x20;

The use case for this is, for example, you want your buyer to be notified if they haven't placed orders for more than 2 weeks.

1. The last order placed by buyer were more than 2 weeks ago.
2. The job will run to check if the last order was indeed more than 2 weeks old.
3. If it finds any buyers like this, it will send an email and notification to them.

## **How to copy to another environment**

The job will do the following:

1. Get All Buyers - Get all buyers from your environment.
2. Get Last Orders - Get all orders from the last 2 weeks.
3. Get Accounts Without Orders - Get all accounts, which has not any order for the last 2 weeks.
4. Get Skipped Accounts and Merge with Accounts Without Orders - Get skipped accounts and join them with accounts without orders.

{% hint style="info" %}
**Skipped Accounts** are accounts that have already received email and notifications, so they should be skipped until they have no orders from the last 2 weeks.
{% endhint %}

5. Get Buyers Without Orders - Search for buyers, that doesn't have any orders for the last 2 weeks.
6. Send Emails and Notifications - Send emails and notifications for these buyers.
7. Save Accounts, that should be skipped for the next run - Save accounts that were already used for the last orders check and don't use them in the next run, until they have no orders from the last 2 weeks.

<figure><img src="../../../.gitbook/assets/No Orders For 2 Weeks Notifications - How Does It Work.png" alt=""><figcaption></figcaption></figure>

### Get Data From Pepperi

First part of the job is to get all necessary data for this job.

You need to take:

* All buyers, Buyers without orders.
* All accounts.
* All orders for the last 2 weeks.
* Store accounts we already send emails and notifications to.

{% hint style="info" %}
We store the accounts in a sql table to understand which accounts we are already send emails and notifications to, for the next job run, in order to skip them.
{% endhint %}

Using all of this data, we can find which of the buyers didn't place any orders for the last 2 weeks.

<figure><img src="../../../.gitbook/assets/No Orders For 2 Weeks Notifications  - Get Data From Pepperi.png" alt=""><figcaption></figcaption></figure>

### Send Email

This is pretty simple part. We go over all of the buyers and send emails to them.

{% hint style="info" %}
Example on Services Demo Environment -> [Send Emails For No Orders (74357)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74357).
{% endhint %}

### Send Notification

We go over all of the buyers and send notifications to them.

{% hint style="info" %}
In case, if you are not familiar with notifications, read this article first -> [Push Notifications](https://kbint.pepperi.com/internal-api/push-notifications).
{% endhint %}

### Update Stored Data

After you send emails and notifications, the only thing left to do is save the accounts in the sql table for the next job run.

The task simply takes the result from the task which has all the accounts we have sent emails to and stores them in a sql table.

{% hint style="info" %}
Example on Services Demo Environment -> [Store Skipped Accounts (74361)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74361).
{% endhint %}

## Possible Problems

One of the possible problems, that could appear, is problems with sql tasks.

{% hint style="info" %}
First of all, make sure your environment is already connected to the sql database. If this is not the case, please contact Services team manager/Support/Success manager.
{% endhint %}

So the job is setup that way, that at first it takes data from the sql table and only then it update the sql table. The problem here, that when you will run the job for the first time, it will throw the error, because the sql table doesn't exist.

In order to fix it, first of all, run the job that stores the accounts. Run it even with hardcoded data, the main thing here, that it should create an sql table.

Only after this, you won't see any issues with this task.

{% hint style="info" %}
Example on Services Demo Environment -> [Store Skipped Accounts (74361)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74361).
{% endhint %}
