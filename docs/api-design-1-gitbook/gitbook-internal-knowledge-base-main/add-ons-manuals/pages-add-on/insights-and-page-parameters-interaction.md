---
description: >-
  This article might be helpful if you want to make the Insights data on the
  Page to be dynamically updated based on Page Parameters
---

# Insights & Page Parameters Interaction

To accomplish all of the next steps you need to be sure that all of the needed Insights (Insights Assistant, Data Query, Data Index Framework, Charts Manager, Targets, UDC) & Pages addons (Pages, Flows, Scripts, all of the page blocks which you want to use including Insights page blocks) are installed.

## General Introduction

Sometimes we need to have different insights dashboards for different users. For example, each Rep should have a Rep Dashboard page, which will contain information about the accounts with needed account type only. Or it could be a Manager Dashboard page, which will contain information about accounts assigned to Reps which have specific type only based on current manager's type. In this article we will consider an example of Manager Dashboard page.

{% hint style="warning" %}
As the insights for every customer are completely unique - you'll need to prepare the base of insights data queries which you want to use on your page before all the next steps.

You can check the example from this article on liortest@sigsauer.com (Sig Sauer, INC).
{% endhint %}

## Insights Introduction

To learn more about Insights configuration, please check out these articles:

{% content-ref url="../insights-add-on/insights-configuration.md" %}
[insights-configuration.md](../insights-add-on/insights-configuration.md)
{% endcontent-ref %}

{% content-ref url="../insights-add-on/insights-data-queries.md" %}
[insights-data-queries.md](../insights-add-on/insights-data-queries.md)
{% endcontent-ref %}

{% content-ref url="../insights-add-on/insights-charts-examples.md" %}
[insights-charts-examples.md](../insights-add-on/insights-charts-examples.md)
{% endcontent-ref %}

## Scripts, Flows, Pages Introduction

If you're new to Scripts, Flows and Pages, please check out this article:

{% content-ref url="adding-dynamic-data-to-the-page.md" %}
[adding-dynamic-data-to-the-page.md](adding-dynamic-data-to-the-page.md)
{% endcontent-ref %}

## Creating Dynamic Dashboard Page (example)

### Manager-Rep Relationship

Let's assume we have managers with different Roles, and by each Role we have a list of Rep Groups, which accounts we should consider while forming insights dashboard. Each account has TSARepGroup, which contains the name of rep group.

For example, user with InternalID 15049823 has RoleName == 'Commercial Sales':

<figure><img src="../../.gitbook/assets/image (1124).png" alt=""><figcaption></figcaption></figure>

We also have information that Commercial Sales manager could see the data on the page only for the accounts which TSARepGroup is one of the following: Blackstone-East / Blackstone-West / SIG-North / WLCC.

All of these data could be saved in UDT or UDC, now we will consider an example using UDT.

#### UserRoles UDT

As we cannot get user's RoleName with pepperi.api functions, we will use UserRoles UDT for saving RoleName of each existing user.&#x20;

{% hint style="info" %}
You can create dataflow task and schedule it to run as often as you want to have data in UDT up to date. Example task is on Sig Sauer (6784) (30012932),  "Upload User Roles To UDT (94830)" dataflow task.
{% endhint %}

Example of the data in UserRoles UDT:

<figure><img src="../../.gitbook/assets/image (1122).png" alt=""><figcaption></figcaption></figure>

#### RepGroups UDT

As was mentioned prevoiusly, we have the list of assigned rep groups for each user's RoleName. This data is saved in RepGroups UDT:

<figure><img src="../../.gitbook/assets/image (1126).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
The list separator is '\~', however, you can use any separator you want. But try to avoid using comma - it could be difficult to get exported data or work with this UDT in dataflow tasks.
{% endhint %}

Basically, our goal now is to make Manager Dashboard page to load the data only for accounts which have AccountTSARepGroup IN ('Blackstone-East', 'Blackstone-West', 'SIG-North', 'WLCC').

To accomplish this, we need to create script for page OnLoad flow, which will get current user's role from the UserRoles UDT, then based on retrieved role get the list of rep groups from the RepGroups UDT and set it to the newly created repGroups page parameter to use it inside Data Queries for data filtering.

### Creating Page Parameter

If you're new to Pages, please check out this article:

{% content-ref url="adding-dynamic-data-to-the-page.md" %}
[adding-dynamic-data-to-the-page.md](adding-dynamic-data-to-the-page.md)
{% endcontent-ref %}

You can call the page parameter as you wish. In this example it will be called "repGroups".

<figure><img src="../../.gitbook/assets/image (1139).png" alt=""><figcaption></figcaption></figure>

### Creating Script for getting data from UDTs

If you're new to Scripts, please check out these articles:

{% content-ref url="../../scripts/" %}
[scripts](../../scripts/)
{% endcontent-ref %}

{% content-ref url="../../scripts/scripts-how-to-write.md" %}
[scripts-how-to-write.md](../../scripts/scripts-how-to-write.md)
{% endcontent-ref %}

{% content-ref url="../../scripts/debugging-scripts-and-flows.md" %}
[debugging-scripts-and-flows.md](../../scripts/debugging-scripts-and-flows.md)
{% endcontent-ref %}

{% hint style="info" %}
You can check existing script on Sig Sauer environment: "Get Rep Groups By User Role".
{% endhint %}

This script will have no parameters, the code is:

```typescript
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

{% content-ref url="../../flows/pages-with-flows.md" %}
[pages-with-flows.md](../../flows/pages-with-flows.md)
{% endcontent-ref %}

{% content-ref url="adding-dynamic-data-to-the-page.md" %}
[adding-dynamic-data-to-the-page.md](adding-dynamic-data-to-the-page.md)
{% endcontent-ref %}

{% hint style="info" %}
You can check existing flow on Sig Sauer environment: "Manager Dashboard - On Load".
{% endhint %}

The only logic block which we will add to this flow is UserScriptsBlock:

<figure><img src="../../.gitbook/assets/image (1140).png" alt=""><figcaption></figcaption></figure>

Save the changes and add the flow to the page OnLoad action:

<figure><img src="../../.gitbook/assets/image (1141).png" alt=""><figcaption></figcaption></figure>

### Data Queries

Let's assume we need to show to a manager the progress bar where the 100% (benchmark) is sales amount from the last month and the main value is sales amount from current month:

<figure><img src="../../.gitbook/assets/image (1138).png" alt=""><figcaption></figcaption></figure>

To achieve it we need to have two data queries: sales amount from the last month and sales amount from current month.

#### Sales amount from the last month

{% hint style="info" %}
You can check existing data query on Sig Sauer environment: "\_Manager UD - Card Total $ Sales last month".
{% endhint %}

We will connect repGroups page parameter to the data queries througth data query input variable which we should also create:

<figure><img src="../../.gitbook/assets/image (1142).png" alt=""><figcaption></figcaption></figure>

The main filters for retrieved data are configured in Series section:

<figure><img src="../../.gitbook/assets/image (1129).png" alt=""><figcaption></figcaption></figure>

The Aggregated field is lineAmount - the query will sum up amounts in every line that match the specified filters:

<figure><img src="../../.gitbook/assets/image (1130).png" alt=""><figcaption><p>Sales Series' Metric section</p></figcaption></figure>

The filters are:

1. Date is in the last 1 month;
2. Date is not in the last 0 month - to remove data from current month;
3. AccountTSARepGroup is IN variable repGroups.

<figure><img src="../../.gitbook/assets/image (1143).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
We have possibility to get the data related only to "accounts of users under my role" - accounts assigned to users which have roles under the role of current user (for example, "Commercial Sales" manager). It's up to you what the Account filter should be here.

In this example we will select "Account of users under my role".
{% endhint %}

<figure><img src="../../.gitbook/assets/image (1133).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
We also have a lot of different filter settings. There are two which are related to the variables: In (variable) and Equal to (variable).

If in your case you need to check if the comma separated string list in the variable contains the value from some field - you should use In (variable).

If you want to check if the string value in the variable is equal (as a string) to the value from the field - you should use Equal to (variable).
{% endhint %}

<figure><img src="../../.gitbook/assets/image (1162).png" alt=""><figcaption></figcaption></figure>

When all of the needed parts of the data query are configured, you may see zero as a result in Preview section - it means that you're doing the configuration with Admin user or any user which have no directly assigned users / accounts:

<figure><img src="../../.gitbook/assets/image (1144).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If you want to test your data query, you can add Preview Value to the variable. For example:
{% endhint %}

<figure><img src="../../.gitbook/assets/image (1145).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
This value will be saved only for Preview section inside the data query and will not affect data query workability on the real page:
{% endhint %}

<figure><img src="../../.gitbook/assets/image (1146).png" alt=""><figcaption></figcaption></figure>

#### Sales amount from current month

{% hint style="info" %}
You can check existing data query on Sig Sauer environment: "\_Manager UD - Card Total $ Sales this month".
{% endhint %}

This Data Query is basically the same as the previous one. The only one difference is the filter:

1. Date is in this month;
2. AccountTSARepGroup is IN variable repGroups.

<figure><img src="../../.gitbook/assets/image (1147).png" alt=""><figcaption></figcaption></figure>

#### Adding Block to the Page connected to Data Queries

1\. Add new section on the Page:

<figure><img src="../../.gitbook/assets/image (1154).png" alt=""><figcaption></figcaption></figure>

2\. Add Sales Amount from current month as main Data Query and map the repGroups variable:

<figure><img src="../../.gitbook/assets/image (1156).png" alt=""><figcaption></figcaption></figure>

3\. Add Sales Amount from the last month as Benchmark Query and map the repGroups variable:

<figure><img src="../../.gitbook/assets/image (1157).png" alt=""><figcaption></figcaption></figure>

4\. Select any card design which suites better for data representation:

<figure><img src="../../.gitbook/assets/image (1158).png" alt=""><figcaption></figcaption></figure>

5\. Save and publish the page.

{% hint style="info" %}
You might see zero as a result in the page block - that's normal, because you're updating the page with Admin user, which almost never have directly assigned users. If you're working on Manager Dashboard - pick one manager user and test the page with it.
{% endhint %}

Basically now you can create any Data Query and simply add the same input variable and the same filter inside the Series.&#x20;

You can check more page blocks and Data Query examples on Manager Dashboard page. This is how it looks like now:

<figure><img src="../../.gitbook/assets/image (1159).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (1160).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (1161).png" alt=""><figcaption></figcaption></figure>
