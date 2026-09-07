---
description: 'Effort Estimation: 3-4 days.'
---

# Split Order - ETA buffer

{% hint style="info" %}
Split Order based on item ETA date while taking into consideration the 14-day buffer within which an item will get back in stock therefore Split Order should not be triggered.
{% endhint %}

### How to use:&#x20;

1. Start a new transaction.
2. Select an in-stock item and an item with an ETA **less** than 14 days from the current date.
   1. Such an order will not be split.
3.  Select an in-stock item and an item with an ETA **more** than 14 days from the current date.<br>

    <figure><img src="../.gitbook/assets/image (35).png" alt=""><figcaption></figcaption></figure>

    1. Such an order will be split:

<figure><img src="../.gitbook/assets/image (36).png" alt=""><figcaption></figcaption></figure>

**Tags**: Split Order, ETA, Delivery Date.
