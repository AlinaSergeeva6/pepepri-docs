---
title: "Item and Order Trade Promotions Editor Guide"
order: 77
---
# Item and Order Trade Promotions Editor Guide

This guide explains how to use the Item and Order Trade Promotions Editor in Pepperi to configure promotions. For Package Trade Promotions, refer to the **Packages Trade Promotions Editor Guide**.

---

### Overview

Once the Item and Order Trade Promotions Add-Ons were installed and completed the additional setup (see Item Trade Promotions Installation Guide and Order Trade Promotions Installation Guide), users can configure promotions using the editor. Access the editor through **Settings** in the Webapp.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-651.png)

---

### Using the Editor

This guide walks through configuring example Item and Order promotions to demonstrate the editor’s functionality. Examples include:

#### 1. Item Trade Promotions by Quantity

-   **1a. Two-Tier Promotion:**
    -   Tier 1: Purchase 10+ items of a specific Main Category for medium-sized accounts, get 10% discount.
    -   Tier 2: Purchase 20+ items of the same Main Category for medium-sized accounts, get 15% discount.

-   **1b. Purchase 10+ items of a specific Main Category for large-sized accounts, get 20% discount.**
-   **1c. Purchase 50+ of 3 specific items for all accounts on B2B eCommerce, get 5% discount.**
-   **1d. Purchase 10+ of 2 specific items, get Item XYZ free (or discounted) for all accounts.**
-   **1e. Multiple incentives for the same quantity tier: Purchase 2 items, pay $10, and get 1 free display unit.**

#### 2. Order Trade Promotions by Price

-   **2a. All B2B eCommerce orders over $500 get 10% discount.**
-   **2b. Orders over $1000 get 5% discount for accounts paying cash (usually credit).**
-   **2c. Orders over $100 get additional user-selected items for free (all accounts).**

---

### Promotion Details Fields Explanation:

-   **Description:** Enter a clear and concise description of the promotion. This will be visible to other users or buyers, so ensure it’s easy to understand.
-   **Type:** Select the promotion type. Types specify the properties determining which items the promotion applies to (e.g., "By Account Size and Item Main Category"). If the desired type isn’t available, create it.
-   **Validity:**
    -   **Enabled between dates:** Specify the "Valid from" and "Valid to" dates to set the promotion’s active period. Leave blank for always valid.
    -   **Disabled:** Check this to disable the promotion entirely.

-   **By:** Choose the property for tier calculation:
    -   **Quantity:** Applies the promotion based on the item unit quantity ordered (common for Item Trade Promotions).
    -   **Price:** Applies the promotion based on the total amount spent (common for Order Trade Promotions).

-   **Priority:** Set a numerical priority to determine the order in which multiple applicable promotions are applied.
-   **Apply Multiple Promotions:**
    -   **Yes, continue to the next promotion:** Allows multiple promotions to stack in priority order.
    -   **No:** Applies only the current promotion, ignoring others.

-   **Promotion Tiers:**
    -   **Quantity:** Add tiers by specifying the quantity (or price, if "By: Price" was selected) thresholds.
    -   **Get:** Define the incentive for each tier:
        -   **Price:** Set a specific price per item when the quantity threshold is met (e.g., "Order 10 or more and pay $3 per item").
        -   **Discount %:** Set a percentage discount when the threshold is met (e.g., "Order 10 or more and get 10% discount").
        -   **Discount Price:** Set a fixed discount amount when the threshold is met (e.g., "Order 10 or more and get $1 off").

---

### Step-by-Step Configuration

#### 1. Item Trade Promotions by Quantity

**Example 1a: Two-Tier Promotion**

-   **Objective:** 10% discount for 10+ items, 15% for 20+ items, for medium-sized accounts and a specific Main Category.
-   **Steps:**
    1.  **Open Editor:** Click **Add** in the Item Promotions Editor.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-652.png)

    2.  **Fill Promotion Details:**
        -   **Description:** "10-20 Tier Discount for Medium Accounts - Nail Polish"
        -   **Type:** Select "By Account Size and Item Main Category".
        -   **Validity:** Set "Valid from" and "Valid to" dates (leave blank for always valid).
        -   **By:** Choose "Quantity" (for item unit quantity).
        -   **Priority:** Set a priority (e.g., 1).
        -   **Apply Multiple Promotions:** Choose "Yes, continue to next promotion" or "No".
        -   **Promotion Tiers:**
            -   Quantity: 10 → Get: Discount % → Value: 10
            -   Quantity: 20 → Get: Discount % → Value: 15

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-653.png)

    3.  **Save and Set Values:**
        -   Click **Save**, then **Values**.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-654.png)

        -   Select: Account Size = "Medium", Main Category = "Nail Polish".

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-655.png)

    4.  **Result:** Promotion applies immediately after sync, adjusting prices in the cart.

**Example 1b: 20% Discount for Large Accounts**

-   **Steps:** Similar to 1a, but select Account Size = "Large" and Quantity tier: 10 → 20% discount.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-656.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-657.png)

**Example 1c: 5% Discount for 3 Items on B2B**

-   **Steps:**
    -   **Promotion Details:**
        -   Description: "50+ Units 5% Off for B2B - Face Creams"
        -   Type: "By Item ID and Transaction Type"
        -   By: Quantity
        -   Quantity: 50
        -   Get: Discount %
        -   Value: 5

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-658.png)

    -   **Save and Set Items:**
        -   Click **Items**, select by Item ID, choose 3 face creams (e.g., A, B, C).
        -   Select Transaction Type: "B2B eCommerce Order".

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-659.png)

**Example 1d: Free Item XYZ for 10+ of 2 Items**

-   **Steps:**
    -   **Promotion Details:**
        -   Description: "10+ Units Free XYZ Skin Cream"
        -   Type: "By Item ID"
        -   By: Quantity
        -   Quantity: 10
        -   Get: Additional Item
        -   Value: Select "Skin Cream XYZ" (click Edit → Select another item → Item ID).
        -   Discount: 100% (free), Quantity: 1

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-660.png)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-661.png)

    -   **Save and Set Items:**
        -   Click **Items**, select by Item ID, choose 2 items (e.g., SE50, SE140).

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-662.png)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-663.png)

**Example 1e: Multiple Incentives**

-   **Steps:**
    -   **Promotion Details:**
        -   Description: "Buy 2, Pay $10, Get Free Display"
        -   Type: (e.g., "By Item ID")
        -   By: Quantity
        -   Quantity: 2
        -   Tier 1: Get: Price → Value: $10
        -   Tier 2: Get: Additional Item → Value: "Display Unit" (100% discount, Quantity: 1)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-664.png)

#### 2. Order Trade Promotions by Price

-   **Note:** The Order Trade Promotions Editor is similar to the Item Editor, with an option for user-selected additional items based on order total.

**Example 2a: 10% Discount for B2B Orders over $500**

-   **Steps:**
    -   **Promotion Details:**
        -   Description: "B2B Orders > $500 - 10% Discount"
        -   Type: "By Transaction Type and Total Amount"
        -   Validity: Set dates (or leave blank).
        -   By: Price
        -   Promotion Tiers: Price: 500 → Get: Discount % → Value: 10

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-665.png)

    -   **Save and Set Values:** Select Transaction Type = "B2B eCommerce Order".

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-666.png)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-667.png)

**Example 2b: 5% Discount for Cash Payments over $1000**

-   **Steps:**
    -   **Promotion Details:**
        -   Description: "Cash Orders > $1000 - 5% Discount"
        -   Type: "By Account Default Payment + Payment Method Selected"
        -   By: Price
        -   Promotion Tiers: Price: 1000 → Get: Discount % → Value: 5

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-668.png)

    -   **Set Values:** Select Account Default Payment = "Credit", Payment Method Selected = "Cash".

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-669.png)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-670.png)

    -   **Note:** Custom fields (e.g., TSA:DefaultPaymentMethod) must exist with test data.

**Example 2c: Free User-Selected Items for Orders over $100**

-   **Steps:**
    -   **Promotion Details:**
        -   Description: "Orders > $100 - Free User-Selected Items"
        -   Type: "By Transaction Type"
        -   By: Price
        -   Promotion Tiers: Price: 100 → Get: Additional User-Selected Items

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-671.png)

    -   **Configure Additional Items:**

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-672.png)

        -   Click **Value** to define the selection list.
        -   **Message Displayed:** Add a pop-up message (e.g., "Select 3 items").
        -   **Quantity Rule:** Choose "Equal" or "Up to" (e.g., 3 items).
        -   **Get:** Set Discount = 100% (free) or a price.
        -   **Available Items Rules:** Filter by property (e.g., Main Category = "Skincare"), set Default Quantity = 1.
        -   **Excluded Items Rules:** Exclude specific items (e.g., by Item Code).

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-673.png)
