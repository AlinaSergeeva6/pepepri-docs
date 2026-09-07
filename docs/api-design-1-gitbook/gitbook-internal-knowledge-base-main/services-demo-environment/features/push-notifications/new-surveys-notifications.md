---
description: Estimated time to implement for the new environment - 2h
---

# New Surveys Notifications

## **Description**

This is example of the notification for the New Surveys. It check if there are any new surveys and if it is, it will send a notifications to the buyers.

{% hint style="info" %}
Survey is a new feature available in Pepperi. It's a part of the [Launch Page](https://kbint.pepperi.com/add-ons-manuals/pages-add-on/launch-page). Make sure you are familiar with this article before moving on.
{% endhint %}

## Advantages and disadvantages

{% hint style="success" %}
The buyer can always be notified if there are any new surveys by e-mail and notification from the application.
{% endhint %}

{% hint style="success" %}
This feature works for any user in your environment.
{% endhint %}

## Demo - How does it work&#x20;

The use case for this is, for example, you are a Buyer and you want to have a notifications in case there are new surveys available for you.

1. The job will run to search for new surveys for you.
2. If it finds any new surveys, it will send an email and notification to you.

## **How to copy to another environment**

The job will do the following:

1. Get Surveys - Get surveys from the last 30 days.&#x20;
2. Get Accounts - Get all accounts from your environment.&#x20;
3. Get All Buyers - Get all buyers from your environment.
4. Filter Only Buyers Without Surveys - Filter all buyers and find buyers who don't have surveys.
5. Send Emails and Notifications - Send emails and notifications for these buyers.

<figure><img src="../../../.gitbook/assets/Surveys Notifications - How does it works.png" alt=""><figcaption></figcaption></figure>

### Get Data From Pepperi

First part of the job is to get all necessary data for this job.

You need to take:

* All surveys.
* All buyers.
* All accounts.

Using all of this data, we can find which of the buyers didn't have any new surveys for the last 30 days.

<figure><img src="../../../.gitbook/assets/Surveys Notifications - Get Data From Pepperi.png" alt=""><figcaption></figcaption></figure>

### Send Email

This is pretty simple part. We go over all of the buyers and send emails to them.

{% hint style="info" %}
Example on Services Demo Environment -> [Send Emails For Surveys (74388)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74388).
{% endhint %}

### Send Notification

We go over all of the buyers and send notifications to them.

{% hint style="info" %}
In case, if you are not familiar with notifications, read this article first -> [Push Notifications](https://kbint.pepperi.com/internal-api/push-notifications).
{% endhint %}
