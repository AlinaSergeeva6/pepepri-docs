---
description: Estimated time to implement for new environment - 1h
---

# Return Based On UI Task

### Description

One of the best solutions among existing returns. Allows you to return items based on existing invoices, but more customizable and very flexible when it comes to styles, includes searching by Invoice ID or Product ID.

<figure><img src="../../../.gitbook/assets/image (197).png" alt=""><figcaption><p><strong>The UI task shows a list of all items and the number of items that can be returned.</strong></p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (211).png" alt=""><figcaption><p><strong>Select the items you would like to return and their quantity.</strong></p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (115).png" alt=""><figcaption><p><strong>You can then view the items you have selected in your cart and submit a return.</strong></p></figcaption></figure>

### Advantages and disadvantages

{% hint style="success" %}
Has a good validation system, users can't return an item or select a wrong quantity that hasn't been added to the invoice before.
{% endhint %}

{% hint style="success" %}
Easy to use, fairly fast implementation (if you use standard styles and fields).
{% endhint %}

{% hint style="success" %}
Very flexible. Has the ability to search for a specific product or transaction.
{% endhint %}

{% hint style="success" %}
Can be setup with a UI Task or a Custom Form, depending on the customer's requirements or the complexity of the task.
{% endhint %}

{% hint style="success" %}
If you are implementing with a Custom Form, you can make a return offline, but it won't be processed until the user syncs their device.
{% endhint %}

{% hint style="danger" %}
We can only return items for transactions that were previously created.
{% endhint %}

### Demo - How does it work&#x20;

1. Open **Return Based On UI Task** transaction and select the first customer.
2. Select the items you would like to return and the quantity and click **Add To Card** button.

{% hint style="info" %}
When you start a transaction, the **Return Qty** column displays the maximum number of items you can return.
{% endhint %}

3. You will be redirected to the cart where you can view your items. Click **Submit** to complete the return process.

### **How to copy to another environment**

1. Create new transaction type.
2. Create these fields in a new transaction and add them to views.
   * **Header fields**
     * TSAGrandTotal - Sum Transaction Lines type. Sum Transaction line field - TSALineSum.
   * **Line fields**
     * TSALineSum - Currency type.
     * TSAQTY - Number type.
3. In the workflow on **New** -> **In Creation** step, add a UI Task or a Custom From. (You can use a custom corm from **Services Demo Environment**. Custom From name: **Return items from Invoice**).

{% hint style="info" %}
By default, the custom form retrieves invoice data from an **Invoice** transaction. Make sure you have this transaction and your invoices are uploaded to the **Invoice** transaction. If you want to retrieve invoices from another transaction, you need to update the custom form.
{% endhint %}
