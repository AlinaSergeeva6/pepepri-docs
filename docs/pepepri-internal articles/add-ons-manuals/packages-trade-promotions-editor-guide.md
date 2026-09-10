---
title: "Packages Trade Promotions Editor Guide"
order: 76
---
# Packages Trade Promotions Editor Guide

This guide explains how to use the Package Trade Promotions Editor in Pepperi to configure promotions. For Item and Order Trade Promotions, refer to the **Item and Order Trade Promotions Editor Guide**.

---

### Overview

Once the Package Trade Promotions Add-On was installed and completed the additional setup (see Package Trade Promotions Installation Guide), users can configure promotions using the editor. Access the editor through **Settings** in the Webapp.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-674.png)

---

### Package Setup Overview

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-675.png)

To create a Package Promotion, configure the following tabs in the editor:

-   **Package Info:** Defines the package as an "Item" in Pepperi, including its Name, Description, Main Category, and Image, displayed in the Order Center.
-   **Transactions:** Specifies the Transaction Types where the package is available (e.g., B2B eCommerce only). If none are selected, the package appears in all Transaction Types unless restricted by the Package Promotion module.
-   **Accounts:** Filters which Accounts can access the package using properties (logical OR for rules).
-   **Promotion Details:** Sets the message, validity, and tier rules (e.g., "Select 3 items for $20").
-   **Available Items:** Defines items available for selection in the package (Phase 1). For two-phase promotions, configure "Additional Selected Items" separately.
    -   **Rules Logic:** Multiple rules use logical OR (any rule satisfied); grouped rules use logical AND (all conditions in the group satisfied).

    ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-676.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-677.png)

---

### Using the Editor

This guide walks through configuring example Package Promotions to demonstrate the editor’s functionality. Examples include:

1.  **User selects any 3 items for $20 from a list (1 phase).**
2.  **User selects 2 items, gets 1 free, and a free display unit (multiple incentives).**
3.  **User selects 5 items, then 2 free items from another list (2 phases).**
4.  **User selects 5 items, gets the cheapest free (1 phase).**
5.  **User buys $500 from a list, gets up to $50 of free items (2 phases).**
6.  **User buys 3 preselected items for $20 (predefined kit).**

---

### Package Info and Accounts Setup (Applies to All Examples)

**Package Info**

-   **Name:** The package name displayed in the Order Center.
-   **External ID:** A unique ID for the Package Item (default provided, change only if necessary).
-   **Description:** A customer-facing description of the package deal, shown in the item details page.
-   **Main Category:** Assign a Main Category (e.g., a dedicated "Packages" category or the category of participating items).
-   **Image:** Upload an image to represent the package.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-678.png)

**Accounts**

-   **Filter:** Define which Accounts can access the package using properties (e.g., PaymentMethod = "Cash" OR LocationType = "Salon"). If none are set, all Accounts can access it.
-   **Excluded Accounts:** Specify Accounts to exclude (e.g., "Look de Luxe").

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-679.png)

---

### Step-by-Step Configuration

#### 1. User Selects Any 3 Items for $20 (1 Phase)

**Promotion Details (Field Descriptions)**

-   **Steps:**
    1.  **Fill Promotion Details:**
        -   **Title:** A name for your reference in the editor.

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-680.png)

        -   **Message:** A pop-up message explaining the promotion (e.g., what quantities to select). Also displayed at the top of the selection screen.

            ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-681.png)

        -   **Validity:**
            -   **Enabled between dates:** Set "Valid from" and "Valid to" dates (leave blank for always valid).
            -   **Disabled:** Check to disable the promotion.

        -   **By:** Choose the property for tier calculation:
            -   **Price:** Based on the total amount spent.
            -   **Quantity:** Based on the item unit quantity ordered.
            -   **Distinct Items:** Requires unique items (e.g., 3 distinct items, not multiples of the same).

        -   **Can be used (#) of times (0 is 'Unlimited'):** Limit how many times the package can be added per order.
        -   **Tiers:** Define the promotion rules:
            -   **Quantity Rule:**
                -   **Equal:** Quantity must match exactly.
                -   **More than:** Quantity can be greater than or equal to the value.
                -   **Multiple of:** Quantity must be a multiple of the value.

            -   **Quantity:** The threshold value (quantity or price).
            -   **Limitations:** Add conditions (e.g., items from specific categories). Click **Edit Limitations** to set (e.g., 5 items from 2 different categories).

                ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-682.png)

            -   **Get:**
                -   **Discount (%):** Apply a percentage discount.
                -   **Price:** Set a fixed price for all selected items.
                -   **Additional Item:** Add a specific item at a discount/free.
                -   **Additional User Selected Item:** Allow users to select items from a list at a discount/free.

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-683.png)

    2.  **Set Available Items:** Define items using properties (e.g., Main Category = "Skincare").
    3.  **Result:** Users see the package in the Order Center, with pop-ups for incorrect quantities.

**Example Values**

-   **Promotion Details:**
    -   Title: "3 Items for $20"
    -   Message: "Select 3 items for $20!"
    -   By: Quantity
    -   Quantity Rule: Equal
    -   Quantity: 3
    -   Get: Price → Value: $20

#### 2. User Selects 2 Items, Gets 1 Free + Free Display Unit (Multiple Incentives)

-   **Steps:**
    -   **Promotion Details:**
        -   Title: "2 Items + 1 Free + Display Unit"
        -   By: Quantity
        -   Quantity Rule: Equal
        -   Quantity: 2
        -   Tier 1: Get: Additional User Selected Item → Quantity: 1, Discount: 100%
        -   Tier 2: Get: Additional Item → Select "Display Unit", Discount: 100%, Quantity: 1

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-684.png)

    -   **Set Available Items:** Define items for the first phase (e.g., by Product Type).

#### 3. User Selects 5 Items, Then 2 Free Items (2 Phases)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-685.png)

-   **Steps:**
    -   **Promotion Details:**
        -   Title: "5 Items + 2 Free"
        -   By: Quantity
        -   Quantity Rule: Multiple of (supports multiples, e.g., 15 items = 6 free)
        -   Quantity: 5
        -   Get: Additional User Selected Items

    -   **Configure Additional Items:**

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-686.png)

        -   Title: "Select Free Items"
            -   Message: "Select {0} free items" (e.g., "Select 6 free items" for 15 items).
                -   Quantity Rule: Equal
                -   Quantity: 2
                -   Get: Discount (%) → Value: 100
                -   Available Items: Product Type = "Moisturizers"
                -   Excluded Items: Item ExternalID = "Skin033A"
                -   Default Quantity: 0

                ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-687.png)

#### 4. User Selects 5 Items, Gets Cheapest Free (1 Phase)

-   **Steps:**
    -   **Promotion Details:**

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-688.png)

        -   Title: "5 Items, Cheapest Free"
        -   By: Quantity
        -   Quantity Rule: Equal
        -   Quantity: 5
        -   Get: Additional Items → Use Cheapest Item, Quantity: 1, Discount: 100%

            ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-689.png)

    -   **Result:** For items (e.g., ItemA: $12.50 x2, ItemB: $13.75 x1, ItemC: $14.50 x2), cart shows 1 ItemA as free.

#### 5. User Buys $500, Gets $50 Free Items (2 Phases)

-   **Steps:**
    -   **Promotion Details:**
        -   Title: "$500 + $50 Free Items"
        -   By: Package Fixed Price
        -   Price: 500
        -   Get: Additional User Selected Items

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-690.png)

    -   **Configure Additional Items:**
        -   By: Price
        -   Rule: Up to
        -   Price: 50
        -   Get: Discount (%) → Value: 100

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-691.png)

    -   **Set Available Items:** Define items for both phases.

#### 6. User Buys 3 Preselected Items for $20 (Predefined Kit)

-   **Steps:**
    -   **Promotion Details:**
        -   Title: "3-Item Kit for $20"
        -   By: Quantity
        -   Quantity Rule: Equal
        -   Quantity: 3
        -   Get: Price → Value: $20

    -   **Set Available Items:**
        -   Filter by Item Code (e.g., 3 specific items).
        -   Default Quantity: 1 (non-modifiable, quantity field must be as read-only).

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-692.png)
