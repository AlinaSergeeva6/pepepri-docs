---
title: "KANGAROO API IN UI TASK"
order: 176
---
# KANGAROO API IN UI TASK

Main Links:

**1) KANGAROO REWARDS API (It’s main page where you can login for create OAuth2 client ID)** - https://api.kangaroorewards.com/developers

#### 2) KANGAROO REWARDS API Docs (Documentation for working with API) - https://api.kangaroorewards.com/docs/business.html APP CAPABILITIES

· Access your account information

· Access Business information including branches, offers, rewards etc.

· List all Customers and new Customers

· Reward your customers

· List Custom Rewards and Catalog Items

· Redeem based on amount, points or Catalog Item

The Kangaroo Rewards API uses HTTP methods and a RESTful endpoint structure. The API authorization framework is OAuth 2.0. You format requests in JSON and the APIs return JSON-formatted responses. More information about it you can see by reference: [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/connect-to-kangaroo-rewards-api-using-oauth-2.0?q=kang](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/connect-to-kangaroo-rewards-api-using-oauth-2.0?q=kang)

When the user starts a transaction and chooses a certain number of items for the total amount or only the total value of special, promotional items, a certain number of special points can be used that will reduce the amount of the order. Kangaroo Rewards - API is good for implementing this. To work with the Kangaroo API and operations on the received data, it is best to use UI tasks.

**UI task for receiving and using Kangaroo points:**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-385.png)

**1\. Balance** (The number of points available for a certain account, taken from the Kangaroo API)

To get the values for the account we use, we must take a special ID that the required account must have or implement it in another way. In the example, we receive the necessary account data, and create a request to the dataflow task to receive points available to the user .

**Dataflow Task for getting balance points example:**

[https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67514](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67514%20)

In **Dataflow Task** we get:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-386.png)

This is due to what we specified in the settings http\_row\_element: included

last\_updated - field created in the mapping to receive the date of the last update of the value.

More examples of http requests to retrieve data from Kangaroo Api at the link: [https://api.kangaroorewards.com/docs/business.html#customers](https://api.kangaroorewards.com/docs/business.html#customers)

Then balance points are written to a variable and displayed on the screen.

**2\. Eligible Items**

The field that receives the data of the ordered items from transaction and determines the number of points that can be used. The field is not mandatory, it depends on the logic implemented in the product.

**3\. Redeem Input**

A field that gets the minimum and maximum values available for input. Therefore, when the user enters a certain value, it is checked and corrected to the nearest correct value, if the entered number is outside the minimum - maximum value. This allows the user to choose the number of points available to him and prevent an error at the next stages of the transaction.

**4\. Button Proceed to Checkout**

This is a button by clicking on which you will continue creating a transaction by writing the necessary value for debiting in a certain field of the transaction (it is not advisable to write off the used points at an intermediate stage, this may lead to their disappearance when the transaction is canceled)

**5.** **Update Kangaroo Points**

After the transaction is confirmed, a new UI task is launched, which checks whether the user is using the correct number of points and updates their number on the kangaroo API. Using a larger number of points is possible when ordering from two tabs at the same time, which will lead to an error and redirecting the transaction to the "On Hold" status.

**UI task for receiving and using Kangaroo points Example**:

[https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67519](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67519)

**Update Kangaroo Points Dataflow Task Example:**

[https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67515](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67515)

**6\. Other Information**

Also, the UI Task can be used simply to display the user's balance in Activity:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-387.png)

Works as in part 1.Balance. The UI Task shown in the example receives, displays on the screen and update the latest value of points for the account.

**UI task for showing Kangaroo balance points Example**:

[https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67518](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67518)

You can also update the data on the Kangaroo Api using a **Webhook**, but this will throw an error if a bad value is passed to api.kangaroorewards.com.

**Webhook for Update Kangaroo Points Example**: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67524](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=67524%09)

If necessary, using an **iframe** you can update the balance in the custom header. You can read more about this in the article:

[https://kbint.pepperi.com/integration-platform-ipaas/integration-platform-ipaas-ui-tasks/ui-task-in-custom-header](https://kbint.pepperi.com/integration-platform-ipaas/integration-platform-ipaas-ui-tasks/ui-task-in-custom-header)

**All examples are implemented on a test environment:**

**Name: “Services Demo Environment”(** **7343)**

**Login: ukr\_templates@pepperi.com**
