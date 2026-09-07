---
description: >-
  This guide provides a comprehensive overview of configuring Pepperi Insights.
  Effort Estimation: 2h
---

# Insights Configuration

Overview

Pepperi Insights allows users to view statistics and analytics (e.g., sales vs. targets, success of sales programs, promotions) on dedicated dashboard pages accessible via slugs like /insights or /account\_insights. Configuration is performed in the Pepperi back office under **Settings -> Insights** and **Settings -> Pages**, offering flexibility to customize dashboards based on roles, time periods, item categories, and more.

The configuration process involves installing Insights, indexing data, creating queries, designing dashboards, and assigning them to user profiles. This article details each step, including advanced configurations for targets and custom fields.

***

### Advantages and Disadvantages

#### <mark style="color:green;">Advantages</mark>

* **Flexibility:** Dashboards can display various charts and graphs, customized by role, time period, or item category.
* **Integrated Access:** Insights are accessible via dedicated slugs (/insights, /account\_insights).

#### <mark style="color:red;">Disadvantages</mark>

* **Case Sensitivity:** The search bar in **Settings -> Insights -> Data Queries** is case-sensitive, requiring exact matches.
* **Configuration Errors:** If target queries do not use the correct UDC resource, dashboard sections may display errors.

***

### Demo Environment

On the **Services Demo - Environment**, Insights are configured for the Transaction Type "Insights". The Home Page includes quick access links to "Insights Page" (/insights) and "Account Insights Page" (/account\_insights).

***

### Prerequisites

1. **Obtain Access:**\
   Ensure you have access to the Insights functionality. Contact Eyal to enable this feature for your account.
2. **Install Insights Add-on:**
   * Navigate to **Settings -> Configuration -> Add-on Manager**.
   * Search for "Insights Assistant".
   * Click **Install** and confirm by selecting **Continue**.
   *   Wait for the installation to complete (this may take several minutes). Once done, a new **Insights** section will appear under **Settings**.<br>

       <figure><img src="../../.gitbook/assets/image (1331).png" alt=""><figcaption></figcaption></figure>

***

### Configuration Process

#### Step 1: Install Initial Dashboards and Queries

*   Use the **Configuration Assistant** to set up initial dashboards and data queries for Reps and Managers:

    * Go to **Settings -> Insights -> Configuration Assistant**.

    <figure><img src="../../.gitbook/assets/image (1332).png" alt=""><figcaption></figcaption></figure>

    *   Configure the following:

        * **Fields to Accumulate:** Select fields for data aggregation (only fields indexed in the Data Index will be available).

        <figure><img src="../../.gitbook/assets/image (1333).png" alt=""><figcaption></figcaption></figure>

        * **Queries Filter:** Filter by Transaction Type or Status (e.g., select "submitted" for orders).

        <figure><img src="../../.gitbook/assets/image (1334).png" alt=""><figcaption></figcaption></figure>

        * **Slugs & Pages to Create:** Default slugs are /insights and /account\_insights (customizable if needed).

        <figure><img src="../../.gitbook/assets/image (1335).png" alt=""><figcaption></figcaption></figure>
    * Click **Run** to create three unpublished pages. A notification will confirm completion.

    <figure><img src="../../.gitbook/assets/image (1340).png" alt=""><figcaption></figcaption></figure>

#### Step 2: Index Data (Data Index)

The Data Index prepares fields for use in queries and dashboards by exporting them to an Elastic database, optimized for fast data retrieval.

**Indexing Fields**

1.  Navigate to **Settings -> Insights -> Data Index**.

    <figure><img src="../../.gitbook/assets/image (1337).png" alt=""><figcaption></figcaption></figure>
2.  **Activities & Transactions Tab:**

    * Index header fields such as:
      * Transaction GrandTotal
      * Transaction SubTotalAfterDiscount
      * Transaction UnitsQuantity
    * Default fields are pre-indexed. Ensure custom fields (e.g., TSA fields like TSATransactionTotal) are added, especially if multiple Transaction/Activity types are used.

    <figure><img src="../../.gitbook/assets/image (1338).png" alt=""><figcaption></figcaption></figure>
3. **Transaction Lines Tab:**
   * Index line-level fields such as:
     * UnitsQuantity
     * TotalUnitsPriceAfterDiscount
   *   Include any custom TSA fields relevant to your reporting needs.<br>

       <figure><img src="../../.gitbook/assets/image (1339).png" alt="" width="563"><figcaption></figcaption></figure>
4. **Publish the Index:**
   * Click **Publish** to export data to the Elastic database.
   * Publishing may take time, especially with large datasets. Wait for completion before proceeding.
   * Schedule publishing for off-peak hours using the "Run at" option to minimize impact on operations.
   * Note: Publishing without changes to fields results in no action. To re-publish, delete the indexed data first (see below).

**Delete Indexed Data**

* If dashboard data needs updating, delete the indexed data:
  * Go to **Settings -> Insights -> Data Index**.
  * Select **Delete Indexed Data** to remove current data.
  * Re-publish by clicking **Publish** to refresh the dataset.
* Regular maintenance of indexed data ensures optimal dashboard performance.

#### Step 3: Create Data Queries

* Navigate to **Settings -> Insights -> Data Queries** to manage queries created by the Configuration Assistant.

<figure><img src="../../.gitbook/assets/image (1342).png" alt=""><figcaption></figcaption></figure>

* Create or edit queries to summarize indexed fields for dashboards:
  * Use the graphical UI to select fields and apply filters.
  * **Note:** The search bar in Data Queries is case-sensitive.
* For target-related queries, specify the relevant User Defined Collection (UDC) as the resource to ensure accurate data retrieval.

#### Step 4: Build Dashboard Pages

1.  Go to **Settings -> Pages -> Page Builder**.<br>

    <figure><img src="../../.gitbook/assets/image (1344).png" alt=""><figcaption></figcaption></figure>
2.  Locate the three new pages created by the Configuration Assistant.<br>

    <figure><img src="../../.gitbook/assets/image (1348).png" alt=""><figcaption></figcaption></figure>
3. For each page:
   * Add sections and drag in blocks such as Charts, Benchmark Charts, Scorecards, and Tables.
   * Link blocks to the appropriate Data Queries (ensure target queries use the correct UDC resource to avoid errors).
   * Customize the layout for each user profile (e.g., Rep, Manager, Buyer).
4.  Save and click **Publish** to make pages available.<br>

    <figure><img src="../../.gitbook/assets/image (1349).png" alt=""><figcaption></figcaption></figure>

#### Step 5: Assign User Profile Permissions

1.  Navigate to **Settings -> Pages -> Slugs -> Mapping**.<br>

    <figure><img src="../../.gitbook/assets/image (1350).png" alt=""><figcaption></figcaption></figure>
2. Add or edit user profiles:
   * Drag available slugs (e.g., /insights, /account\_insights) to the Mapped Slugs section.
   *   Select the corresponding page for each slug.<br>

       <figure><img src="../../.gitbook/assets/image (1351).png" alt=""><figcaption></figcaption></figure>
3. Verify published pages are accessible:
   * https://app.pepperi.com/insights
   * https://app.pepperi.com/account\_insights

#### Step 6: Add Dashboards to the Home Screen (Optional)

1.  Go to **Settings -> Company Profiles -> App Home Screen**.<br>

    <figure><img src="../../.gitbook/assets/image (1347).png" alt=""><figcaption></figcaption></figure>
2. Select the desired profile.
3. In the Slugs section, locate the newly created slugs (e.g., /insights, /account\_insights).
4. Add them to the Home Screen for quick access.

***

### Advanced Configuration: Setting Up Targets

#### Overview

Targets in Pepperi Insights allow users to track performance against predefined goals (e.g., sales targets per user or account). They are managed through User Defined Collections (UDCs) and integrated into dashboards via data queries.

#### Target Resources

Target resources are defined in the **User Defined Collections (UDC)** editor:

* If you used the Insights Configuration Assistant, two default target UDCs are created:
  * **AccountTarget:** For account-level targets.
  *   **UserTarget:** For user-level targets.<br>

      <figure><img src="../../.gitbook/assets/image (1365).png" alt=""><figcaption></figcaption></figure>
* If your sales targets are per user or per account, these UDCs suffice without modification.
* You may need to modify or create additional UDCs in cases such as:
  * If you did not use the Configuration Assistant.
  * If you need additional fields (e.g., targets by user and brand).

**Manual UDC Creation**

To create a new target UDC or add fields to existing ones (e.g., for targets by user and brand):

1. Navigate to **Settings -> Configuration -> User Defined Collection**.
2. Click **Add**.
3. Define the UDC:
   * **Key:** Use a unique name starting with a capital letter, with no spaces or special characters (e.g., UserBrandTarget).
   * **Description:** Provide a clear description (e.g., "Targets by user and brand").
   *   **Inherit Field From:** Select either user\_target or account\_target to inherit base fields (Date, User/Account, Target) and make the UDC available in the Targets Manager.<br>

       <figure><img src="../../.gitbook/assets/image (1367).png" alt=""><figcaption></figcaption></figure>
4. Ensure the **Scheme Only** checkbox is unchecked, then click **Create**.
5.  After creation, the UDC editor opens:<br>

    <figure><img src="../../.gitbook/assets/image (1368).png" alt=""><figcaption></figcaption></figure>

    * Add fields (e.g., Brand):
      * **Key:** Use lowercase, with no spaces or special characters (e.g., brand).
      * **Description:** Provide a description.
      * **Type:** Select the appropriate type (e.g., String).
      * **Is Array:** Enable if needed for multiple values.
      * **Mandatory:** Set to true/false as required.
      * **Indexed:** Set to true if the field will be used in Insights data queries.
      *   **Optional Values:** List options (e.g., brand1, brand2, brand3a).<br>

          <figure><img src="../../.gitbook/assets/image (1369).png" alt=""><figcaption></figcaption></figure>
    * Click **Update** to save changes.


6. **Reindex if Needed:**
   * If the UDC structure changes after data is added, reindex the data:
     * Go to the UDC list, select the UDC, and choose **Rebuild Index** from the pencil menu.

#### Targets Manager (Data Editor)

The Targets Manager allows you to view, create, or edit target data for each UDC resource.

1.  Navigate to **Settings -> Insights -> Targets Manager**.<br>

    <figure><img src="../../.gitbook/assets/image (1366).png" alt=""><figcaption></figcaption></figure>
2. Each target resource (e.g., UserTarget, AccountTarget) is displayed in a separate tab.
3. Per resource, you can:
   * View existing target data.
   * Create new target entries manually by clicking **Add** and filling out the form.
   * Edit existing entries as needed.

**Data Import**

Import target data from a file to populate the UDC:

1.  Open the UDC list and click on the target UDC (e.g., UserTarget).<br>

    <figure><img src="../../.gitbook/assets/image (1370).png" alt=""><figcaption></figcaption></figure>
2. Click the menu icon and select **Import**.
3. Upload a file in **JSON** or **CSV** format:
   * For CSV, use columns like:
     * Date: Format as 2023-07-01T00:00:00.
     * Target: Specify the target value.
     * User#Email or Account#ExternalID: Use email for users or External ID for accounts (e.g., from **Settings -> Users -> Manage Users -> Sales Rep ID**).
   * Example CSV structure:

{% file src="../../.gitbook/assets/UDCTargetsExample.csv" %}

4.  The imported data will appear in the UDC and be available in the Targets Manager.<br>

    <figure><img src="../../.gitbook/assets/image (1371).png" alt=""><figcaption></figcaption></figure>

#### Targets Data Queries

Target data queries aggregate target data for use in dashboards. They follow the same principles as other data queries (see Data Queries documentation for basics).

**Creating a Target Data Query**

Example: Create a query for a benchmark chart showing Sales Reps’ Monthly Sales Actual vs. Target for reps under a manager.

1.  Navigate to **Settings -> Insights -> Data Queries**.<br>

    <figure><img src="../../.gitbook/assets/image (1364).png" alt=""><figcaption></figcaption></figure>
2.  Create a new query and select the target resource (e.g., UserTarget).<br>

    <figure><img src="../../.gitbook/assets/image (1363).png" alt=""><figcaption></figcaption></figure>
3.  Configure the query:

    * **Value Format:** Choose Currency or Decimal (default currency applies unless specified).

    <figure><img src="../../.gitbook/assets/image (1362).png" alt=""><figcaption></figcaption></figure>

    * **Series:**
      * Sum the Target field in the UserTarget resource.
      * For managers: Group by User Name to see targets per rep.
      * For individual reps: Create a separate query without grouping.\
        ![](<../../.gitbook/assets/image (1361).png>)
    * **User Filter:**
      * For managers: Select "All users" or "Users under my role" (if using Role Hierarchy).
      *   For reps: Select "Current User" (create separate queries for each role).<br>

          <figure><img src="../../.gitbook/assets/image (1360).png" alt=""><figcaption></figcaption></figure>
    *   **Date Filter:** Filter by This Month to view current month targets (uses the Date column in the UDC).<br>

        <figure><img src="../../.gitbook/assets/image (1359).png" alt=""><figcaption></figcaption></figure>
4. Click **Add** and preview the values to ensure accuracy.

#### Targets in Charts

Target queries are typically used in Scorecards or Benchmark Charts on dashboard pages.

**Adding Targets to a Dashboard**

1. Go to **Settings -> Pages -> Page Builder**.
2. Add a **Benchmark Chart** block to the page.
3. In the **Content** tab, select two queries:
   * Actual values query (e.g., "Manager Rep Sales this Month").
   *   Target values query (e.g., "Manager Rep Targets this Month").<br>

       <figure><img src="../../.gitbook/assets/image (1358).png" alt=""><figcaption></figcaption></figure>
4. Save and publish the page to the relevant profiles (see Page Builder Guide).
