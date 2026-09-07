# Order Trade Promotions Installation Guide

This guide provides step-by-step instructions for installing the Order Trade Promotions module in Pepperi. Order promotions are applied based on quantity or price tiers of an entire order, enhancing your B2B sales strategy. For details on creating promotions, refer to the **Item and Order Trade Promotions Editor Guide**.

***

### Overview

The Order Trade Promotions module allows to install and configure a system for applying promotions to entire orders based on total quantity or price thresholds. Once installed, users can use the graphical Promotions Editor to set up promotions.

* **Prerequisites:** Access to the Pepperi Webapp (via the new login).
* **Post-Installation:** Users can create promotions after the completing the setup steps.

***

### Step 1: Install the Order Trade Promotions Add-On

1. **Log In as Admin:**
   * Access the Pepperi Webapp using the new login as an Admin user.
2. **Navigate to Add-On Manager:**
   * Go to **Settings → Configuration → Add-On Manager**.
3.  **Install the Add-On:**

    * Locate **Order Trade Promotions** in the list.
    * Click the **Edit Menu** and select **Install**.

    <figure><img src="../../.gitbook/assets/image (623).png" alt=""><figcaption></figcaption></figure>

    * **Troubleshooting:** If the add-on is missing or access is denied, contact Pepperi support to enable it.

***

### Step 2: Complete the Installation Process

After installing the add-on, the following steps must be performed to fully enable Order Trade Promotions. These steps ensure the module integrates with your environment and is ready for user configuration.

#### Pre-Installation Check

* **Internal Delimiter:**
  * Go to **Settings → ERP Integration Configuration**.
  * Verify the internal delimiter is not set to `:`.
  * If it is `:`, change it to `;` or `~` (this change impacts integration data).

#### Detailed Steps

1.  **Run Installation per Transaction Type:**

    * Navigate to **Settings → Promotion Setup → Order TP Setup**.

    <figure><img src="../../.gitbook/assets/image (626).png" alt=""><figcaption></figcaption></figure>

    * Select each Transaction Type where Order Trade Promotions should apply (e.g., B2B Transaction, Sales Rep Order).

    <div data-gb-custom-block data-tag="hint" data-style="success" class="hint hint-success"><h3>Best Practice:</h3><p><a href="../../pepperi/pepperi-configuration-general/sales-activities/duplicate-a-transaction-activity-type.md">Duplicate the target transaction</a> (e.g., "Sales Order" to "Sales Order with Promotions") for testing:</p><ul><li>Go to <strong>Settings → Sales Activities → Transaction Types</strong>, duplicate the transaction, and install promotions on the copy.</li><li>Create test orders with sample values on the duplicated transaction to enable editor recognition (e.g., test payment method "cash" if filtering by it).</li><li>After testing, apply promotions to the original transaction.</li></ul></div>

    *   **Outcome:**

        * Creates User Defined Tables (prefix PPI\_OrderPromotion).

        <figure><img src="../../.gitbook/assets/image (624).png" alt=""><figcaption></figcaption></figure>

        * Creates custom Transaction fields (prefix PPI\_OrderPromotion).

        <figure><img src="../../.gitbook/assets/image (625).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
#### Note: Do not delete or modify these objects, as it will break the promotion functionality.
{% endhint %}

2. **Define Promotion Types in the Types Editor:**
   * Go to **Promotions Setup → Order TP Types**.
   * Click **Add+** to define a new Order Promotion Type.
   * **Fields:**
     * **Description:** Name the type descriptively (e.g., "Medium Accounts - Cash Payment").
     * **Priority:** Assign a priority (e.g., 1 for highest). Relevant only if multiple promotions apply and you choose not to stack them.
     * **Apply Multiple Promotions:**
       * **Yes, continue to next promotion:** All applicable promotions stack (priority ignored, set to 1).
       * **No:** Only the highest-priority promotion applies.
     *   **Promotion Properties:**

         * **Object Type:** Select Account or Transaction.
         * **Property:** Choose the field (e.g., Account.Size, Transaction.SelectedPaymentMethod).
         * Click **Add+** for additional properties.

         <figure><img src="../../.gitbook/assets/image (621).png" alt=""><figcaption></figcaption></figure>
   * **Example Types:**
     * Medium-sized accounts paying by cash:&#x20;
       * Account.Size
       * Account.DefaultPaymentMethod
       * Transaction.SelectedPaymentMethod
     * Small customers in City "A" via sales reps:&#x20;
       * Account.Size
       * Account.City
       * Transaction.Type
     * Buyers ordering on Pepperi B2B eCommerce site only:&#x20;
       * Transaction.Type
   * Save each type for use in the Promotions Editor.
3. **Modify Transaction Workflow:**
   *   Edit the workflow for each Transaction Type with Order Trade Promotions:

       * Go to **Settings → Sales Activities → Transaction Types → \[Your Transaction] → Workflows**.
       * Add the following actions in the transition to the final status (e.g., In Creation → Submit):
         *   **Calculate Formula Action:** Use the PPI\_OrderPromotion\_Trigger field.

             <figure><img src="../../.gitbook/assets/image (629).png" alt=""><figcaption></figcaption></figure>
         *   **Branch Action:** Use the PPI\_OrderPromotion\_AdditionalPhaseShouldStart field (failure workflow continues to the same status).

             <figure><img src="../../.gitbook/assets/image (630).png" alt=""><figcaption></figcaption></figure>
         *   **Open Campaign Action:** Use the PPI\_OrderPromotion\_AdditionalPhaseItemExternalID field after the Branch action.

             <figure><img src="../../.gitbook/assets/image (631).png" alt=""><figcaption></figcaption></figure>
       * **Note:** Add these actions to intermediate transitions (e.g., Revise → Submit) but not post-submit transitions (e.g., Submit → Paid).
       * **Outcome:** The workflow ensures promotions are calculated correctly before submission.

       <figure><img src="../../.gitbook/assets/image (632).png" alt=""><figcaption></figcaption></figure>
4. **Indicate Custom Pricing Fields:**
   * By default, the module uses standard Transaction fields (e.g., SubTotalAfterItemsDiscount, GrandTotal).
   * If using custom fields, edit the PPI\_OrderPromotion\_Init Custom Transaction Field:
     * Go to the **Input** or **Output** section.
     * Uncomment and update the relevant lines with your custom field API names.
   * **Examples:**
     *   Input: Replace SubTotalAfterItemsDiscount with TSACalcSubTotal:

         ```javascript
         config.APINames["API_OrderPrice"] = "TSACalcSubTotal";
         ```
     *   Output: Replace DiscountPercentage with TSACalcOrderDiscount:

         ```javascript
         config.APINames["API_OrderDiscount"] = "TSACalcOrderDiscount";
         ```
5. **Advanced Configuration for Additional Phase:**
   *   If the promotion includes an additional phase (e.g., selecting free/discounted items):

       * Go to **Order TP Setup → Advanced Setup**.

       <figure><img src="../../.gitbook/assets/image (633).png" alt=""><figcaption></figcaption></figure>

       * Select a Transaction Type for additional items (a default is provided, or choose a custom one).
       * Save the configuration.
       * Further setup occurs in the Order Promotions Editor.

       <figure><img src="../../.gitbook/assets/image (634).png" alt=""><figcaption></figcaption></figure>
6. **Create Item Lists:**
   * Create at least one Item List via **Item Lists** instructions.
   * Include fields in the List View layout and Smart Search for quick filtering.
   *   Define a default list (if preferred):

       * Go to **Settings → Promotion Setup → Item TP Setup → Advanced Setup**.
       * Enter the List ID\
         You can find the List ID as explained in section #9 in [Package Promotions Advanced Configuration](promotions-advanced-configuration.md#id-9.-define-specific-account-item-lists-for-selection)

       <figure><img src="../../.gitbook/assets/image (635).png" alt="" width="375"><figcaption></figcaption></figure>

***

### Step 3: Test the Installation

1. **Verify Installation:**
   * Check that PPI\_OrderPromotion tables and fields are created in the back office.
   * Ensure no objects are deleted or altered post-installation.
2. **Test Promotions:**
   * Create test orders on the duplicated transaction type.
   * Use the Promotions Editor to apply an order promotion (e.g., 5% off for orders over $500) and confirm it reflects correctly.
3. **Test Additional Phase (if applicable):**
   * Verify that the additional items window opens for promotions with an extra phase (e.g., selecting free items).
