---
description: >-
  All the examples you can find in 'Integration Examples' (6685);  'Email
  Tasks/Email - Get All Failed Transactions' and 'TestSqlSource' dataflow task
---

# SQL Based Dataflow/UI Task output tables

There is a new sophisticated SQL-based way to process received data. It may come in handy during report creation and it also dramatically simplifies manipulations with data using dataflow tasks.

This article is related to **task\_table\_sql** set of dataflow task settings.

To start working with task\_table\_sql first you need to define one of you target dataflow tasks as SQL data source. The example uses dataflow task which receives all failed transactions of current project.

Email – Get All Failed Transactions:

![](<../../.gitbook/assets/1 (16).png>)

For further manipulations we need to define one key setting which allows us to process the data stored by this dataflow task by using SQL. In other words this setting converts final CSV into SQL table.

![](<../../.gitbook/assets/2 (34).png>)

TestSqlSource:

By defining this setting:

![](<../../.gitbook/assets/3 (11).png>)

\
We set our dataflow task as data source.

Applying **task\_table\_sql\_query**

![](<../../.gitbook/assets/4 (18).png>)

We can easily fetch the data we need by using standard SQL.

![](<../../.gitbook/assets/5 (5).png>)
