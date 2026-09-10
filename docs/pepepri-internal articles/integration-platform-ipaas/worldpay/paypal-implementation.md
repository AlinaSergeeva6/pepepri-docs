---
title: "PayPal Implementation"
description: "PayPal payment could be integrated as Custom Form with UI task in the workflow."
order: 193
---
# PayPal Implementation

*PayPal payment could be integrated as Custom Form with UI task in the workflow.*

All of the PayPal Integration steps you can find [here](https://developer.paypal.com/docs/checkout/integrate/#)

### Step 1. PayPal Sandbox Account creation

To create Sandbox Account you need regular PayPal account. You can create it via [link](https://www.paypal.com/welcome/signup/#/email_password) After that you should log in to the Developer using this [link](https://www.paypal.com/signin?returnUri=https%3A%2F%2Fdeveloper.paypal.com%2Fdeveloper%2Fapplications) In Sandbox-> Accounts press "Create Account" button and select all the necessary fields In Dashboard -> My Apps & Credentials press "Create App" button and type your app name and account you created before

In Dashboard -> My Apps & Credentials select your App. There you can find "Client ID" - this field is an ID of your account. Using this ID you can receive payments.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-348.png)

### Step 2. Custom Form configuration

PayPal allows to proceed payment using JS.

```
    paypal
      .Buttons({
        createOrder: function(data, actions) {
          return actions.order.create({
            purchase_units: [
              {
                amount: {
                  value: '100' //payment amount
                }
              }
            ]
          });
        },
        onApprove: function(data, actions) {
          return actions.order.capture().then(function(details) {
            alert(
              "Transaction completed by " +
                details.payer.name.given_name +
                " OrderID: " +
                data.orderID
            );
            //any code after payment receive
          });
        }
      })
      .render("#paypal-button-container");
```

where

```
#paypal-button-container
```

is ID of the div, where you would like to place the buttons.

To use this function you have to add link to the script in the head of the HTML document.

```
<script src="https://www.paypal.com/sdk/js?client-id='CLIENT_ID'&currency=CURRENCY_CODE"></script>
```

where CLIENT\_ID - you client ID from Step 1 and CURRENCY\_CODE is payment currency ISO code

### Step 3. Add Custom Form to the workflow

15KB

[PayPalCustomFormExample.html](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Lmo-6u1e0kXuZN1Y6cC%2F-Lmo9rB45Pj9_5EJ2nZm%2FPayPalCustomFormExample.html?alt=media&token=90409837-4db0-4766-b388-882b04cd6dc0)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Lmo-6u1e0kXuZN1Y6cC%2F-Lmo9rB45Pj9_5EJ2nZm%2FPayPalCustomFormExample.html?alt=media&token=90409837-4db0-4766-b388-882b04cd6dc0)

PayPal Custom Form Example

!!!warning
Note, that this Custom Form temporary doesn\`t work on Android devices due to CORS policy To avoid any errors on Android, please, use UI task **'PayPal Implementation'** as template on **Integartion Examples (6685)** account
!!!

### Step 4. Changing Sandbox account to the real

After testing you can easily replace your Client ID from sandbox to the real customer client ID
