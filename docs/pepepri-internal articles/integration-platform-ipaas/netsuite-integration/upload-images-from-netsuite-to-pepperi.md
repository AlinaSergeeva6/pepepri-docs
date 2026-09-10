---
title: "Upload Images from NetSuite to Pepperi"
order: 159
---
# Upload Images from NetSuite to Pepperi

**NetSuite:**

Create items saved search with 2 columns in the results:

1\. Internal ID (In case the item external id in Pepperi has a different value then the NS internal ID then use the same value). The custom label of the field in the saved search needs to match the mapping of the "Item External ID" in Pepperi.

2\. Image field id (can use custom image field as well), this will require to use a formula field in the saved search results

**Integration platform:**

Create a task of type – “image upload” to use the RESTlet deployment and to use the saved search ID that you created (saved\_search\_id in the settings tab)

![](/static/image-437.png)

\*Note that the internal ID has to use as Pepperi Item code for this integration to work.
