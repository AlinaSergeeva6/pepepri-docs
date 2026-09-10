---
title: "VersaPay and NetSuite"
description: "Effort Estimation: 4h"
order: 137
---
# VersaPay and NetSuite

*Effort Estimation: 4h*

You can find the description of general processes between **NetSuite**, **Payment Systems** and **Pepperi** here:

[![Logo](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image) Netsuite and Payment system integration | Internal Knowledge Basekbint.pepperi.com](https://kbint.pepperi.com/article-drafts/general-about-drafts/payment-systems-and-netsuite)

**Services Demo Environment** (7343) (30013939)

**Admin**: ukr\_templates@pepperi.com

### Add Credit Card

▶ Settings -> Sales Activities -> Activity Types

1.  Create a new Activity "VersaPay - Tokenize Card"
2.  Workflows: New -> In Creation:
    -   Add Custom Form.

▶ Settings -> UDT

1.  Create UDT "CreditCards" which will contain Credit Cards data.

#### Integration -> UI Tasks

▶ Copy UI Task **"VersaPay - NMI Tokenization Netsuite Insert"** from **Services Demo Environment**:

1.  In **ui\_page\_head**: update **data-tokenization-key**:

    ```
    <script src="https://secure.networkmerchants.com/token/Collect.js" data-tokenization-key="______________"></script>
    ```

2.  Collect.js Tokenization Docs:

[![Logo](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/c2ee5f63ec6643286b1cddcf2dc498ed88e5c7c0.png) Collect.js Tokenization With Direct ConnectNMI](https://support.nmi.com/hc/en-gb/articles/360009713318-Collect-js-Tokenization-With-Direct-Connect)

▶ Copy UI Task "**VersaPay - Update UDT**" from **Services Demo Environment**

▶ Add this UI task to the newly created Custom Form.

▶ Add Activity to HomePage:

The result should be as follows:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-476.png)

▶ Copy the following Dataflow Task from the **Services Demo Environment**:

◾ *Netsuite Insert Card Token*

*HTTP tab: add* **paymentMethod ID**

*(check "****How to find paymentMethod ID in NetSuite"*** *in* [Netsuite and Payment system integration](/integration-platform-ipaas/sap-examples/netsuite-and-payment-system-integration.md)*):*

```
<paymentMethod xsi:type='platformCore:RecordRef' internalId='___'/>
```

◾ *Export Credit Card Data (UDT):*

**Settings**: *saved\_search\_id*: add the ID of NetSuite Saved Search (details in the next tab)

◾ *Export Credit Token Data (UDT)*

**Settings**: *saved\_search\_id*: add the ID of NetSuite Saved Search (details in the next tab)

Create two Saved Searches:

▶ Pepperi Export Credit Cards:

◾ Customer Search

◾ Criteria:

◽ add the same criteria as for Customer Export

◽ Credit Card Number: is true

◾ Results:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-472.png)

▶ Pepperi Export Payment Card Tokens:

◾ Customer Search

◾ Criteria:

◽ add the same criteria as for Customer Export

◽ Credit Card Number: is true

◽ Payment Instrument: Payment Instrument Type: is true

◾ Results:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-473.png)
