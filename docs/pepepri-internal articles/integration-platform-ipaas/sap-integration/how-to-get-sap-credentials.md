---
title: "How to get SAP Credentials"
order: 153
---
# How to get SAP Credentials

### To connect to the SAP server, a prerequisite is to obtain such credentials from the client: SQL server- User ID, Password, SAP - CompanyUser, CompanyPass and Companedb.

#### 1. For SAP Integration we need to add to the General Settings:

| Key |  |
| --- | --- |
| sql\_connection | Data Source=Data Source name;Initial Catalog=DB name;**Integrated Security=False**; UserID=user; Password=\*\*\* |
| companydb | Data Source name |
| server | current server |
| companylang | 3 |
| companyuser | login from SAP |
| companypass | SAP password |
| servertype | SQL release year/HANA |
| licenseserver | server:30000/server:40000 |
| desktop\_response\_timeout | 12000 (if there is a problem with timeouts) |

![](https://alinasergeeva6.github.io/pepepri-docs/static/MicrosoftTeams-image.png)

After we enter the username and password ---> **Change Company** \--->select server version ---> select Data Source ---> fill User ID and Password fields---> OK

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-19.PNG)

**IMPORTANT!** To understand which version of SAP, you need to look at what number the version field begins with. If this is the number 10, then you need to update the importer.

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-20.PNG)

**2\. How to find the transaction in SAP?**

We have 2 types of transactions - ***draft*** and ***regular***.

If we need to find a transaction in the **regular** status, we follow Modules ---> Sales AR ---> Sales Order --->insert the ExternalID of the transaction--->enter

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-21.PNG)

!!!info
Below you can see the definition of **all fields of the OCRD (Sales Order)table** by clicking on the link [http://www.saptables.net/?schema=BusinessOne9.2&module\_id=3&table=OCRD](http://www.saptables.net/?schema=BusinessOne9.2&module_id=3&table=OCRD)
!!!

If we need to find a transaction in the **draft status**, we follow Modules ---> Sales - AR ---> Sales Reports -->Document Drats Report ---> select the desired report and see the table with the result

![](https://alinasergeeva6.github.io/pepepri-docs/static/MicrosoftTeams-image-5.png)

3\. If you need to get information about a **payment**, for example, about its type, you can find it by following Modules ---> Banking---> Incoming Payments -->Incoming Payments

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-22.PNG)
