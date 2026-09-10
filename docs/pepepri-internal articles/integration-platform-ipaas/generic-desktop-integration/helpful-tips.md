---
title: "Helpful tips"
order: 123
---
# Helpful tips

1.  Work with multiple tenants Acumatica ERP

Tenant is a database inside one environment **Important!** If you want to work with a test environment, you need to create a user after all tenants are created, otherwise you will receive an *unsupported client error*.

**In order to create a test environment, we need to:**

1.  Create new tenant (created by Acumatica admin);
2.  Then create a user (created by Acumatica admin);

To set up a test environment, you need to add a setting such as generic\_app\_id with any name to the dataflow task settings.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2-35.png)

Then, when we go to the HTTP tab and click Get Token - we see our Application Unique Name.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/3-26.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/photo_2022-04-03_14-23-54.jpg)

Ready. Now you can test dataflow tasks.

**2***.* **Inspect Elements** If the client asks to add some field (for example, Description). In order to understand which field from which table is responsible for Description, you need to go to ***Sales Order→ Customization → Inspect Element.***

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Capture-29.PNG)

Point to the desired element, click and see all the information we need. **Data Class** - table name **Data Field** - field name We also have the opportunity to open the documentation for all the fields that we have. This can be obtained by following **Actions*****→ View data class source****.*

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Capture-30.PNG)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Capture-31.PNG)

How to change branch Add to header of http request : PX-CbApiBranch:SS
