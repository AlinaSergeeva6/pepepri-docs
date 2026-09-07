---
description: >-
  You can find implementation for Quantity Pricing, Price Level, Group Pricing
  and Item Pricing
---

# NetSuite Exapmles for Pricing

### 1. Quantity Pricing

{% hint style="info" %}
NetSuite allows to setup pricing based on ordered quantity.&#x20;

This functionality can be copied to Pepperi by following the steps below
{% endhint %}

Setup a saved search of items. The criteria should be the same as the items saved search.&#x20;

The results tab should have the following data (assuming the \<Pepperi item External ID> = \<NetSuite Item Internal ID>  :

![](<../../../../.gitbook/assets/image (328).png>)

in the integration platform, setup a dataflow task that uploads a UDT into Pepperi. The task settings:

in the pivot tab - add the following settings:

![](<../../../../.gitbook/assets/image (377).png>)



In the Settings tab - add the following settings:

![](<../../../../.gitbook/assets/image (326).png>)

Use the attached manual for creating the quantity pricing rules in Pepperi. Some changes might be needed, depending on the specific requirements.&#x20;

Continue with the [Pepperi configuration for quantity pricing](https://app.gitbook.com/@pepperi/s/internal-knowledge-base/~/drafts/-LkOC4TjPd2SoQJbIqqk/primary/pepperi-configuration/dynamic-quantity-pricing) (or download the word version below)&#x20;

{% file src="../../../../.gitbook/assets/QTY Pricing Manual.docx" %}
Pepperi - Setting up quantity pricing
{% endfile %}

### 2. Price Level

Settings up integration (Export) of NetSuite price levels into Pepperi

Price Levelfor this implementation, you will need to setup 2 saved searches -&#x20;

1. Price Level Headers
2. Price Level Lines (Items)

\*Additional option - is to setup the price levels using UDTs, and not the basic Pepperi functionality. This can be useful (and necessary) when you will need to implement additional pricing modules of NetSuite into Pepperi (such as QTY pricing, Group Pricing and Custom Pricing)

1.Price Level Headers

![](<../../../../.gitbook/assets/image (358).png>)

2\. Price Level Lines

![](<../../../../.gitbook/assets/image (373).png>)

{% hint style="info" %}
for minimal results, criteria needs to match the item criteria saved search.&#x20;
{% endhint %}

### 3. Group Pricing

Group pricing is a pricing matrix - each item is assigned to a _pricing group_ and each customer, other then the main price level it is assigned to, can have _additional assignments of price level per pricing group of items._&#x20;

Example:

Customer A - main price level - Base Price

Item A1 - pricing group AAA

Item B2 - Pricing Group BBB

Item C3 - Pricing Group CCC

The customer has assignment of Pricing Group CCC with Price Level "Base - 20%"

The final pricing the customer will see -&#x20;

Item A1 - Base Price

Item B2 - Base Price

Item C3 - Base - 20%

**Pepperi Implementation**

This can be implemented in Pepperi using UDTs. You should setup 2 UDTs -

* Pricing Group - Price Level Assignment: MainKey = Customer External ID, SecondaryKey = Pricing Group, Values = Price Level

![](<../../../../.gitbook/assets/image (507).png>)

* Price Level Item UDT: MainKey = Price Level, SecondaryKey = Item, Value=Price

![](<../../../../.gitbook/assets/image (511).png>)

{% hint style="info" %}
The value of the first UDT, will be used as the MainKey of the second UDT
{% endhint %}

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

![](<../../../../.gitbook/assets/image (189).png>)

3\. Create Saved Search to load the Data to the PricingGroups UDT

![](<../../../../.gitbook/assets/image (375).png>)

4\. Create Saved Search to load the Data to the PricingLevelItem UDT

![](<../../../../.gitbook/assets/image (234).png>)

\
**Integration Implementation**‌

Create Dataflow Tasks for exporting UDT\`s data

Specify the settings below for each Dataflow Task:

| saved\_search\_id | = | customsearch\_XX\_XX\_XX  (use the relevant Saved Search ID) |
| ----------------- | - | ------------------------------------------------------------ |
| overwrite\_type   | = | selective                                                    |
| is\_new\_api      | = | 1                                                            |

Schedule these dataflow tasks using the Scheduled Jobs section in the integration platform to provide regular integration updates.

**Configure TSA UDT field – to get Price Level by Pricing Group and Account ExternalID:**

![](<../../../../.gitbook/assets/image (203).png>)

The value of the first UDT, will be used as the MainKey of the second UDT. But to prevent cases when price group was not assigned to the item you need to create additional calculated field with formula:

```
var ret = TransactionAccountTSAPriceLevel;
if ( TSAPricingGroupLinePriceLevel != ''){
  ret =  TSAPricingGroupLinePriceLevel;
}
return ret;
```

![](<../../../../.gitbook/assets/image (379).png>)

**Configure TSA UDT field – to get Item Price by Price Level and Item ExternalID:**

![](<../../../../.gitbook/assets/image (484).png>)

### 4. Item Pricing

_Item Pricing_ is a  pricing module that creates assignment for a specific item, for specific customer with a specific price (or price level). This is a similar module to Pepperi's special price level.

Example:

Customer A - main price level - Base Price

Item A1 - Base Price = $29.99

Item A2 - Base Price = $54.00

Item A2 - Price Level AAA = $32.00

Item A3 - Base Price = $33.5

The customer main price level is "Base Price". The customer also has assignment of _Item Pricing_ for item A1  = $21.99, and of _Item Pricing_ for item A2 = Price Level AAA. For item A3 this customer has no _Item Pricing_.&#x20;

The final pricing the customer will get -&#x20;

Item A1 = $21.99

Item A2 - $32.00

Item A3 - $33.5

**Implementation**

This can be implemented in Pepperi using UDTs.&#x20;

For each of the options - _**Item Pricing**_**&#x20;with a specific price**, and _**Item Pricing**_**&#x20;with price level**, we will use different implementation (both can be used together of course).&#x20;

_**Item Pricing**_**&#x20;with a Specific Price - NetSuite Implementation**

NetSuite saved search:

Search Type: Customer

Criteria: \[Item Pricing Unit Price] IS NOT EMPTY

| Field                   | Formula              | NS Custom Label    |
| ----------------------- | -------------------- | ------------------ |
| Formula (Text)          | 'ItemPricingCustom'  | MapDataExternalID  |
| InternalID              |                      | MainKey            |
| Pricing Item            |                      | SecondaryKey       |
| Item Pricing Unit Price |                      | Values             |

_**Item Pricing**_**&#x20;with a Specific Price - Pepperi Implementation**

* Create a UDT with the Name "ItemPricingCustom". Main Key = Catalog Name.

![](<../../../../.gitbook/assets/image (448).png>)

* Create a field in the wanted transaction:
  * Type = Decimal Number/Currency, UDT field.&#x20;
  * Table = ItemPricingCustom
  * Main Key = Customer External ID
  * Secondary Key = Item External ID

Create a dataflow task in the integration platform to upload this UDT to Pepperi with a daily scheduling.&#x20;

_**Item Pricing**_**&#x20;with a Price Level - NetSuite Implementation**

NetSuite saved search:

Search Type: Customer

Criteria:&#x20;\[Item Pricing Level] IS NOT EMPTY and {itempricinglevel} is not 'Custom'

| Field                   | Formula                  | NS Custom Label   |
| ----------------------- | ------------------------ | ----------------- |
| Formula (Text)          | 'ItemPricingPriceLevel'  | MapDataExternalID |
| InternalID              |                          | MainKey           |
| Pricing Item            |                          | SecondaryKey      |
| Item Pricing Unit Price |                          | Values            |

_**Item Pricing**_**&#x20;with a Price Level - Pepperi Implementation**

* Create a UDT with the Name "ItemPricingPriceLevel". Main Key = Catalog Name.

![](<../../../../.gitbook/assets/image (392).png>)

* Create a field in the wanted transaction - TSAItemPricingPriceLevel:
  * Type = Decimal Number/Currency, UDT field.&#x20;
  * Table = ItemPricingCustom
  * Main Key = Customer External ID
  * Secondary Key = Item External ID

Create a dataflow task in the integration platform to upload this UDT to Pepperi with a daily scheduling.&#x20;

{% hint style="info" %}
The value in this field will give the final **price level** for this customer for this item
{% endhint %}

{% hint style="info" %}
If you already implemented [Group Pricing (NetSuite)](/broken/pages/-Lir7K3rzahpmfTwhhop) - you will not need to implement the next step, but use the table you already have as the next UDT
{% endhint %}



**UDT to get the item price for each Price Level**

**Pepperi:**

* Price Level Item UDT: MainKey = Price Level, SecondaryKey = Item, Value=Price

![](<../../../../.gitbook/assets/image (511).png>)

**NetSuite:**

Create Saved Search to load the Data to the PricingLevelItem UDT

![](<../../../../.gitbook/assets/image (234).png>)

Final Pepperi field to get the price for the Item _**Item Pricing**_**&#x20;with a Price Level**

* Create a field in the wanted transaction - TSAItemPricingPriceLevel**Price**:
  * Type = Decimal Number/Currency, UDT field.&#x20;
  * Table = PricingLevelItem
  * Main Key = TSAItemPricingPriceLevel
  * Secondary Key = Item External ID
