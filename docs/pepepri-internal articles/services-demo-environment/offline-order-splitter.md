---
title: "Offline Order Splitter"
description: "Estimated time to implement for new environment - 4h"
order: 39
---
# Offline Order Splitter

*Estimated time to implement for new environment - 4h*

### Description

Offline order splitter is a feature that allows you to split an order using client API and create a few additional transactions of any type. It allows you to add a bunch of items to the cart and then choose what type of transaction you want to assign every item to.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-956.png)

### Advantages and disadvantages

!!!success
Offline Order Splitter **works fast and doesn\`t require an internet connection** \- allows to create child orders in a way that the customer can see them immediately
!!!

!!!danger
This feature allows splitting orders but workflow actions will not be triggered at the moment of the order creation. If there are any actions like forms or alerts visible in UI they will be triggered on order opening. They will be created in the **status 'New'** **only**
!!!

!!!danger
Offline order split doesn\`t support the possibility to send these split orders to ERP immediately - the user will have to open the transaction and **press the 'Submit' button**
!!!

### Demo - how does it work

A demo is available on [Services Demo - Environment](https://kbint.pepperi.com/services-demo-environment/features).

1.  In the burger menu on the left chose the 'Offline Order Splitter' transaction.
2.  Select any customer.
3.  Add items to the cart and select the 'OrderTypeSelector' dropdown. Different items can have different values. In order to see results, you need to select a few different transaction types for different items.
4.  After choosing the items and assigning them to the different transactions go to the cart and there you can split your order. To do this press the "Split" button.
5.  Then the activity list 'Offline Order Splitter - child' will be open and new split child transactions would be displayed.
6.  In the Activities the Activity list 'Offline Order Splitter - parent' will display parent order and the activity list 'Offline Order Splitter - child' will display split child transactions.

### How to copy to another environment

Implementing this feature in a new environment requires the:

1.  Creating UDT 'Parameters' with the following data structure:

-   main key: 'OfflineOrderSplitter',
-   secondary key is the name of the child transaction type,
-   value is this transaction type ActivityTypeID.

1.  Creating a header text field '**TSASplitterKey**' which returns 'OfflineOrderSplitter' text.
2.  Creating a line UDT dropdown field '**TSAOrderTypeSelector**' which uses UDT 'Parameters' and field '**TransactionTSASplitterKey**' as a main key.
3.  Creating a line UDT text field '**TSAOdrerTypeId**' which returns ActivityTypeID of selected in dropdown type from UDT 'Parameters'.
4.  Creating a header reference field '**TSAOriginalOrder**' in **each** child order transaction type that refers to a parent transaction type.
5.  Adding custom form splitter (can be copied from 'Offline Order Splitter' transaction, workflow action 'in creation -> submitted').
6.  Creating activity lists for parent and child orders.

### Advanced configuration

The custom form can be added to the 'in creation -> in creation' workflow action if parent order is not needed. In this case, step 5 of the 'how to copy' block can be skipped and in code you will need to remove line **object:{TSAOriginalOrder:trUUID},** from the code.
