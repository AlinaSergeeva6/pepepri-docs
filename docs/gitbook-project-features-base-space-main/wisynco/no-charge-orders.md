---
description: 'Effort Estimation: 8 hours'
---

# No-charge Orders

{% hint style="info" %}
There are specific accounts that are used as "NO CHARGE" accounts. A Sales Rep may use these accounts to write up an order for a customer with no charge.&#x20;
{% endhint %}

### How to use:

1. Start a new Sales Order transaction and select NO CHARGE account;\
   ![](<../.gitbook/assets/image (7).png>)
2. The user is able to select items and see the Line Total but the Total Units Price After Discount will be always $0.0:

<figure><img src="../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

3. Submit -> The order is sent to "Waiting for Approval".

### Implementation Details

* Logic is based on the Account checkbox field called TSANoCharge.&#x20;
* If a sales order is started and Account.TSANoCharge is TRUE:
  * All line items on the transaction should have TSAIsNoCharge = TRUE.
  * If line TSAIsNoCharge = TRUE, the line total should always be 0.

**Tags**: Sales Order, No-Charge orders, Order Management.
