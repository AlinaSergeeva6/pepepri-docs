---
title: "Splitit"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account (all dataflow and UI tasks);"
order: 191
---
# Splitit

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account (all dataflow and UI tasks);*

Notes:

Main links (you can find there all requests):

-   Hosted Splitit solution for developers - [https://www.splitit.com/developers/integrations/hosted-solution/](https://www.splitit.com/developers/integrations/hosted-solution/)
-   Splitit web API - [https://documenter.getpostman.com/view/795699/RWaNQSJH?version=latest#a026e2d6-427f-47f8-b98e-7722507682be](https://documenter.getpostman.com/view/795699/RWaNQSJH?version=latest#a026e2d6-427f-47f8-b98e-7722507682be)

## Introduction

Splitit allows merchants to offer personalized installment payments for their customers anytime and anywhere, using their existing credit card, with no changes to the merchant’s risk.

The Splitit service works as an intermediate layer between the merchant’s platform and their existing payment gateway. New installment transactions are sent to Splitit (instead of being sent to the gateway) and we relay the transaction to the existing gateway.

Main purpose of using Splitit is to split payments to 2 or more.

### Splitit Checkout Workflow

In order to better understanding how to integrate Splitit into the workflow, it is important to understand the transaction flow while using Splitit:

![](/static/1-32.png)

1.  The shopper inserts his personal details on your checkout page and selects Splitit as the payment method.
2.  The shopper inserts his credit card details and chooses the payment period for the installment plan.
3.  The shopper reviews the payment schedule and approves the Splitit T&C’s.
4.  Transaction complete!

Splitit can be implemented in different ways, depending on how deep you would like to go into the coding; if you are PCI compliant or not, if the UI/UX is the #1 priority in your platform and etc.

## Which Integration Method to Choose?

**There are 4 ways of integrating Splitit’s platform:**

### Hosted Page

Fast and easy, the hosted solution allows you to let Splitit deal with the transaction while using their pages. You can either redirect the shopper to our Payment Wizard or pop it up as an overlay layer on top of your page. This solution is also recommended if you are not PCI compliance.

### Embedded Solution

**(For PCI Compliance systems)**

We have built our Web API to be very simple and fast to integrate, requiring a few days of effort, depending on the implementation.

This solution will allow you to control the shopper data insertion in your own checkout page, including the credit card number insertion and the approval page.

You might also use our pre-build approval page, hosted by Splitit. It will allow you to keep your shopper in the same UI environment and deal only with your shopper data.

### Virtual POS

**(For retailers or support center)**

Ideal for brick & mortar retailers, our Virtual POS does not require any integration. Through your Merchant Console, you are able to create a new installment plan, insert your customers’ details, and choose how many installments they want.

### Plugins

Splitit offers several plugins, allowing you to implement it in a matter of minutes.

We will use Hosted Page solution.

## Hosted Solution

#### SplitIt Web API

In order to start working you will need the following data:

-   *UserName* \- The username of your API user in Splitit system
-   *Password* \- The password of your API user in Splitit system
-   *ApiKey* \- Your terminal API key

You must receive this data from your Splitit onboarding contact (from client or your PM in case of Pepperi). If you need assistance, please email Splitit at onboarding@splitit.com

#### Sandbox and Production environments

Development should be done in our sandbox environment. Once development is complete, please contact your onboarding contact for approval and credentials to our production environment.

-   Sandbox:
    -   URL - [https://web-api-sandbox.splitit.com](https://web-api-sandbox.splitit.com/)
    -   Test Cards (any other card will result error "Unrecognized card"):
        -   Visa: 4111 1111 1111 1111
        -   Master Card: 5555 5555 5555 4444

-   Production
    -   URL - [https://web-api.splitit.com](https://web-api.splitit.com/)

**1\. Login**

First, in order to connect to our services, you will need to authenticate yourself and get a SessionId.

![](/static/2-24.png)

Dataflow task login request example:

![](/static/3-18.png)

You will get Session ID in your UI task with *get\_data* function then you should go to second part.

**2\. Initiate Installment Plan**

Call Initiate Service (from server side) with the SessionId, order details (amount, shopper information, billing address) and exit Urls (SuccessUrl, CancelUrl). The service response will include a checkout Url which you can use for opening the Splitit payment wizard.

Request:

```
{
  "RequestHeader": {
    "SessionId": "{{SessionId}}",
    "ApiKey": "{{ApiKey}}"
  },
  "PlanData": {
    "Amount": {"Value": 50,"CurrencyCode": "USD"},
    "NumberOfInstallments": 3,
    "RefOrderNumber": "012AB",
    "AutoCapture": true,
    "Attempt3DSecure": false
  },
  "BillingAddress": {
    "AddressLine": "260 Madison Avenue.",
    "AddressLine2": "Appartment 1",
    "City": "New York",
    "State": "NY",
    "Country": "USA",
    "Zip": "10016"
  },
  "ConsumerData": {
    "FullName": "John Smith",
    "Email": "JohnS@splitit.com",
    "PhoneNumber": "1-844-775-4848",
    "CultureName": "en-us"
  },
  "PaymentWizardData": {
    "RequestedNumberOfInstallments": "2,3,4",
    "IsOpenedInIframe": false
  },
  "RedirectUrls": {
    "Succeeded": "https://www.success.com/",
    "Failed": "https://www.failed.com/",
    "Canceled": "https://www.canceled.com/"
  },
  "EventsEndpoints": {
    "CreateSucceeded": "https://www.async-success.com/"
  }
}
```

Not all keys are mandatory. Some descriptions:

1) *PlanData.NumberOfInstallments* – number of splited payments;
2) *AutoCapture* – for a scenario in which you would like to hold with the first charge until product is shipped, set property AutoCapture to **false;**
3) *Attempt3DSecure* \- For 3D Secure solution, change property Attempt3DSecure to **true**;
4) *BillingAddress* – mandatory fields, but you can ask support to turn off them;
5) *ConsumerData* – mandatory field;
6) *PaymentWizardData* – RequestedNumberOfInstallments allow user to choose number of payments;

Buckley example:

![](/static/4-14.png)

```
    "RequestHeader":{
        "SessionId":    "*~sessionId~*",
        "ApiKey":       "-//-"
    },
    "PlanData":{
        "Amount":{
            "Value": *~grandTotal~*,
            "CurrencyCode":"USD"
        },
      	"PurchaseMethod": "Ecommerce",
      	"FirstChargeDate": "{#getdate(+30,yyyy-MM-dd,day)#}",
        "NumberOfInstallments":2,
        "RefOrderNumber": "XYZ",
        "AutoCapture": true
    },
    "ConsumerData":{
		 "FullName":"John Smith",
         "Email":"JohnS@splitit.com",
         "PhoneNumber":"1-844-775-4848",
         "CultureName":"en-us"
     },
    "PaymentWizardData":{
    	"RequestedNumberOfInstallments":"2"
    },
     "RedirectUrls":{
        "Succeeded":"https://integration.pepperi.com/ui_tasks//PageTask/Run?ClientToken=3a947203-0d36-45ea-987e-e73d4310d103&TaskName=Split+IT+Payment+Success+Page",
        "Failed":"https://integration.pepperi.com/ui_tasks//PageTask/Run?ClientToken=3a947203-0d36-45ea-987e-e73d4310d103&TaskName=Split+IT+Payment+Failed+Page",
        "Canceled": "https://integration.pepperi.com/ui_tasks//PageTask/Run?ClientToken=3a947203-0d36-45ea-987e-e73d4310d103&TaskName=Split+IT+Payment+Canceled+Page"

    }
}
```

**3\. Redirect from merchant checkout to the Splitit payment form**

After receiving a checkout Url from the former response, you will be able to redirect the shopper to the Splitit payment wizard to complete the payment process.

Optional – In order to provide a better shopping experience, you can instead open the payment form as a floating iframe overlay to your website. To obtain this, please follow the steps below:

Add following code in the &lt;header> tag:

```
<head>
      <script id="splitit-form-loader" src="{URL}/js/payment-form-loader.js"></script>
</head>
```

Remark – {URL}:

-   For sandbox use **https://checkout-sandbox.splitit.com**
-   For production use **https://checkout.splitit.com**

Add following code in the &lt;body> tag:

```
<body>
     <div>
          <button onclick="loadSplititPaymentForm('{checkoutURL}')">Open Splitit IFrame</button>
     </div>
     <div id="splitit-payment-form" class="iframe-container"></div>
</body>
```

Remark – {checkoutURL}: The url that was returned from the initiate call.

After that you will get from like this:

![](/static/5-12.png)

**4\. Redirect back from the Splitit payment form to the merchant checkout and closing the order**

After a payment is completed (or canceled by the shopper), the shopper will be redirected back to the exit Urls defined in the previous call (SuccessUrl or CancelUrl). The redirect Url will also include the unique InstallmentPlanNumber and your ReferenceOrderNumber that will help you close the order on your end.

There are a few possible variants:

1) User press back button – he will redirect to UI task that use function:

close\_form({

abort\_transition: true

});

2) User press “PAY NOW” and transaction doesn’t succeed – he will be redirected to UI task with failed message;
3) User press “PAY NOW” and transaction succeed – user will be redirected to success UI task.

Before you close the order on your end, it is highly recommended that you run a [VerifyPayment](https://documenter.getpostman.com/view/795699/RWaNQSJH#3c8c0f5a-e044-4be2-a975-91143ba84eb3) request to the Splitit server in order to verify that the payment was done successfully via Splitit. This step is required to prevent: **(A)** unauthorized or faked success Urls, **(B)** prevent false “order closed”.

It will look like this:

![](/static/6-10.png)

And in case of success you should close the order.
