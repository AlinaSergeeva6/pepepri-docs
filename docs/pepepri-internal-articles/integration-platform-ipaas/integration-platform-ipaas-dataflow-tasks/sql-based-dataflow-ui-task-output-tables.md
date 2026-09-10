---
title: "SQL Based Dataflow/UI Task output tables"
description: "All the examples you can find in 'Integration Examples' (6685); 'Email Tasks/Email - Get All Failed Transactions' and 'TestSqlSource' dataflow task"
order: 242
---
# SQL Based Dataflow/UI Task output tables

*All the examples you can find in 'Integration Examples' (6685);  'Email Tasks/Email - Get All Failed Transactions' and 'TestSqlSource' dataflow task*

There is a new sophisticated SQL-based way to process received data. It may come in handy during report creation and it also dramatically simplifies manipulations with data using dataflow tasks.

This article is related to **task\_table\_sql** set of dataflow task settings.

To start working with task\_table\_sql first you need to define one of you target dataflow tasks as SQL data source. The example uses dataflow task which receives all failed transactions of current project.

Email – Get All Failed Transactions:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-16.png)

For further manipulations we need to define one key setting which allows us to process the data stored by this dataflow task by using SQL. In other words this setting converts final CSV into SQL table.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2-10.png)

TestSqlSource:

By defining this setting:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3-6.png)

We set our dataflow task as data source.

Applying **task\_table\_sql\_query**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/4-4.png)

We can easily fetch the data we need by using standard SQL.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/5-5.png)
