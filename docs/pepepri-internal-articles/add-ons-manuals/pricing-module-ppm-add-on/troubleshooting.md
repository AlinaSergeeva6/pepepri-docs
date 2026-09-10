---
title: "Troubleshooting"
order: 62
---
# Troubleshooting

## Debugging the PPM Module

**What You Need:**

1.  **MacOS** with the **Pepperi Dev App** installed.
2.  **Installed scripts for VS Code**. Refer to [this article](/pepperi/custom-homepages/scripts-vs-code.md) for installation instructions.

---

#### You can implement and debug code while in the debugging process. Follow these steps:

#### 1. Start Debugging

1.  **Open Transaction**:
    -   Open a transaction that uses the **PPM add-on** and wait for it to load.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-03-11-112359.png)

2.  **Attach Debugger**:
    -   Open the **script folder** in your project.
    -   Attach the debugger in VS Code.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-03-11-112459.png)

    -   If the debugger attaches successfully, you will see logs in the **Debug Console**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-03-11-112529.png)

3.  **Check Logs**:
    -   Look for logs prefixed with **PPM** – these are the necessary logs for debugging the PPM module.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-804.jpg)

---

**2\. Trigger Pricing Calculation**

-   Go back to the transaction and trigger the **pricing calculation**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-03-11-112602.png)

-   In **VS Code**, you will see the **debug breakdown** and the current state of the pricing calculation.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot_8.png)

---

**3\. Edit Script Code**

-   While debugging, you can:
    -   **Edit the script code** directly in VS Code.
    -   **Add breakpoints** or additional debugger statements at specific lines in the code.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot_3-1.png)

---

**4\. Sync Changes**

1.  **Close Transaction**:
    -   Close the transaction after making changes to the script.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot_4.png)

2.  **Run Sync**:
    -   Go to the **main screen** and run the **sync process**.
    -   **Note**: Re-syncing does not reload script files, so your code changes remain in the application.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot_5.png)

---

**5\. Test Changes**

1.  **Reopen Transaction**:
    -   Return to the transaction and trigger the pricing calculation again.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot_6.png)

2.  **Debugger Stops at New Code**:
    -   In **VS Code**, the debugger will stop at the lines you added or modified, allowing you to inspect the state and verify the changes.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot_9.png)

---

#### Key Notes:

-   Debugging in this way allows you to **test and modify code in real-time**.
-   Ensure that you **sync** before testing again.
-   This process makes debugging the PPM module **easy and efficient**.

---

## Possible Issues While Setting Up the Add-On

Here are some common issues you might encounter while setting up the **PPM add-on** and how to address them:

---

### 1. No Pricing is Given (NPMCalcMessage is Null)

**Common Reasons:**

-   Error in the configuration JSON.
-   Pricing was not installed for the transaction.
-   Events were not defined in the transaction.

**Steps to Diagnose:**

1.  **If pricing does not work in all transactions or if the error started after the configuration was updated:**
    -   The issue is likely in the configuration JSON.
    -   **Common Reasons:**
        -   A field defined in the pricing configuration does not exist in the transaction.
        -   Sync failed, so the configuration object was not synced. In this case, you may see an error like `‘Proc1’ not found`.

2.  **If pricing does not work in a new (or duplicated) transaction:**
    -   **Common Reasons:**
        -   A field defined in the pricing configuration does not exist in the transaction. Check the logs for details.
        -   The pricing module is not called because events are not defined. Refer to the events configuration section.
        -   For a new transaction, the pricing procedure may not be configured. Verify that the procedure is configured for the transaction (using Postman).

---

### 2. Specific Discount is Not Given (or Given When It Should Not Be)

Sometimes, a specific discount is not applied (missing in `TSANPMCalcMessage`) or is applied incorrectly.

**Common Reasons:**

-   The pricing data record is missing.
-   A required value does not exist on the item or transaction line.

**Steps to Diagnose:**

1.  Identify which discount and table were not applied (or applied incorrectly). For example, `ZKR1 table A029`.
2.  Check the fields involved in the table, such as:
    -   `TransactionDivision`
    -   `ItemProp1`
    -   `TaxClass`

3.  Retrieve the fields of the problematic order using Postman:
    -   **For transaction header fields:**

        ```
        https://api.pepperi.com/v1.0/transactions?where=InternalID=389562715&fields=Type,TSAOriginalOrder,AccountExternalID,Catalog,Agent,AgentEmail,InternalID,TSACompany,TSADivision,TSATaxClass,TSAParentOrderRef.InternalID,TSAErpPromoCode,CreationDateTime,ModificationDateTime,AccountTSAParentExID,TSADeliveryDateForPricing,UUID,AccountCountryISOAlpha2Code
        ```

    -   **For transaction line fields:**

        ```
        https://api.pepperi.com/v1.0/transaction_lines?where=TransactionInternalID=389562715&fields=TSAPricingGroup,TSAAOQMUOM1,LineNumber,SpecialOfferLeadingOrderPortfolioItemInternalID,InternalID,ItemExternalID,Hidden,CreationDateTime,ModificationDateTime,TSANPMCalcMessage,TSAUOMConfig,TSAAOQMUOM1,TSAAOQMQuantity1,TSAAllowedUOMs,UnitsQuantity,Remark4,TSAPPMBaseTotalPriceAfter,UnitPrice,UUID,TSASellUOM,Hidden,TSAPPMBaseUnitPriceAfter1,TSASFAPromoCreditNoteTotal,TSAPPMSFAPromoPercentageOf,TSAOrderedQty,TSAQtyBySellUOM,ItemTSAPrincipalCode,ItemTSACategoryCode,ItemTSASubCatCode,ItemTSABrandCode,TSATaxClass,ItemProp2,ItemTSAItemUOMConfig
        ```

4.  **If some fields are null:**
    -   For duplicated or split orders, repeat the above steps for the original order.
    -   If the values exist in the original order, the issue lies in the duplicate/split process.
    -   If the order is not duplicated or split, investigate why the values are null (e.g., bad data or missing code in the load script).

5.  **If all fields have values:**
    -   Build the pricing data main key using all the fields in the required pricing table. For example: `ZKR1@A029@ND@2@1`.
    -   Search for the record in the pricing UDT/UDC.
        -   If the record is missing, the discount was not applied due to bad data.
        -   If the record exists, check its value for issues such as:
            -   Incorrect active period.
            -   Missing UOM unit (e.g., `TSAAOQMUOM1` is null).
            -   Missing UOM factor (e.g., `TSAUOMConfig` is null).
            -   **Common Problems with UOM:**
                -   The UOM unit was not selected (e.g., `TSAAOQMUOM1` is null).
                -   The UOM factor is missing (e.g., `TSAUOMConfig` is null).

---

### 3. Transaction Lines with Zero Promotion Discount (TSAPromoLineDiscount = 0)

To identify the reason why certain transaction items have a zero promotion discount, follow these steps:

---

**1\. Identify the Problematic Entry**

-   Note the **TransactionInternalID** and **ItemExternalID** of the problematic entry.
    -   **Example**:
        -   `TransactionInternalID`: `368140833`
        -   `ItemExternalID`: `1212739`

---

**2\. Retrieve Transaction Line Details**

-   Use Postman to get the transaction lines for the problematic order and item:

    ```
    https://api.pepperi.com/v1.0/transaction_lines?where=TransactionInternalID=368140833 and ItemExternalID=1212739&fields=LineNumber,TSALineCalculations,TSANPMCalcMessage,TSAPPMAppliedRulesDetails,TSAPPMBaseUnitPriceAfter1,ItemExternalID,Remark4,CreationDateTime,SpecialOfferLeadingOrderPortfolioItemInternalID,InternalID,TSAPPMSFAPromoPercentageOf,TSAPromoLineDiscount,UUID,UnitsQuantity,TSAAOQMQuantity1,TSASFAPromoCreditNote,ItemExternalID,Hidden
    ```

-   Check the result:
    -   Confirm that `TSAPromoLineDiscount = 0`.
    -   Verify if the line belongs to a package by checking `SpecialOfferLeadingOrderPortfolioItemInternalID`.
        -   **Example**:

            ```
            "SpecialOfferLeadingOrderPortfolioItemInternalID": 1946344697
            ```

---

**3\. Check for Credit Notes**

-   Check the value of `TSASFAPromoCreditNote`.
    -   If it’s greater than `0`, the promotion provides a credit note instead of a real discount.

---

**4\. Check for Duplicated or Split Orders**

-   Retrieve transaction details to check if the order is duplicated or split:

    ```
    https://api.pepperi.com/v1.0/transactions?where=InternalID=368140833&fields=Type,TSAOriginalOrder,TSAParentOrderRef
    ```

    -   If the order is split (`Type = Split` or `B2BForERP`), repeat the steps for the original order using `TSAOriginalOrder` or `TSAParentOrderRef`.

---

**5\. Retrieve Package Transaction Details**

-   Get the transaction line of the package:

    ```
    https://api.pepperi.com/v1.0/transaction_lines?where=TransactionInternalID=368140833 and InternalID=1946344697&fields=Remark4
    ```

    -   Extract the package transaction UUID from `Remark4`:

        ```
        "Remark4": "c4c78ef77af243f4b948525036a2ceb6"
        ```

-   Retrieve the package transaction lines:

    ```
    https://api.pepperi.com/v1.0/transaction_lines?where=TransactionUUID='c4c78ef77af243f4b948525036a2ceb6'&fields=LineNumber,TSALineCalculations,TSANPMCalcMessage,TSAPPMAppliedRulesDetails,TSAPPMBaseUnitPriceAfter1,TSAPPMPromoUnitPriceAfter1,TSAPPMSFAPromoUnitPriceAfter1,ItemExternalID,Remark4,CreationDateTime,SpecialOfferLeadingOrderPortfolioItemInternalID,InternalID,TSAPPMSFAPromoPercentageOf,TSAPromoLineDiscount,TSAPromoLineDiscountType,TSAPromoLineDiscountName,TSAPPIPackagePromotionStartItemCreditNoteSetbyAPI,UUID,UnitsQuantity,TSAAOQMQuantity1,TSAAOQMUOM1,TSAUOMConfig,Hidden
    ```

-   Identify the problematic item (`ItemExternalID = 1212739`) and check:
    -   **Base Price (**`TSAPPMBaseUnitPriceAfter1`**)**
    -   **Pricing Calculation Message (**`TSANPMCalcMessage`**)**

---

#### Possible Scenarios

**Case 1: Base Price = 0, NPMCalcMessage = Null**

-   **Example**:

    ```
    "TSAPPMBaseUnitPriceAfter1": 0.0,
    "TSANPMCalcMessage": null
    ```

-   **Issue**: Pricing did not run in the package promotion, resulting in a zero base price and zero promo discount.
-   **Action**: Further investigation is required.

---

**Case 2: Base Price = 0, NPMCalcMessage ≠ Null**

-   **Example**:

    ```
    "TSAPPMBaseUnitPriceAfter1": 0.0,
    "TSANPMCalcMessage": "[{\"Name\":\"Tax\",\"Base\":0,\"Conditions\":[{\"Name\":\"MWST_A002\",\"Type\":\"%\",\"Value\":20,\"Amount\":0}],\"New\":0,\"Amount\":0},{\"Name\":\"TaxOnBase\",\"Base\":0,\"Conditions\":[{\"Name\":\"MWST_A002\",\"Type\":\"%\",\"Value\":20,\"Amount\":0}],\"New\":0,\"Amount\":0}]"
    ```

-   **Issue**: Pricing ran, but no base price rule was found for the item.
-   **Action**: Check the base price rules (`A142`, `A742`, `A715`, `A707`, `A844`) and search for matching records in the UDT `PPM_Values`.

---

**Case 3: Credit Note (Base Price > 0, Promo Price = SFA Promo Price, TSAPromoLineDiscount = 0, TSASFAPromoCreditNote > 0)**

-   **Example**:

    ```
    "TSAPPMPromoUnitPriceAfter1": 85.0,
    "TSAPPMSFAPromoUnitPriceAfter1": 85.0,
    "TSAPromoLineDiscount": 0.0,
    "TSAPromoLineDiscountType": "DC",
    "TSAPromoLineDiscountName": "ZSFA_PPI_1704796782459",
    "TSASFAPromoCreditNote": 4.1667,
    "TSASFAPromoCreditNoteTotal": 100.0008
    ```

-   **Issue**: The promotion provides a credit note instead of a real discount.
-   **Action**: Verify in the UI by checking the package editor for credit notes.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-805.png)

---

**Case 4: Base Price > 0, Promo Price = SFA Promo Price, TSAPromoLineDiscount = 0, TSASFAPromoCreditNote = 0**

-   **Issue**: To be determined (TBD) based on a real scenario.

---

**Case 5: Base Price > 0, Promo Price = SFA Promo Price, TSAPromoLineDiscount > 0**

-   **Example**:

    ```
    "TSAPPMPromoUnitPriceAfter1": 85.0,
    "TSAPPMSFAPromoUnitPriceAfter1": 85.0,
    "TSAPromoLineDiscount": 0.0
    ```

-   **Issue**: Pricing did not run, or the package promotion did not apply a discount.
-   **Action**: Investigate further using a real case.

---

### 4. Price for UOM Don't Calculate Correctly

If you have different **UOMs (Units of Measure)** for items with various package variants and notice that pricing is not calculating correctly, follow these steps to troubleshoot and resolve the issue:

---

**1\. Understand the Problem**

-   **Scenario**:
    -   Items have different UOMs (e.g., single units, packs, cases).
    -   Pricing calculations for these UOMs are incorrect.

---

**2\. Check the Pricing Configuration**

-   In the pricing configuration, locate the **CalculatedItemFields** array.
    -   This array defines where and after which condition the price should be saved to a field.

---

**3\. BlockPriceField Types**

There are two types of **BlockPriceField** for single price values:

1.  **Single Type**:
    -   **Behavior**: Calculates the price based on the value in **TSAAOQMQuantity1**.
    -   **Use Case**: Suitable for scenarios where the price changes dynamically with the quantity.
    -   **Example**: If `TSAAOQMQuantity1` increases by 1, the price is recalculated accordingly.

2.  **Unit Type**:
    -   **Behavior**: Calculates the price based on the default **UnitsQuantity**.
    -   **Use Case**: Suitable for scenarios where the price is fixed per unit, regardless of the quantity.
    -   **Example**: If `TSAAOQMQuantity1` increases by 1, but `UnitsQuantity` becomes `24`, the pricing module treats `24` as the whole quantity.

---

**4\. Steps to Resolve**

1.  **Verify UOM Configuration**:
    -   Ensure that UOM units and factors are correctly defined in the transaction.
    -   Check fields like **TSAAOQMUOM1** and **TSAUOMConfig**.

2.  **Check CalculatedItemFields**:
    -   Ensure that the correct **BlockPriceField** type (`Single` or `Unit`) is used based on your pricing logic.

3.  **Test with Different Quantities**:
    -   Test the pricing calculation with different quantities and UOMs to identify inconsistencies.

4.  **Update Pricing Logic**:
    -   If necessary, adjust the pricing logic in the configuration JSON to align with your UOM requirements.
