---
title: "eWay"
description: "How to implement eWay payment process to a new environment"
order: 190
---
# eWay

*How to implement eWay payment process to a new environment*

**PAY ATTENTION** \--- source of templates is on Integration Examples, UI tasks, folder eWay payment

### #1 Step: copy UI Task to the client we need

make sure to mark the checkbox “Copy Sub Tasks”, otherwise repeat the copying process!

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot-2021-09-01-at-12.32.48.png)

the eWay UI Task

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot-2021-09-01-at-12.34.04.png)

copying the eWay UI Task to the different client

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot-2021-09-01-at-12.35.23.png)

copying the eWay UI Task to the different client

### #2 Step: “RUN” the task

which will result into opening a window where we need to copy the code to a custom form.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-349.png)

the code we need for the further implementation.

### #3 Step: create a custom form

for this follow the path **Sales Activities------>Transaction Types>Programs------->New Program**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-350.png)

creating a new Program

### #4 Step: edit the newly created program in order to insert our code previously copied from the UI Task

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-351.png)

implementing the code to our Custom Form

### #5 Step: create the custom fields on the Header level (Custom Transaction Fields)

for this transaction, see the screenshot below for the example of the required field type

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-352.png)

custom fields needed for the custom form.

Some of the default fields are also needed

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-353.png)

default required fields

### #6 Step: add our Program to the dropdown menu

Go to **Sales Activities** ---->**Transaction Types**\------->**Views and Forms** ------>**Menu**\---------->**Order Center Menu** and configure the specific profile that you need to add a program:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-354.png)

adding our program to the dropdown menu

### #7 Step: let's test it

Go to the **webapp** ---> **Sales Order** ---> choose **a test account** ------> add some goods to the cart -------> go to the **dropdown menu** and choose **payment option** that you added in the select menu

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-355.png)

dropdown menu in the Sales Order.

**Finally**, this is what you should see in the end. Make sure that **TotalSum** from the cart matches with what you have in the form:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-356.png)

the final look of the Custom Form
