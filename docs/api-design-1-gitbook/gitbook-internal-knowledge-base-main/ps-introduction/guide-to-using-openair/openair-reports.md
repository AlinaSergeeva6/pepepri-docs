---
description: How to create Reports in OpenAir
---

# OpenAir Reports

## What is a Report

In **OpenAir**, **Report** is a tool used to generate insights from project, financial, and resource data. OpenAir provides a reporting system that allows users to create, customize, and export reports for project tracking, financial analysis, resource utilization, and more...

<figure><img src="../../.gitbook/assets/image (1296).png" alt=""><figcaption><p>Example of existing report</p></figcaption></figure>

## Commonly used Report types&#x20;

The most common reports that are created and used include various types of **Bookings, Bookings vs Actual**, **User time entries**, and **User task reports**. These reports typically present similar information but are structured differently based on their specific purpose.

**1. Bookings Reports**

These reports track scheduled work, planned resource allocations, and estimated project efforts. They help managers and teams plan workloads and ensure resources are properly assigned.

**2. Bookings vs. Actual Reports**

This report compares planned work (bookings) against the actual time spent on tasks or projects. It helps identify discrepancies between scheduled and real-time efforts, allowing managers to assess efficiency and accuracy in project planning.

**3. User Time Entry Reports**

These reports track the actual time users spend on tasks, projects, or activities. They are crucial for payroll, productivity analysis, and client billing.

**4. User Task Reports**

This report provides a detailed view of tasks assigned to users, their progress, time spent and completion status. It helps in tracking individual and team performance.

<figure><img src="../../.gitbook/assets/image (1267).png" alt=""><figcaption></figcaption></figure>

## How to create new Report

**The most efficient way** to create a new report is to **copy an existing one** and update it to the required format.

It is possible to create a new report from scratch in the **Create** tab in OpenAir. However, selecting the appropriate report type may not always be clear.

Lets take **Pepperi Bookings Forecast - 12 weeks** as an example.

1. **Copying the Report**

<figure><img src="../../.gitbook/assets/image (1273).png" alt=""><figcaption></figcaption></figure>

To copy a report, click **Modify**, then scroll to the bottom of the settings and check the box **"Save this report as..."**. \
Enter a unique name and click **Save** to create the new report.

<figure><img src="../../.gitbook/assets/image (1276).png" alt=""><figcaption></figcaption></figure>

2. **Updating the Report**

* _**Time Periods**_ is a section that present in mostly all Report types.\
  It is set to have statistics on some period of time depending on your needs.\
  ![](<../../.gitbook/assets/image (1277).png>)
* _**Options**_ is a section where data source is selected and set to views and subtotals. Some extra functions like percentage formatting and color on value are set here. \
  ![](<../../.gitbook/assets/image (1278).png>)![](<../../.gitbook/assets/image (1279).png>)
* _**Filters and Detail Fields**_ section is responsible for filtering out unnecessary data, such as other Advantive companies, closed projects, or irrelevant entries. **Detail Fields** are selected here to be used in **Subtotals**.\
  \
  ![](<../../.gitbook/assets/image (1282).png>)\
  ![](<../../.gitbook/assets/image (1283).png>)
*   **Other** section is responsible for defining the final report settings. Here, users can configure additional report options, including formatting, data exclusions, and output preferences.

    **Key Settings:**

    * The name of the report is set in the **"Save this report as..."** field. This is a required field and ensures proper identification and retrieval of reports.

    **Others:**

    * **Suppress decimals in money figures:** Rounds off financial values to whole numbers.
    * **Display currency symbols in all rows:** Ensures that currency symbols appear consistently in the report.
    * **Suppress company row:** Hides the company name row if not needed in the final output.
    * **Exclude transactions associated with inactive entities:** Removes any data related to deactivated or inactive accounts.
    * **Run the report in the background:** Enables background execution, allowing users to continue working while the report is generated.
    * **Generate PivotTable file:** Exports the report as a PivotTable-ready file for further analysis in Excel.
    * **Use native Excel CSV format for PivotTable file:** Ensures compatibility with Excel’s PivotTable feature by using its native CSV format.
    * **Include adjustments for variance from 100% in PivotTable file:** Adds variance calculations for a more detailed comparison of data.
    * **For downloads, generate distinct columns for each entity when subtotaling is specified:** Separates data into unique columns when subtotaling is enabled.

    <figure><img src="../../.gitbook/assets/image (1284).png" alt=""><figcaption></figcaption></figure>

3. **Saving the Report** \
   To _**save**_ Report review box "Save this report as...". \
   It has to be **checked** and the **name has to be relevant**.\
   ![](<../../.gitbook/assets/image (1285).png>)
4. **Running the Report**\
   After that Report can be **run** and the Result viewed\
   ![](<../../.gitbook/assets/image (1286).png>)

<figure><img src="../../.gitbook/assets/image (1289).png" alt=""><figcaption></figcaption></figure>
