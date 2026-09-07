---
description: >-
  This article contains tips that can be useful during Dynamics BC development.
  They are related to different configuration categories.
---

# Dynamics BC - Helpful Tips

### Fields from extension are not available&#x20;

When you're using Dynamics BC extensions and trying to add custom fields to you data objects (query, pages etc.) you may see they are not available. To fix this you'll need to add extension as a dependency to your project. Let's take a look on example with [Apportunix Custom Fields extension](https://apportunix.com/app/custom-fields/).

Open Dynamics BC admin panel and search for **Extension Management**. Open it and find requested extension (**Custom Fields** in our case):

<figure><img src="../../../../.gitbook/assets/image (818).png" alt=""><figcaption></figcaption></figure>

Click on its name to see detailed information:

<figure><img src="../../../../.gitbook/assets/image (819).png" alt=""><figcaption></figcaption></figure>

Now navigate to _app.json_ file in you BC project and fill in required information about dependent extension:

{% code title="app.json" %}
```json
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
{% endcode %}

Last step is to download new packages using `AL: Download symbols` command. Congrats, you have access to extension fields!



### GST (Goods and Services Tax) configuration

Configuring GST in Dynamics BC involves setting up tax groups, tax codes, and linking them to the appropriate ledger accounts. The basic thing that required a configuration when you're doing an integration is tax groups. Go to Dynamics BC admin panel, search for **GST Posting Setup**. Here you're able to set required tax amount:

<figure><img src="../../../../.gitbook/assets/image (811).png" alt=""><figcaption></figcaption></figure>

After that go to **Items**, select one of them and navigate to **Costs & Posting** section, click on _Show more_. The fields **Gen. Prod. Posting Group** and **GST Prod. Posting Group** are used for GST configuration of current item:

<figure><img src="../../../../.gitbook/assets/image (813).png" alt=""><figcaption></figcaption></figure>

### Add Order Discount

There is a common issue when you're trying to add an order discount to the Sales Order using `discountAmount` field  and as a result getting error message saying:

{% hint style="danger" %}
Cannot apply an invoice discount because the document does not include lines where the Allow Invoice Disc. field is selected. To add a discount, specify a line discount in the Line Discount % field for the relevant lines, or add a line of type Item where the Allow Invoice Disc. field is selected
{% endhint %}

One of possible solutions is to apply order discount only after the order was added to the Dynamics BC system. To implement this, create a separate webhook, which will be triggered after the Insert Sales Order webhook, using HTTP-request as below.

**Method:** PATCH

{% code title="URL" overflow="wrap" %}
```
https://api.businesscentral.dynamics.com/v2.0/<environment_name>/api/v2.0/companies(<company_id>)/salesOrders(<sales_order_id>)
```
{% endcode %}

{% code title="Header" %}
```
If-Match: *
```
{% endcode %}

{% code title="Body" %}
```json
{
    "discountAmount" : "<discount_value>"
}
```
{% endcode %}

Order discount will be successfully added to the sales order and appear in Dynamics BC system.

\-- IPaaS configuration example --\
Insert SO: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83026](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83026)\
Insert Discount: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92902](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=92902)



### Bulk Data Upload (Excel)

When you need to upload some data type in bulk, navigate to requested type (Items for example) and click on **Share** icon on the top right, select option **Edit in Excel**:

<figure><img src="../../../../.gitbook/assets/image (814).png" alt=""><figcaption></figcaption></figure>

Download the Excel document and open it. Authenticate using your Dynamic BC credentials if requested - and you'll see a list of all items - the same as you have in BC admin panel:

<figure><img src="../../../../.gitbook/assets/image (815).png" alt=""><figcaption></figcaption></figure>

Now copy a line with some item and put it in the end of the document. Edit needed fields (specifying **Item Category Code** is a must) and don't forget to change item **No.** :

<figure><img src="../../../../.gitbook/assets/image (816).png" alt=""><figcaption></figcaption></figure>

Click on **Publish** and after getting message saying that publish operation was successful - click on **Refresh**. After that you can navigate o Dynamics BC admin panel - Items list. Recently uploaded items are available:

<figure><img src="../../../../.gitbook/assets/image (817).png" alt=""><figcaption></figcaption></figure>

### Move changes from Sandbox to Prod environment

Once you're finished with developing on Sandbox environment you might need to transfer all changes to Production. In order to manage this you should create a package and upload it to Production. Perform `AL: Package` command in VS Code. The package will be created in the project folder with the next name: "\<publisher>\_\<name>\_\<version>.app":

<figure><img src="../../../../.gitbook/assets/image (891).png" alt="" width="353"><figcaption></figcaption></figure>

Then in Production environment search for **Extension Management**. Click on **Manage** → **Upload Extension** and upload recently created package.

