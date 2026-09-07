# Netsuite and Payment system integration

## Description:

_The process described below helps to secure sensitive credit card information by using tokens and involves data flow between Pepperi, the payment system, and NetSuite. This article outlines the steps involved in saving and utilizing the tokenized information for sales orders in Pepperi and NetSuite._

_**The payment systems:** CyberSource, VersaPay._

## **Advantages and disadvantages**

{% hint style="success" %}
The integration of Pepperi into payment processes opens up new possibilities for customers by providing enhanced functionality and adds value to the overall user experience.
{% endhint %}

{% hint style="warning" %}
Be careful when activating payment instruments in NetSuite, especially for customers in a production. This could alter Sales Order flow in NetSuite.
{% endhint %}

## General processes:

<details>

<summary>1️⃣ Pepperi -> Activity (UI Tasks)</summary>

a.      Customer adds credit card data in the form (UI task).

b.      Necessary fields could differ depending on Payment system used.

c.      After filling the form, the information is sent to the designated payment system.

</details>

<details>

<summary>2️⃣ The Payment System</summary>

a.      The payment system receives data from Pepperi.

b.      The card token is generated.

c.      The payment system sends to Pepperi response with payment method data and token.

</details>

<details>

<summary>3️⃣ Pepperi -> Dataflow Tasks</summary>

a.      Pepperi sends HTTP request to NetSuite with card data e.g:

&#x20;    i.     paymentMethod;

&#x20;    ii.     token;

&#x20;    iii.     tokenFamily;

&#x20;    iv.     cardBrand;

&#x20;    v.     cardExpirationDate;

&#x20;    vi.     cardLastFourDigits;

&#x20;    vii.     cardNameOnCard;

&#x20;    viii.     isDefault.

</details>

<details>

<summary>4️⃣ NetSuite</summary>

a.      NetSuite receives the card token from the payment system.

b.      NetSuite saves the received token as an object for future use.

c.      NetSuite sends the Token ID and card mask back to Pepperi for reference.

</details>

<details>

<summary>5️⃣ Pepperi -> UDT</summary>

a.      Saves Token ID and card mask in UDT:

&#x20;    i.     MainKey: AccountExternalID;

&#x20;    ii.     Secondary Key: Card mask (\*\*\*\*\*\*\*\*\*\*\*\*1234);

&#x20;    iii.     Values: Token ID.

</details>

<details>

<summary>6️⃣ Pepperi -> Sales Order</summary>

a.      Customer chooses a card from drop-down.

b.      Token ID transferred to NetSuite.

</details>

{% hint style="info" %}
**How to find card tokens in NetSuite**

1\) Lists -> Relationships -> Customers.

2\) Choose Customer -> View.

3\) In the Customer Page open the Financial tab -> Payment Instruments:

![](<../../../../.gitbook/assets/image (539).png>)&#x20;

![](<../../../../.gitbook/assets/image (540).png>)
{% endhint %}

{% hint style="info" %}
**How to find paymentMethod ID in NetSuite**

1\) Go to _Setup > Accounting > Setup Tasks > Accounting Lists._

2\) Find Payment Method with type **Payment Card Token** and copy ID from URL e.g.:

[https://1231234.app.netsuite.com/app/common/otherlists/accountingotherlist.nl?<mark style="background-color:orange;">id=13</mark>](https://1231234.app.netsuite.com/app/common/otherlists/accountingotherlist.nl?id=13)&#x20;

\
**If there is no such Payment Method, you can create a new one for Pepperi:**

1\) Go to _Setup > Accounting > Setup Tasks > Accounting Lists > New._

2\) While creating, choose Payment Method type - **External Checkout.**
{% endhint %}

***

## Demo - how does it work:

Environment:

**Services Demo Environment** (7343) (30013939)

**Admin**: ukr\_templates@pepperi.com

### CyberSource:&#x20;

<table data-view="cards"><thead><tr><th></th><th></th><th data-hidden></th></tr></thead><tbody><tr><td>✅<strong>Add Card:</strong> </td><td>HomePage -> Menu -> <strong>"CyberSource - Add Credit Card"</strong></td><td></td></tr><tr><td>❌<strong>Remove Card:</strong></td><td>HomePage -> Menu -> <strong>"CyberSource - Add Credit Card"</strong></td><td></td></tr><tr><td>🔄<strong>Show Card:</strong></td><td>HomePage -> Menu -> <strong>"CyberSource - Add Credit Card"</strong></td><td></td></tr></tbody></table>

## VersaPay:

<table data-view="cards"><thead><tr><th></th><th></th><th data-hidden></th></tr></thead><tbody><tr><td>✅<strong>Add and Tokenize Card:</strong> </td><td>HomePage -> Menu -> <strong>"VersaPay - Tokenize Card"</strong></td><td></td></tr></tbody></table>

***

## How to copy to another environment:

1. **CyberSource:**

{% embed url="https://kbint.pepperi.com/article-drafts/general-about-drafts/payment-systems-and-netsuite/cybersource-and-netsuite" %}

2. **VersaPay:**

{% embed url="https://kbint.pepperi.com/article-drafts/general-about-drafts/payment-systems-and-netsuite/versapay-and-netsuite" %}
