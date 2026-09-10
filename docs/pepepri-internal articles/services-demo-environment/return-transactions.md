---
title: "Return Transactions"
order: 37
---
# Return Transactions

There are three types of return transactions you need to know.

## Return 3 (return without validations)

The simplest one is Return 3 (return without validations): the functionality of this transaction is pretty straightforward, you just have to pick the items, add them to the cart and submit your transaction and that is it.

![](/static/CleanShot-2022-11-04-at-2.23.48@2x-55.png)

![](/static/CleanShot-2022-11-04-at-2.25.11@2x-57.png)

**How to copy:**

Copy the transaction type from the Services demo environment.

## Return 1 (Return Based On UDT)

The next return transaction, which is Return 1, is a bit more complicated. First of all, you can only see the items that were ordered before, secondly, when you are adding some items for return, you can pick the invoice for these items from the dropdown, while in Return 1 you just have to print the invoice in by yourself. If you pick to return more items that are available for return for the invoice you have chosen, the number of items will be automatically reduced to the maximum quantity available.

![](/static/CleanShot-2022-11-04-at-2.26.51@2x-59.png)

**How to copy:**

To use this functionality, apart from copying this transaction type, you will also need to create a UDT that will store the information about it. In addition to this, you also need to create a Scheduled Job that will delete the data from the UDT. (See UDT Return 1 Cleaner (68939)).

## Return 2 (Return Based On UI Task)

Return 2 provides you with a Custom Form that allows you to choose the items according to the particular invoices. It also only allows you to pick a certain quantity available for each invoice. The default quantity is the max quantity available for the particular invoice. After making your choice, press the Add to cart button, and then hit Submit.

![](/static/CleanShot-2022-11-04-at-2.31.05@2x-61.png)

![](/static/CleanShot-2022-11-04-at-2.34.20@2x-63.png)

**How to copy:**

To copy this functionality for your own use, please remember, that apart from copying the transaction type, you also need a custom form.

![](/static/CleanShot-2022-11-04-at-3.23.27@2x-67.png)

**Note! For all the return transactions apart from copying transaction types be sure to check for any additional files in the workflow that might also need to be copied (custom forms, webhooks, UI tasks, etc.)**
