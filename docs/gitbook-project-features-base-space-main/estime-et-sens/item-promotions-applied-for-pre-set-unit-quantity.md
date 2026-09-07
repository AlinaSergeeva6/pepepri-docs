---
description: 'Effort Estimation: 2 days'
---

# Item Promotions applied for pre-set Unit Quantity

{% hint style="info" %}
Allows to trigger Item Promotions when the Unit Quantity of items is set automatically on transaction init (e.g. based on UDT).
{% endhint %}

### How to use:

1. Start transaction.
2. Items with predefined Unit Quantity are added to the cart automatically. All linked Item Promotions are triggered and applied:&#x20;

<figure><img src="../.gitbook/assets/image (29).png" alt=""><figcaption></figcaption></figure>

### Implementation Details:

* Added Custom Form in New->In Creation: &#x20;
  * Updating Transaction Lines with Units Quantity with predefined values (in our case values were stored in line level field TSAUDTQuantiteDepart);&#x20;
  * Adding loader while Transaction Lines are being updated.&#x20;

**Tags**: Item Promotions, Predefined Quantity, Item Quantity, Workflow.
