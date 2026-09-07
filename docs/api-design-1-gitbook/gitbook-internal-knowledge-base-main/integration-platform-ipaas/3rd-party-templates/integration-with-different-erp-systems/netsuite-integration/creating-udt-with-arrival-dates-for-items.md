# Creating UDT with Arrival dates for items

If customer have information for future availability of items, he may want to show this to client.

Netsuite configuration:

Here is NS criteria configurations, main of them is Quantity and Arrival Date.

![](../../../../.gitbook/assets/1.png)

Columns configuration:

![](<../../../../.gitbook/assets/2 (19).png>)

Integration configuration:

![](<../../../../.gitbook/assets/3 (22).png>)

Normally you will need 1 task to fill in the UDT.&#x20;

You must have fields: MainKey, SecondaryKey, Values, MapdataExternalID. &#x20;

You will use this settings:

![](<../../../../.gitbook/assets/4 (10).png>)

In case when SecondaryKey is not unique you will need 2 tasks to upload data to UDT, because of pepperi back office will remove duplicates and you will get only unique Secondary Key.

1 task settings you see on screenshot above and there is mapping for it:

![](<../../../../.gitbook/assets/5 (22).png>)

This task will only get data from NS or other platform.

2 task will filter data from task 1.

Settings:

![](<../../../../.gitbook/assets/6 (15).png>)

Mapping:

![](<../../../../.gitbook/assets/7 (6).png>)

