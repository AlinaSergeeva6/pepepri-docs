---
title: "Return Without Validations"
description: "Estimated time to implement for new environment - 1h"
order: 36
---
# Return Without Validations

*Estimated time to implement for new environment - 1h*

### Description

This return transaction type is the simplest return we can implement. Requires no complexity to implement. Only the items you need to add to your cart and the ability to add an invoice ID as a remark.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2023-03-30-110529.png)

### Advantages and disadvantages

!!!success
This feature is very easy to implement. Only the items you need to add to your cart and the option to add an invoice ID as a remark.
!!!

!!!danger
Since it does not have invoice ID validation, the user can enter a quantity that is higher than what is on the invoice, and this will require manual validation in ERP.
!!!

!!!danger
The user can enter any invoice ID without understanding what these items are, there is a high probability of entering the wrong ID, which can lead to integration errors.
!!!

### Demo - How does it work

1.  Open **Return Without Validations** transaction and select any customer.
2.  Add items to the cart and add an Invoice ID for each item and submit.

### How to copy to another environment

1.  Create new transaction type.
2.  Add a field **Invoice ID** of text type. Add it to the relevant views.
