---
title: "SAP payment"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account (Webhook task: “SAP On Demo Server” );"
order: 143
---
# SAP payment

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account (Webhook task: “SAP On Demo Server” );*

This is an option for the client to pay by card, cash, check, credit card, transfer and invoice.

Setting is done via activity tab:

![](/static/1-40.png)

On integration platform settings is done via webhook tasks:

![](/static/2-29.png)

Base settings:

![](/static/3-21.png)

Pepperi have no default fields for this type of activity so you need to create TSA fields and add mapping to send information to SAP server:

![](/static/4-16.png)

Depending on what type of payment you need, you must select the appropriate fields.

![](/static/5-15.png)

You can frequently see in the logs an error about the fields you don't have for a successful payment. To see what kind of data you need for specific field you can see RCT3 SAP table

![](/static/6-13.png)
