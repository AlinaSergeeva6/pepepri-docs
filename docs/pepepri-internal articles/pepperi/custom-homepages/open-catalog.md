---
title: "Open Catalog"
description: "This article describes the process of Pepperi Open Catalog configuration, including the creation and configuration of Pepperi transaction, WordPress configuration and useful tips."
order: 282
---
# Open Catalog

*This article describes the process of Pepperi Open Catalog configuration, including the creation and configuration of Pepperi transaction, WordPress configuration and useful tips.*

### Overview

Open Catalog is a Pepperi feature, that gives possibility to show Pepperi transaction (Order Center and Item Portrait) outside of the application. Open Catalog has its own free WordPress plugin, that makes the configuration smooth for customer websites, built on this CMS system. The other way of configuration is

The key features are:

-   Wide product customization - views, searches, filters
-   Real-time updates
-   Fast and easy configuration process
-   Support of multi-domains

### Pepperi Configuration

In the Backoffice, navigate to **Branded App** and select **Open Catalog**. Here you can create new or manage existing Open Catalog instances. Click on **Add Open Catalog**:

![](/static/image-130.png)

Choose required Pepperi Catalog:

![](/static/image-131.png)

After loading you'll see the configuration window of newly created Open Catalog. The information in **General** tab includes **Open Catalog Name**, chosen **Pepperi Catalog**, generated **Access Key** and **Scheduling** options. **History** tab contains logs and can be useful to check statuses and comments of previous publishings.

![](/static/image-132.png)

In **Access Key** section you can find a key, that should be placed in Wordpress plugin configuration:

![](/static/image-133.png)

Meanwhile, a new transaction, associated with the Open Catalog instance, will be created:

![](/static/image-134.png)

!!!warning
Open Catalog supports the customization of **Order Center Views** and **Search**. Cart is not available, as there is no possibility to place orders using Open Catalog.
!!!

After finishing with Pepperi Transaction configuration go to Open Catalog configuration again and click on **Publish** button to make your changes live on website. Publishing process may take some time based on your categories and items quantity. Wait until it finishes and check **History** tab to make sure that publishing was successful.

### Wordpress Configuration

Log in to your Wordpress admin panel and navigate to **Plugins** - **Add New Plugin**. Search for **Pepperi Open Catalog** plugin, install it and then activate:

![](/static/image-135.png)

After the installation you can access plugin configurations in **Settings** - **Pepperi Open Catalog**. On the first tab - **General** - there is a field **API Key**. Here you should set the key value from Pepperi configurations in order to link your Open Catalog to the website:

![](/static/image_2024-08-26_15-12-32.png)

There are 3 pages required for Open Catalog proper work:

-   Homepage
-   Products - the page where all items are listed
-   Product Details - the page with particular item description

Navigate to **Pages** and create 2 new pages for Products and Product Details:

![](/static/image_2024-08-26_15-14-02.png)

The logic of Open Catalog templates is built with *shortcodes*. You can use various page builders (Classic Editor, Gutenberg Editor, Elementor etc.) - the aim is to create proper layout to show Open Catalog data blocks. When blocks are set up in a wrong order - you may not see required data.

The best option is to create the layout using *Code Editor* tab, which is accessible in any page builder.

```
<div>
    <div>
        [pepperi_oc_top_bar]
    </div>
</div>

<div>
    <div>
        [pepperi_oc_breadcrumbs]
    </div>
</div>

<div style="display: flex; width: 100%;">
    <div style="width: 33.3%">
        [pepperi_oc_products_filter]
    </div>
    <div style="width: 66.6%">
        [pepperi_oc_products]
        [pepperi_oc_breadcrumbs]
    </div>
</div>
```

```
<div>
    <div>
        [pepperi_oc_top_bar]
    </div>
</div>

<div>
    <div>
        [pepperi_oc_breadcrumbs]
    </div>
</div>

<div>
    <div>
        [pepperi_oc_product_details]
    </div>
</div>
```

Now move back to Open Catalog plugin configurations, open **Pages** tab and set corresponding pages for **Home Page**, **Products Page** and **Product Information Page**. Here you also can configure the amount of items on one page - **\# of Product Per Page**:

![](/static/image_2024-08-26_15-13-06.png)

### Useful Tips

#### ❗Issue: Smart Search has values but showing 0 results

There is an issue when customer is using "and" in Smart Search field values. As a result, after clicking on this Samrt Search you'll see "No results were found". there is no search results (despite the fact that it works on Pepperi side):

![](/static/image_2024-08-27_16-08-29.png)

To fix it avoid using "and", by changing it to "&" for example:

![](/static/image_2024-08-27_16-09-23.png)

!!!info
‘and’ is a reserved word and should not be used inside open catalog. That is due to the fact Elastic uses ‘and’ as part of its query and if you add an 'and’ into your search phrase/category the query will return the wrong result no matter what
!!!

#### ❗Issue: Item Prop fields are empty

There is an issue when Item Prop fields are visible in Pepperi Transaction, but in Open Catalog on the website they have "None" values.

![](/static/image-136.png)

Item Portait View in Pepperi Transaction

![](/static/image-137.png)

Product Details page on the website

To fix this you need to create a separate field and set the value of Item Prop there using calculation field:

TSALineCalculationInit

```
// ...
var ItemProp1 = GetValueByApiName('ItemProp1');
var ItemProp2 = GetValueByApiName('ItemProp2');

SetValueByApiName('TSAItemLength', ItemProp1);
SetValueByApiName('TSAItemWidth', ItemProp2);
// ...
```

As a result, newly created TSA fields are visible in Open Catalog:

![](/static/image-138.png)

#### ❗Issue: Smart Search - not all values are present

Sometimes there is a situation when you have lots of values in Smart Search and in Pepperi they all are presented, but in Open Catalog (on the website) there is a limited amount of them.

!!!info
This is happening because of the restriction: amount of Smart Search values is limited to 100 in Open Catalog
!!!
