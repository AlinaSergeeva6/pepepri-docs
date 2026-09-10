---
title: "Related Items Add-on"
description: "Effort Estimation: 16h"
order: 54
---
# Related Items Add-on

*Effort Estimation: 16h*

### Overview

The Related Items add-on allows users to associate and display items related to a specific catalog item (e.g., substitutions, recommended purchases, or grouped items) in a carousel on the Item Information page. Relationships are defined through uploaded data, supporting both web and mobile platforms. For example, the item "Gouda Cheese" (CH001) may have related items (CH002–CH006) displayed based on factors like low stock substitutions or promotional pricing.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-883.png)

---

### Configuration Steps

#### Step 1: Install the Related Items Add-on

-   Install the Related Items add-on

#### Step 2: Add Collections in the Related Items Add-on

A collection is a list of items and their related items, defined by associations such as item type, suggested purchases, or custom relationships.

!!!warning
**The carousel displays up to 25 related items per parent item in the order they are listed.**
!!!

**Example Collections**

-   **Related Items:**
    -   Item43: Item11, Item12, Item13, Item14, Item15, Item22
    -   Item25: Item14, Item18, Item32, Item51
    -   Item11: Item17, Item18, Item33

-   **Recommended Items:**
    -   Item71: Item56, Item86, Item99, Item83
    -   Item72: Item32, Item33, Item64, Item35, Item63

-   **Bought Together:**
    -   Item71: Item70, Item42, Item55, Item76
    -   Item55: Item71, Item99, Item86

**Methods to Add Collections**

1.  **Manually:**
    -   Go to **Settings -> Items -> Item Collections**.

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-884.png)

    -   Click **Add Collection**.
    -   Enter a name and description (avoid special characters like +, -, %, &, etc.).
    -   Add the **Item ExternalID** and related items (up to 100 manually; use import/export for more).

    ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-885.png)

    -   Enter related **Item ExternalIDs** one by one or use semicolons (e.g., Item11; Item12; Item13).

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-886.png)

    -   Save the collection.

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-887.png)

    -   Add more items as needed.

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-888.png)

2.  **Import via CSV:**
    -   Go to **Settings -> Items -> Item Collections**, click the menu, and select **Import**.

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-889.png)

    -   Upload a CSV file with the following columns:
        -   CollectionName
        -   ItemExternalID
        -   RelatedItems (max 25 items, e.g., \["Item11","Item12"\])

    -   Example CSV:

544B

[RelateItemsImport\_Ex.csv](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FQne2nutO8SyNXe2yQOkT%2FRelateItemsImport_Ex.csv?alt=media&token=553aaa6d-947b-4037-94b1-81281c099ea6)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FQne2nutO8SyNXe2yQOkT%2FRelateItemsImport_Ex.csv?alt=media&token=553aaa6d-947b-4037-94b1-81281c099ea6)

!!!warning
#### Notes:

-   Only 100 entries are displayed in the UI, but all related items appear in catalogs.
-   Upload partial updates; full file re-upload is not required.
-   Updated RelatedItems values overwrite existing ones.
-   To delete an item from a collection, upload with empty brackets (e.g., Recommended Items,Item71,\[\]).
-   Avoid special characters in CollectionName.

!!!

#### Step 3: Associate Collections with Transaction Types

1.  Go to **Settings -> Sales Activities -> Transaction Types**.
2.  Edit the desired Transaction Type (e.g., Sales Order, B2B Order).
3.  Navigate to the **Related Items** tab.
4.  Click **Add Field** to create a field for the carousel.
    -   Enter a **Name** (e.g., "Bought Together"); the API Name (e.g., TSABoughtTogether) is auto-generated.
    -   Select the associated collection.

        ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-890.png)

5.  Add multiple fields for additional carousels if needed.

#### Step 4: Add Field to Item Information View

1.  In the Transaction Type, go to the **Views and Forms** tab.
2.  Edit the **Item Information Portrait View**.
3.  Add the custom field (e.g., TSABoughtTogether) from **Custom Transaction Line-Item Fields**.
    -   Set it to span the full width (one line) with a height matching the **Small Thumbnail View** configuration.
    -   Ensure the **Small View** is enabled and configured with required fields (e.g., custom pricing); otherwise, an error will occur.

4.  Add a **Splitter** field above the carousel for a title.

    ![](https://alinasergeeva6.github.io/pepepri-docs/static/image-891.png)

---

### Result

The carousel displays in the app (mobile and web) with items based on the **Small Thumbnail View** configuration.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-892.png)
