---
title: "Deleting UDT rows"
description: "All examples of tasks are on the Integration Examples (6685) integration account."
order: 315
---
# Deleting UDT rows

*All examples of tasks are on the Integration Examples (6685) integration account.*

For deleting lines from UDT we need run webhook task, where we use POST method, Url is: [https://api.pepperi.com/v1.0/user\_defined\_tables](https://api.pepperi.com/v1.0/user_defined_tables).

It is neccesary create a fields, that takes MainKey, SecondaryKey, Values and specified this fields in Body of webhook. In our case we created for secondary key TSASecKey field and TSAUDTvalObj for getting values . ‘Hidden’ should be true.

MapDataExternalId is name of UDT.

![](https://alinasergeeva6.github.io/pepepri-docs/static/1-1.jpg)

You can call webhook in workflow. For this make :

![](https://alinasergeeva6.github.io/pepepri-docs/static/22.png)

Web service URL : go to Detains in webhook task and copy **Commit Task URL:**

![](https://alinasergeeva6.github.io/pepepri-docs/static/1-2.jpg)
