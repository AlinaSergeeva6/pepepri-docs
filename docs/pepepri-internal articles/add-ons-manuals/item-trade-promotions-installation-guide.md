---
title: "Item Trade Promotions Installation Guide"
order: 80
---
# Item Trade Promotions Installation Guide

This guide provides step-by-step instructions for installing the Item Trade Promotions module in Pepperi. Item promotions are applied to specific items based on quantity or price tiers, enhancing your B2B sales strategy. For details on creating promotions, refer to the **Item and Order Trade Promotions Editor Guide**.

---

### Overview

The Item Trade Promotions module allows users to install and configure a system for applying promotions to individual items based on purchase quantities or amounts. Once installed, users can use the graphical Promotions Editor to set up promotions.

-   **Prerequisites:** Access to the Pepperi Webapp.
-   **Post-Installation:** Users can create promotions after completing the setup steps.

---

### Step 1: Install the Item Trade Promotions Add-On

1.  **Log In as Admin:**
    -   Access the Pepperi Webapp as an Admin user.

2.  **Navigate to Add-On Manager:**
    -   Go to **Settings → Configuration → Add-On Manager**.

3.  **Install the Add-On:**
    -   Locate **Item Trade Promotions** in the list.
    -   Click the **Edit Menu** and select **Install**.
    -   **Troubleshooting:** If the add-on is missing or access is denied, contact Pepperi support to enable it.

    ![](/static/image-625.png)

---

### Step 2: Complete the Installation Process

After installing the add-on, the following steps must be perfomed to fully enable Item Trade Promotions. These steps ensure the module integrates with your environment and is ready for user configuration.

#### Pre-Installation Check

-   **Internal Delimiter:**
    -   Go to **Settings → ERP Integration Configuration**.
    -   Verify the internal delimiter is not set to `:`.
    -   If it is `:`, change it to `;` or `~` (this change impacts integration data).

#### Detailed Steps

1.  **Run Installation per Transaction Type:**
    -   Navigate to **Settings → Promotion Setup → Item TP Setup**.

        ![](/static/image-626.png)

    -   Select each Transaction Type where Item Trade Promotions should apply (e.g., B2B Transaction, Sales Rep Order).

!!!success
### Best Practice:

[Duplicate the target transaction](/pepperi/sales-activities/duplicate-a-transaction-activity-type.md) (e.g., "Sales Order" to "Sales Order with Promotions") for testing:

-   Go to **Settings → Sales Activities → Transaction Types**, duplicate the transaction, and install promotions on the copy.
-   Create test orders with sample values on the duplicated transaction to enable editor recognition (e.g., test payment method "cash" if filtering by it).
-   After testing, apply promotions to the original transaction.

!!!

-   **Outcome:**
    -   Creates User Defined Tables (prefix PPI\_ItemPromotion)

    ![](/static/image-627.png)

    -   Creates custom Transaction Line-Item fields (prefix PPI\_ItemPromotion).

    ![](/static/image-628.png)

!!!warning
#### Note: Do not delete or modify these objects, as it will break the promotion functionality.
!!!

1.  **Define Promotion Types in the Types Editor:**
    -   Go to **Settings → Promotion Setup → Item TP Types Editor**.

    ![](/static/image-629.png)

    -   Click **Add+** to define a new Item Promotion Type.
    -   **Fields:**
        -   **Description:** Name the type descriptively (e.g., "Medium Accounts - Brand X").
            -   **Priority:** Assign a priority (e.g., 1 for highest). Relevant only if multiple promotions apply and you choose not to stack them.

        -   **Apply Multiple Promotions:**
            -   **Yes, continue to next promotion:** All applicable promotions stack (priority ignored, set to 1).
            -   **No:** Only the highest-priority promotion applies.

        -   **Promotion Properties:**
            -   **Object Type:** Select Account, Item, or Transaction.
            -   **Property:** Choose the field (e.g., Account.Size, Item.MainCategory).
            -   Click **Add+** for additional properties.

            ![](/static/image-630.png)

    -   **Example Types:**
        -   Medium-sized accounts, Brand "X" items:
            -   Account.Size
            -   Item.MainCategory.

        -   Small customers in City "A", SubCategory "S" on B2B site:
            -   Account.Size
            -   Account.City
            -   Item.SubCategory
            -   Transaction.Type.

        -   Items in SubCategory "F", only when sales reps are ordering on the app for all customers
            -   Item.SubCategory
            -   Transaction.Type

    -   Save each type for use in the Promotions Editor.

2.  **Indicate Custom Pricing Fields:**
    -   By default, the module uses standard Transaction Line fields (e.g., UnitPrice, UnitsQuantity).
    -   If using custom fields, edit the PPI\_ItemPromotion\_Init Custom Transaction Field:
        -   Go to the **Input** or **Output** section.
        -   Uncomment and update the relevant lines with your custom field API names.

    -   **Examples:**
        -   Input: Replace UnitPrice with TSACalcUnitPrice:

            ```
            config.APINames["API_UnitPrice"] = "TSACalcUnitPrice";
            ```

        -   Output: Replace UnitDiscountPercentage with TSACalcUnitDiscount:

            ```
            config.APINames["API_UnitDiscount"] = "TSACalcUnitDiscount";
            ```

3.  **Create Item Lists:**
    -   Create at least one Item List via **Item Lists** instructions.
    -   Include fields in the List View layout and Smart Search for quick filtering.
    -   Define a default list (if preferred):
        -   Go to **Settings → Promotion Setup → Item TP Setup → Advanced Setup**.
        -   Enter the List ID You can find the List ID as explained in section #9 in Package Promotions Advanced Configuration

        ![](/static/image-631.png)

4.  **Modify Next Discount Message Text:**
    -   Edit the PPI\_ItemPromotionLogic field in the Transaction Custom Fields section.
    -   Locate the NextDiscountText variables near the code’s start and translate them (e.g., replace "Buy" with your language term).
    -   Example:

        ```
        var NextDiscountTextBuyPrefix = 'Kaufen '; // German for "Buy"
        ```

    -   Edit PPI\_ItemPromotionNextDiscount to customize icons/emoji:
        -   Replace $ $ $ with emoji (e.g., ⭐️):

            ```
            var nextDiscountMessage = this.PPI_ItemPromotion.getNextDiscount(ItemWrntyID, ItemUUID, LineNumber);
            if (nextDiscountMessage != '') {
                nextDiscountMessage = '⭐️  ' + nextDiscountMessage + ' ⭐️';
            }
            return nextDiscountMessage;
            ```

    -   Test in Admin view to ensure proper display.

---

### Step 3: Enhance User Experience

-   **Add Display Fields:**
    -   Include these fields in the Order Center or Cart view for customer clarity:
        -   PPI\_ItemPromotion\_Reason: Shows the applied promotion name.
        -   Unit Price After Discount: Displays the new unit price post-promotion.
        -   Item Discount: Shows the percentage discount (if applicable).

    ![](/static/image-632.png)

---

### Step 4: Test the Installation

1.  **Verify Installation:**
    -   Check that PPI\_ItemPromotion tables and fields are created in the back office.
    -   Ensure no objects are deleted or altered post-installation.

2.  **Test Promotions:**
    -   Create test orders on the duplicated transaction type.
    -   Use the Promotions Editor to apply a promotion and confirm it reflects correctly (e.g., discounts, next discount messages).

3.  **Test Across Platforms:**
    -   Validate the setup on Web App, iPad, and Android to ensure consistent behavior.

---
