---
title: "Insights - Data Queries"
description: "This guide provides a comprehensive overview of creating and configuring Data Queries for Pepperi Insights. Effort Estimation: 2h"
order: 71
---
# Insights - Data Queries

*This guide provides a comprehensive overview of creating and configuring Data Queries for Pepperi Insights. Effort Estimation: 2h*

---

### Advantages and Disadvantages

#### Advantages

-   **Intuitive Interface:** The graphical query editor simplifies query creation.
-   **Data Manipulation:** Supports flexible aggregation and presentation of data.

#### Disadvantages

-   **Limitations:** Cannot add text-based columns or manipulate non-numeric data directly.
-   **Data Dependency:** Insights reflect only existing Pepperi data; inaccuracies or incomplete data will affect results.
    -   **Recommendation:** Apply filters (e.g., by Transaction Type or Status) to ensure data accuracy.

---

### Overview

Data Queries in Pepperi Insights define the data sources and calculations used to populate analytics blocks (e.g., charts, tables) on dashboard pages. This guide covers the creation of basic queries, advanced dynamic filtering, and best practices for configuration, ensuring accurate and flexible data representation.

---

### Prerequisites

-   Ensure access to the Insights module in the Pepperi back office (contact Eyal if needed).
-   Complete data indexing via **Settings -> Insights -> Data Index** to make fields available for queries.

---

### Creating Data Queries

#### Accessing Data Queries

1.  Navigate to **Settings -> Insights -> Data Queries**.

    ![](/static/image-746.png)

2.  Click **Add** to create a new query.

#### Configuring a Data Query

1.  **Enter Details:**
    -   Provide a descriptive **Name** for the query.
    -   Select a **Resource**:
        -   all\_activities: Use header-level fields (e.g., GrandTotal, TotalQuantity).
        -   transaction\_lines: Use line-level fields (e.g., UnitPriceAfterDiscount, UnitQuantity).
        -   A UDC defined in the **Targets Manager**: Use imported target data (see Target Resources for Insights Dashboards for details).

            ![](/static/image-747.png)

2.  **Add a Series:**
    -   Define how data is aggregated:

        ![](/static/image-748.png)

        -   **Aggregator:**
            -   Sum: Adds all values of the field.
            -   Average: Calculates the average of values.
            -   Count: Returns the total number of values.
            -   Count Distinct: Returns the number of unique values.
            -   Script: Write a custom calculation using aggregators and fields.

                ![](/static/image-749.png)

3.  **Add Categories (Group By):**
    -   Choose a field to group values (e.g., ActionDateTime for sales by month).
    -   Results in uniform color for bars/columns/lines.

    ![](/static/image-750.png)

    -   **Interval:** Select Day, Week, Month, Quarter, or Year.
    -   **Format:** Choose Year, YearMonth, Month, MonthDay, YearMonthDay, Week, WeekYear, Quarter, or QuarterYear.

        ![](/static/image-751.png)

4.  **Add Dynamic Series (Break By):**
    -   Generate separate graphs per field value (e.g., for a small set of values).
    -   Results in different colors for each bar/column/line.

    ![](/static/image-752.png)

    -   **Limit Results:** Specify the number of values to display.
    -   **Order:** Choose Ascending or Descending.

        ![](/static/image-753.png)

5.  **Add Filters:**
    -   **Account Filter Options:**
        -   All Accounts
        -   Assigned Accounts
        -   Accounts of users under my role (if using Role Hierarchy).

    -   **User Filter Options:**
        -   All Users
        -   Current User
        -   Users under my role (if using Role Hierarchy).

    -   **Additional Filters:**
        -   Filter by Transaction Type (e.g., "Sales Order", "B2B Order").
        -   Filter by Status Name (e.g., "submitted" transactions).

            ![](/static/image-754.png)

6.  **Preview and Save:**
    -   Preview the query results to verify accuracy.
    -   Save the query to make it available for dashboard use.

#### Notes on Resource Changes

-   If no series are defined, the Resource can be changed.
-   To modify the Resource after adding series, remove the series first.

---

### Dynamic Filtering in Data Queries

#### Overview

Dynamic filtering enhances Data Queries by allowing real-time filter adjustments based on user selections or conditions, unlike static filters. Use cases include filtering by user properties, dropdown selections, or conditional logic.

#### Defining a Data Query with Parameters

1.  Create a new Data Query as described above.
2.  Add a variable:
    -   Go to the **Input Variables** section and click **Add**.
    -   **Name:** Define the variable name (e.g., brandFilter).
    -   **Type:** Typically String.
    -   **Default Value:** Optional value if no parameter is passed (e.g., "All").
    -   **Preview Value:** Value for query preview (e.g., a specific brand).

        ![](/static/image-755.png)

3.  Add the variable to the series filter:
    -   Edit the series, go to the **Filter** section, and select a property.
    -   Choose Equal to (variable) or In (variable) and link it to the defined variable.
    -   Use multiple variables if needed.

4.  **Conditional Filtering (Optional):**
    -   Use the **Conditional Filter** section to apply filters only if a condition is met (e.g., filter by MainCategory only if not "All").

        ![](/static/image-756.png)

5.  Verify in Preview:
    -   Adjust the **Preview Value** to see filtered data (e.g., change to a different brand).

        ![](/static/image-757.png)

#### Sending Values from the Page

1.  **Edit the Insights Page:**
    -   Go to **Settings -> Pages -> Page Builder** and open the target page.

2.  **Manage Parameters:**
    -   Click **Manage Parameters**, then **Add**.
    -   **Key:** Enter the variable name (e.g., brandFilter).
    -   **Description:** Provide a description.
    -   **Default Value:** Set a default (e.g., "All" for no filter).

        ![](/static/image-758.png)

3.  **Set Parameter Values:**
    -   **Option 1: User Selection:**
        -   Add a **Filter Block** to the page.
        -   Configure it with the page parameter and a flow containing a Get Values logic block to populate the dropdown.

    -   **Option 2: Static Value:**
        -   Use the **On Load Flow** (Choose Flow) with Search Data and Extract Value logic blocks to set the parameter (e.g., user’s division).

    -   **Option 3: URL Parameter:**
        -   Pass the value via the URL (not recommended due to maintenance challenges).

4.  **Map Variables:**
    -   In the **Content** tab of the Insight block (e.g., Chart), go to **Variable Mapping**.
    -   Select **Variable** and choose the page parameter.

        ![](/static/image-759.png)

#### Example Use Case

-   Create a chart showing Monthly Sales (last 12 months) filtered by MainCategory.
-   If a user selects a category (e.g., "Electronics"), filter by that value; if "All" is selected, show all categories.

---

### Creating Insight Blocks Based on Data Queries

1.  Navigate to **Settings -> Pages -> Page Builder**.
2.  Open or create a page for Insights.
3.  **Add a Section:** Click **Add Section**.

    ![](/static/image-760.png)

4.  **Add a Block:** Drag and drop a block (e.g., Chart, Benchmark Chart, Scorecard, Table).

    ![](/static/image-761.png)

5.  **Configure Content:**
    -   Go to the **Content** tab.
    -   Select the desired Data Query from the list.
    -   Assign the query to the block’s "Content" section.

    ![](/static/image-762.png)
