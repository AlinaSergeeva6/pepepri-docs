---
title: "Required credentials for NetSuite integration"
order: 172
---
# Required credentials for NetSuite integration

In order to make the integration with Netsuite, we need to add following settings:

1.  **nsaccount** is taken from the main link

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Capture-1.PNG)

2\. **ns\_consumer\_key ns\_consumer\_secret** you can find in point 7 of the NetSuite Authentication article [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authentication](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authentication)

3\. **ns\_application\_id** is generated when you create an application

Go on NetSuite --> **“Setup”** --> **“Integrations”** \---> **“Manage Integrations”**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/1-33.PNG)

\---> Select "Pepperi integration". Thus we san see the generated **application id**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Capture-2.PNG)

4\. **ns\_token\_id ns\_token\_secret** you can find in point 11 of the NetSuite Authentication article [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authenticatio](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authentication)

**5\. ns\_is\_tba = true**

**6\. advanced\_search\_url** you can find in point 11 of the "First steps in Pepperi-NetSuite Integration" article [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/first-steps-in-pepperi-netsuite-integration](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/first-steps-in-pepperi-netsuite-integration)
