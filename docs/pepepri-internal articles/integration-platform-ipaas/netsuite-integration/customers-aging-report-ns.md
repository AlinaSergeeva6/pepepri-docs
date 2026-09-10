---
title: "Customers Aging Report NS"
description: "This report is representing summary of expenses for each account divided by periods (current day, 1 month, 2 months, 3 months etc.)"
order: 160
---
# Customers Aging Report NS

*This report is representing summary of expenses for each account divided by periods (current day, 1 month, 2 months, 3 months etc.)*

In order to make this report you need to create a Saved Search in Netsuite.

Please do the following steps:

1\. Navigate to **Reports > Saved Searches > All Saved Searches > New** > Click on **Transactions**

![](https://alinasergeeva6.github.io/pepepri-docs/static/113322.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-432.png)

2\. Under **Criteria** tab > **Standard** sub tab set the following: a. **Account Type**: is any of **Accounts Receivable** b. **Status** is none of **Invoice: Paid in Full, Invoice: Pending Approval** c. **Amount Remaining** = is not equal to **0.00**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-433.png)

3\. On the **Results** tab > **Columns** sub tab > Click **Remove All** button and then add the following: a. **Formula (Currency)** Set Summary Type = **Sum** Formula: **case when trunc({today})-{duedate} &lt; 0 then {amount} end** Custom Label: **Current** b. **Formula (Currency)** Set Summary Type = **Sum** Formula: **case when trunc({today})-{duedate} between 1 and 30 then {amount} end** Custom Label: **1-30** c. **Formula (Currency)** Set Summary Type = **Sum** Formula: **case when trunc({today})-{duedate} between 31 and 60 then {amount} end** Custom Label: **31-60** d. **Formula (Currency)** Set Summary Type = **Sum** Formula: **case when trunc({today})-{duedate} between 61 and 90 then {amount} end** Custom Label: **61-90** e. **Formula (Currency)** Set Summary Type = **Sum** Formula: **case when trunc({today})-{duedate} > 90 then {amount} end** Custom Label: **Over 91** f. **Formula (Currency)** Set Summary Type = **Sum** Formula: **NVL(case when trunc({today})-{duedate} &lt; 0 then {amount} end,0)+ NVL(case when trunc({today})-{duedate} between 1 and 30 then {amount} end,0) + NVL(case when trunc({today})-{duedate} between 31 and 60 then {amount} end,0) + NVL( case when trunc({today})-{duedate} between 61 and 90 then {amount} end ,0)+ NVL(case when trunc({today})-{duedate} > 91 then {amount} end,0)** Custom Label: **Total Outstanding**

**g. Customer : Internal ID** Set Summary Type = **Group**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-434.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-435.png)

4\. Add a Search title eg. Pepperi - A/R Aging Summary Search

5\. If you will need to create a dataflow in ipaas for this saved search please enable the ‘Public’ checkbox. In other case the dataflow will fail with an error

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-436.png)

6\. Click on **Save & Run**
