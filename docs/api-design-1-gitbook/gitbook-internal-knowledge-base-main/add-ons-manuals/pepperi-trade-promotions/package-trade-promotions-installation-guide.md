# Package Trade Promotions Installation Guide

This guide provides step-by-step instructions for installing the Package Trade Promotions module in Pepperi. Package promotions are applied to one or more items selected by the user, enhancing flexibility in B2B sales strategies. For details on creating promotions, refer to the **Packages Trade Promotions Editor Guide**.

***

### Overview

The Package Trade Promotions module allows to install and configure a system for applying promotions to user-selected item packages. Once installed, users can use the graphical Promotions Editor to set up promotions.

* **Prerequisites:** Access to the Pepperi Webapp (via the new login).
* **Post-Installation:** Users can create promotions after the completing the setup steps.

***

### Step 1: Install the Package Trade Promotions Add-On

1. **Log In as Admin:**
   * Access the Pepperi Webapp as an Admin user.
2. **Navigate to Add-On Manager:**
   * Go to **Settings → Configuration → Add-On Manager**.
3.  **Install the Add-On:**

    * Locate **Package Trade Promotions** in the list.
      * Click the **Edit Menu** and select **Install**.

    <figure><img src="../../.gitbook/assets/image (636).png" alt=""><figcaption></figcaption></figure>

    * **Troubleshooting:** If the add-on is missing or access is denied, contact Pepperi support to enable it.

***

### Step 2: Complete the Installation Process

After installing the add-on, the following steps must be performed to fully enable Package Trade Promotions. These steps ensure the module integrates with your environment and provides a smooth user experience.

#### Pre-Installation Check

* **Internal Delimiter:**
  * Go to **Settings → ERP Integration Configuration**.
  * Verify the internal delimiter is not set to `:`.
  * If it is `:`, change it to `;` or `~` (this change impacts integration data).

#### Detailed Steps

1.  **Run Installation per Transaction Type:**

    * Navigate to **Settings → Promotion Setup → Package TP Setup**.
    * Select each Transaction Type where Package Trade Promotions should apply (e.g., B2B Transaction, Sales Rep Order).

    <div data-gb-custom-block data-tag="hint" data-style="success" class="hint hint-success"><h3>Best Practice:</h3><p><a href="../../pepperi/pepperi-configuration-general/sales-activities/duplicate-a-transaction-activity-type.md">Duplicate the target transaction</a> (e.g., "Sales Order" to "Sales Order with Promotions") for testing:</p><ul><li>Go to <strong>Settings → Sales Activities → Transaction Types</strong>, duplicate the transaction, and install promotions on the copy.</li><li>Create test orders with sample values on the duplicated transaction to enable editor recognition (e.g., test payment method "cash" if filtering by it).</li><li>After testing, apply promotions to the original transaction.</li></ul></div>

    *   **Advanced Setup:**

        * Click **Advanced Setup**.

        <figure><img src="../../.gitbook/assets/image (641).png" alt=""><figcaption></figcaption></figure>

        *   Add the Package Item and Additional Items transactions:

            * **Package Item Transaction:** Select PPI\_PackagePromotion for the first phase.
            * **Additional Items Transaction:** Select PPI\_PackagePromotion\_AdditionalItems for the additional phase.

            <figure><img src="../../.gitbook/assets/image (640).png" alt=""><figcaption></figcaption></figure>
        * **Main Category for Internal Item:** Set a valid main category (internal use only, does not affect catalogs or filters).
    *   **Outcome:**

        * Creates User Defined Tables (prefix PPI\_PackagePromotion).

        <figure><img src="../../.gitbook/assets/image (639).png" alt=""><figcaption></figcaption></figure>

        * Creates custom Transaction fields (prefix PPI\_PackagePromotion).

        <figure><img src="../../.gitbook/assets/image (638).png" alt=""><figcaption></figcaption></figure>



{% hint style="warning" %}
**Note: Do not delete or modify these objects, as it will break the promotion functionality.**
{% endhint %}

2. **Modify Items Scope and Catalog Setup:**
   * **Modify Items Scope:**
     * Go to **Settings → Sales Activities → Transaction Types → \[Your Transaction] → Settings**.
     *   Add the following rule to the **Transaction Items Scope**:

         * PPI\_PackagePromotion\_ShowPackageItem isEqual True.

         <figure><img src="../../.gitbook/assets/image (618).png" alt=""><figcaption></figcaption></figure>
     * If existing rules exist, add two PPI rules connected with an "AND" operator and an "OR" to existing rules:
       * PPI Rule #1: PPI\_PackagePromotion\_IsPackage isEqual True.
       * PPI Rule #2: PPI\_PackagePromotion\_ShowPackageItem isEqual True.
       * Pattern: ((your rules) OR (PPI Rule #1 AND PPI Rule #2)).
   * **Modify Catalog Setup:**
     * Create a separate catalog for packages (include all items, no filters except an "ALL" filter).
     * Assign this catalog to PPI\_PackagePromotion and PPI\_PackagePromotion\_AdditionalItems Transaction Types:
       * Go to **Settings → Pricing Policy → Campaigns**.
       * Edit each transaction type and select the package catalog only.
     * Unassign other Transaction Types (e.g., Sales Order, B2B) from this catalog to avoid filter confusion.
3. **Create Item Lists:**
   * Create at least one Item List
   * Include fields in the table layout, Search, and Smart Search for quick filtering.
   * **Optional:** Define a default list:
     * Go to **Settings → Promotion Setup → Package TP Setup → Advanced Setup**.
     * Enter the List ID.\
       You can find the List ID as explained in section #9 in [Package Promotions Advanced Configuration](promotions-advanced-configuration.md#id-9.-define-specific-account-item-lists-for-selection)

***

### Step 3: Test the Installation

1. **Verify Installation:**
   * Check that PPI\_PackagePromotion tables and fields are created in the back office.
   * Ensure no objects are deleted or altered post-installation.
2. **Test Promotions:**
   * Create test orders on the duplicated transaction type.
   * Use the Promotions Editor to apply a package promotion (e.g., "Pick 5 items for $25") and confirm the selection screen works.
3. **Test Catalog and Scope:**
   * Verify the package selection screen uses the dedicated catalog without unintended filters.
   * Ensure the Items Scope rule correctly displays package items.
