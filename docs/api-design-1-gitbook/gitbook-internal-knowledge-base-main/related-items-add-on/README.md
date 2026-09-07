---
description: 'Effort Estimation: 16h'
---

# Related Items Add-on

### Overview

The Related Items add-on allows users to associate and display items related to a specific catalog item (e.g., substitutions, recommended purchases, or grouped items) in a carousel on the Item Information page. Relationships are defined through uploaded data, supporting both web and mobile platforms. For example, the item "Gouda Cheese" (CH001) may have related items (CH002–CH006) displayed based on factors like low stock substitutions or promotional pricing.<br>

<figure><img src="../.gitbook/assets/image (1447).png" alt="" width="563"><figcaption></figcaption></figure>

***

### Configuration Steps

#### Step 1: Install the Related Items Add-on

* Install the Related Items add-on

#### Step 2: Add Collections in the Related Items Add-on

A collection is a list of items and their related items, defined by associations such as item type, suggested purchases, or custom relationships.&#x20;

{% hint style="warning" %}
**The carousel displays up to 25 related items per parent item in the order they are listed.**
{% endhint %}

**Example Collections**

* **Related Items:**
  * Item43: Item11, Item12, Item13, Item14, Item15, Item22
  * Item25: Item14, Item18, Item32, Item51
  * Item11: Item17, Item18, Item33
* **Recommended Items:**
  * Item71: Item56, Item86, Item99, Item83
  * Item72: Item32, Item33, Item64, Item35, Item63
* **Bought Together:**
  * Item71: Item70, Item42, Item55, Item76
  * Item55: Item71, Item99, Item86

**Methods to Add Collections**

1.  **Manually:**

    *   Go to **Settings -> Items -> Item Collections**.<br>

        <figure><img src="../.gitbook/assets/image (1448).png" alt="" width="335"><figcaption></figcaption></figure>
    * Click **Add Collection**.
    * Enter a name and description (avoid special characters like +, -, %, &, etc.).
    * Add the **Item ExternalID** and related items (up to 100 manually; use import/export for more).&#x20;

    <figure><img src="../.gitbook/assets/image (1449).png" alt="" width="494"><figcaption></figcaption></figure>

    *   Enter related **Item ExternalIDs** one by one or use semicolons (e.g., Item11; Item12; Item13).<br>

        <figure><img src="../.gitbook/assets/image (1450).png" alt="" width="438"><figcaption></figcaption></figure>
    *   Save the collection.<br>

        <figure><img src="../.gitbook/assets/image (1451).png" alt="" width="563"><figcaption></figcaption></figure>
    *   Add more items as needed.<br>

        <figure><img src="../.gitbook/assets/image (1452).png" alt="" width="563"><figcaption></figcaption></figure>
2. **Import via CSV:**
   *   Go to **Settings -> Items -> Item Collections**, click the menu, and select **Import**.<br>

       <figure><img src="../.gitbook/assets/image (1453).png" alt=""><figcaption></figcaption></figure>
   * Upload a CSV file with the following columns:
     * CollectionName
     * ItemExternalID
     * RelatedItems (max 25 items, e.g., \["Item11","Item12"])
   * Example CSV:

{% file src="../.gitbook/assets/RelateItemsImport_Ex.csv" %}

{% hint style="warning" %}
#### Notes:&#x20;

* Only 100 entries are displayed in the UI, but all related items appear in catalogs.
* Upload partial updates; full file re-upload is not required.
* Updated RelatedItems values overwrite existing ones.
* To delete an item from a collection, upload with empty brackets (e.g., Recommended Items,Item71,\[]).
* Avoid special characters in CollectionName.
{% endhint %}

#### Step 3: Associate Collections with Transaction Types

1. Go to **Settings -> Sales Activities -> Transaction Types**.
2. Edit the desired Transaction Type (e.g., Sales Order, B2B Order).
3. Navigate to the **Related Items** tab.
4. Click **Add Field** to create a field for the carousel.
   * Enter a **Name** (e.g., "Bought Together"); the API Name (e.g., TSABoughtTogether) is auto-generated.
   *   Select the associated collection.<br>

       <figure><img src="../.gitbook/assets/image (1454).png" alt="" width="338"><figcaption></figcaption></figure>
5. Add multiple fields for additional carousels if needed.

#### Step 4: Add Field to Item Information View

1. In the Transaction Type, go to the **Views and Forms** tab.
2. Edit the **Item Information Portrait View**.
3. Add the custom field (e.g., TSABoughtTogether) from **Custom Transaction Line-Item Fields**.
   * Set it to span the full width (one line) with a height matching the **Small Thumbnail View** configuration.
   * Ensure the **Small View** is enabled and configured with required fields (e.g., custom pricing); otherwise, an error will occur.
4.  Add a **Splitter** field above the carousel for a title.<br>

    <figure><img src="../.gitbook/assets/image (1455).png" alt=""><figcaption></figcaption></figure>

***

### Result

The carousel displays in the app (mobile and web) with items based on the **Small Thumbnail View** configuration.

<figure><img src="../.gitbook/assets/image (1456).png" alt="" width="563"><figcaption></figcaption></figure>
