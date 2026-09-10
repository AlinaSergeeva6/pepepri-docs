---
title: "NetSuite Exapmles for Pricing"
description: "You can find implementation for Quantity Pricing, Price Level, Group Pricing and Item Pricing"
order: 162
---
# NetSuite Exapmles for Pricing

*You can find implementation for Quantity Pricing, Price Level, Group Pricing and Item Pricing*

### 1. Quantity Pricing

!!!info
NetSuite allows to setup pricing based on ordered quantity.

This functionality can be copied to Pepperi by following the steps below
!!!

Setup a saved search of items. The criteria should be the same as the items saved search.

The results tab should have the following data (assuming the &lt;Pepperi item External ID> = &lt;NetSuite Item Internal ID> :

![](/static/image-417.png)

in the integration platform, setup a dataflow task that uploads a UDT into Pepperi. The task settings:

in the pivot tab - add the following settings:

![](/static/image-418.png)

In the Settings tab - add the following settings:

![](/static/image-419.png)

Use the attached manual for creating the quantity pricing rules in Pepperi. Some changes might be needed, depending on the specific requirements.

Continue with the [Pepperi configuration for quantity pricing](https://app.gitbook.com/@pepperi/s/internal-knowledge-base/~/drafts/-LkOC4TjPd2SoQJbIqqk/primary/pepperi-configuration/dynamic-quantity-pricing) (or download the word version below)

735KB

[QTY Pricing Manual.docx](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Li2aPZlqauBq9fcxpjB%2F-Li2bFblkVgFWADTjElt%2FQTY%20Pricing%20Manual.docx?alt=media&token=88a693ea-6aea-4fb9-b22c-2b3c0a297dc7)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-Li2aPZlqauBq9fcxpjB%2F-Li2bFblkVgFWADTjElt%2FQTY%20Pricing%20Manual.docx?alt=media&token=88a693ea-6aea-4fb9-b22c-2b3c0a297dc7)

Pepperi - Setting up quantity pricing

### 2. Price Level

Settings up integration (Export) of NetSuite price levels into Pepperi

Price Levelfor this implementation, you will need to setup 2 saved searches -

1.  Price Level Headers
2.  Price Level Lines (Items)

\*Additional option - is to setup the price levels using UDTs, and not the basic Pepperi functionality. This can be useful (and necessary) when you will need to implement additional pricing modules of NetSuite into Pepperi (such as QTY pricing, Group Pricing and Custom Pricing)

1.Price Level Headers

![](/static/image-420.png)

2\. Price Level Lines

![](/static/image-421.png)

!!!info
for minimal results, criteria needs to match the item criteria saved search.
!!!

### 3. Group Pricing

Group pricing is a pricing matrix - each item is assigned to a *pricing group* and each customer, other then the main price level it is assigned to, can have *additional assignments of price level per pricing group of items.*

Example:

Customer A - main price level - Base Price

Item A1 - pricing group AAA

Item B2 - Pricing Group BBB

Item C3 - Pricing Group CCC

The customer has assignment of Pricing Group CCC with Price Level "Base - 20%"

The final pricing the customer will see -

Item A1 - Base Price

Item B2 - Base Price

Item C3 - Base - 20%

**Pepperi Implementation**

This can be implemented in Pepperi using UDTs. You should setup 2 UDTs -

-   Pricing Group - Price Level Assignment: MainKey = Customer External ID, SecondaryKey = Pricing Group, Values = Price Level

![](/static/image-422.png)

-   Price Level Item UDT: MainKey = Price Level, SecondaryKey = Item, Value=Price

![](/static/image-423.png)

!!!info
The value of the first UDT, will be used as the MainKey of the second UDT
!!!

**NetSuite Implementation**

1\. Account Saved Search updating

NetSuite provides multiple Price Lists. Each customer should be assigned to a Price List. In Pepperi, if a customer isn't assigned to a price list, it will show 0 price for all items. As a solution to avoid this, it is recommended to setup a formula field in the accounts search in NetSuite, so any missing assignments will be integrated into Pepperi, as if they are assigned to the "Basic Price" price list. Formula Field with the code below:

```
CASE
WHEN {pricelevel} IS NULL
THEN 'Base Price'
ELSE {pricelevel}
END
```

2\. Implementing Pricing Groups requires loading additional data for Items - in the NetSuite saved search, include Pricing Group field:

![](/static/image-424.png)

3\. Create Saved Search to load the Data to the PricingGroups UDT

![](/static/image-425.png)

4\. Create Saved Search to load the Data to the PricingLevelItem UDT

![](/static/image-426.png)

**Integration Implementation**‌

Create Dataflow Tasks for exporting UDT\`s data

Specify the settings below for each Dataflow Task:

|  |  |  |
| --- | --- | --- |
| saved\_search\_id | \= | customsearch\_XX\_XX\_XX (use the relevant Saved Search ID) |
| overwrite\_type | \= | selective |
| is\_new\_api | \= | 1 |

Schedule these dataflow tasks using the Scheduled Jobs section in the integration platform to provide regular integration updates.

**Configure TSA UDT field – to get Price Level by Pricing Group and Account ExternalID:**

![](/static/image-427.png)

The value of the first UDT, will be used as the MainKey of the second UDT. But to prevent cases when price group was not assigned to the item you need to create additional calculated field with formula:

```
var ret = TransactionAccountTSAPriceLevel;
if ( TSAPricingGroupLinePriceLevel != ''){
  ret =  TSAPricingGroupLinePriceLevel;
}
return ret;
```

![](/static/image-428.png)

**Configure TSA UDT field – to get Item Price by Price Level and Item ExternalID:**

![](/static/image-429.png)

### 4. Item Pricing

*Item Pricing* is a pricing module that creates assignment for a specific item, for specific customer with a specific price (or price level). This is a similar module to Pepperi's special price level.

Example:

Customer A - main price level - Base Price

Item A1 - Base Price = $29.99

Item A2 - Base Price = $54.00

Item A2 - Price Level AAA = $32.00

Item A3 - Base Price = $33.5

The customer main price level is "Base Price". The customer also has assignment of *Item Pricing* for item A1 = $21.99, and of *Item Pricing* for item A2 = Price Level AAA. For item A3 this customer has no *Item Pricing*.

The final pricing the customer will get -

Item A1 = $21.99

Item A2 - $32.00

Item A3 - $33.5

**Implementation**

This can be implemented in Pepperi using UDTs.

For each of the options - ***Item Pricing*** **with a specific price**, and ***Item Pricing*** **with price level**, we will use different implementation (both can be used together of course).

***Item Pricing*** **with a Specific Price - NetSuite Implementation**

NetSuite saved search:

Search Type: Customer

Criteria: \[Item Pricing Unit Price\] IS NOT EMPTY

|  |  |  |
| --- | --- | --- |
| Field | Formula | NS Custom Label |
| Formula (Text) | 'ItemPricingCustom' | MapDataExternalID |
| InternalID |  | MainKey |
| Pricing Item |  | SecondaryKey |
| Item Pricing Unit Price |  | Values |

***Item Pricing*** **with a Specific Price - Pepperi Implementation**

-   Create a UDT with the Name "ItemPricingCustom". Main Key = Catalog Name.

![](/static/image-430.png)

-   Create a field in the wanted transaction:
    -   Type = Decimal Number/Currency, UDT field.
    -   Table = ItemPricingCustom
    -   Main Key = Customer External ID
    -   Secondary Key = Item External ID

Create a dataflow task in the integration platform to upload this UDT to Pepperi with a daily scheduling.

***Item Pricing*** **with a Price Level - NetSuite Implementation**

NetSuite saved search:

Search Type: Customer

Criteria: \[Item Pricing Level\] IS NOT EMPTY and {itempricinglevel} is not 'Custom'

|  |  |  |
| --- | --- | --- |
| Field | Formula | NS Custom Label |
| Formula (Text) | 'ItemPricingPriceLevel' | MapDataExternalID |
| InternalID |  | MainKey |
| Pricing Item |  | SecondaryKey |
| Item Pricing Unit Price |  | Values |

***Item Pricing*** **with a Price Level - Pepperi Implementation**

-   Create a UDT with the Name "ItemPricingPriceLevel". Main Key = Catalog Name.

![](/static/image-431.png)

-   Create a field in the wanted transaction - TSAItemPricingPriceLevel:
    -   Type = Decimal Number/Currency, UDT field.
    -   Table = ItemPricingCustom
    -   Main Key = Customer External ID
    -   Secondary Key = Item External ID

Create a dataflow task in the integration platform to upload this UDT to Pepperi with a daily scheduling.

!!!info
The value in this field will give the final **price level** for this customer for this item
!!!

!!!info
If you already implemented Group Pricing (NetSuite) - you will not need to implement the next step, but use the table you already have as the next UDT
!!!

**UDT to get the item price for each Price Level**

**Pepperi:**

-   Price Level Item UDT: MainKey = Price Level, SecondaryKey = Item, Value=Price

![](/static/image-423.png)

**NetSuite:**

Create Saved Search to load the Data to the PricingLevelItem UDT

![](/static/image-426.png)

Final Pepperi field to get the price for the Item ***Item Pricing*** **with a Price Level**

-   Create a field in the wanted transaction - TSAItemPricingPriceLevel**Price**:
    -   Type = Decimal Number/Currency, UDT field.
    -   Table = PricingLevelItem
    -   Main Key = TSAItemPricingPriceLevel
    -   Secondary Key = Item External ID
