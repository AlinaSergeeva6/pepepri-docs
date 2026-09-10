---
title: "Distributed Ordering"
description: "Estimated time to implement for new environment - 4h"
order: 38
---
# Distributed Ordering

*Estimated time to implement for new environment - 4h*

### Description

Distributed order is a feature that is usually added as a program or workflow. Distributed ordering allows you to assign items from the order center to different accounts ship-tos.

You can then create a transaction with items that are assigned to a specific account. After you split the order of the main transaction, new transactions will be uploaded.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2023-03-31-152614.png)

**Select the accounts you want to ship-to.**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2023-03-31-152452.png)

**Distribute the totals across all locations.**

### Demo - How does it work

To see how this feature works:

1.  Open a **Sales Order**, select the **A Paris Food** account.
2.  Add multiple items to cart with quantity more than 1.
3.  Go to the cart and click **Distributed Ordering** button.
4.  The UI Task will open, where you can select a delivery ship-tos. Select some of them, click **Next**.
5.  Fill in the grid and click **Next**.

!!!info
Now the job will be triggered, which will split the order and create child transactions
!!!

1.  When the job completes, the **Distributed Ordering - Parent** and **Distributed Ordering - Child** action lists will represent the corresponding parent and child transactions.

### How to copy to another environment

1.  Copy this Dataflow/Webhook/UI Tasks to your environment.

-   Copy the Dataflow Tasks and create a scheduled job for them - it should be the same as **Split Order (50682)** in **Services Demo Environment**.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2023-03-31-15_09_01-ACC-[7343]-General-Settings.png)

-   Copy the Webhook Tasks.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2023-03-31-15_15_10-ACC-[7343]-General-Settings.png)

-   Copy the UI Tasks.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2023-03-31-15_17_18-ACC-[7343]-Manage-UI-Tasks.png)

1.  In your transaction, create new step in the workflow, give it a following name: **Distributed Ordering**.
2.  In this new step, add the following.
    -   The new custom form, which should be your copy of the following UI Task: **Distributed Ordering (68137)**.
    -   The webhook, which should be your copy of the following Webhook Task: **Webhook for Distributed Ordering (68148)**.
