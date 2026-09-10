---
title: "Testing NetSuite Export with Postman"
order: 167
---
# Testing NetSuite Export with Postman

To test the NetSuite export, we can use postman. Follow the steps below to mimic the integration process of Pepperi using the postman app.

If you don't have postman's latest version installed on your computer, you can download it from here: [https://www.getpostman.com/downloads/](https://www.getpostman.com/downloads/)

In postman, create a post request. Select OAuth 1.0 as the authorization type, and enter the following details (same as you have in the integration platform:

-   Consumer Key
-   Consumer Secret
-   Access Token
-   Token Secret
-   URL (the URL provided by NetSuite after installing the script as described here: [First steps in Pepperi-NetSuite Integration](/integration-platform-ipaas/netsuite-integration/first-steps-in-pepperi-netsuite-integration.md)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-408.png)

Select the signature method to be HMAC-SHA256

populate the "Realm" field with the NetSuite ACCOUNT ID. This can be found in NetSuite under - Setup > Integration > SOAP WEB Services Preferences (usually same as you will see in the URL as well)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-409.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-410.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-411.png)

In the selection box: "Add authorization data to:", select "Request Headers"

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-412.png)

In the "Body" section - select "raw", and use the following format for the request:

{"searchId":"NetSuite\_Search\_ID","start":record\_start,"end":record\_end}

example:

{"searchId":"pepperi\_items","start":0,"end":100}

Run the request [👍](https://emojipedia.org/thumbs-up-sign/)
