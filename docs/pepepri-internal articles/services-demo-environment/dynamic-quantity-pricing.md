---
title: "Dynamic Quantity Pricing"
description: "Dynamic Quantity Pricing Manual"
order: 17
---
# Dynamic Quantity Pricing

*Dynamic Quantity Pricing Manual*

Dynamic quantity pricing will modify the price according to the quantity ordered. The item price that will be presented on the screen will be according to the quantity selected from this item.

For example –

Item A; price for 1-10 units = 8$, price for 11-20 units = 6$, price for 21+ units = 5.5$

Step 1:

Create UDT with the following structure –

![](https://alinasergeeva6.github.io/pepepri-docs/static/assets_internal-knowledge-base_-LkOC4ktfz_M14OQvM7l_-LkOCN8gZREeA2FRqRAP_0.png)

MapDataExternalID = QtyPricing

MainKey = ItemExternalID

SecondaryKey = \[Null\]

Values = {PricingJSON} definition below.

\*\* The UDT can also be formed in a way that MainKey/SecondaryKey will have Customer code/Price Level Code/ Pricing Group Code. This way quantity pricing for the same item varies for different Customer /Price Level/ Pricing Group.

Step 2:

Upload a file that holds the prices for each item. Do this through Settings > ERP Integration > File Upload and Logs > Upload > API MapData SelectiveOverwrite > Select the pricing CSV File you created. See example file structure below.

![](https://alinasergeeva6.github.io/pepepri-docs/static/assets_internal-knowledge-base_-LkOC4ktfz_M14OQvM7l_-LkOCN8hmmiJmAzSOny7_1.png)

Example file structure (file should with csv extension, delimiter by the settings in the backoffice > Settings > ERP Integration > Configuration):

|  |  |  |  |
| --- | --- | --- | --- |
| MapDataExternalID | MainKey | SecondaryKey | Values |
| QTYPricing | UN10101 |  | {“0”:10,”5”:8,”10”:6} |
| QTYPricing | MaEy34 |  | {“0”:20,”5”:15,”10”:15.5} |

Values {PricingJSON}:

The structure of the JSON –

{Quantity1: Price1, Quantity2: Price2, Quantity3: Price3….}

![](https://alinasergeeva6.github.io/pepepri-docs/static/assets_internal-knowledge-base_-LkOC4ktfz_M14OQvM7l_-LkOCN8i7Us0ibimK2PY_2.png)

\*\* Price 1 needs to be the price for 1 peace from the item and have to exist for all items. Otherwise, the price for single unit will be stored else ware (for example – will be uploaded with the item file) and the formula that calculate the price will take this under consideration.

\*\*\*The formula which calculate the price can handle JSON that isn’t in ascending quantity order.

Step 3:

Defining the rule engine fields to retrieve the price.

1.  Set a field to bring the JSON of the relevant item
2.  Set a field to retrieve the price from the JSON
3.  Set the pricing structure to consider the new fields as the ones determine the price

a) Set new field in the wanted transaction fields Transaction Line Item Fields Add custom field (Single Line Text, UDT)

![](https://alinasergeeva6.github.io/pepepri-docs/static/assets_internal-knowledge-base_-LkOC4ktfz_M14OQvM7l_-LkOCN8jKDiBUlHsFWUj_3.png)

b) add another customer field – Currency type (or decimal) with the following formula –

```
var ret = UnitPrice;
var priceJson = JSON.parse(TSAQTYPriceJSON);
var maxQTY = 0;
for (var key in priceJson) {
 if (key >= maxQTY && UnitsQuantity >= key) {
 maxQTY = parseFloat(key);
 ret = priceJson[key];
 }
}
return ret;
```

\*\* make sure to add the UnitPrice, UnitsQuantity and the previous field you created to the available fields list.

![](https://alinasergeeva6.github.io/pepepri-docs/static/assets_internal-knowledge-base_-LkOC4ktfz_M14OQvM7l_-LkOCN8kg9vtv2i5O7WY_4.png)

1.  Set the pricing structure to consider the new fields as the ones determine the price –

This can be done by feeding the value of UnitPriceAfterDiscount with the field we just created –

Go to the transaction settings > Fields > UnitPriceAfterDiscount > Edit > Select your field in the box: “Set value based on this field”

![](https://alinasergeeva6.github.io/pepepri-docs/static/assets_internal-knowledge-base_-LkOC4ktfz_M14OQvM7l_-LkOCN8l620krWsDdGu7_5.png)

Step 4:

Customize the tractions views to include the fields as you like.

![](https://alinasergeeva6.github.io/pepepri-docs/static/assets_internal-knowledge-base_-LkOC4ktfz_M14OQvM7l_-LkOCN8mNaqkYBH34rQP_6.png)

Bonus step:

Setup an additional text field to display all the quantity pricing options in the following format –

“

X Units X1 Price

Y Units Y1 Price

….

“

Display it in the Item details page.

Your all done!
