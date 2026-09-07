---
description: Dynamic Quantity Pricing Manual
---

# Dynamic Quantity Pricing

Dynamic quantity pricing will modify the price according to the quantity ordered. The item price that will be presented on the screen will be according to the quantity selected from this item.

For example –

Item A; price for 1-10 units = 8$, price for 11-20 units = 6$, price for 21+ units = 5.5$

Step 1:

Create UDT with the following structure –

![](<../../.gitbook/assets/0 (1).png>)

MapDataExternalID = QtyPricing

MainKey = ItemExternalID

SecondaryKey = \[Null]

Values = {PricingJSON} definition below.

\*\* The UDT can also be formed in a way that MainKey/SecondaryKey will have Customer code/Price Level Code/ Pricing Group Code. This way quantity pricing for the same item varies for different Customer /Price Level/ Pricing Group.

Step 2:

Upload a file that holds the prices for each item. Do this through Settings > ERP Integration > File Upload and Logs > Upload > API MapData SelectiveOverwrite > Select the pricing CSV File you created. See example file structure below.

![](<../../.gitbook/assets/1 (25).png>)

Example file structure (file should with csv extension, delimiter by the settings in the backoffice > Settings > ERP Integration > Configuration):

| MapDataExternalID | MainKey | SecondaryKey | Values                    |
| ----------------- | ------- | ------------ | ------------------------- |
| QTYPricing        | UN10101 |              | {“0”:10,”5”:8,”10”:6}     |
| QTYPricing        | MaEy34  |              | {“0”:20,”5”:15,”10”:15.5} |

Values {PricingJSON}:

The structure of the JSON –

{Quantity1: Price1, Quantity2: Price2, Quantity3: Price3….}

![](<../../.gitbook/assets/2 (30).png>)

\*\* Price 1 needs to be the price for 1 peace from the item and have to exist for all items. Otherwise, the price for single unit will be stored else ware (for example – will be uploaded with the item file) and the formula that calculate the price will take this under consideration.

\*\*\*The formula which calculate the price can handle JSON that isn’t in ascending quantity order.

Step 3:

Defining the rule engine fields to retrieve the price.

1. Set a field to bring the JSON of the relevant item
2. Set a field to retrieve the price from the JSON
3. Set the pricing structure to consider the new fields as the ones determine the price

a) Set new field in the wanted transaction fields Transaction Line Item Fields Add custom field (Single Line Text, UDT)

![](<../../.gitbook/assets/3 (19).png>)

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

![](<../../.gitbook/assets/4 (14).png>)

1. Set the pricing structure to consider the new fields as the ones determine the price –

This can be done by feeding the value of UnitPriceAfterDiscount with the field we just created –

Go to the transaction settings > Fields > UnitPriceAfterDiscount > Edit > Select your field in the box: “Set value based on this field”

![](<../../.gitbook/assets/5 (16).png>)

Step 4:

Customize the tractions views to include the fields as you like.

![](<../../.gitbook/assets/6 (13).png>)

Bonus step:

Setup an additional text field to display all the quantity pricing options in the following format –

“

X Units X1 Price

Y Units Y1 Price

….

“

Display it in the Item details page.

Your all done!
