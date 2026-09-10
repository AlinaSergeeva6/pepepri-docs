---
title: "Buyer Management"
description: "Effort Estimation: 8h"
order: 26
---
# Buyer Management

*Effort Estimation: 8h*

### Description:

Allow you to create/delete/observe Buyers for any account available to the user with any Profile type connected for him.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-988.png)

### Advantages and disadvantages

!!!success
Allows you to quickly create and delete bayers.
!!!

!!!warning
Works online only.
!!!

!!!warning
Requires SQL connection on client integration page.
!!!

### Demo - how does it work:

1\. **In the Services Demo Environment,** open **Buyer Management** Activity from home-screen.

2\. To delete some buyers, click the checkboxes to the left of the required lines and click the **Delete** button through the burger menu with the image of a pencil.

3\. To create, click the plus button. Enter the first name, last name and email. Select the **Profile** and **Account** to which the buyer should be connected.

4\. Сlick Apply button and wait for the contact to be created. After closing "Success!" messages, you can continue working with buyers.

### How to copy to another environment:

1\. Copy the Dataflow tasks withall sub tasks and UI Task from Services Demo Environment into your environment. Link to the Dataflow Tasks: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=80340](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=80340) Link to the UI Task: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=80620](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=80620)

2\. Check the fields of accounts, contacts. Add new ones or delete unnecessary ones. Create a UDT with name **Pepperi Profile List** and fill in the logic of the profiles, as in the example on Services Demo Environment but for Profile hierarchy in client environment.

3\. Create new activity - **Buyer Management**.

4\. Create a custom form and put UI Task into it.

5\. In workflow, between **New -> In Creation** step, add your custom form which contains UI Task.

### Advanced configuration:

Custom/additional fields can be added to the view, contact create form. Also, the logic for changing the fields for the created contacts can be added, but it may be faster to delete and create a new contact in most cases.
