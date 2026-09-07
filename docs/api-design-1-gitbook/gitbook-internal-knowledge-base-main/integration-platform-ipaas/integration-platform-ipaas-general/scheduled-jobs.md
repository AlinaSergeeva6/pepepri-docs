---
description: >-
  This example you can find in 'Integration Examples' (6685) GroupBy dataflow
  task.
---

# Scheduled Jobs

When you need to complete tasks one after another (for example, the second task is based on the accomplished result of the first task), then use the 'Scheduled Jobs'. This is also used if you want the task to be performed automatically at a given frequency.

Let's look at an example:

The 'GroupBy' dataflow task returns a file, then the second task takes data and transform it. The second task will never be completed if the first task is not completed.&#x20;

_We can do a scheduled jobs_

Go to

![](../../.gitbook/assets/a.png)

Add new record

![](../../.gitbook/assets/b.png)

Here you can set the task execution time:

![](<../../.gitbook/assets/2 (16).png>)

click Update and you will have new line with you own scheduled:

![](<../../.gitbook/assets/1 (17).png>)

Click it --> oped 'Tasks' Tab --> Add new record --> select the name of the tasks that you need and put the execution queue:

![](../../.gitbook/assets/e.png)

#### It is not necessary to specify a manual sequence execution  for each task. We can just grab the task and move it to the right place in the sequence (sequence will change automatically):<br>

![](../../.gitbook/assets/s.png)

Then go to 'Details' and click 'Run Job'

