---
description: 'Effort Estimation: 4h'
---

# VersaPay and NetSuite

You can find the description of general processes between **NetSuite**, **Payment Systems** and **Pepperi** here:&#x20;

{% embed url="https://kbint.pepperi.com/article-drafts/general-about-drafts/payment-systems-and-netsuite" %}

**Services Demo Environment** (7343) (30013939)

**Admin**: ukr\_templates@pepperi.com

### Add Credit Card

{% tabs %}
{% tab title="1️⃣ Backoffice" %}
▶  Settings -> Sales Activities -> Activity Types

1. Create a new Activity "VersaPay - Tokenize Card"
2. Workflows: New -> In Creation:
   * Add Custom Form.

▶  Settings -> UDT&#x20;

1. Create UDT "CreditCards" which will contain Credit Cards data.
{% endtab %}

{% tab title="2️⃣ Integration -> UI Tasks " %}
#### Integration -> UI Tasks&#x20;

▶  Copy UI Task **"VersaPay - NMI Tokenization Netsuite Insert"** from **Services Demo Environment**:

1.  In **ui\_page\_head**: update **data-tokenization-key**:

    <pre class="language-javascript" data-overflow="wrap"><code class="lang-javascript">&#x3C;script src="https://secure.networkmerchants.com/token/Collect.js" data-tokenization-key="______________">&#x3C;/script>
    </code></pre>
2. Collect.js Tokenization Docs:&#x20;

{% embed url="https://support.nmi.com/hc/en-gb/articles/360009713318-Collect-js-Tokenization-With-Direct-Connect" %}

▶  Copy UI Task "**VersaPay - Update UDT**" from **Services Demo Environment**

▶  Add this UI task to the newly created Custom Form.

▶  Add Activity to HomePage:&#x20;

The result should be as follows:

<figure><img src="../../../../.gitbook/assets/image (533).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="3️⃣ Integration -> Dataflow Tasks" %}
▶ Copy the following Dataflow Task from the **Services Demo Environment**:

&#x20;   ◾ _Netsuite Insert Card Token_

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
