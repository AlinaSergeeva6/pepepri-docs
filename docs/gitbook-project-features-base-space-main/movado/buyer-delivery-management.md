---
description: 'Effort estimation: 2-3 days'
---

# Buyer Delivery Management

Generally, it’s like a lines report but with ability to select the line to be delivered and send this information to ERP on submit. For implementing this we used separate transaction type.&#x20;

Instead of UnitsQuantity selector, we use checkbox which mean that items of Allocated Quantity should be delivered. Once submitted, each selected line is updated in the original transaction as well, so it is not visible in the Buyer Delivery Management anymore.

{% hint style="info" %}
Intended to work for multi-account buyers, but may not be suitable for reps who have plenty of customers assigned.
{% endhint %}

<figure><img src="../.gitbook/assets/image (23).png" alt=""><figcaption><p>Buyer Delivery Management</p></figcaption></figure>

**Tags**: Lines Report, Report, Delivery Management, Multi Account Buyers report.
