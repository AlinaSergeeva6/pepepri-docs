---
title: "Change Error field and Webhook status using data from http request"
description: "This example you can find in 'Integration Examples' (6685) 'SalesOrderSend' webhook task"
order: 216
---
# Change Error field and Webhook status using data from http request

*This example you can find in 'Integration Examples' (6685) 'SalesOrderSend' webhook task*

**HTTP Webhook Configuration**

To configure the HTTP settings of the webhook, please refer the “Getting Started With HTTP Integration”.

Using webhook means not only to send the data to remote clients API system or data storage via HTTP. It is also necessary to parse the server’s response to use its data to make data in integration system work just as client needs.

First and foremost: Each webhook routine after execution appears in “Transaction Logs” where you can find out whether your payload was delivered successfully.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/1-25.png)

Here we have 2 key columns we can determine by using Webhook Settings.

**Status**

Status represents whether your webhook execute well.

By default it uses **HTTP Code Value** provided by the server after processing your post request. It this case webhook with response code 200 will be considered as Success and other, for example 400, will be considered as Failed.

For particular clients this determination of success status is not suitable due to their API structure. For example, the server will respond with status 200 even when you have some data issues, but your call is ok. Such webhook will be declined by client’s system, but in Transaction logs you will see Success status.

To get rid of this unwanted behavior suggested to use next setting.

**USE\_HTTP\_STATUS**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2-19.png)

**Field Name -** *use\_http\_status*

**Field Value -** false (unchecked)

This setting switches of the determination of webhook status by using HTTP request status.

Next we need to set what exact value Integration System needs to use as Webhook Success Status.

**EXP\_SUCCESS\_STATUS**

**Field Name -** exp\_success\_status

**Field Value -** Variable or expression

When the response from clients server received, you may use its data to determine webhook success status. After submitting webhook go to Transaction Logs and hit the “View Details” button to examine the whole process of webhook execution.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/3-13.png)

At the very end of the log find “Response As Single Row” paragraph.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/4-10.png)

Here you will see the data representation of the client’s server response. You may use whatever value you need to determine webhook success status or use in expression.
