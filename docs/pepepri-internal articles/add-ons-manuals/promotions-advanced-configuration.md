---
title: "Promotions Advanced Configuration"
order: 75
---
# Promotions Advanced Configuration

This guide covers advanced configurations for Promotions in Pepperi.

---

### Overview

This article addresses the following advanced configurations for Promotions:

1.  Enable Edit/Delete a Package in the Shopping Cart.
2.  Translate Package Messages.
3.  Copy Field Values from the Original Transaction to the Package Transaction.
4.  Pass the Promotion Code to Line Items in the Original Transaction.
5.  Merge Pricing Fields from the Package Transaction to the Original Transaction.
6.  Set Up Predefined Kits (Non-Editable Quantities).
7.  Assign Catalogs to Package Transactions.
8.  Apply Item Promotion Discounts Inside a Package Promotion.
9.  Define Specific Account/Item Lists for Selection.
10.  Set Field Values on the Package Leading Item Line.
11.  Apply Package Promotion Discounts to Line Views or Custom Fields.
12.  Configure Order Promotions with TSA Fields.

---

### Step-by-Step Configuration

#### 1. Enable Edit/Delete a Package in the Shopping Cart

-   **Objective:** Allow users to edit or delete a package in the cart.
-   **Steps:**
    1.  Go to **Views and Forms → Order Center → Cart Line Menu Configuration**.

        ![](/static/image-693.png)

    2.  Add **Edit Package** and **Delete Package** options to the menu.
    3.  **Behavior:**
        -   **Web App:** Tick the leading package item (dark blue line) and select Edit/Delete from the menu.
        -   **Mobile App:** Long-tap the leading package item (regular items show Edit/Delete for the item only).
        -   Menu options are context-sensitive, showing "Edit/Delete" for both package and non-package items.

    ![](/static/image-694.png)

#### 2. Translate Package Messages

**Translate Warning Messages**

-   **Objective:** Customize warning messages (e.g., for incorrect quantities/prices) in the user’s language.
-   **Steps:**
    1.  Go to **Settings → Sales Activities → Transaction Types → PPI\_PackagePromotion → Fields → Transaction Custom Fields**.
    2.  Edit the PPI\_PackagePromotion\_Start\_Strings field.
    3.  Uncomment the code (remove /\* and \*/) and replace the text, preserving the {0} placeholder.

        ```
        var strings = {
            MissingOneMsg: "Please select an additional item",
            MissingMsg: "Please select {0} more items",
            PrefixExtraMsg: "You have chosen too many items. Please ",
            OneExtraMsg: "remove one item",
            TooManyMsg: "remove {0} items",
            MissingPriceMsg: "Please select additional items at a total price of {0}",
            TooManyPriceMsg: "remove items at a total price of {0}",
            OrMsg: " or "
        };
        return JSON.stringify(strings);
        ```

    4.  **Note:** Messages for selecting quantities per phase are set in the Package Editor, not here.

    ![](/static/image-695.png)

**Translate Package Next Discount Messages**

-   **Objective:** Customize the "Next Discount" message (e.g., "Buy {qty} more to get {get}").
-   **Steps:**
    1.  Go to **Settings → Sales Activities → Transaction Types → PPI\_PackagePromotion → Fields → Transaction Custom Fields**.
    2.  Edit the PPI\_PackagePromotion\_Start\_Logic field.
    3.  Translate the text in the commented section, preserving placeholders (e.g., {qty}, {get}).

        ```
        var NextDiscountTextBuy = 'Buy {qty} to get {get}';
        var NextDiscountTextBuyMore = 'Buy {qty} more to get {get}';
        // ... (other messages)
        var NextDiscountTextGetAdditionalUserSelectedItems = 'additional user selected items';
        var NextDiscountTextGetCreditNote = '{val} credit note';
        var NextDiscountTextGetSeparator = ' & ';
        ```

#### 3. Copy Field Values from Original to Package Transaction

-   **Objective:** Copy calculated fields from the original transaction (e.g., Sales Order) to the Package Transaction.
-   **Steps:**
    1.  **Edit Field List:**
        -   Go to **Settings → Sales Activities → Transaction Types → PPI\_PackagePromotion → Fields**.
        -   Edit PPI\_PackagePromotion\_Start\_GetOriginalOrderFields.
        -   Add custom fields to the array (e.g., \["TSAmyPrice", "TSATax"\]).

            ```
            var originalOrderFields = ["TSAmyPrice", "TSATax"];
            ```

    2.  **Create Fields in Package Transaction:**
        -   Add the same custom fields (e.g., TSAmyPrice, TSATax) to the PPI\_PackagePromotion Transaction (case-sensitive).

    3.  **Update Workflow:**
        -   Go to **Workflow** tab of PPI\_PackagePromotion.
        -   Edit the In Creation transition in both branches.

            ![](/static/image-696.png)

        -   Add the fields to the **Merge Transaction Lines** action (e.g., map TSAmyPrice to TSAmyPrice).

        ![](/static/image-697.png)

#### 4. Pass Promotion Code to Line Items in Original Transaction

![](/static/image-698.png)

-   **Objective:** Assign a Promotion Code from the Package configuration to each line item in the original transaction for tracking.
-   **Steps:**
    1.  Create a custom line-item field in the original transaction (e.g., TSAPromoCode).
    2.  Go to **Settings → Sales Activities → Transaction Types → PPI\_PackagePromotion → Workflow**.
    3.  Edit the **Merge Transaction Lines** action in both branches of the In Creation transition.
    4.  Map PPI\_PackagePromotion\_Start\_PromotionCode to TSAPromoCode.

![](/static/image-699.png)

#### 5. Merge Pricing Fields from Package to Original Transaction

**Case A: Custom UnitPrice Field in Original Transaction**

-   **Steps:**
    -   Edit the **Merge Transaction Lines** action in both branches of the In Creation transition in PPI\_PackagePromotion.
    -   Add a mapping: Custom field (e.g., TSACustomUnitPrice) ← PPI\_PackagePromotion\_Start\_UnitPrice (Calculated).

    ![](/static/image-700.png)

**Case B: Custom Pricing Fields (UnitPrice, UnitDiscount, etc.)**

-   **Steps:**
    -   Edit the **Merge Transaction Lines** action in both branches.
    -   Replace default fields with custom fields (e.g., UnitPriceAfterDiscount → TSACustomUnitPriceAfterDiscount, UnitDiscount → TSACustomUnitDiscount).
    -   Add a mapping for TotalUnitPriceAfterDiscount: Custom field (e.g., TSACustomTotalPrice) ← PPI\_PackagePromotion\_Start\_ItemTotalPrice (Set By API).

    ![](/static/image-701.png)

#### 6. Set Up Predefined Kits (Non-Editable Quantities)

-   **Objective:** Create kits with fixed quantities that users cannot modify.
-   **Steps:**
    1.  **Add Package Transaction Type:**
        -   Go to **Settings → Promotion Setup → Package TP Setup → Advanced Setup**.
        -   Click **Add**, select new transaction types for both Package and Additional Items (e.g., PPI\_PackagePromotion\_Kit).

        ![](/static/image-702.png)

    2.  **Configure Transaction Type:**
        -   Go to **Settings → Sales Activities → Transaction Types → \[New Transaction Type\]**.
        -   Set Name (e.g., PPI\_PackagePromotion\_Kit) and Description.

        ![](/static/image-703.png)

    3.  **Create Custom Quantity Field:**
        -   Add a custom line-item field (e.g., MyUnitsQuantity, type: Number) to return UnitsQuantity.

        ![](/static/image-704.png)

    4.  **Update Order Center Views:**
        -   Replace UnitsQuantity with MyUnitsQuantity in views (e.g., Medium or Grid Line).
        -   Set as read-only.

        ![](/static/image-705.png)

        ![](/static/image-706.png)

    5.  **Result:** Users can select the new transaction type in the Package Editor for kits.

        ![](/static/image-707.png)

#### 7. Assign Catalogs to Package Transactions

-   **Objective:** Assign specific catalogs to PPI\_PackagePromotion and PPI\_PackagePromotionAdditionalItems transactions.
-   **Steps:**
    1.  Go to **Settings → Sales Activities → Transaction Types → \[PPI\_PackagePromotion or PPI\_PackagePromotionAdditionalItems\] → Settings**.

        ![](/static/image-708.png)

    2.  Assign the desired catalog(s), ideally a separate catalog without filters to avoid user errors.
    3.  For detailed setup, see "Modify the Catalog Setup for Package Promotion Transactions" in the **Packages Trade Promotions Editor Guide**.
    4.  **Screenshot Reference:** \[mceclip8.png\]

#### 8. Apply Item Promotion Discounts Inside a Package Promotion

-   **Objective:** Apply both Item and Package Promotion discounts to the same item (e.g., 10% Item discount + 40% Package discount).
-   **Steps:**
    1.  **Install Item Promotion on Package Transaction:**
        -   Rename PPI\_PackagePromotion to a temporary name (e.g., xx).
        -   Go to **Settings → Promotion Setup → Item TP Setup**, select the renamed transaction, and run the installation.
        -   Rename it back to PPI\_PackagePromotion.

    2.  **Update Pricing Logic:**
        -   Go to **Settings → Sales Activities → Transaction Types → PPI\_PackagePromotion → Fields → Transaction Line Item Fields**.
        -   Edit PPI\_PackagePromotion\_Start\_UnitPrice (Calculated).
        -   Add UnitPriceAfterDiscount to participating fields.
        -   Modify the formula:

            ```
            if (UnitPriceAfterDiscount == 0) {
                return UnitPrice;
            } else {
                return UnitPriceAfterDiscount;
            }
            ```

        ![](/static/image-709.png)

    3.  **Note:** Only supports discounts, not additional items.

#### 9. Define Specific Account/Item Lists for Selection

-   **Objective:** Use specific Account/Item Lists in the Package Editor instead of the default.
-   **Steps:**
    1.  Go to **Settings → Promotion Setup → Package TP Setup → Advanced Setup**.
    2.  Enter the List IDs:

        ![](/static/image-710.png)

        -   **Account List ID Format:** \[AG#39949\]AccountList
        -   **Item List ID Format:** \[GL#22b4eef3-130b-4590-8d8b-a0d9395e7d82\]ListView

    3.  **Find List IDs:**
        -   **Account List (Old Format):**
            -   Go to **Settings → Accounts → Account Lists**.
            -   Open browser debugger (F12), go to Network tab, edit the list, find GetListUIControl → Data → UIControls → Type.

            ![](/static/image-711.png)

        -   **Item List or Account List (New Format):**
            -   Go to **Settings → Items → Item Lists** (or **Account Lists (New)**).
            -   Open debugger, edit the list, find GetTemplates → Data → uiControlState → Type.

            ![](/static/image-712.png)

#### 10. Set Field Values on the Package Leading Item Line

-   **Objective:** Update fields on the leading package item line (dark blue line in cart), e.g., custom quantity.
-   **Steps:**
    -   Go to **Settings → Sales Activities → Transaction Types → PPI\_PackagePromotion → Fields**.
    -   Edit the header field TSAPPIPackagePromotionStartUpdateLeadingItem.
    -   Add code to set fields (e.g., TSAmyQuantity to 1):

    ![](/static/image-713.png)

#### 11. Apply Package Promotion Discounts to Line Views or Custom Fields

-   **Objective:** Use discounts from the Package TP Editor inside Package Promotions for line views, merges, or custom fields.
-   **Steps:**
    1.  **Retrieve Discount from UDT:**
        -   Go to **Settings → Sales Activities → Transaction Types → PPI\_PackagePromotion → Fields**.
        -   Create or edit a header field (e.g., PPI\_Custom\_Header\_Init).
        -   Add the following script to fetch the discount from PPI\_PackagePromotion\_Details:

            ```
            /* PPI_Custom_Header_Init */
            // Definition:
            //  * Level: Transaction
            //  * Trigger: Always (temporary)
            //  * Available Fields: 'TSAPPIPackagePromotionStartLeadingItemReference.ExternalID'
            var ret = '';
            var DiscountPercentage = 0;
            var x = pepperi.api.userDefinedTables.get({
                table: "PPI_PackagePromotion_Details",
                mainKey: TSAPPIPackagePromotionStartLeadingItemReference.ExternalID,
                secondaryKey: ""
            });
            if (x.success && x.value.length > 0) {
                ret = x.value;
                JSON.parse(ret).Breakpoints.forEach(el => {
                    if (el.ValueType && el.ValueType == "Discount" && el.Value) {
                        DiscountPercentage = Number(el.Value);
                    }
                });
            }
            this.DiscountPercentage = DiscountPercentage;
            return ret;
            ```

    2.  **Calculate and Set Values:**
        -   Create or edit a line-item field (e.g., PPI\_Custom\_Line\_Init).
        -   Add the following script to calculate and set the discount and price:

            ```
            /* PPI_Custom_Line_Init */
            // Definition:
            //  * Level: Transaction Lines
            //  * Trigger: Always (temporary)
            //  * Available Fields: ''
            var Price = GetValueByApiName('ItemTSABasePrice'); // Choose your field for base price
            var DiscountPercentage = this.DiscountPercentage;
            /* Your calculation */
            var Discount = this.round(Price * DiscountPercentage / 100, 2);
            var PromoPrice = this.round(Price - Discount, 2);
            SetValueByApiName("TSAPPIDiscount", Discount); // Create this field
            SetValueByApiName("TSAPPIPrice", PromoPrice); // Create this field
            return '1';
            ```

    3.  **Explore UDT for Additional Data:**
        -   The PPI\_PackagePromotion\_Details UDT contains useful data (e.g., promotion code, breakpoints). Example:

            ```
            {
                "Title": "Free FSDU",
                "PromotionCode": "FSDU 1",
                "StartupMsg": "Buy 60 Relaxeazzz and receive a FREE FSDU",
                "Enabled": true,
                "ActiveFrom": "0",
                "ActiveTo": "0",
                "BreakBy": "Quantity",
                "MaxInstances": "1",
                "Breakpoints": [
                    {
                        "MinTotalType": "ExactMatch",
                        "MinTotal": "60",
                        "ValueType": "AdditionalItem",
                        "Value": [
                            {
                                "UseCheapestItem": false,
                                "ItemExternalId": "30214KORI01",
                                "ValueType": "Discount",
                                "Quantity": "1",
                                "Value": "100",
                                "LimitedTo": "0"
                            }
                        ],
                        "AdvanceLimitations": { "Name": "", "ItemsRules": [] },
                        "ValueExceptions": []
                    },
                    {
                        "MinTotalType": "ExactMatch",
                        "MinTotal": "60",
                        "ValueType": "Discount",
                        "Value": "16.66",
                        "AdvanceLimitations": { "Name": "", "ItemsRules": [] },
                        "ValueExceptions": []
                    }
                ],
                "TransactionsRules": [
                    { "Property": "TransactionType", "Value": "Sales Order" }
                ],
                "AccountsRules": [],
                "ExcludedAccountsRules": [],
                "ItemsRules": [
                    {
                        "Property": "ItemExternalID",
                        "Value": "300159275",
                        "DefaultQuantity": "2",
                        "IsAdvanceGroup": false,
                        "AdvanceGroupValue": ""
                    }
                ],
                "ExcludedItemsRules": [],
                "ExtensionValues": []
            }
            ```

#### 12. Configure Order Promotions with TSA Fields

-   **Objective:** Configure Order Promotions using custom TSA fields for input and output.
-   **Steps:**
    1.  **Create TSA Fields:**
        -   Create new fields to store updated values (e.g., TSAPromoTotal, TSAPromoDiscount).

    2.  **Update** PPI\_OrderPromotion\_Init**:**
        -   Go to **Settings → Sales Activities → Transaction Types → \[Your Transaction Type\] → Fields**.
        -   Edit the PPI\_OrderPromotion\_Init header field.
        -   Configure the following blocks:
            -   **Input Fields:** Specify fields to read data from.
            -   **Input & Output Fields:** For additional items (optional).
            -   **Output Fields:** Specify fields to store new values (must differ from input fields).

            ```
            /* PPI_OrderPromotion_Init */
            /* Input fields: */
            config.APINames["API_OrderPrice"] = "TSATotalItemsSum"; // Field containing the order price
            // config.APINames["API_Discount_BreakBy_Quantity"] = "TSAmyUnitsQuantity"; // Field for quantity-based discount
            config.APINames["API_Discount_BreakBy_Price"] = "TSATotalItemsSum"; // Field for price-based discount
            // config.APINames["API_UnitPrice"] = "TSAmyUnitPrice"; // Field for item price (for additional item)

            /* Input & Output fields: */
            // config.APINames["API_TotalUnitsPriceAfterDiscount"] = "TSAmyTotalUnitsPriceAfterDiscount"; // For limitation check and output (for additional item)
            // config.APINames["API_UnitsQuantity"] = "TSAmyUnitsQuantity"; // For limitation check and output (for additional item)

            /* Output fields: */
            config.APINames["API_OrderDiscount"] = "TSAOrderDiscount"; // Field to store new order discount
            config.APINames["API_OrderPriceAfterDiscount"] = "TSATotalPriceAfterDiscount"; // Field to store new total price after discount
            // config.APINames["API_UnitDiscount"] = "TSAmyUnitDiscountPercentage"; // For additional item
            // config.APINames["API_UnitPriceAfterDiscount"] = "TSAmyUnitPriceAfterDiscount"; // For additional item
            ```

    3.  **Update** PPI\_OrderPromotion\_Trigger**:**
        -   Ensure the PPI\_OrderPromotion\_Trigger field is set to trigger the calculation (details not provided in the source, but typically involves workflow integration).

    4.  **Choose Discount Type:**
        -   **Quantity-Based:** Use API\_Discount\_BreakBy\_Quantity (e.g., TSAmyUnitsQuantity).
        -   **Price-Based:** Use API\_Discount\_BreakBy\_Price (e.g., TSATotalItemsSum).
