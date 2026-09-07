---
description: 'Effort Estimation: 8 hours'
---

# Publitas catalog

Publitas interactive catalogs let users view available products, see their detailed information, and add them to the cart for further purchases.

{% hint style="info" %}
This integration requires client to have an existing catalog on Publitas platform.
{% endhint %}

Two UI tasks are used to enable the integration of Publitas publications into Pepperi. Upon running the first one, a new iframe opens, displaying the Publitas publication where users can browse through available items.&#x20;

<figure><img src="../.gitbook/assets/image (30).png" alt=""><figcaption><p>Publitas Catalog</p></figcaption></figure>

Once a user selects a product from the catalog and clicks on it, another iframe opens with a second UI task, presenting the corresponding product details and allowing the user to add the item to the Pepperi cart.

<figure><img src="../.gitbook/assets/image (31).png" alt=""><figcaption><p>Item hotspot</p></figcaption></figure>

{% hint style="warning" %}
To add items to the cart using Publitas catalog, the UI tasks should be opened inside the transaction only. Opening inside activity will not work
{% endhint %}

**Tags**: Publitas, Interactive Catalog
