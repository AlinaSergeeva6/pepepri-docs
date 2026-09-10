---
title: "CyberSource and NetSuite"
description: "Effort Estimation: 8h"
order: 138
---
# CyberSource and NetSuite

*Effort Estimation: 8h*

You can find the description of general processes between **NetSuite**, **Payment Systems** and **Pepperi** here:

[![Logo](/static/image) Netsuite and Payment system integration | Internal Knowledge Basekbint.pepperi.com](https://kbint.pepperi.com/article-drafts/general-about-drafts/payment-systems-and-netsuite)

**Services Demo Environment** (7343) (30013939)

**Admin**: ukr\_templates@pepperi.com

### Add Credit Card

▶ Settings -> Sales Activities -> Activity Types

1.  Create a new Activity "CyberSource - Add Credit Card"
2.  Workflows: New -> In Creation:
    -   Add Custom Form.

▶ Settings -> UDT

1.  Create UDT "CreditCards" which will contain Credit Cards data.

#### Integration -> UI Tasks

▶ Copy UI Task **"CyberSource - Create Credit Card"** from **Services Demo Environment**:

1.  In **ui\_page\_head**: update **createAuth** (variables ***merchantId, keyId*** and ***sharedSecret*** **)**with relevant data received from the customer:

    ```
    createAuth: (requestUrl = '', requestData = '', method = 'get') => {
                ...

                const merchantId = '_________________';
                const keyId = '______________________';
                const sharedSecret = '____________________';

                ...
                };
    ```

2.  In **ui\_page\_head**: If the customer uses a custom domain, add to **targetOrigin** of **getKeys** the relevant URL:

    ```
       getKeys: () => {
                   ...

                    const requestData = {
                        "encryption type": "RsaOaep256",
                        "targetOrigin": "https://integration.pepperi.com https://app.pepperi.com https://shop.testb2bwholesale.com"
                    };

                    ...
    }
    ```

3.  In **ui\_page\_head**: If you need to connect to the CyberSource **Sandbox** environment, update the **requestSettings** configuration as follows:

    ```
    var config = {
                ...
                requestSettings: {
                    envUrl: "https://apitest.cybersource.com/",
                    endHost: "apitest.cybersource.com"
                }
    ```

▶ Add this UI task to the newly created Custom Form.

▶ Add Activity to HomePage:

The result should be as follows:

![](/static/image-471.png)

▶ Copy the following UI Tasks from **Services Demo Environment**:

◾ *PROD CyberSource CC Management Flex Keys*

◾ *PROD CyberSource CC Management Flex Create Card*

◾ *PROD CyberSource CC Management Get Payment Instrument*

▶ Copy the following Dataflow Task from the **Services Demo Environment**:

◾ *PROD Cybersource - Create CC*

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

![](/static/image-472.png)

▶ Pepperi Export Payment Card Tokens:

◾ Customer Search

◾ Criteria:

◽ add the same criteria as for Customer Export

◽ Credit Card Number: is true

◽ Payment Instrument: Payment Instrument Type: is true

◾ Results:

![](/static/image-473.png)

---

### Remove Credit Card

▶ Settings -> Sales Activities -> Activity Types

1.  Create a new Activity "CyberSource - Remove Credit Card"
2.  Workflows: New -> In Creation:
    -   Add Custom Form

▶ Copy UI Task **"CyberSource - Remove Credit Card"** from **Services Demo Environment**:

▶ Add this UI task to the newly created Custom Form.

▶ Add Activity to HomePage:

The result should be as follows:

![](/static/image-474.png)

▶ Copy the following Dataflow Tasks from the **Services Demo Environment**:

◾ *Get Credit Cards From UDT*

◾ *PROD Cybersource - Remove CC*

◾ *PROD Cybersource - Remove CC from UDT*

---

### Show Credit Card

▶ Settings -> Sales Activities -> Activity Types

1.  Create a new Activity "CyberSource - Show Credit Card"
2.  Workflows: New -> In Creation:
    -   Add Custom Form

▶ Copy UI Task **"PROD Cybersource Show Available CC"** from **Services Demo Environment**:

▶ Add this UI task to the newly created Custom Form.

▶ Add Activity to HomePage:

The result should be as follows:

![](/static/image-475.png)

▶ Copy the following Dataflow Task from the **Services Demo Environment**:

◾ *Get Credit Cards From UDT* (could be already present if you added Remove Card feature)
