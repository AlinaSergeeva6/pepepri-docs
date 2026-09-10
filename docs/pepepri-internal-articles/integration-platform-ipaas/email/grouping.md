---
title: "Grouping"
description: "This example you can find in 'Integration Examples' (6685) GroupBy dataflow task."
order: 233
---
# Grouping

*This example you can find in 'Integration Examples' (6685) GroupBy dataflow task.*

## Group By without aggregation function

For example , you have the next datas (to retrieve data using the task 'GroupBy') :

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-20.png)

for data conversion we need second task (GroupBy-1) and set the following settings: func\_groupby\_cols, func\_col

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/kk.png)

The final file will contain the following data:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2-15.png)

## Group By with aggregation function

Settings the same + group\_func setting with value like 'count' or 'sum'
