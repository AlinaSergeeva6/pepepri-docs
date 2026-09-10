---
title: "Resubmit All Failed Transactions"
description: "All the examples you can find in 'Integration Examples' (6685), Dataflow task - \"Get And Resubmit Transactions\""
order: 243
---
# Resubmit All Failed Transactions

*All the examples you can find in 'Integration Examples' (6685), Dataflow task - "Get And Resubmit Transactions"*

Firstable you need to get all failed transactions (in separate task). After you have this csv with data , create a new one task, where privious task will be loop\_over\_table:

![](/static/1-15.png)

Then do this:

![](/static/2020-07-13_15h30_09.png)
