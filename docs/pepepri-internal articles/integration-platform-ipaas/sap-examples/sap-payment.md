---
title: "SAP payment"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account (Webhook task: “SAP On Demo Server” );"
order: 143
---
# SAP payment

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account (Webhook task: “SAP On Demo Server” );*

This is an option for the client to pay by card, cash, check, credit card, transfer and invoice.

Setting is done via activity tab:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/1-40.png)

On integration platform settings is done via webhook tasks:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2-29.png)

Base settings:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/3-21.png)

Pepperi have no default fields for this type of activity so you need to create TSA fields and add mapping to send information to SAP server:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/4-16.png)

Depending on what type of payment you need, you must select the appropriate fields.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/5-15.png)

You can frequently see in the logs an error about the fields you don't have for a successful payment. To see what kind of data you need for specific field you can see RCT3 SAP table

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/6-13.png)
