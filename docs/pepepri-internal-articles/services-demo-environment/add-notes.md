---
title: "Add Notes"
description: "Effort Estimation: 3h"
order: 25
---
# Add Notes

*Effort Estimation: 3h*

### Description:

This Custom form allow you to add coment with date and time creating and with the id of the person who wrote the comment and to read comments for transaction all managers or other comnpany members which work with current transaction at any stage and leave coment here.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-989.png)

### Advantages and disadvantages

!!!success
Works offline and allows you to comment on the transaction at any stage, even after transaction are Submitted.
!!!

!!!warning
Works bad with a lot quantity of buttons on the homepage. Requires additional config file(does not sync with App Home Screen) and logic settings for correct output of dropdown with all buttons.
!!!

### Demo - how does it work:

Open ‘Kangaroo, Order Details, Notes’ transaction, select any customer. Go to the Cart or in the Order Center, open the drop-down menu and select “Add Notes”. In Add Notes field add some comment and click “Continue”. After that, you can reopen this transaction or simply reopen this custom form and see your previous comment and be able to add a new one.

### How to copy to another environment:

Implementing this feature on new environment requires :

1\. Creating a header text field '**TSANotes**' which stores all comments for the current transaction.

2\. Adding program “Add Notes” with custom form(can be copied from ' Kangaroo, Order Details, Notes' transaction, programs => “Reworked Add Notes UI to Custom Form” => “Add Notes Custom Form”)

3\. Adding/replacing account and order fields which you need to display in the form.

### Advanced configuration:

Custom Form allows you to easily change the message, add additional fields, change/add new fields to the view.
