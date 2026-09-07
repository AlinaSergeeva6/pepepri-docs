---
description: >-
  PayPal payment could be integrated as Custom Form with UI task in the
  workflow.
---

# PayPal Implementation

All of the PayPal Integration steps you can find [here](https://developer.paypal.com/docs/checkout/integrate/)

### Step 1. PayPal Sandbox Account creation

To create Sandbox Account you need regular PayPal account. You can create it via [link](https://www.paypal.com/welcome/signup/#/email_password)\
After that you should log in to the Developer using this [link](https://www.paypal.com/signin?returnUri=https%3A%2F%2Fdeveloper.paypal.com%2Fdeveloper%2Fapplications)\
In Sandbox-> Accounts press "Create Account" button and select all the necessary fields\
In Dashboard -> My Apps & Credentials press "Create App" button and type your app name and account you created before

In Dashboard -> My Apps & Credentials select your App.\
There you can find "Client ID" - this field is an ID of your account. Using this ID you can receive payments.

![](<../../../.gitbook/assets/image (504).png>)

### Step 2. Custom Form configuration

PayPal allows to proceed payment using JS.&#x20;

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

where&#x20;

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

{% file src="../../../.gitbook/assets/PayPalCustomFormExample (2).txt" %}
PayPal Custom Form Example
{% endfile %}

{% hint style="warning" %}
Note, that this Custom Form temporary doesn\`t work on Android devices due to CORS policy\
To avoid any errors on Android, please, use UI task **'PayPal Implementation'** as template  on **Integartion Examples (6685)** account
{% endhint %}

### Step 4. Changing Sandbox account to the real

After testing you can easily replace your Client ID from sandbox to the real customer client ID
