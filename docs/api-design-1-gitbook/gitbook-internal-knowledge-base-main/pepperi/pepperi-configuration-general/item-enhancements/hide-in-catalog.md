# Hiding Items in the Pepperi Catalog

## Hiding Items in the Pepperi Catalog

Hiding items in the Pepperi catalog allows you to temporarily prevent them from appearing in any catalog filter. This is useful for items that are temporarily unavailable (e.g., out of stock) but may be reintroduced later. This guide explains how to use the "Hide In Catalog" field to achieve this.

***

### Overview

The "Hide In Catalog" field controls item visibility in the Pepperi catalog:

* **Hide an Item:** Set the field to `True` or `1`.
* **Show an Item:** Set the field to `False`, `0`, or leave it blank.

When an item is hidden, it will not appear in any catalog filter, effectively preventing it from being ordered until the field is updated.

***

### Step 1: Prepare the Items File

1. **Create a CSV File:**
   * Prepare a `*.csv` file containing the items you want to update.
   * Include a column with the heading **Hide In Catalog**.
   * Use the following values:
     * `True` or `1`: Hides the item.
     * `False`, `0`, or blank: Displays the item.
2. **Example Scenario:**\
   Suppose you want to hide items that are temporarily unavailable at the warehouse. For instance, you want to hide items with even-numbered External IDs (e.g., "Hat2", "Hat4") and display only odd-numbered ones (e.g., "Hat1", "Hat3").
   *   Sample `items.csv`:

       ```
       ExternalID,BrandExternalID,HideInCatalog
       Hat1,Hats,False
       Hat2,Hats,True
       Hat3,Hats,False
       Hat4,Hats,True
       ```

***

### Step 2: Upload the File in Back Office

1. **Navigate to File Upload:**
   * Go to **Settings → ERP Integration → File Upload and Logs**.
   * Click **Upload**.
2. **Select File Type:**
   * Choose the value **API Item** from the dropdown.
3. **Upload the File:**
   * Click **Browse**, locate your `*.csv` file (e.g., `items.csv`), and upload it.
4. **Verify Success:**
   * Upon successful upload, you’ll see the message: **Completed retrieving**.
   * Check the **Failed Lines** column in the Upload Data section—it should show `0`. If there are failed lines, review the file for errors (e.g., incorrect column names or values).

***

### Step 3: Test the Catalog

1. **Check Item Visibility:**
   * Navigate to the Order Center in the Pepperi Web App or mobile app (iPad/Android).
   * Verify that hidden items (e.g., "Hat2", "Hat4" with `Hide In Catalog = True`) do not appear in any catalog filter.
   * Confirm that visible items (e.g., "Hat1", "Hat3" with `Hide In Catalog = False`) are displayed as expected.
2. **Test Across Platforms:**
   * Test on both Web App and mobile devices (iPad/Android) to ensure consistent behavior.

***

### Best Practices

* **Validate the CSV File:**\
  Before uploading, double-check the `Hide In Catalog` column for correct values (`True`/`False` or `1`/`0`). Incorrect values may lead to unexpected behavior.

***

### Final Notes

Hiding items in the Pepperi catalog is a straightforward way to manage item availability without deleting them. By using the "Hide In Catalog" field and following these steps, you can temporarily prevent items from appearing in the catalog while maintaining the ability to restore them later.
