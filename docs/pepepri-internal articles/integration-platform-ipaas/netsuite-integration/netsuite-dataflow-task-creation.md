---
title: "NetSuite Dataflow Task Creation"
order: 169
---
# NetSuite Dataflow Task Creation

!!!danger
Before doing these tasks please make sure you have Granded necessary access to your user Integration. You can find in point 14 of the "NetSuite Authentication" article [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authenticatio](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authentication)
!!!

In order to create a dataflow task, we need to set

-   **Application:** NetSuite Plugin
-   **Source Object:** choose from the list

!!!info
The **Source Object** specifies the request type and does some validation. It happens that we send a request, but we get an error like "**such field does not exist**". To do this, if this is additional information that is not in the Source Object , we choose the **Special Price List** **as** the generic **Source Object**.

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-4.PNG)
!!!

After we have filled all the necessary settings in **General Settings** and created a dataflow task, we need to set only one setting **saved\_search\_id.**

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-5.PNG)

1.  In order to get *saved\_search\_id* go to \--> **“List”** --> **“Search”** \---> **“Saved Searches”**

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-6.PNG)

\---> **“New Saved Search”** and select the required type for Saved Search (for example, for items)

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-7.PNG)

2\. After we have created Saved Search fill in the **Search Title** (it’s better to always start with the Pepperi, as it will be easy to find it later) and put the **checkbox Public**

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-8.PNG)

3\. **Also we can customize our Saved search** 3.1 **Criteria** to filter the amount of data (you can use USE EXPRESSIONS to select AND,OR operations as the default is AND)

![](https://alinasergeeva6.github.io/pepepri-docs/static/2-25.PNG)

3.2 **Results** to show selected columns

![](https://alinasergeeva6.github.io/pepepri-docs/static/1-34.PNG)

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-9.PNG)

After we saved the Saved Search, an **saved\_search\_id** is created.

**IMPORTANT!** As for ***saved search on images*** we need to set only IDs for the desired images with the correct column names.

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-10.PNG)

After that, you need to set the settings in Details as shown below.

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-11.PNG)
