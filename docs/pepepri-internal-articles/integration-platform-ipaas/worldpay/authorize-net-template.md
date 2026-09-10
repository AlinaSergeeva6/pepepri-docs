---
title: "Authorize.Net Template"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account. There are 2 templates for UI task: Authorize.Net Template Working; Authorize.NET Template Anot"
order: 186
---
# Authorize.Net Template

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account. There are 2 templates for UI task: Authorize.Net Template Working; Authorize.NET Template Anot*

In this article we will work with the "Authorize.Net Template Working" , but they use same dataflow tasks and have similar structure.

### Notes

Main links (you can find there all requests):

● API reference: [https://developer.authorize.net/api/reference/index.html#gettingstarted-section-section-header](https://developer.authorize.net/api/reference/index.html#gettingstarted-section-section-header)

● Sandbox account creation: [https://developer.authorize.net/hello\_world/sandbox.html](https://developer.authorize.net/hello_world/sandbox.html) If you go to developer.authorize -> SIGN IN -> sandbox, first time you will see modal window like this:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/5-13.png)

You should set it to “Live” in order to process transactions (even test).

### Solution Overview

You can find all views of solution in attached presentation.

### Settings and Tasks Flow

You need to add general settings for dataflow tasks (or you can use that fields (General Settings) exactly in tasks):

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/6-11.png)

How to find merchant name and key:

Go to [https://sandbox.authorize.net/](https://sandbox.authorize.net/) -> ACCOUNT -> API Credentials & Keys

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/7-8.png)

You will see all required information there:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/8-5.png)

### Transaction Types

Authorize.Net supports several transaction types for creating and managing transactions through the createTransactionRequest API call.

● **AUTHORIZATION AND CAPTURE;**

● AUTHORIZATION ONLY;

● PRIOR AUTHORIZATION CAPTURE;

● CAPTURE ONLY;

● VOID;

● CREDIT.

In our solution we use first type (To submit an Authorization and Capture request, set the transactionType element to authCaptureTransaction in the createTransactionRequest API call).

Full information about transaction type you can find by following link:

[https://developer.authorize.net/api/reference/features/payment\_transactions.html](https://developer.authorize.net/api/reference/features/payment_transactions.html)

### Dataflow and UI tasks

Note: In this example we use UI tasks as dataflow (it use same http request logic: Source Object: UI Generic HTTP Exporter).

Main UI task was written with Classes and Object logic. We have 2 classes:

● **CustomerProfile** (“user” object - class instance) - we use it for working with pepperi data and it have next properties and methods.

Properties:

○ **CustomerProfileId** - equal pepperi account field what save a value from authorize;

○ **transactionDataFields** - fields to get from transaction api request;

○ **accountDataFields** - fields to get from account api request;

○ aditional fields.

Methods:

○ **getContext** - get "pepperi.app.getContext" api call and put in to “user” object;

○ **getTransaction** - "pepperi.api.transactions.get" api call with transaction uuid from context;

○ **getProfile** - get "pepperi.api.accounts.get" api call and put in to “user” object;

○ **setValue** - update account fields with "pepperi.api.accounts.update";

○ **updatePepperiField** - update transaction fields with "pepperi.api.transactions.update";

○ createPaymentActivity - we don't use it in our example. It use “pepperi.app.activities.add” to create payment activity (Simple pepperi activity type). It create new activity as well, but it put status to “New”, so this activity will not have acceptable InternalID (InternalID with “-”). It will need later for payment webhook.

○ **createPaymentActivityViaDataflowTask** - trigger dataflow task to create payment activity. Do same job as createPaymentActivity, but with http POST request, so we will have acceptable TransactionInternalID;

○ **triggerPaymentWebhook** - http request to trigger payment webhook (we will look closer to it later);

○ **addLogToUDT** - "pepperi.api.userDefinedTables.upsert" api call to add log to UDT with logs (not mandatory);

○ **checkTransactionDublicate** - "pepperi.api.userDefinedTables.get" api call to get values from UDT with transactions and check if we have duplicates. (Not mandatory);

○ **saveTransactionToUDT** - save transaction to udt in order to check for duplicates later and this is also some kind of logs.

● **AuthorizeGetData** - this class extends CustomerProfile (super() method in constructor). We use it to work with Auth via http requests and it has next methods:

○ **getAuthorizeListPaymentID** - use “**getCustomerProfile**” http request;

○ **geAuthorizePaymentToken** - “createTransaction” API request (Single payment);

○ **getAuthorizePaymentProfilePage** - “getHostedProfilePage” API request;

○ **createCustomerAuthorizePaymentProfile** - use “**createCustomerProfile**” http request;

○ **payWithAuthorizeDotNet** - “createTransaction” API request (payment with Card);

○ **removeAuthPaymentProfileID** - use “**deleteCustomerPaymentProfile**” http request.

“**getCustomerProfile**”, “**createCustomerProfile**” and “**deleteCustomerPaymentProfile**” api calls you can find by the following link (with all request and response fields explanations): [https://developer.authorize.net/api/reference/index.html#customer-profiles-get-customer-profile](https://developer.authorize.net/api/reference/index.html#customer-profiles-get-customer-profile)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/9-5.png)

Some notes about dataflow task testing: 1) If you change name of main UI task, you also should change some http body:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/10-4.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/11-3.png)

2) Data about AUTH transaction (success, transaction Ids etc.) can be save in pepperi current transaction, UDT or other activity. That's why UI task have some function, that we don't use in current example, but can be used in others.

### FlowChart

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/12-2.png)

You can find this diagram in attached PDF.

This flow chart run as on\_load. After that Auth.net form appear and user can interact with it. We use &lt;iframe> tag, so security reasons dont allow us to work with it directly from js. Thats why we need some kind of action listeners (iframe communicator). You can find it in attached files.

**Main logic**: iFrame send some information to parent window, you catch it, proceed and do some actions.

After sending transaction request, you will get response and proceed it with “createTransactionAuthCallback” function. In our case we create new payment activity and webhook (You can find information about it in next article).

Fields that we can get from AUTH response:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/13-1.png)

### Conclusion

To set this UI task, you need to be attentive to details, but in general it's easy to set up it. Main work is to change/update pepperi transactions/UDT/Activities with required fields.

5MB

[AdditionalInfo.rar](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MARRYJzAMYMHymB1qwA%2F-MARS2RSgJ56sBlNKi_k%2FAdditionalInfo.rar?alt=media&token=493162cf-4a37-4be1-92e3-fb4a188ef3de)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MARRYJzAMYMHymB1qwA%2F-MARS2RSgJ56sBlNKi_k%2FAdditionalInfo.rar?alt=media&token=493162cf-4a37-4be1-92e3-fb4a188ef3de)
