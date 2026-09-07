---
description: 'Effort Estimation: 8h'
---

# CyberSource and NetSuite

You can find the description of general processes between **NetSuite**, **Payment Systems** and **Pepperi** here:&#x20;

{% embed url="https://kbint.pepperi.com/article-drafts/general-about-drafts/payment-systems-and-netsuite" %}

**Services Demo Environment** (7343) (30013939)

**Admin**: ukr\_templates@pepperi.com

### Add Credit Card

{% tabs %}
{% tab title="1️⃣ Backoffice" %}
▶  Settings -> Sales Activities -> Activity Types

1. Create a new Activity "CyberSource - Add Credit Card"
2. Workflows: New -> In Creation:
   * Add Custom Form.

▶  Settings -> UDT&#x20;

1. Create UDT "CreditCards" which will contain Credit Cards data.
{% endtab %}

{% tab title="2️⃣ Integration -> UI Tasks " %}
#### Integration -> UI Tasks&#x20;

▶  Copy UI Task **"CyberSource - Create Credit Card"** from **Services Demo Environment**:

1.  In **ui\_page\_head**: update **createAuth** (variables _**merchantId, keyId**_ and _**sharedSecret**_**&#x20;)**&#x77;ith relevant data received from the customer:

    ```javascript
    createAuth: (requestUrl = '', requestData = '', method = 'get') => {
                ...
                
                const merchantId = '_________________';
                const keyId = '______________________';
                const sharedSecret = '____________________';

                ...
                };
    ```
2.  In **ui\_page\_head**: If the customer uses a custom domain, add to **targetOrigin** of **getKeys** the relevant URL:

    <pre class="language-javascript" data-overflow="wrap"><code class="lang-javascript"><strong>   getKeys: () => {             
    </strong><strong>               ...
    </strong>                
                    const requestData = {
                        "encryption type": "RsaOaep256",
                        "targetOrigin": "https://integration.pepperi.com https://app.pepperi.com https://shop.testb2bwholesale.com" 
                    };
                    
                    ...
    }
    </code></pre>
3.  In **ui\_page\_head**: If you need to connect to the CyberSource **Sandbox** environment, update the **requestSettings** configuration as follows:

    <pre class="language-javascript"><code class="lang-javascript">var config = {
                ...
    <strong>            requestSettings: {
    </strong>                envUrl: "https://apitest.cybersource.com/",
                    endHost: "apitest.cybersource.com"
                }
    </code></pre>

▶  Add this UI task to the newly created Custom Form.

▶  Add Activity to HomePage:&#x20;

The result should be as follows:

<figure><img src="../../../../.gitbook/assets/image (547).png" alt=""><figcaption></figcaption></figure>

▶ Copy the following UI Tasks from **Services Demo Environment**:

&#x20;   ◾ _PROD CyberSource CC Management Flex Keys_

&#x20;   ◾ _PROD CyberSource CC Management Flex Create Card_

&#x20;   ◾ _PROD CyberSource CC Management Get Payment Instrument_
{% endtab %}

{% tab title="3️⃣ Integration -> Dataflow Tasks" %}
▶ Copy the following Dataflow Task from the **Services Demo Environment**:

&#x20;   ◾ _PROD Cybersource - Create CC_

_HTTP tab: add_ **paymentMethod ID**&#x20;

_(check "**How to find paymentMethod ID in NetSuite"** in_ [.](./ "mention")_):_

```javascript
<paymentMethod xsi:type='platformCore:RecordRef' internalId='___'/>
```

&#x20;   ◾ _Export Credit Card Data (UDT):_&#x20;

**Settings**: _saved\_search\_id_: add the ID of NetSuite Saved Search (details in the next tab)

&#x20;   ◾ _Export Credit Token Data (UDT)_

**Settings**: _saved\_search\_id_: add the ID of NetSuite Saved Search (details in the next tab)
{% endtab %}

{% tab title="4️⃣ NetSuite -> Saved Searches" %}
Create two Saved Searches:

▶ Pepperi Export Credit Cards:

&#x20;   ◾ Customer Search

&#x20;   ◾ Criteria:&#x20;

&#x20;     ◽ add the same criteria as for Customer Export

&#x20;     ◽ Credit Card Number: is true

&#x20;   ◾ Results:

<figure><img src="../../../../.gitbook/assets/image (554).png" alt=""><figcaption></figcaption></figure>

▶ Pepperi Export Payment Card Tokens:

&#x20;   ◾ Customer Search

&#x20;   ◾ Criteria:&#x20;

&#x20;     ◽ add the same criteria as for Customer Export

&#x20;     ◽ Credit Card Number: is true

&#x20;     ◽ Payment Instrument: Payment Instrument Type: is true

&#x20;   ◾ Results:

<figure><img src="../../../../.gitbook/assets/image (553).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

***

### Remove Credit Card

{% tabs %}
{% tab title="1️⃣ Backoffice" %}
▶  Settings -> Sales Activities -> Activity Types

1. Create a new Activity "CyberSource - Remove Credit Card"
2. Workflows: New -> In Creation:
   * Add Custom Form
{% endtab %}

{% tab title="2️⃣ Integration -> UI Task" %}
▶  Copy UI Task **"CyberSource - Remove Credit Card"** from **Services Demo Environment**:

▶  Add this UI task to the newly created Custom Form.

▶  Add Activity to HomePage:&#x20;

The result should be as follows:

<figure><img src="../../../../.gitbook/assets/image (555).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="3️⃣ Integration -> Dataflow Tasks" %}
▶ Copy the following Dataflow Tasks from the **Services Demo Environment**:

&#x20;   ◾ _Get Credit Cards From UDT_

&#x20;   ◾ _PROD Cybersource - Remove CC_

&#x20;   ◾ _PROD Cybersource - Remove CC from UDT_
{% endtab %}
{% endtabs %}

***

### Show Credit Card

{% tabs %}
{% tab title="1️⃣ Backoffice" %}
▶  Settings -> Sales Activities -> Activity Types

1. Create a new Activity "CyberSource - Show Credit Card"
2. Workflows: New -> In Creation:
   * Add Custom Form
{% endtab %}

{% tab title="2️⃣ Integration -> UI Tasks" %}
▶  Copy UI Task **"PROD Cybersource Show Available CC"** from **Services Demo Environment**:

▶  Add this UI task to the newly created Custom Form.

▶  Add Activity to HomePage:&#x20;

The result should be as follows:

<figure><img src="../../../../.gitbook/assets/image (560).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="3️⃣ Integration -> Dataflow Tasks" %}
▶ Copy the following Dataflow Task from the **Services Demo Environment**:

&#x20;   ◾ _Get Credit Cards From UDT_ (could be already present if you added Remove Card feature)
{% endtab %}
{% endtabs %}
