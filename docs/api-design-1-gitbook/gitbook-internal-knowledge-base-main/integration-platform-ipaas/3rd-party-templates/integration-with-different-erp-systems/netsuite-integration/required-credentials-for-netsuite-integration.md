# Required credentials for NetSuite integration

In order to make the integration with Netsuite, we need to add following settings:

1. **nsaccount** is taken from the main link

![](<../../../../.gitbook/assets/Capture (45).PNG>)

2\. **ns\_consumer\_key**\
&#x20;    **ns\_consumer\_secret** \
you can find in point 7 of the NetSuite Authentication article [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authentication](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authentication)

3\. **ns\_application\_id** is generated when you create an application

Go on NetSuite --> **“Setup”** --> **“Integrations”** ---> **“Manage Integrations”**&#x20;

![](<../../../../.gitbook/assets/1 (2).PNG>)

\---> Select "Pepperi integration". Thus we san see the generated **application id**<br>

![](<../../../../.gitbook/assets/Capture (46).PNG>)

&#x20;4\. **ns\_token\_id**\
&#x20;     **ns\_token\_secret** \
you can find in point 11 of the NetSuite Authentication article [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authenticatio](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/netsuite-authentication)

**5. ns\_is\_tba = true**

**6. advanced\_search\_url**\
you can find in point 11 of the "First steps in Pepperi-NetSuite Integration" article [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/first-steps-in-pepperi-netsuite-integration](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/netsuite-integration/first-steps-in-pepperi-netsuite-integration)
