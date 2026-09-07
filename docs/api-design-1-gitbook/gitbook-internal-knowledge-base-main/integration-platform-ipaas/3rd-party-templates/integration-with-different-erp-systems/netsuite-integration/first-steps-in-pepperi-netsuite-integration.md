---
description: Follow this article to understand how to start Pepperi-NetSuit Integration
---

# First steps in Pepperi-NetSuite Integration

**REMARK**

**NetSuite software** is an online service that enables companies to manage all key business processes in a single system. This Cloud System for enterprise resource planning (ERP) and to manage inventory, track their financials, host e-commerce stores and maintain customer relationship management (CRM) systems. This flexible platform can be applied to a range of business applications



**Let's discuss main steps in Pepperi-NetSuite Integration:**

1.  you need **ADMIN access** because you will need to upload **necessary Pepperi script** to begin with

    \-       this is a simple script that enables to pull data from NetSuite saved searches using Pepperi's integration platform

    \-       you will need to change the extension from **.txt to .JS**
2. In the NetSuite account, go to **Customization > Scripting > Scripts > New**

![](<../../../../.gitbook/assets/image (374).png>)



3\. Press the “+” button to add a script

4\. **Choose file > Choose the “pepperi\_saved\_search\_execute\_V2” file from your computer.**

![](<../../../../.gitbook/assets/image (227).png>)

if you don't have the script, you can download the script from here - **remember, you will need to change the extension from .txt to .JS**:&#x20;

{% file src="../../../../.gitbook/assets/pepperi_saved_search_execute_V2.txt" %}

5\.  Push the button “**Save”** and then “**Create Script Record”**

![](<../../../../.gitbook/assets/image (44).png>)

6\. Enter “**Pepperi Integration Script**” in the name field

![](<../../../../.gitbook/assets/image (298).png>)

**Important to mention:** TYPE is chosen as **RESTlet** by default

7\.  Press on “**Save**” and “**Deploy Script**”

![ ](<../../../../.gitbook/assets/image (421).png>)

![](<../../../../.gitbook/assets/image (121).png>)

8\. Mark the checkboxes of **Roles**, **Partners** and **Employees**

![](<../../../../.gitbook/assets/image (122).png>)

9\. Change the status to “**Released**” and the log level to “**Error**”

![](<../../../../.gitbook/assets/image (60).png>)

10\.  After this you will be able to get **advanced\_search\_url**&#x20;

EXTERNAL URL:

![](<../../../../.gitbook/assets/image (63).png>)

11\.  Saved it in **Pepperi's Integration plugin > General Settings >&#x20;**_**advanced\_search\_url.**_

![](<../../../../.gitbook/assets/image (463).png>)
