---
title: "Email Sender"
description: "This article could be helpful if you are going to create email newsletter for some customers. All examples of tasks are on the Integration Examples (6685) integration account."
order: 238
---
# Email Sender

*This article could be helpful if you are going to create email newsletter for some customers. All examples of tasks are on the Integration Examples (6685) integration account.*

**Let\`s say** that we want to send Email with some information in the form of tables (Last Activities, Top managers/customers by Revenue/Orders, Top Brands; total 6 tables in our example) and 2 total fields (Total Orders and Total Revenue):

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-280.png)

First of all, we need to create data to send in form of table. We are going to use loop over table and @@lines to put data in email body, but there is one issue: @@lines @@lines duplicate all html elements, which are between them, and you can’t use them more than ones. So we can’t do something like that:

first\_table @@lines data\_to\_table1 @@lines …

second\_table @@lines data\_to\_table2 @@lines …

…

, because it will duplicate all between first and last @@lines, so it will duplicate even tables. As we make only top3 in every table, we can do it with only 1 iteration if we have only 1 row in our final table, where columns will be like: LastActivity\_AgentFullName\_1, LastActivity\_AgentFullName\_2 etc. Since we have only 1 row there will be only 1 iteration and tables will not be duplicated and we will get all data, which we need.

**Stages:**

1) **Get Data** - prepare all required data separately;
2) **Join all together** - unite all data and transform it to table with 1 row;
3) **Send Email** - push data into email and send it.

Stages as dataflow tasks:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-18.jpg)

**Get Data**

First of all, we need to get data separately:

· **Total Orders and Quantity** – we use simple totals, count and summarize all submitted sales order transactions for last day: https://api.pepperi.com/v1.0/totals/transactions?select=sum(GrandTotal),count(GrandTotal)&group\_by=Type&where=Status='2' AND Type='Sales Order' AND CreationDateTime>'{#getdate(-1,yyyy-MM-ddZ,day)#}'

· **Get Top Managers/Customers By Revenue/Orders** – this 4 table are really similar, so we will consider only one:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2-13.jpg)

In the first part we use totals to find total revenue by each manager (agent) and sort them in descent order. In the second part we just use auto for future join (we will join all tables by this field, so at the end we add this field).

· **Get Top Brands By Revenue** – there are 2 sub-tasks, because we union revenue and orders quantity. First of all, we should get totals by each item for transaction lines, then join brands for items and use group\_by by brand:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3-9.jpg)

· **Get Last Activities** – use simple HTTP Get request to get last 3 activities in DESC order:

https://api.pepperi.com/v1.0/activities?fields=AgentInternalID,ActionDateTime,Type&where=Status='2'&order\_by=ActionDateTime DESC&page\_size=3

Change and split some columns to get only time:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/4.jpg)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/5.jpg)

· **Fields To Join Folder** – just a folder, contains dataflow tasks which are used to join additional field such as Manager or Customer Name etc.:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/6.jpg)

Can be simply changed in order to get needed fields. That dataflow tasks than join to certain tables by InternalID, but it can be joined by other fields.

**Note:** order\_by is executed at the end, even after data\_feature\_order, that’s why we need to create additional tasks with auto in Customer/Manager dataflow tasks.

**Join all together**

To join all together we need 3 tasks:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/7.jpg)

1) **Join All For Email For Pivot Without Filter** – first tasks where we just join all other tables in 1 by key (auto):

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/8.jpg)

At the end we get table, that contains all data we need, but there are 3 rows, but we need 1.

2) **Join All For Email** – we use this tasks to get only 1 row with help of pivot (this function similar to nominal rows\_to\_cols). We use pivot for each column, so we get 18 pivots:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/9.jpg)

· **Pivot Column** – name of columns after pivot: “ManagerIDbyRev \_1”, “ManagerIDbyRev \_2”, “ManagerIDbyRev \_3”, …;

· **Pivot Value** – column from which we take data;

· **Functions** – TOP;

· **Pivot Condition** – condition to use pivot. In our case we just use columns with absolutely same value.

At the end we get table with only 1 row and over 60 columns, **but** we after pivot we got columns with names such as “ManagerIDbyRev \_1” – we got space between ‘v’ and ‘\_’, but @@lines require columns without spaces and that’s why we need next task.

3) **Join All For Email Final** – simple task to rename all 54 columns. Technically we could do it in previous tasks and put “change” at the last position in data\_feature\_order, but it doesn’t work properly, so we use one more task.

**Send Email**

This is the last task we actually send our sheet. First of all, we should set dataflow task setting:

· Application – Generic HTTP Connector;

· Source Object – Email Sender;

· Target Object – Store Data Table For Later Use.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/10.jpg)

The next step should be email and loop\_over\_table Settings:

1) **loop\_over\_table** – name of table for loop (Join All For Email Final);
2) **loop\_over\_table\_distinct** – distinct field to loop over all rows by it (key);
3) **dataflow\_email\_from** – dataflow Email From, sender (info@pepperi.com);
4) **dataflow\_email\_display\_from** – it displays from who was email;
5) **dataflow\_email\_to** – name of email to send to;
6) **dataflow\_email\_subject** – subject of email;
7) **dataflow\_email\_attach\_task** – attach CSV by task name;
8) **dataflow\_email\_body\_html** – allow you to use html to make body of email:

In our case we use @@lines in the beginning and in the end, and create tables with using $#TotalQty#$, $#LastActivity\_AgentFullName\_1#$ etc. fields between them.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/11.jpg)
