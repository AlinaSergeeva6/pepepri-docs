---
title: "PaySafe"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account (Dataflow task: “PaySafe Tasks Folder” -> “Authorization”; UI task: “PaySafe Payment”);"
order: 192
---
# PaySafe

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account (Dataflow task: “PaySafe Tasks Folder” -> “Authorization”;  UI task: “PaySafe Payment”);*

#### Main links:

1) **PaySafe Developer** (It contains almost all required information about payment system and integration) - [https://developer.paysafe.com/en/](https://developer.paysafe.com/en/)
2) **Netbanx** (Service that provides access to management of your test account) - [https://login.test.netbanx.com/office/public/preLogin.htm](https://login.test.netbanx.com/office/public/preLogin.htm)
3) **Paysafe.js solution** - [https://developer.paysafe.com/en/sdks/paysafejs/overview/](https://developer.paysafe.com/en/sdks/paysafejs/overview/)

## Overview

Paysafe allow to use a large number of solutions: The Paysafe Card Payments API, The Paysafe 3D Secure API etc. We used one of them - **Paysave.js**.

**Paysafe.js** enables merchants to create a customized payment form that complies with the least demanding level of PCI compliance, SAQ-A. All the sensitive payment fields (card number, cvv, and expiry date or expiry year and month) are displayed in an iframe hosted on Paysafe's servers, and the user input and storage of the data is handled by Paysafe. Paysafe.js makes use of the Customer Vault and Card Payments REST APIs to handle the payment.

## Before You Begin

Before you begin, you need to obtain your standard server-to-server API key and a **single-use token-generating API key** from the Merchant Back Office.

**The single-use token-generating API key** is used in your JavaScript code on the client to generate single-use tokens from customer credit cards and bank accounts. Unlike the server-to-server API key, this key has no ability to take payment or carry out any other operation, and can therefore be safely exposed in your client side code.

The obtain a single-use token–generating key:

1\. Go to [Paysafe Developer: Home](https://developer.paysafe.com/en/)

2\. Press [SIGN UP](https://developer.paysafe.com/en/sdks/paysafejs/overview/) (right top corner) to get a Test account, if you haven't already done so.

3\. [**Log in**](https://login.test.netbanx.com/) to the Test back office ([NETBANX](https://login.test.netbanx.com/office/public/preLogin.htm)) with the user name and password you used when signing up for the Test account. You should now be able to view the **Settings > API Key** page.

4\. In the Single-Use Token area, click the **Create** button.

5\. You will receive a security token by email. Enter this token and click **Next**. The Single-Use Token area in the API Key page updates to show the user name and password for the single-use token API key.

6\. If you haven't already done so, take a copy of the user name and password for the server-to-server API key as well. You will need this (and your account ID in your sign-up email) for taking payments with the generated tokens.

Paysafe.js uses the Base64-encoded version of the single-use token API key, constructed by concatenating the user name and password, separated by a colon, and Base64 encoding the result. You can use a site like [https://www.base64encode.org/](https://www.base64encode.org/) to do the Base64 encoding. See [More about Authentication](https://developer.paysafe.com/en/rest-apis/reference-information/important-integration-concepts/authentication/) for details.

## Solution

## UI task contain 2 main settings:

● **ui\_page\_body** - contains main html elements (PaySafe solution start with &lt;!-- CREDIT CARD FORM STARTS HERE → and ends with &lt;!-- CREDIT CARD FORM ENDS HERE →; headers with some messages, images etc.) and styles; So we get form like that:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-31.png)

● **ui\_page\_head** - contains js logic:

○ global variables - apiKey, account\_id\_paysafe, authorization\_link etc. for testing purposes; options - contains fields settings and env selector - select the Paysafe test / sandbox environment;

○ paysafe setup functions - paysafe.fields.setup(apiKey, options, func) - initalize the hosted iframes using the SDK setup function;

○ dataflow functions - send\_auth send auth to paySafe via dataflow task;

### Workflow

You can see default form with 3 input fields that should be filled:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2-23.png)

In case of bad input it will show red light:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3-17.png)

It used PaySafe functions:

#### If Valid:

```
instance.fields("cvv cardNumber expiryDate").valid(function (eventInstance, event){
$(event.target.containerElement).closest('.form-control').removeClass('error').addClass('success');
 	if (paymentFormReady()) {
    		$('.pay').prop('disabled', false);
  	}
});
```

#### If Invalid:

```
instance.fields("cvv cardNumber expiryDate").invalid(function (eventInstance, event) {
$(event.target.containerElement).closest('.form-control').removeClass('success').addClass('error');
  	if (!paymentFormReady()) {
      		$('.pay').prop('disabled', true);
  	}
});
```

**paymentFormReady** - return true if all fields are valid, and false in other case.

This part allow to change card image, which depends on number of card:

```
$('.fa').removeClass('fa-credit-card')
              switch (cardBrand) {
                case "AmericanExpress":
                  $(".fa").addClass('fa-cc-amex');
                  break;
                case "MasterCard":
                  $(".fa").addClass('fa-cc-mastercard');
                  break;
                case "Visa":
                  $(".fa").addClass('fa-cc-visa');
                  break;
                case "Diners":
                  $(".fa").addClass('fa-cc-diners-club');
                  break;
                case "JCB":
                  $(".fa").addClass('fa-cc-jcb');
                  break;
                case "Maestro":
                  $(".fa").addClass('fa-cc-discover');
                  break;
              }
```

So we will have these results:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/4-13.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/5-11.png)

If user enter correct data “Pay” button will be accessible. After pressings it will run tokenize function that will give you token and you can send payment via dataflow task with POST request and body like that (minimum required body):

```
body_obj = {
        "merchantRefNum": wfobject.UUID,
        "amount": 1100, // Can be set to any (Total Price for example)
        'settleWithAuth': 1,
        "card": {
            "paymentToken" : single_use_token,
            // "cardNum": "4111111111111111", // dont need if you have token (much safer than use this data with js)
            // "cardExpiry": {
            //   "month": "2",
            //   "year": "2027"
            // }
        },
        "billingDetails": {
            "zip": "M5H 2N2"
        }
      };
```

If you get response like this

```
response[0].status==='COMPLETED'
```

it show success message, else show message with error.
