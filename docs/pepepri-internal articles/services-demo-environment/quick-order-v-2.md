---
title: "Quick Order v.2"
description: "Effort Estimation: 2h"
order: 24
---
# Quick Order v.2

*Effort Estimation: 2h*

![](/static/image-958.png)

### Description:

This feature allows you to easily add items to an order. You can do this by either the search line or by using a barcode scanner.

Switch Keypad/Scanner: If needed, you can also manually enter the item ID using the on-screen keyboard. To access the on-screen keyboard, click on the Switch Keypad/Scanner.

Switch Scanner mode: Remove/Add: This allows you to choose whether the quantity of an item being added for the second time should be included or deducted. The Scanning Multiplier feature allows you to select the quantity for this addition or subtraction.

After adding an item, you can edit the quantity or delete it.

![](/static/image-959.png)

### Advantages and disadvantages

!!!success
Allows to add items in a quick way, using a barcode scanner or a search line
!!!

!!!success
Allows to select the quantity for of added or subtracted items by using Scanning Multiplier
!!!

!!!warning
There could be a need in creating new custom item fields or editing the code to include existing ones
!!!

### Demo - how does it work:

The demo is available on [Services Demo Environment](/services-demo-environment/features.md).

1.  Sales Order -> Hamburger-menu -> “QuickOrder”;
2.  Add or subtract items using a barcode scanner or search line;
3.  Edit the items' quantity if needed;
4.  Press the "Done" button;
5.  In Order Center or a Cart, you can see the updated quantity of the items.

### How to copy to another environment:

1) Go to Sales Activity -> Transaction type -> Sales Order -> Programs;
2) Copy the QuickOrder program which contains a custom form to your environment.
3) Check if in your environment there are such fields as:

```
"ItemTSAItemCode" - same as ItemExternalID
"ItemTSAInStockQuantity" - available item quantity
"ItemTSAMaximumOrderQuantity" - maximum item quantity that could be ordered
```

4) Add created program to Views -> Menu -> Order Center Menu / Cart Menu.
