---
description: Slugs are human readable identifiers.
---

# slugs

### Description

Slugs typically used for URLs. Pepperi web app navigation and deep links are based on slugs. Slugs will add the ability to create new navigations and assignment of different content (page) per slug based on profile. A link to that resources documentation can be helpful as well.  &#x20;

### Fields

_**Name**_**:**

* **Description:** Slug name.
* **Type:** string
* **Mandatory**: true
* **Default Value**: empty string.

_**Hidden**_**:**

* **Description:** Used for deleteing an asset.
* **Type:** bool
* **Mandatory**: false
* **Default Value**: false

_**Description**_**:**

* **Description:** Slug description.&#x20;
* **Type:** string
* **Mandatory**: false
* **Default Value**: null

**Slug:**

* **Description:** Should contains only lowercase characters & without any spaces
* **Type:** string
* **Mandatory**: true
* **Default Value**: null

**Key:**

* **Description:**  UUID - used for edit or delete exiting slug.
* **Type:** string
* **Mandatory**: false
* **Default Value**: null
