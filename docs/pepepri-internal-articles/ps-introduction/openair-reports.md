---
title: "OpenAir Reports"
description: "How to create Reports in OpenAir"
order: 335
---
# OpenAir Reports

*How to create Reports in OpenAir*

## What is a Report

In **OpenAir**, **Report** is a tool used to generate insights from project, financial, and resource data. OpenAir provides a reporting system that allows users to create, customize, and export reports for project tracking, financial analysis, resource utilization, and more...

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-5.png)

Example of existing report

## Commonly used Report types

The most common reports that are created and used include various types of **Bookings, Bookings vs Actual**, **User time entries**, and **User task reports**. These reports typically present similar information but are structured differently based on their specific purpose.

**1\. Bookings Reports**

These reports track scheduled work, planned resource allocations, and estimated project efforts. They help managers and teams plan workloads and ensure resources are properly assigned.

**2\. Bookings vs. Actual Reports**

This report compares planned work (bookings) against the actual time spent on tasks or projects. It helps identify discrepancies between scheduled and real-time efforts, allowing managers to assess efficiency and accuracy in project planning.

**3\. User Time Entry Reports**

These reports track the actual time users spend on tasks, projects, or activities. They are crucial for payroll, productivity analysis, and client billing.

**4\. User Task Reports**

This report provides a detailed view of tasks assigned to users, their progress, time spent and completion status. It helps in tracking individual and team performance.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-6.png)

## How to create new Report

**The most efficient way** to create a new report is to **copy an existing one** and update it to the required format.

It is possible to create a new report from scratch in the **Create** tab in OpenAir. However, selecting the appropriate report type may not always be clear.

Lets take **Pepperi Bookings Forecast - 12 weeks** as an example.

1.  **Copying the Report**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-7.png)

To copy a report, click **Modify**, then scroll to the bottom of the settings and check the box **"Save this report as..."**. Enter a unique name and click **Save** to create the new report.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-8.png)

1.  **Updating the Report**

-   ***Time Periods*** is a section that present in mostly all Report types. It is set to have statistics on some period of time depending on your needs.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-9.png)

-   ***Options*** is a section where data source is selected and set to views and subtotals. Some extra functions like percentage formatting and color on value are set here.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-10.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-11.png)

-   ***Filters and Detail Fields*** section is responsible for filtering out unnecessary data, such as other Advantive companies, closed projects, or irrelevant entries. **Detail Fields** are selected here to be used in **Subtotals**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-12.png)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-13.png)

-   **Other** section is responsible for defining the final report settings. Here, users can configure additional report options, including formatting, data exclusions, and output preferences.

    **Key Settings:**

    -   The name of the report is set in the **"Save this report as..."** field. This is a required field and ensures proper identification and retrieval of reports.

    **Others:**

    -   **Suppress decimals in money figures:** Rounds off financial values to whole numbers.
    -   **Display currency symbols in all rows:** Ensures that currency symbols appear consistently in the report.
    -   **Suppress company row:** Hides the company name row if not needed in the final output.
    -   **Exclude transactions associated with inactive entities:** Removes any data related to deactivated or inactive accounts.
    -   **Run the report in the background:** Enables background execution, allowing users to continue working while the report is generated.
    -   **Generate PivotTable file:** Exports the report as a PivotTable-ready file for further analysis in Excel.
    -   **Use native Excel CSV format for PivotTable file:** Ensures compatibility with Excel’s PivotTable feature by using its native CSV format.
    -   **Include adjustments for variance from 100% in PivotTable file:** Adds variance calculations for a more detailed comparison of data.
    -   **For downloads, generate distinct columns for each entity when subtotaling is specified:** Separates data into unique columns when subtotaling is enabled.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-14.png)

1.  **Saving the Report** To ***save*** Report review box "Save this report as...". It has to be **checked** and the **name has to be relevant**.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-15.png)

2.  **Running the Report** After that Report can be **run** and the Result viewed

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-16.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-17.png)
