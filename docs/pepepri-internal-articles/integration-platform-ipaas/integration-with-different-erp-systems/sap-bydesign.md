---
title: "SAP ByDesign"
description: "this article includes general info on how to send and receive requests for \"SAP By Design\""
order: 182
---
# SAP ByDesign

*this article includes general info on how to send and receive requests for "SAP By Design"*

SAP Business ByDesign is a solution that **integrates financial management and control, purchasing and procurement, production and supply-chain, and employee management**.

!!!info
you can find general documentation [here](https://help.sap.com/doc/a2b4c7ef61d64397b2b1d052082a8a08/2108/en-US/IntegrationServices.html)
!!!

In order to generate requests we need to understand some specific things about this SAP.

-   Its type is **HTTP based integration.**
-   Authorization type: basic auth. (Username, Password)
-   if you see an error: "**Authorization row missing for service**", it means that the user, which is provided by the company, does not have access to make a specific request. In this case you need to contact the company and ask them to give this user such permission or create the user with all the necessary accesses.
-   If there is an error in the body of the request, it can still be marked as successful but nothing will be uploaded, so please check the result of your request on the SAP ByDesign platform.

!!!success
**The easiest way** to build the request is to **download WSDL file** with the necessary service for Postman. This includes examples with all possible parameters options for your query.
!!!
