---
title: "New Surveys Notifications"
description: "Estimated time to implement for the new environment - 2h"
order: 18
---
# New Surveys Notifications

*Estimated time to implement for the new environment - 2h*

## Description

This is example of the notification for the New Surveys. It check if there are any new surveys and if it is, it will send a notifications to the buyers.

!!!info
Survey is a new feature available in Pepperi. It's a part of the [Launch Page](https://kbint.pepperi.com/add-ons-manuals/pages-add-on/launch-page). Make sure you are familiar with this article before moving on.
!!!

## Advantages and disadvantages

!!!success
The buyer can always be notified if there are any new surveys by e-mail and notification from the application.
!!!

!!!success
This feature works for any user in your environment.
!!!

## Demo - How does it work

The use case for this is, for example, you are a Buyer and you want to have a notifications in case there are new surveys available for you.

1.  The job will run to search for new surveys for you.
2.  If it finds any new surveys, it will send an email and notification to you.

## How to copy to another environment

The job will do the following:

1.  Get Surveys - Get surveys from the last 30 days.
2.  Get Accounts - Get all accounts from your environment.
3.  Get All Buyers - Get all buyers from your environment.
4.  Filter Only Buyers Without Surveys - Filter all buyers and find buyers who don't have surveys.
5.  Send Emails and Notifications - Send emails and notifications for these buyers.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Surveys-Notifications-How-does-it-works.png)

### Get Data From Pepperi

First part of the job is to get all necessary data for this job.

You need to take:

-   All surveys.
-   All buyers.
-   All accounts.

Using all of this data, we can find which of the buyers didn't have any new surveys for the last 30 days.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Surveys-Notifications-Get-Data-From-Pepperi.png)

### Send Email

This is pretty simple part. We go over all of the buyers and send emails to them.

!!!info
Example on Services Demo Environment -> [Send Emails For Surveys (74388)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=74388).
!!!

### Send Notification

We go over all of the buyers and send notifications to them.

!!!info
In case, if you are not familiar with notifications, read this article first -> [Push Notifications](https://kbint.pepperi.com/internal-api/push-notifications).
!!!
