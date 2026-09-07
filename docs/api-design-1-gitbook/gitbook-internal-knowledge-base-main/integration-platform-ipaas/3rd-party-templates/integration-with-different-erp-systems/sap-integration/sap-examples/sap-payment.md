---
description: >-
  You can find existing solution in “Integration Examples” (6685) Pepperi
  integration platform account (Webhook task: “SAP On Demo Server” );
---

# SAP payment

This is an option for the client to pay by card, cash, check, credit card, transfer and invoice.

Setting is done via activity tab:

![](<../../../../../.gitbook/assets/1 (28).png>)

On integration platform settings is done via webhook tasks:

![](<../../../../../.gitbook/assets/2 (10).png>)

Base settings:

![](<../../../../../.gitbook/assets/3 (8).png>)

Pepperi have no default fields for this type of activity so you need to create TSA fields and add mapping to send information to SAP server:

![](<../../../../../.gitbook/assets/4 (4).png>)

Depending on what type of payment you need, you must select the appropriate fields.

![](<../../../../../.gitbook/assets/5 (7).png>)

You can frequently see in the logs an error about the fields you don't have for a successful payment. To see what kind of data you need for specific field you can see RCT3 SAP table

![](<../../../../../.gitbook/assets/6 (2).png>)
