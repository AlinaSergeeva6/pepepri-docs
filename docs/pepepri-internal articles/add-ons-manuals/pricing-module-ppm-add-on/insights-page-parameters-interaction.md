---
title: "Insights & Page Parameters Interaction"
description: "This article might be helpful if you want to make the Insights data on the Page to be dynamically updated based on Page Parameters"
order: 56
---
# Insights & Page Parameters Interaction

*This article might be helpful if you want to make the Insights data on the Page to be dynamically updated based on Page Parameters*

To accomplish all of the next steps you need to be sure that all of the needed Insights (Insights Assistant, Data Query, Data Index Framework, Charts Manager, Targets, UDC) & Pages addons (Pages, Flows, Scripts, all of the page blocks which you want to use including Insights page blocks) are installed.

## General Introduction

Sometimes we need to have different insights dashboards for different users. For example, each Rep should have a Rep Dashboard page, which will contain information about the accounts with needed account type only. Or it could be a Manager Dashboard page, which will contain information about accounts assigned to Reps which have specific type only based on current manager's type. In this article we will consider an example of Manager Dashboard page.

!!!warning
As the insights for every customer are completely unique - you'll need to prepare the base of insights data queries which you want to use on your page before all the next steps.

You can check the example from this article on liortest@sigsauer.com (Sig Sauer, INC).
!!!

## Insights Introduction

To learn more about Insights configuration, please check out these articles:

[Insights Configuration](/add-ons-manuals/insights-configuration.md)[Insights - Data Queries](/add-ons-manuals/insights-data-queries.md)[Insights - Charts examples](/add-ons-manuals/insights-charts-examples.md)

## Scripts, Flows, Pages Introduction

If you're new to Scripts, Flows and Pages, please check out this article:

[Adding Dynamic Data to the Page](/add-ons-manuals/pricing-module-ppm-add-on/adding-dynamic-data-to-the-page.md)

## Creating Dynamic Dashboard Page (example)

### Manager-Rep Relationship

Let's assume we have managers with different Roles, and by each Role we have a list of Rep Groups, which accounts we should consider while forming insights dashboard. Each account has TSARepGroup, which contains the name of rep group.

For example, user with InternalID 15049823 has RoleName == 'Commercial Sales':

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-851.png)

We also have information that Commercial Sales manager could see the data on the page only for the accounts which TSARepGroup is one of the following: Blackstone-East / Blackstone-West / SIG-North / WLCC.

All of these data could be saved in UDT or UDC, now we will consider an example using UDT.

#### UserRoles UDT

As we cannot get user's RoleName with pepperi.api functions, we will use UserRoles UDT for saving RoleName of each existing user.

!!!info
You can create dataflow task and schedule it to run as often as you want to have data in UDT up to date. Example task is on Sig Sauer (6784) (30012932), "Upload User Roles To UDT (94830)" dataflow task.
!!!

Example of the data in UserRoles UDT:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-852.png)

#### RepGroups UDT

As was mentioned prevoiusly, we have the list of assigned rep groups for each user's RoleName. This data is saved in RepGroups UDT:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-853.png)

!!!info
The list separator is '~', however, you can use any separator you want. But try to avoid using comma - it could be difficult to get exported data or work with this UDT in dataflow tasks.
!!!

Basically, our goal now is to make Manager Dashboard page to load the data only for accounts which have AccountTSARepGroup IN ('Blackstone-East', 'Blackstone-West', 'SIG-North', 'WLCC').

To accomplish this, we need to create script for page OnLoad flow, which will get current user's role from the UserRoles UDT, then based on retrieved role get the list of rep groups from the RepGroups UDT and set it to the newly created repGroups page parameter to use it inside Data Queries for data filtering.

### Creating Page Parameter

If you're new to Pages, please check out this article:

[Adding Dynamic Data to the Page](/add-ons-manuals/pricing-module-ppm-add-on/adding-dynamic-data-to-the-page.md)

You can call the page parameter as you wish. In this example it will be called "repGroups".

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-854.png)

### Creating Script for getting data from UDTs

If you're new to Scripts, please check out these articles:

[Scripts](/pepperi/custom-homepages/scripts.md)[Scripts - How to Write](/pepperi/custom-homepages/scripts-how-to-write.md)[Debugging Scripts and Flows](/pepperi/custom-homepages/debugging-scripts-and-flows.md)

!!!info
You can check existing script on Sig Sauer environment: "Get Rep Groups By User Role".
!!!

This script will have no parameters, the code is:

```
export async function main(data) {
  // getting current user's fields
  const user = await pepperi.environment.user();

  // getting current user's role
  const userRole = await getUDTElement("UserRoles", user.internalID + "", "1");

  // getting rep groups list based on current user's role
  let repGroups = await getUDTElement("RepGroups", userRole, "1");

  // getting rep groups list as string with comma separated rep groups
  // example:
  // input: "Blackstone-East~Blackstone-West~SIG-North~WLCC"
  // output: "Blackstone-East,Blackstone-West,SIG-North,WLCC"
  repGroups = repGroups.split("~").join(",") || "";

  // setting repGroups flow parameter to pass it to the same parameter but on the page
  return repGroups ? { repGroups: repGroups } : "";
}

// function to get a single row from the UDT
async function getUDTElement(table, mainKey, secondaryKey) {
  let value: any = "";

  const res = await pepperi.api.userDefinedTables
    .get({
      table: table,
      mainKey: mainKey,
      secondaryKey: secondaryKey,
    })
    .then((successRes) => {
      if (successRes.success) {
        value = successRes.value;
        console.log(
          `getting UDT data succeeded, input data is: table: ${table}, mainKey: ${mainKey}, secondaryKey: ${secondaryKey}; output data is: ${value}`
        );
      }
    })
    .catch((error) => console.log(error));

  return value;
}
```

### Creating Page OnLoad Flow

If you're new to Pages or Flows, please check out these articles:

[Pages with flows](/pepperi/custom-homepages/pages-with-flows.md)[Adding Dynamic Data to the Page](/add-ons-manuals/pricing-module-ppm-add-on/adding-dynamic-data-to-the-page.md)

!!!info
You can check existing flow on Sig Sauer environment: "Manager Dashboard - On Load".
!!!

The only logic block which we will add to this flow is UserScriptsBlock:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-855.png)

Save the changes and add the flow to the page OnLoad action:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-856.png)

### Data Queries

Let's assume we need to show to a manager the progress bar where the 100% (benchmark) is sales amount from the last month and the main value is sales amount from current month:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-857.png)

To achieve it we need to have two data queries: sales amount from the last month and sales amount from current month.

#### Sales amount from the last month

!!!info
You can check existing data query on Sig Sauer environment: "\_Manager UD - Card Total $ Sales last month".
!!!

We will connect repGroups page parameter to the data queries througth data query input variable which we should also create:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-858.png)

The main filters for retrieved data are configured in Series section:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-859.png)

The Aggregated field is lineAmount - the query will sum up amounts in every line that match the specified filters:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-860.png)

Sales Series' Metric section

The filters are:

1.  Date is in the last 1 month;
2.  Date is not in the last 0 month - to remove data from current month;
3.  AccountTSARepGroup is IN variable repGroups.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-861.png)

!!!info
We have possibility to get the data related only to "accounts of users under my role" - accounts assigned to users which have roles under the role of current user (for example, "Commercial Sales" manager). It's up to you what the Account filter should be here.

In this example we will select "Account of users under my role".
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-862.png)

!!!info
We also have a lot of different filter settings. There are two which are related to the variables: In (variable) and Equal to (variable).

If in your case you need to check if the comma separated string list in the variable contains the value from some field - you should use In (variable).

If you want to check if the string value in the variable is equal (as a string) to the value from the field - you should use Equal to (variable).
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-863.png)

When all of the needed parts of the data query are configured, you may see zero as a result in Preview section - it means that you're doing the configuration with Admin user or any user which have no directly assigned users / accounts:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-864.png)

!!!info
If you want to test your data query, you can add Preview Value to the variable. For example:
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-865.png)

!!!info
This value will be saved only for Preview section inside the data query and will not affect data query workability on the real page:
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-866.png)

#### Sales amount from current month

!!!info
You can check existing data query on Sig Sauer environment: "\_Manager UD - Card Total $ Sales this month".
!!!

This Data Query is basically the same as the previous one. The only one difference is the filter:

1.  Date is in this month;
2.  AccountTSARepGroup is IN variable repGroups.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-867.png)

#### Adding Block to the Page connected to Data Queries

1\. Add new section on the Page:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-868.png)

2\. Add Sales Amount from current month as main Data Query and map the repGroups variable:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-869.png)

3\. Add Sales Amount from the last month as Benchmark Query and map the repGroups variable:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-870.png)

4\. Select any card design which suites better for data representation:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-871.png)

5\. Save and publish the page.

!!!info
You might see zero as a result in the page block - that's normal, because you're updating the page with Admin user, which almost never have directly assigned users. If you're working on Manager Dashboard - pick one manager user and test the page with it.
!!!

Basically now you can create any Data Query and simply add the same input variable and the same filter inside the Series.

You can check more page blocks and Data Query examples on Manager Dashboard page. This is how it looks like now:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-872.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-873.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-874.png)
