---
title: "Splitting Transactions"
description: "the main feature is that you split one transaction into 2 or more"
order: 234
---
# Splitting Transactions

*the main feature is that you split one transaction into 2 or more*

There are 2 options of creating split order

## 1.http request

1.  Create transaction

2\. Add items

3.Choose what type of transaction you want to split it to

4.Choose a parameter for splitting

if the user needs it to work on API with multiple accounts, the user creates a custom form and he defines everything there.

**NOTE!** It does not work on the web app.

web app does not load all the accounts, only the ones that we logged in to.

Custom form is fast and it displays all transaction.

!!!info
The entire example can be found on pepperi demo environment,

log via Admin: ukr\_templates@pepperi.com
!!!

## 2. Webhook

!!!info
The entire example can be found in integration account : Examples - Internal (6546)
!!!

The process starts like always with a Webhook - since this is what the workflow triggers- so we will typically have 2+ webooks - for example:

1.  Webhook - that triggers a JOB
2.  Webhook - that does the actual processing for example of sales order after filtering only the lines we want to filter as sales order lines
3.  Another Webhook or many - that does the same as 2. but with different filter for example as invoice lines

Screenshot of manage Webhook tasks:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-281.png)

The Job:

1.  The job starts with HTTP task to get the Transaction Header
2.  HTTP task to get the Transaction Lines - and perform Join with Task 1
3.  HTTP task to loop over the lines from task 2 and filter only required lines - and create a transaction in Pepperi that has only the required lines
4.  General Cloud task that trigger Wwebhook = submit the newly created transaction on step 3
5.  HTTP task that takes the response - transaction ID from task 4 and updated external ID in Pepperi.

Screenshot of manage Dataflow task:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-282.png)

The Webhook that starts the process must have the following settings:

1.  run\_job\_id = the Shceduled Job ID (seen on the scheduled jobs)
2.  job\_wait\_seconds = seconds to wait until job ends with failure or success status
3.  lock\_online\_trn = the value here MUST be 0 - since the webhook triggers another Webhook within the job process - and if we set it to 1 (default) the meaning will be the job will never end as it will not allow the additional Webhook to run in parallel.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-283.png)

1.The job starts with HTTP task to get the Transaction Header - please note the `{#pepperi_object_id#}` **its the object id of the Webhook that triggered the job**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-284.png)

2\. HTTP task to get the Transaction Lines - and perform Join with Task 1

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-285.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-286.png)

3\. HTTP task to loop over the lines from task 2 and filter only required lines - and **POST** a transaction in Pepperi that has only the required lines

\>> loops over the joined table >> only on the filtered lines >> only on the lines where InternalID is the same - which is all the lines in this case

**\*\* please note - if the split is simple based on a sinlgle field value - for example category id - then the** `loop_over_distinct` **feature enables looping over each distinct set of lines and process HTTP request on those lines.**

**Loop:**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-287.png)

**POST**:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-288.png)

4\. General Cloud task that trigger Webhook = submit the newly created transaction on step 3

**Loop**:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-289.png)

**POST**:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-290.png)

5\. HTTP task that takes the response - transaction ID from task 4 and updated external ID in Pepperi.

**Loop:**

**(its also possible to loop over the Webhook task name - it might be clearer as the result had the internal id as a column)**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-291.png)

**POST:**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-292.png)

The required General Settings are:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-293.png)

to ensure that all loops are per job and response is not taken from other job

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-294.png)

to ensure that when HTTP request fails - the entire Job fails
