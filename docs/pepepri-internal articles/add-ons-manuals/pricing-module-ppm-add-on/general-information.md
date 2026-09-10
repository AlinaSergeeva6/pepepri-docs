---
title: "General Information"
description: "Add-on description"
order: 66
---
# General Information

*Add-on description*

---

## High-Level Description of the Pricing Module

The pricing module supports complex pricing and discount rules based on the following object hierarchy:

---

### 1. Procedure

-   A **procedure** is a high-level container that defines the pricing configuration for a transaction.
-   Each transaction using the pricing module is assigned a specific procedure to run.
-   While one procedure is usually sufficient, some scenarios may require multiple procedures.
    -   **Example**: One procedure for sales orders (with all discount rules) and another for returns (with only base price calculations).

-   Each procedure contains one or more **pricing blocks**.

---

### 2. Pricing Blocks

-   A **pricing block** is a logical unit that groups several pricing conditions.
-   All discounts within a block are accumulated and calculated on the same base price.
-   Blocks within a procedure are calculated sequentially.
-   The result of a block (the price after its calculations and all previous blocks) can:
    -   Be stored in a **TSA field**.
    -   Serve as the base for the next block’s calculations.

-   Each block contains one or more **pricing conditions**.

---

### 3. Pricing Conditions

-   A **pricing condition** defines a list of tables to scan for price calculations.
-   Each condition can use different tables in a specific order.

---

### 4. Tables

-   A **table** defines the fields used to check price and discount values.
-   Tables can include fields from:
    -   **Account**
    -   **Item**
    -   **Transaction**
    -   **Transaction Line**

-   **Example**:
    -   **Procedure**: `Proc1`
        -   **Block**: `BasePrice`
            -   **Condition**: `ZPR0`
                -   **Table**: `A700` (Fields: `SalesChannel`, `ItemID`)
                -   **Table**: `A701` (Fields: `Division`, `AccountID`, `ItemType`)

            -   **Condition**: `ZPR1`

        -   **Block**: `CommercialDiscount`
        -   **Block**: `Tax`

---

## Scan Rules and Calculation Order

### Calculation Order

-   All pricing conditions are scanned in a pre-defined order.
-   For each condition, tables are scanned in a specific order (which can vary per condition).
-   Only the topmost table with a matching pricing record is applied; the rest are ignored.

**Example**:

-   **Conditions**:
    -   `ZLP0` with tables: `A9A0`, `A9A1`
    -   `ZLP1` with table: `A9A0`

-   **Tables**:
    -   `A9A0` (Fields: `AccountID`, `ItemID`)
    -   `A9A1` (Fields: `ItemID`)

-   **Result**:
    -   For an order with `AccountID = 111` and `ItemID = 222`:
        -   Applies `ZLP0\A9A0` and `ZLP1\A9A0`.
        -   Ignores `ZLP0\A9A1` because `A9A0` was applied in `ZLP0`.

---

### Discount Calculation

-   Some discounts are visible to the user, while others are not.
    -   **Example**:
        -   Base discount: Not visible.
        -   Regular discount: Visible.
        -   Tax (negative discount): Stored in separate fields.

-   Discounts can be:
    -   Joined together.
    -   Applied on top of previous discounts.

---

## Supported Functionality

1.  **Multiple Procedures**: Support for multiple pricing procedures.
2.  **Validity Dates**: Pricing rules can be defined for multiple periods.
3.  **UOM (Unit of Measure)**:
    -   Prices can be defined for specific UOMs and converted based on the sell UOM.
    -   **Example**: Define price in singles; for packs, use `singles * 6`.
    -   Prices can vary by UOM (e.g., different prices for packs and single items).
    -   Discounts/surcharges can apply only to specific UOMs.

4.  **Multiple Scales (Tiers)**:
    -   Support for tiered pricing (e.g., buy X get Y, buy X2 get Y2).
    -   Tiers can be based on dollar value or quantity.

5.  **Group Discount**:
    -   Items with the same value in a specific field are grouped.
    -   Discounts are applied individually based on the total quantity.

6.  **Surcharge/Tax**: Support for negative discounts.
7.  **Free Goods**: Support for additional item discounts.
8.  **Recalculation of Price**: Recalculate prices for open orders.
9.  **Base Price Calculation**:
    -   Calculate base price or retrieve it from a field.
    -   Useful when item prices are set via price lists or UDTs.

10.  **Manual Discounts**: Support for user-defined discounts at the order or line level.
11.  **Condition Exclusion**:
     -   If a pricing condition is applied, exclude other specified conditions.

12.  **Delivery Date-Based Pricing**: Calculate prices based on the delivery date.
13.  **Partial Field Values**: Support for pricing based on partial field values (e.g., item hierarchy codes).
14.  **Multiple Field Values**: Support for pricing based on multiple field values (e.g., account contracts).
15.  **Detailed Output**: Provide detailed information on all applied rules.

---

### Notes

-   **Account Currency**: Works with the current currency, using the price list declaration and attachment to the account (for currency handling).

---
