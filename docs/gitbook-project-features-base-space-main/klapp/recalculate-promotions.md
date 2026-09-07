---
description: 'Effort Estimation: 10 hours'
---

# Recalculate promotions

This custom form is used to solve the issue with Item promotions not transferred to the new transaction after using order duplication functional.

Custom form is placed inside the Program and therefore can be run only manually: after user clicks on this option in cart menu.&#x20;

{% hint style="info" %}
Running this CF in background does not solve the issue. Rerunning also caused unexpected behavior with **UnitsQuantity** field for updated items.
{% endhint %}

Custom form algorithm:

1. Get parent transaction UUID and boolean field to check if CF was not run before
2. Transaction lines search of parent order to get only item promotion (blue) lines IDs
3. Set **UnitsQuantity** to 0 for all lines in the new order with same **Item ID**
4. Trigger item promotions by updating **UnitsQuantity** back to correct number

**Tags**: Item Promotions, Promotions, Order Duplication.
