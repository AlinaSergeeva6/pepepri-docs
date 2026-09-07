---
description: >-
  How to implement a Stripe payment process in a new environment with a Quick
  Setup
---

# Stripe (Quick Setup)

## Installation

Before using Stripe in a new environment for the first time, you need to install it. Click **Install** in Quick Setup to install Stripe in your environment.

<div><figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Installation 1.png" alt=""><figcaption><p><strong>Stripe in Quick Setup before installation</strong></p></figcaption></figure> <figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Installation 2.png" alt=""><figcaption><p><strong>Stripe in Quick Setup after installation</strong></p></figcaption></figure></div>

{% hint style="info" %}
After a successful installation, you will see two groups of UI Tasks.
{% endhint %}

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Installation 3.png" alt=""><figcaption><p><strong>Two groups of UI Tasks created by Quick Setup.</strong></p></figcaption></figure>

After the installation, launch Stripe and you should see the **General** section first.

{% hint style="info" %}
Stripe Quick Setup is divided on 3 sections:

* **General** - configure basic Stripe Payment.
* **Advanced** - configure default Stripe Payment settings and multiple Payment options.
* **Logs** - show all logs from Stripe UI Tasks.
{% endhint %}

## **General** Section

General section allows to configure basic Stripe Payment. You have the option to create multiple connections depending on the **Transaction** or **Activity**. There is also a Test Mode for easy testing and making changes before connecting to production.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - General Section.png" alt=""><figcaption></figcaption></figure>

For a correct connection, you must not only select the **Resource Type** and **Sub Type**, but also add certain settings on the **Advanced** tab.

## Advanced Section

Advanced section allows to configure default Stripe Payment settings and multiple Payment options.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section.png" alt=""><figcaption></figcaption></figure>

### Generic Block

In the Generic block, you can select the **Currency**, **Payment Type**, and **Configuration Logic** (for different connection types):

* **Default** - use only 1 connected account or api/js keys and configuration. Connections are labeled with an ID from 1 to n+1 of each subsequent connection and use the Default Configuration field names in the "Fields Mapper".
* **Transaction / Activity** - use transaction or activity field to get config ID.
* **Account** - use account field to get config ID.

```json
"generic": {
    "retrieving": {
        "type": "accountField",
        "fieldName": "TSAStripeSubConfigurationID"
    }
}
```

* **Query** - use query param to get config ID.

_(You can read more detailed information by hovering over the field name.)_

### Connected Account & API/JS Keys Block

In the Connected Account & API/JS Keys block you can choose one of two connection types.&#x20;

* By connecting your own account if you have access to this account in Stripe **(Recommended)**
* By providing Publishable and Restricted keys (if the customer is unable to access the account or does not agree to use the Pepperi account). If you are using Stripe Api and JS Keys, you can test them with the **Test Keys** button.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Connected Account &#x26; API-JS Keys Block.png" alt=""><figcaption></figcaption></figure>

### Payment Methods Block

In the Payment Methods block, you can select the payment methods that will be used in this connection (for different transactions, you can use different connections). Each method has its own set of settings.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Payment Methods Block.png" alt=""><figcaption></figcaption></figure>

### Duplicates Checks Block

The Duplicates Checks block contains settings that cannot be changed. All necessary settings for these fields are already created in Quick Setup and do not need to be changed.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Duplicates Checks Block (1).png" alt=""><figcaption></figcaption></figure>

### Fields Mapper Block

The Fields Mapper block contains the fields necessary for the correct operation of the stripe. **Some of them are optional.** More detailed information about the fields can be read by hovering over the field name.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Fields Mapper Block.png" alt=""><figcaption></figcaption></figure>

### Visuals Block

In the Visuals block contains the settings for the styles for the Stripe form. You can check the visual changes made by clicking on the **Preview** button.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Visuals Block - 1.png" alt=""><figcaption><p><strong>All style settings for the Stripe form.</strong></p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Visuals Block - 2.png" alt=""><figcaption><p><strong>Preview of the Stripe form.</strong></p></figcaption></figure>

## Logs Section

Logs section show all logs from Stripe UI Tasks.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Logs Section.png" alt=""><figcaption></figcaption></figure>

## Configuration

After saving the connection, information about it and other connections can be found in the General settings.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Configurations.png" alt=""><figcaption></figcaption></figure>

## Setup Stripe In Pepperi

Connecting Stripe to a transaction is the same as for any UI task. It is necessary to connect the **Stripe Payment Generic Main** UI Task created by Quick Setup to the user form in the transaction and correctly connect the configurations.

<pre class="language-html"><code class="lang-html">&#x3C;html>
&#x3C;head>
&#x3C;script src="https://integration.pepperi.com/ui_tasks//kendo/js/jquery.min.js">&#x3C;/script>
&#x3C;script>document.write("&#x3C;script type='text/javascript' src='https://integration.pepperi.com/ui_tasks//kendo/App/PageTask/CustomForm.js?v="+Date.now()+"'>&#x3C;\/script>");&#x3C;/script>
&#x3C;script>
page_url   = "https://integration.pepperi.com/ui_tasks//PageTask/Run?ClientToken=07581619-774a-433e-bd90-a3fb5be2f089&#x26;TaskName=Stripe+Payment+Generic+Main";
url_params = [{name: "TSAStripeSubConfigurationID", value: "1"}];
window.parent.document.getElementsByClassName("mat-focus-indicator pep-button icon-button md weak dialog-close mat-button mat-button-base")[0].style = 'display: none';
<strong>&#x3C;/script>
</strong>&#x3C;/head>
&#x3C;body>
&#x3C;/body>
&#x3C;/html>
</code></pre>

Sample code of a custom form with a query connection. You can get it by clicking the blue button and pasting the copied text into the custom form.

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Setup Stripe In Pepperi.png" alt=""><figcaption></figcaption></figure>



{% hint style="warning" %}
Be careful, most payments need to block any extra buttons(which can close the form after starting the payment procedure), so it is mandatory to use an additional code in custom form:

```
window.parent.document.getElementsByClassName("mat-focus-indicator pep-button icon-button md weak dialog-close mat-button mat-button-base")[0].style = 'display: none';
```
{% endhint %}

\
As a result, you will see a Stripe Page, and after confirming the payment, you will see an Approve Page.

<div align="center"><figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Setup Stripe In Pepperi - 2.png" alt=""><figcaption><p><strong>Stripe form in the transaction.</strong></p></figcaption></figure></div>

<figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Advanced Section - Setup Stripe In Pepperi - 3.png" alt=""><figcaption><p><strong>When the transaction is successful, you will see the Approved Page.</strong></p></figcaption></figure>

## Additional Features

If you plan to customize the payment, change some kind of logic, visual part, you need to block the quick setup settings update so that the update does not overwrite your changes in UI tasks.

To do this, you need to go to the **Stripe Payment Generic Main** and **Stripe Payment Quick Setup** UI task settings and change the **task\_version** value to empty.

<div><figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Additional Features - 1.png" alt=""><figcaption><p><strong>Default setting.</strong></p></figcaption></figure> <figure><img src="../../../.gitbook/assets/Stripe (Quick Setup) - Additional Features - 2.png" alt=""><figcaption><p><strong>Disabled setting.</strong></p></figcaption></figure></div>

## Example

You can find an example in the **Service Demonstration Environment (7343) (30013939)** in the **Kangaroo, Order Details, Notes** transaction by making a specific order or by launching the **Stripe Example** program from the menu.
