# Packages Trade Promotions Editor Guide

This guide explains how to use the Package Trade Promotions Editor in Pepperi to configure promotions. For Item and Order Trade Promotions, refer to the **Item and Order Trade Promotions Editor Guide**.

***

### Overview

Once the Package Trade Promotions Add-On was installed and completed the additional setup (see Package Trade Promotions Installation Guide), users can configure promotions using the editor. Access the editor through **Settings** in the Webapp.

<figure><img src="../../.gitbook/assets/image (667).png" alt=""><figcaption></figcaption></figure>

***

### Package Setup Overview

<figure><img src="../../.gitbook/assets/image (668).png" alt=""><figcaption></figcaption></figure>

To create a Package Promotion, configure the following tabs in the editor:

* **Package Info:** Defines the package as an "Item" in Pepperi, including its Name, Description, Main Category, and Image, displayed in the Order Center.
* **Transactions:** Specifies the Transaction Types where the package is available (e.g., B2B eCommerce only). If none are selected, the package appears in all Transaction Types unless restricted by the Package Promotion module.
* **Accounts:** Filters which Accounts can access the package using properties (logical OR for rules).
* **Promotion Details:** Sets the message, validity, and tier rules (e.g., "Select 3 items for $20").
*   **Available Items:** Defines items available for selection in the package (Phase 1). For two-phase promotions, configure "Additional Selected Items" separately.

    * **Rules Logic:** Multiple rules use logical OR (any rule satisfied); grouped rules use logical AND (all conditions in the group satisfied).

    <figure><img src="../../.gitbook/assets/image (669).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../../.gitbook/assets/image (670).png" alt=""><figcaption></figcaption></figure>

***

### Using the Editor

This guide walks through configuring example Package Promotions to demonstrate the editor’s functionality. Examples include:

1. **User selects any 3 items for $20 from a list (1 phase).**
2. **User selects 2 items, gets 1 free, and a free display unit (multiple incentives).**
3. **User selects 5 items, then 2 free items from another list (2 phases).**
4. **User selects 5 items, gets the cheapest free (1 phase).**
5. **User buys $500 from a list, gets up to $50 of free items (2 phases).**
6. **User buys 3 preselected items for $20 (predefined kit).**

***

### Package Info and Accounts Setup (Applies to All Examples)

**Package Info**

* **Name:** The package name displayed in the Order Center.
* **External ID:** A unique ID for the Package Item (default provided, change only if necessary).
* **Description:** A customer-facing description of the package deal, shown in the item details page.
* **Main Category:** Assign a Main Category (e.g., a dedicated "Packages" category or the category of participating items).
* **Image:** Upload an image to represent the package.

<figure><img src="../../.gitbook/assets/image (671).png" alt=""><figcaption></figcaption></figure>

**Accounts**

* **Filter:** Define which Accounts can access the package using properties (e.g., PaymentMethod = "Cash" OR LocationType = "Salon"). If none are set, all Accounts can access it.
* **Excluded Accounts:** Specify Accounts to exclude (e.g., "Look de Luxe").

<figure><img src="../../.gitbook/assets/image (672).png" alt=""><figcaption></figcaption></figure>

***

### Step-by-Step Configuration

#### 1. User Selects Any 3 Items for $20 (1 Phase)

**Promotion Details (Field Descriptions)**

* **Steps:**
  1.  **Fill Promotion Details:**<br>

      * **Title:** A name for your reference in the editor.

      <figure><img src="../../.gitbook/assets/image (675).png" alt="" width="302"><figcaption></figcaption></figure>

      *   **Message:** A pop-up message explaining the promotion (e.g., what quantities to select). Also displayed at the top of the selection screen.<br>

          <figure><img src="../../.gitbook/assets/image (676).png" alt=""><figcaption></figcaption></figure>
      * **Validity:**
        * **Enabled between dates:** Set "Valid from" and "Valid to" dates (leave blank for always valid).
        * **Disabled:** Check to disable the promotion.
      * **By:** Choose the property for tier calculation:
        * **Price:** Based on the total amount spent.
        * **Quantity:** Based on the item unit quantity ordered.
        * **Distinct Items:** Requires unique items (e.g., 3 distinct items, not multiples of the same).
      * **Can be used (#) of times (0 is 'Unlimited'):** Limit how many times the package can be added per order.
      * **Tiers:** Define the promotion rules:
        * **Quantity Rule:**
          * **Equal:** Quantity must match exactly.
          * **More than:** Quantity can be greater than or equal to the value.
          * **Multiple of:** Quantity must be a multiple of the value.
        * **Quantity:** The threshold value (quantity or price).
        *   **Limitations:** Add conditions (e.g., items from specific categories). Click **Edit Limitations** to set (e.g., 5 items from 2 different categories).<br>

            <figure><img src="../../.gitbook/assets/image (677).png" alt=""><figcaption></figcaption></figure>
        * **Get:**
          * **Discount (%):** Apply a percentage discount.
          * **Price:** Set a fixed price for all selected items.
          * **Additional Item:** Add a specific item at a discount/free.
          * **Additional User Selected Item:** Allow users to select items from a list at a discount/free.

      <figure><img src="../../.gitbook/assets/image (674).png" alt=""><figcaption></figcaption></figure>
  2. **Set Available Items:** Define items using properties (e.g., Main Category = "Skincare").
  3. **Result:** Users see the package in the Order Center, with pop-ups for incorrect quantities.

**Example Values**

* **Promotion Details:**
  * Title: "3 Items for $20"
  * Message: "Select 3 items for $20!"
  * By: Quantity
  * Quantity Rule: Equal
  * Quantity: 3
  * Get: Price → Value: $20

#### 2. User Selects 2 Items, Gets 1 Free + Free Display Unit (Multiple Incentives)

* **Steps:**
  *   **Promotion Details:**

      * Title: "2 Items + 1 Free + Display Unit"
      * By: Quantity
      * Quantity Rule: Equal
      * Quantity: 2
      * Tier 1: Get: Additional User Selected Item → Quantity: 1, Discount: 100%
      * Tier 2: Get: Additional Item → Select "Display Unit", Discount: 100%, Quantity: 1

      <figure><img src="../../.gitbook/assets/image (678).png" alt=""><figcaption></figcaption></figure>
  * **Set Available Items:** Define items for the first phase (e.g., by Product Type).

#### 3. User Selects 5 Items, Then 2 Free Items (2 Phases)

<figure><img src="../../.gitbook/assets/image (679).png" alt=""><figcaption></figcaption></figure>

* **Steps:**
  * **Promotion Details:**
    * Title: "5 Items + 2 Free"
    * By: Quantity
    * Quantity Rule: Multiple of (supports multiples, e.g., 15 items = 6 free)
    * Quantity: 5
    * Get: Additional User Selected Items
  *   **Configure Additional Items:**

      <figure><img src="../../.gitbook/assets/image (680).png" alt=""><figcaption></figcaption></figure>

      * Title: "Select Free Items"
        *   Message: "Select {0} free items" (e.g., "Select 6 free items" for 15 items).

            * Quantity Rule: Equal
            * Quantity: 2
            * Get: Discount (%) → Value: 100
            * Available Items: Product Type = "Moisturizers"
            * Excluded Items: Item ExternalID = "Skin033A"
            * Default Quantity: 0

            <figure><img src="../../.gitbook/assets/image (681).png" alt=""><figcaption></figcaption></figure>

#### 4. User Selects 5 Items, Gets Cheapest Free (1 Phase)

* **Steps:**
  *   **Promotion Details:**

      <figure><img src="../../.gitbook/assets/image (682).png" alt=""><figcaption></figcaption></figure>

      * Title: "5 Items, Cheapest Free"
      * By: Quantity
      * Quantity Rule: Equal
      * Quantity: 5
      *   Get: Additional Items → Use Cheapest Item, Quantity: 1, Discount: 100%<br>

          <figure><img src="../../.gitbook/assets/image (683).png" alt="" width="292"><figcaption></figcaption></figure>
  * **Result:** For items (e.g., ItemA: $12.50 x2, ItemB: $13.75 x1, ItemC: $14.50 x2), cart shows 1 ItemA as free.

#### 5. User Buys $500, Gets $50 Free Items (2 Phases)

* **Steps:**
  *   **Promotion Details:**

      * Title: "$500 + $50 Free Items"
      * By: Package Fixed Price
      * Price: 500
      * Get: Additional User Selected Items

      <figure><img src="../../.gitbook/assets/image (684).png" alt=""><figcaption></figcaption></figure>
  *   **Configure Additional Items:**

      * By: Price
      * Rule: Up to
      * Price: 50
      * Get: Discount (%) → Value: 100

      <figure><img src="../../.gitbook/assets/image (685).png" alt=""><figcaption></figcaption></figure>
  * **Set Available Items:** Define items for both phases.

#### 6. User Buys 3 Preselected Items for $20 (Predefined Kit)

* **Steps:**
  * **Promotion Details:**
    * Title: "3-Item Kit for $20"
    * By: Quantity
    * Quantity Rule: Equal
    * Quantity: 3
    * Get: Price → Value: $20
  *   **Set Available Items:**

      * Filter by Item Code (e.g., 3 specific items).
      * Default Quantity: 1 (non-modifiable, quantity field must be as read-only).

      <figure><img src="../../.gitbook/assets/image (686).png" alt=""><figcaption></figcaption></figure>
