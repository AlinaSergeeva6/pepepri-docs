---
title: "Return Based On UI Task"
description: "Estimated time to implement for new environment - 1h"
order: 34
---
# Return Based On UI Task

*Estimated time to implement for new environment - 1h*

### Description

One of the best solutions among existing returns. Allows you to return items based on existing invoices, but more customizable and very flexible when it comes to styles, includes searching by Invoice ID or Product ID.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2023-03-31-122224.png)

**The UI task shows a list of all items and the number of items that can be returned.**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2023-03-31-122810.png)

**Select the items you would like to return and their quantity.**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2023-03-31-122904.png)

**You can then view the items you have selected in your cart and submit a return.**

### Advantages and disadvantages

!!!success
Has a good validation system, users can't return an item or select a wrong quantity that hasn't been added to the invoice before.
!!!

!!!success
Easy to use, fairly fast implementation (if you use standard styles and fields).
!!!

!!!success
Very flexible. Has the ability to search for a specific product or transaction.
!!!

!!!success
Can be setup with a UI Task or a Custom Form, depending on the customer's requirements or the complexity of the task.
!!!

!!!success
If you are implementing with a Custom Form, you can make a return offline, but it won't be processed until the user syncs their device.
!!!

!!!danger
We can only return items for transactions that were previously created.
!!!

### Demo - How does it work

1.  Open **Return Based On UI Task** transaction and select the first customer.
2.  Select the items you would like to return and the quantity and click **Add To Card** button.

!!!info
When you start a transaction, the **Return Qty** column displays the maximum number of items you can return.
!!!

1.  You will be redirected to the cart where you can view your items. Click **Submit** to complete the return process.

### How to copy to another environment

1.  Create new transaction type.
2.  Create these fields in a new transaction and add them to views.
    -   **Header fields**
        -   TSAGrandTotal - Sum Transaction Lines type. Sum Transaction line field - TSALineSum.

    -   **Line fields**
        -   TSALineSum - Currency type.
        -   TSAQTY - Number type.

3.  In the workflow on **New** \-> **In Creation** step, add a UI Task or a Custom From. (You can use a custom corm from **Services Demo Environment**. Custom From name: **Return items from Invoice**).

!!!info
By default, the custom form retrieves invoice data from an **Invoice** transaction. Make sure you have this transaction and your invoices are uploaded to the **Invoice** transaction. If you want to retrieve invoices from another transaction, you need to update the custom form.
!!!
