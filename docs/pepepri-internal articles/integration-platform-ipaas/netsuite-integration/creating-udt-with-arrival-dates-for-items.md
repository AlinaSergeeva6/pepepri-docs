---
title: "Creating UDT with Arrival dates for items"
order: 161
---
# Creating UDT with Arrival dates for items

If customer have information for future availability of items, he may want to show this to client.

Netsuite configuration:

Here is NS criteria configurations, main of them is Quantity and Arrival Date.

![](https://alinasergeeva6.github.io/pepepri-docs/static/1-36.png)

Columns configuration:

![](https://alinasergeeva6.github.io/pepepri-docs/static/2-26.png)

Integration configuration:

![](https://alinasergeeva6.github.io/pepepri-docs/static/3-19.png)

Normally you will need 1 task to fill in the UDT.

You must have fields: MainKey, SecondaryKey, Values, MapdataExternalID.

You will use this settings:

![](https://alinasergeeva6.github.io/pepepri-docs/static/4-15.png)

In case when SecondaryKey is not unique you will need 2 tasks to upload data to UDT, because of pepperi back office will remove duplicates and you will get only unique Secondary Key.

1 task settings you see on screenshot above and there is mapping for it:

![](https://alinasergeeva6.github.io/pepepri-docs/static/5-14.png)

This task will only get data from NS or other platform.

2 task will filter data from task 1.

Settings:

![](https://alinasergeeva6.github.io/pepepri-docs/static/6-12.png)

Mapping:

![](https://alinasergeeva6.github.io/pepepri-docs/static/7-9.png)
