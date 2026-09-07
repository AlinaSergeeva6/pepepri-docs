---
description: How to implement eWay payment process to a new environment
---

# eWay

**PAY ATTENTION**    ---   source of templates is on Integration Examples, \
&#x20;                                        UI tasks, folder eWay payment

### #1 Step: copy UI Task to the client we need

make sure to mark the checkbox “Copy Sub Tasks”, otherwise repeat the copying process!

![the eWay UI Task](<../../../.gitbook/assets/Screenshot 2021-09-01 at 12.32.48.png>)

![copying the eWay UI Task to the different client](<../../../.gitbook/assets/Screenshot 2021-09-01 at 12.34.04.png>)

![copying the eWay UI Task to the different client](<../../../.gitbook/assets/Screenshot 2021-09-01 at 12.35.23.png>)

### &#xD;#2 Step:  **“RUN” the task**

which will result into opening a window where we need to copy the code to a custom form.

![the code we need for the further implementation.](<../../../.gitbook/assets/image (325).png>)

### &#xD;#3 Step: create a custom form

for this follow the path **Sales Activities------>Transaction    Types>Programs------->New Program**

![creating a new Program](<../../../.gitbook/assets/image (308).png>)

### &#xD;**#4 Step:** edit the newly created program in order to insert our code previously copied from the UI Task

![implementing the code to our Custom Form](<../../../.gitbook/assets/image (406).png>)

### #5 Step: create the custom fields on the Header level (Custom Transaction Fields)&#x20;

for this transaction, see the screenshot below for the example of the required field type

![custom fields needed for the custom form.](<../../../.gitbook/assets/image (446).png>)

Some of the default fields are also needed

![default required fields](<../../../.gitbook/assets/image (417).png>)

### #6 Step: &#xD; add our Program to the dropdown menu

Go to **Sales Activities** ---->**Transaction Types**------->**Views and Forms**\
\------>**Menu**---------->**Order Center Menu** \
and configure the specific profile that you need to add a program:

![adding our program to the dropdown menu](<../../../.gitbook/assets/image (405).png>)

### #7 Step: let's test it&#x20;

Go to the **webapp** ---> **Sales Order** ---> choose **a test account** ------> add some goods to the cart -------> go to the **dropdown menu** and choose **payment option** that you added in the select menu

![dropdown menu in the Sales Order. ](<../../../.gitbook/assets/image (425).png>)

**Finally**,       this is what you should see in the end. Make sure that\
&#x20;                 **TotalSum** from the cart matches with what you have in the\
&#x20;                  form:

![the final look of the Custom Form](<../../../.gitbook/assets/image (332).png>)
