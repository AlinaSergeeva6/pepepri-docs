---
description: >-
  This example you can find in 'Integration Examples' (6685) GroupBy dataflow
  task.
---

# Grouping

## Group By without aggregation function

For example , you have the next datas (to retrieve data using the task 'GroupBy') :

![](<../../.gitbook/assets/1 (23).png>)

for data conversion we need second task (GroupBy-1) and set the following settings: func\_groupby\_cols, func\_col

![](../../.gitbook/assets/kk.png)

The final file will contain the following data:

![](<../../.gitbook/assets/2 (13).png>)

## Group By with aggregation function

Settings the same + group\_func setting with value like 'count' or 'sum'&#x20;
