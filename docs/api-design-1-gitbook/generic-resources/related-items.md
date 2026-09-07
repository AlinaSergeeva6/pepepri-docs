---
description: Related items are items that are related to a specific item in the catalog.
---

# Related Items

The Related Items resource allows you to import a file or an object containing collections that include items along with their related items.

&#x20;You can configure these collections and items in your catalog in a carousel format, enabling the ability to navigate between items from the item information page.



For More Information:

{% embed url="https://support.pepperi.com/hc/en-us/articles/4444835679004-Related-Items" %}

### Resource Name:

related\_items



### Fields

**Key:**

* **Description:**  CollectionName\_ItemExternalID - used for editing or deleting existing Item.
* **Type:** String
* **Mandatory**: for updating
* **Read-only:**  for new entities
* **Default value**: CollectionName\_ItemExternalID&#x20;



_**CollectionName**_**:**

* **Description:** collection name.
* **Type:** string
* **Mandatory**: true



_**ItemExternalID**_**:**

* **Description:** The primary's item external id.
* **Type:** string
* **Mandatory**: true



**RelatedItems:**

* **Description:**  Array of external ids for the related items.
* **Type:** Array\[String]
* **Mandatory**: true



**Hidden:**

* **Description:** Used for deleting an item.
* **Type:** bool
* **Mandatory**: false
* **Default Value**: false



{% hint style="danger" %}
search endpoint is not supported
{% endhint %}
