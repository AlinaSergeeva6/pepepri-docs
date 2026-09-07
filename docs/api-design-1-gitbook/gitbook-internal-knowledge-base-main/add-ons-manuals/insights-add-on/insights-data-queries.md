---
description: >-
  This guide provides a comprehensive overview of creating and configuring Data
  Queries for Pepperi Insights. Effort Estimation: 2h
---

# Insights - Data Queries

***

### Advantages and Disadvantages

#### <mark style="color:green;">Advantages</mark>

* **Intuitive Interface:** The graphical query editor simplifies query creation.
* **Data Manipulation:** Supports flexible aggregation and presentation of data.

#### <mark style="color:red;">Disadvantages</mark>

* **Limitations:** Cannot add text-based columns or manipulate non-numeric data directly.
* **Data Dependency:** Insights reflect only existing Pepperi data; inaccuracies or incomplete data will affect results.
  * **Recommendation:** Apply filters (e.g., by Transaction Type or Status) to ensure data accuracy.

***

### Overview

Data Queries in Pepperi Insights define the data sources and calculations used to populate analytics blocks (e.g., charts, tables) on dashboard pages. This guide covers the creation of basic queries, advanced dynamic filtering, and best practices for configuration, ensuring accurate and flexible data representation.

***

### Prerequisites

* Ensure access to the Insights module in the Pepperi back office (contact Eyal if needed).
* Complete data indexing via **Settings -> Insights -> Data Index** to make fields available for queries.

***

### Creating Data Queries

#### Accessing Data Queries

1.  Navigate to **Settings -> Insights -> Data Queries**.<br>

    <figure><img src="../../.gitbook/assets/image (1372).png" alt=""><figcaption></figcaption></figure>
2. Click **Add** to create a new query.

#### Configuring a Data Query

1. **Enter Details:**
   * Provide a descriptive **Name** for the query.
   * Select a **Resource**:
     * all\_activities: Use header-level fields (e.g., GrandTotal, TotalQuantity).
     * transaction\_lines: Use line-level fields (e.g., UnitPriceAfterDiscount, UnitQuantity).
     *   A UDC defined in the **Targets Manager**: Use imported target data (see Target Resources for Insights Dashboards for details).<br>

         <figure><img src="../../.gitbook/assets/image (1373).png" alt="" width="226"><figcaption></figcaption></figure>
2. **Add a Series:**
   *   Define how data is aggregated:

       <figure><img src="../../.gitbook/assets/image (1374).png" alt=""><figcaption></figcaption></figure>

       * **Aggregator:**
         * Sum: Adds all values of the field.
         * Average: Calculates the average of values.
         * Count: Returns the total number of values.
         * Count Distinct: Returns the number of unique values.
         *   Script: Write a custom calculation using aggregators and fields.<br>

             <figure><img src="../../.gitbook/assets/image (1375).png" alt=""><figcaption></figcaption></figure>
3.  **Add Categories (Group By):**

    * Choose a field to group values (e.g., ActionDateTime for sales by month).
    * Results in uniform color for bars/columns/lines.

    <figure><img src="../../.gitbook/assets/image (1376).png" alt=""><figcaption></figcaption></figure>

    * **Interval:** Select Day, Week, Month, Quarter, or Year.
    *   **Format:** Choose Year, YearMonth, Month, MonthDay, YearMonthDay, Week, WeekYear, Quarter, or QuarterYear.<br>

        <figure><img src="../../.gitbook/assets/image (1377).png" alt=""><figcaption></figcaption></figure>
4.  **Add Dynamic Series (Break By):**

    * Generate separate graphs per field value (e.g., for a small set of values).
    * Results in different colors for each bar/column/line.

    <figure><img src="../../.gitbook/assets/image (1378).png" alt=""><figcaption></figcaption></figure>

    * **Limit Results:** Specify the number of values to display.
    *   **Order:** Choose Ascending or Descending.

        <figure><img src="../../.gitbook/assets/image (1379).png" alt=""><figcaption></figcaption></figure>
5. **Add Filters:**
   * **Account Filter Options:**
     * All Accounts
     * Assigned Accounts
     * Accounts of users under my role (if using Role Hierarchy).
   * **User Filter Options:**
     * All Users
     * Current User
     * Users under my role (if using Role Hierarchy).
   * **Additional Filters:**
     * Filter by Transaction Type (e.g., "Sales Order", "B2B Order").
     *   Filter by Status Name (e.g., "submitted" transactions).<br>

         <figure><img src="../../.gitbook/assets/image (1380).png" alt=""><figcaption></figcaption></figure>
6. **Preview and Save:**
   * Preview the query results to verify accuracy.
   * Save the query to make it available for dashboard use.

#### Notes on Resource Changes

* If no series are defined, the Resource can be changed.
* To modify the Resource after adding series, remove the series first.

***

### Dynamic Filtering in Data Queries

#### Overview

Dynamic filtering enhances Data Queries by allowing real-time filter adjustments based on user selections or conditions, unlike static filters. Use cases include filtering by user properties, dropdown selections, or conditional logic.

#### Defining a Data Query with Parameters

1. Create a new Data Query as described above.
2. Add a variable:
   * Go to the **Input Variables** section and click **Add**.
   * **Name:** Define the variable name (e.g., brandFilter).
   * **Type:** Typically String.
   * **Default Value:** Optional value if no parameter is passed (e.g., "All").
   *   **Preview Value:** Value for query preview (e.g., a specific brand).<br>

       <figure><img src="../../.gitbook/assets/image (1384).png" alt="" width="263"><figcaption></figcaption></figure>
3. Add the variable to the series filter:
   * Edit the series, go to the **Filter** section, and select a property.
   * Choose Equal to (variable) or In (variable) and link it to the defined variable.
   * Use multiple variables if needed.
4. **Conditional Filtering (Optional):**
   *   Use the **Conditional Filter** section to apply filters only if a condition is met (e.g., filter by MainCategory only if not "All").<br>

       <figure><img src="../../.gitbook/assets/image (1385).png" alt=""><figcaption></figcaption></figure>
5. Verify in Preview:
   *   Adjust the **Preview Value** to see filtered data (e.g., change to a different brand).<br>

       <figure><img src="../../.gitbook/assets/image (1386).png" alt=""><figcaption></figcaption></figure>

#### Sending Values from the Page

1. **Edit the Insights Page:**
   * Go to **Settings -> Pages -> Page Builder** and open the target page.
2. **Manage Parameters:**
   * Click **Manage Parameters**, then **Add**.
   * **Key:** Enter the variable name (e.g., brandFilter).
   * **Description:** Provide a description.
   *   **Default Value:** Set a default (e.g., "All" for no filter).<br>

       <figure><img src="../../.gitbook/assets/image (1387).png" alt=""><figcaption></figcaption></figure>
3. **Set Parameter Values:**
   * **Option 1: User Selection:**
     * Add a **Filter Block** to the page.
     * Configure it with the page parameter and a flow containing a Get Values logic block to populate the dropdown.
   * **Option 2: Static Value:**
     * Use the **On Load Flow** (Choose Flow) with Search Data and Extract Value logic blocks to set the parameter (e.g., user’s division).
   * **Option 3: URL Parameter:**
     * Pass the value via the URL (not recommended due to maintenance challenges).
4. **Map Variables:**
   * In the **Content** tab of the Insight block (e.g., Chart), go to **Variable Mapping**.
   *   Select **Variable** and choose the page parameter.<br>

       <figure><img src="../../.gitbook/assets/image (1388).png" alt=""><figcaption></figcaption></figure>

#### Example Use Case

* Create a chart showing Monthly Sales (last 12 months) filtered by MainCategory.
* If a user selects a category (e.g., "Electronics"), filter by that value; if "All" is selected, show all categories.

***

### Creating Insight Blocks Based on Data Queries

1. Navigate to **Settings -> Pages -> Page Builder**.
2. Open or create a page for Insights.
3.  **Add a Section:** Click **Add Section**.<br>

    <figure><img src="../../.gitbook/assets/image (1381).png" alt=""><figcaption></figcaption></figure>
4.  **Add a Block:** Drag and drop a block (e.g., Chart, Benchmark Chart, Scorecard, Table).<br>

    <figure><img src="../../.gitbook/assets/image (1382).png" alt=""><figcaption></figcaption></figure>
5.  **Configure Content:**

    * Go to the **Content** tab.
    * Select the desired Data Query from the list.<br>
    * Assign the query to the block’s "Content" section.

    <figure><img src="../../.gitbook/assets/image (1383).png" alt=""><figcaption></figcaption></figure>
