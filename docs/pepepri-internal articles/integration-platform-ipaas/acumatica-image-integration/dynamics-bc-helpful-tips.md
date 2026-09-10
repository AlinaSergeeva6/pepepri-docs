---
title: "Dynamics BC - Helpful Tips"
description: "This article contains tips that can be useful during Dynamics BC development. They are related to different configuration categories."
order: 113
---
# Dynamics BC - Helpful Tips

*This article contains tips that can be useful during Dynamics BC development. They are related to different configuration categories.*

### Fields from extension are not available

When you're using Dynamics BC extensions and trying to add custom fields to you data objects (query, pages etc.) you may see they are not available. To fix this you'll need to add extension as a dependency to your project. Let's take a look on example with [Apportunix Custom Fields extension](https://apportunix.com/app/custom-fields/).

Open Dynamics BC admin panel and search for **Extension Management**. Open it and find requested extension (**Custom Fields** in our case):

![](/static/image-544.png)

Click on its name to see detailed information:

![](/static/image-545.png)

Now navigate to *app.json* file in you BC project and fill in required information about dependent extension:

app.json

```
// ...
"dependencies": [
  {
    "id": "1ba841c1-087c-4fb7-b0bf-35db594ce248",
    "name": "Custom Fields",
    "publisher": "Apportunix",
    "version": "1.60.0.0"
  }
],
// ...
```

Last step is to download new packages using `AL: Download symbols` command. Congrats, you have access to extension fields!

### GST (Goods and Services Tax) configuration

Configuring GST in Dynamics BC involves setting up tax groups, tax codes, and linking them to the appropriate ledger accounts. The basic thing that required a configuration when you're doing an integration is tax groups. Go to Dynamics BC admin panel, search for **GST Posting Setup**. Here you're able to set required tax amount:

![](/static/image-546.png)

After that go to **Items**, select one of them and navigate to **Costs & Posting** section, click on *Show more*. The fields **Gen. Prod. Posting Group** and **GST Prod. Posting Group** are used for GST configuration of current item:

![](/static/image-547.png)

### Add Order Discount

There is a common issue when you're trying to add an order discount to the Sales Order using `discountAmount` field and as a result getting error message saying:

!!!danger
Cannot apply an invoice discount because the document does not include lines where the Allow Invoice Disc. field is selected. To add a discount, specify a line discount in the Line Discount % field for the relevant lines, or add a line of type Item where the Allow Invoice Disc. field is selected
!!!

One of possible solutions is to apply order discount only after the order was added to the Dynamics BC system. To implement this, create a separate webhook, which will be triggered after the Insert Sales Order webhook, using HTTP-request as below.

**Method:** PATCH

URL

```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders(<sales_order_id>)
```

Header

```
If-Match: *
```

Body

```
{
    "discountAmount" : "<discount_value>"
}
```

Order discount will be successfully added to the sales order and appear in Dynamics BC system.

\-- IPaaS configuration example -- Insert SO: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83026](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83026) Insert Discount: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92902](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92902)

### Bulk Data Upload (Excel)

When you need to upload some data type in bulk, navigate to requested type (Items for example) and click on **Share** icon on the top right, select option **Edit in Excel**:

![](/static/image-548.png)

Download the Excel document and open it. Authenticate using your Dynamic BC credentials if requested - and you'll see a list of all items - the same as you have in BC admin panel:

![](/static/image-549.png)

Now copy a line with some item and put it in the end of the document. Edit needed fields (specifying **Item Category Code** is a must) and don't forget to change item **No.** :

![](/static/image-550.png)

Click on **Publish** and after getting message saying that publish operation was successful - click on **Refresh**. After that you can navigate o Dynamics BC admin panel - Items list. Recently uploaded items are available:

![](/static/image-551.png)

### Move changes from Sandbox to Prod environment

Once you're finished with developing on Sandbox environment you might need to transfer all changes to Production. In order to manage this you should create a package and upload it to Production. Perform `AL: Package` command in VS Code. The package will be created in the project folder with the next name: "&lt;publisher>\_&lt;name>\_&lt;version>.app":

![](/static/image-552.png)

Then in Production environment search for **Extension Management**. Click on **Manage** → **Upload Extension** and upload recently created package.
