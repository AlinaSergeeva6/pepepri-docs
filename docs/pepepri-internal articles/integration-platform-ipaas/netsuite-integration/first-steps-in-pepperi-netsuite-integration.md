---
title: "First steps in Pepperi-NetSuite Integration"
description: "Follow this article to understand how to start Pepperi-NetSuit Integration"
order: 171
---
# First steps in Pepperi-NetSuite Integration

*Follow this article to understand how to start Pepperi-NetSuit Integration*

**REMARK**

**NetSuite software** is an online service that enables companies to manage all key business processes in a single system. This Cloud System for enterprise resource planning (ERP) and to manage inventory, track their financials, host e-commerce stores and maintain customer relationship management (CRM) systems. This flexible platform can be applied to a range of business applications

**Let's discuss main steps in Pepperi-NetSuite Integration:**

1.  you need **ADMIN access** because you will need to upload **necessary Pepperi script** to begin with

    \- this is a simple script that enables to pull data from NetSuite saved searches using Pepperi's integration platform

    \- you will need to change the extension from **.txt to .JS**

2.  In the NetSuite account, go to **Customization > Scripting > Scripts > New**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-389.png)

3\. Press the “+” button to add a script

4\. **Choose file > Choose the “pepperi\_saved\_search\_execute\_V2” file from your computer.**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-390.png)

if you don't have the script, you can download the script from here - **remember, you will need to change the extension from .txt to .JS**:

1KB

[pepperi\_saved\_search\_execute\_V2.txt](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-LsR1oG_ZJVnFst1rIGP%2F-LsR2UI6ewc5XQlS6Ijr%2Fpepperi_saved_search_execute_V2.txt?alt=media&token=39b3e41d-7fe1-4d31-b04d-047a13ed8c01)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-LsR1oG_ZJVnFst1rIGP%2F-LsR2UI6ewc5XQlS6Ijr%2Fpepperi_saved_search_execute_V2.txt?alt=media&token=39b3e41d-7fe1-4d31-b04d-047a13ed8c01)

5\. Push the button “**Save”** and then “**Create Script Record”**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-391.png)

6\. Enter “**Pepperi Integration Script**” in the name field

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-392.png)

**Important to mention:** TYPE is chosen as **RESTlet** by default

7\. Press on “**Save**” and “**Deploy Script**”

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-393.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-394.png)

8\. Mark the checkboxes of **Roles**, **Partners** and **Employees**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-395.png)

9\. Change the status to “**Released**” and the log level to “**Error**”

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-396.png)

10\. After this you will be able to get **advanced\_search\_url**

EXTERNAL URL:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-397.png)

11\. Saved it in **Pepperi's Integration plugin > General Settings >** ***advanced\_search\_url.***

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-398.png)
