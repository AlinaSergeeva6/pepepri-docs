---
title: "Netsuite and Payment system integration"
order: 139
---
# Netsuite and Payment system integration

## Description:

*The process described below helps to secure sensitive credit card information by using tokens and involves data flow between Pepperi, the payment system, and NetSuite. This article outlines the steps involved in saving and utilizing the tokenized information for sales orders in Pepperi and NetSuite.*

***The payment systems:*** *CyberSource, VersaPay.*

## Advantages and disadvantages

!!!success
The integration of Pepperi into payment processes opens up new possibilities for customers by providing enhanced functionality and adds value to the overall user experience.
!!!

!!!warning
Be careful when activating payment instruments in NetSuite, especially for customers in a production. This could alter Sales Order flow in NetSuite.
!!!

## General processes:

**1️⃣ Pepperi -> Activity (UI Tasks)**

a. Customer adds credit card data in the form (UI task).

b. Necessary fields could differ depending on Payment system used.

c. After filling the form, the information is sent to the designated payment system.

**2️⃣ The Payment System**

a. The payment system receives data from Pepperi.

b. The card token is generated.

c. The payment system sends to Pepperi response with payment method data and token.

**3️⃣ Pepperi -> Dataflow Tasks**

a. Pepperi sends HTTP request to NetSuite with card data e.g:

i. paymentMethod;

ii. token;

iii. tokenFamily;

iv. cardBrand;

v. cardExpirationDate;

vi. cardLastFourDigits;

vii. cardNameOnCard;

viii. isDefault.

**4️⃣ NetSuite**

a. NetSuite receives the card token from the payment system.

b. NetSuite saves the received token as an object for future use.

c. NetSuite sends the Token ID and card mask back to Pepperi for reference.

**5️⃣ Pepperi -> UDT**

a. Saves Token ID and card mask in UDT:

i. MainKey: AccountExternalID;

ii. Secondary Key: Card mask (\*\*\*\*\*\*\*\*\*\*\*\*1234);

iii. Values: Token ID.

**6️⃣ Pepperi -> Sales Order**

a. Customer chooses a card from drop-down.

b. Token ID transferred to NetSuite.

!!!info
**How to find card tokens in NetSuite**

1) Lists -> Relationships -> Customers.
2) Choose Customer -> View.
3) In the Customer Page open the Financial tab -> Payment Instruments:

![](/static/image-469.png)

![](/static/image-470.png)
!!!

!!!info
**How to find paymentMethod ID in NetSuite**

1) Go to *Setup > Accounting > Setup Tasks > Accounting Lists.*
2) Find Payment Method with type **Payment Card Token** and copy ID from URL e.g.:

[https://1231234.app.netsuite.com/app/common/otherlists/accountingotherlist.nl?id=13](https://1231234.app.netsuite.com/app/common/otherlists/accountingotherlist.nl?id=13)

**If there is no such Payment Method, you can create a new one for Pepperi:**

1) Go to *Setup > Accounting > Setup Tasks > Accounting Lists > New.*
2) While creating, choose Payment Method type - **External Checkout.**
!!!

---

## Demo - how does it work:

Environment:

**Services Demo Environment** (7343) (30013939)

**Admin**: ukr\_templates@pepperi.com

### CyberSource:

✅**Add Card:**

HomePage -> Menu -> **"CyberSource - Add Credit Card"**

❌**Remove Card:**

HomePage -> Menu -> **"CyberSource - Add Credit Card"**

🔄**Show Card:**

HomePage -> Menu -> **"CyberSource - Add Credit Card"**

## VersaPay:

✅**Add and Tokenize Card:**

HomePage -> Menu -> **"VersaPay - Tokenize Card"**

---

## How to copy to another environment:

1.  **CyberSource:**

[![Logo](/static/image) CyberSource and NetSuite | Internal Knowledge Basekbint.pepperi.com](https://kbint.pepperi.com/article-drafts/general-about-drafts/payment-systems-and-netsuite/cybersource-and-netsuite)

1.  **VersaPay:**

[![Logo](/static/image) VersaPay and NetSuite | Internal Knowledge Basekbint.pepperi.com](https://kbint.pepperi.com/article-drafts/general-about-drafts/payment-systems-and-netsuite/versapay-and-netsuite)
