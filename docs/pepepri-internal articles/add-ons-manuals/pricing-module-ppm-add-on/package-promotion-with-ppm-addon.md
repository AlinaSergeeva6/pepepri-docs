---
title: "Package Promotion with PPM addon"
description: "Integration between the Package promotion to the Pricing module"
order: 64
---
# Package Promotion with PPM addon

*Integration between the Package promotion to the Pricing module*

---

## Implementation Ways for Pricing and Packages

There are two possible implementations for pricing and packages:

---

#### 1. Package Promotion Retrieves Item Prices from the Sales Order

-   **Description**: The package promotion gets the item prices directly from the sales order.
-   **Use Case**:
    -   No need to calculate item prices in the package transaction.
    -   Suitable when there are no quantity discounts for package items (or when such discounts should not apply).

---

#### 2. Package Promotion Calls the Pricing Module

-   **Description**: The package promotion calls the pricing module to calculate item prices.
-   **Use Case**:
    -   Suitable when quantity discounts are part of the pricing and should be reflected in the package (affecting the package’s total price).

---

### General Notes

-   The package discount is recalculated as part of the pricing calculation.
-   This allows control over the order of package discounts and ensures tax is calculated after applying the package discount.

---

### Common Setup for Package Promotion and Pricing

**Sales Order Transaction**

Add the following **line fields** to hold package discount details (translated into pricing conventions):

1.  **TSAPromoLineDiscount** (decimal): Stores the discount value.
2.  **TSAPromoLineDiscountName** (string): Stores the discount name.
3.  **TSAPromoLineDiscountType** (string): Stores the discount type.

**Package Promotion Transaction**

Add the following **line fields** to hold package discount details (can be the same as in the Sales Order transaction):

1.  **TSAPromoLineDiscount**
2.  **TSAPromoLineDiscountName**
3.  **TSAPromoLineDiscountType**

Add a **header string field** to update these three fields with the package discount:

-   **TSASetPricingFieldsWithPromotionResult**
    -   This field is **on-demand** with the following code and should be called in the workflow.

```
// SetPricingFieldsWithPromotionResult - with additional fields
// This code:
// 1. updates a pricing set of fields with the result of the package promotion discount while limiting the discount as manually defined
// Pre-req: None
// Trigger: On-Demand
// To do:
// 1. add this code as a header On-demand field in the package transaction.
// 2. call this field from the workflow of 'continue' in line 3 (after the stop condition)
// Note: similar code exists in the additional item transaction. need to update it as well.
// return details from the promo which should be set on the items
function getPromoDetails() {
  var ret = {
    tierGetType: "",
    additinalItemTierGetType: "",
  };
  var details = GetValueByApiName("TSAPPIPackagePromotionStartDetails");
  var appliedTier = GetValueByApiName(
    "TSAPPIPackagePromotionStartAppliedTierSetbyAPI"
  );
  if (details != "") {
    var detailsObj = JSON.parse(details);
    // Calculate the tier Get type
    if (detailsObj.Breakpoints) {
      var foundTiers = detailsObj.Breakpoints.filter(function (ele) {
        return ele.MinTotal == appliedTier;
      });
      if (foundTiers.length > 0) {
        ret.tierGetType = foundTiers[0].ValueType;
        if (
          ret.tierGetType == "AdditionalItem" &&
          foundTiers[0].Value &&
          foundTiers[0].Value.length > 0
        ) {
          ret.additinalItemTierGetType = foundTiers[0].Value[0].ValueType;
        }
      }
    }
  }
  return ret;
}
// set values to cart item prior to re-applying prices
function setValuesToCartItems(promotionCode) {
  var transactionUUID = GetValueByApiName("UUID");
  // Get the current cart items
  var fields = [
    "UUID",
    "LineNumber",
    "ItemWrntyID",
    "TSAPPIPackagePromotionStartItemDiscountSetbyAPI",
    "TSAPPIPackagePromotionStartItemRelativePriceSetbyAPI",
    "TSAPPIPackagePromotionStartItemQuantitySetbyAPI",
    "TSAPPIPackagePromotionStartItemTotalPriceSetbyAPI",
    "TSAPPIPackagePromotionStartUnitPriceCalculated",
    "TSAPPIPackagePromotionStartAppliedValueTypeSetbyAPI",
    "TSAPPIPackagePromotionStartAppliedValueSetbyAPI",
  ];
  var res = pepperi.api.transactionLines.search({
    fields: fields,
    filter: {
      Operation: "AND",
      LeftNode: {
        Operation: "IsEqual",
        ApiName: "TransactionUUID",
        Values: [transactionUUID.replace(/-/g, "")],
      },
      RightNode: {
        Operation: ">",
        ApiName: "UnitsQuantity",
        Values: ["0"],
      },
    },
    pageSize: 10000,
  });
  // set the pricing fields with the promotion discounts
  if (res.success && res.objects && res.objects.length > 0) {
    var newLines = [];
    for (var line of res.objects) {
      var discount = line["TSAPPIPackagePromotionStartItemDiscountSetbyAPI"];
      //limit the discount
      var unitAmount =
        line["TSAPPIPackagePromotionStartUnitPriceCalculated"] -
        line["TSAPPIPackagePromotionStartItemRelativePriceSetbyAPI"];
      // set the properties of the pricing engine: value type and name (by default, discount is used)
      var pricingType = "DP";
      var pricingValue = discount;
      if (
        line["TSAPPIPackagePromotionStartAppliedValueTypeSetbyAPI"] ==
          "DiscountPrice" ||
        line["TSAPPIPackagePromotionStartAppliedValueTypeSetbyAPI"] ==
          "ItemDiscountPrice"
      ) {
        pricingType = "DC";
        pricingValue = unitAmount;
      } else if (
        line["TSAPPIPackagePromotionStartAppliedValueTypeSetbyAPI"] ==
          "Price" ||
        line["TSAPPIPackagePromotionStartAppliedValueTypeSetbyAPI"] ==
          "ItemPrice"
      ) {
        pricingType = "S";
        pricingValue =
          line["TSAPPIPackagePromotionStartItemRelativePriceSetbyAPI"];
      }
      // if you get additional item, then there is no discount value for the item (since there is no price for the item since the pricing module will calculate the item price)
      // in this case, use the applied value (since its either a simple price or percentage discount value (and not a package price/discount))
      if (pricingValue == 0) {
        pricingValue = line["TSAPPIPackagePromotionStartAppliedValueSetbyAPI"];
      }
      var newObj = {
        UUID: line["UUID"],
        // update PromoLineDiscount fields. These fields are used in the pricing as manual pricing, so they are added into the applied rules message
        TSAPromoLineDiscount: pricingValue,
        TSAPromoLineDiscountType: pricingType,
        TSAPromoLineDiscountName: promotionCode,
      };
      newLines.push(newObj);
    }
    // update the cart lines
    var x = pepperi.api.transactionLines.update({
      objects: newLines,
    });
  }
}
// read promotion details
var promoDetails = getPromoDetails();
// calc promotion code
var promotionExternalID = GetValueByApiName(
  "TSAPPIPackagePromotionStartLeadingItemReference.ExternalID"
);
var promotionCode = GetValueByApiName(
  "TSAPPIPackagePromotionStartPromotionCodeConfiguration"
);
if (promotionCode == "") {
  promotionCode = promotionExternalID;
}
promotionCode = "ZSFA_" + promotionCode;
// update cart items with calculated promo values
setValuesToCartItems(promotionCode);
return "";
```

#### Workflow Setup

1.  **At Package Transaction Workflow**:
    -   Call the **TSASetPricingFieldsWithPromotionResult** field in the workflow’s **‘Done’** step (after the stop condition).

2.  **Merge Actions**:
    -   Add the three **TSAPromoLineDiscountXXX** fields to both merge actions.

#### Pricing Configuration

-   Add a **pricing condition** to apply user manual discounts based on the above fields.
    -   **Example**: A condition that applies discounts using `TSAPromoLineDiscount`, `TSAPromoLineDiscountName`, and `TSAPromoLineDiscountType`.

```
{
    "Key": "SFAPromo",
    "ConditionsOrder": [],
    "InitialPrice": {
        "Type": "Block",
        "Name": "PreviousDiscountCondition"
    },
    "CalculatedOfPrice": {
        "Type": "Block",
        "Name": "PreviousDiscountCondition"
    },
    "UserManual": {
        "ValueField": "TSAPromoLineDiscount",
        "NameField": "TSAPromoLineDiscountName",
        "TypeField": "TSAPromoLineDiscountType"
   }
}
```

#### UOM configuration (Optional)

If you are using **UOM (Unit of Measure)** in your transaction, follow these steps to ensure the correct addition of packages to the cart:

---

#### 1. Modify TSAPPIPackagePromotionStartUpdateLeadingItem

1.  **Locate the Field**:
    -   In the package transaction, find the **TSAPPIPackagePromotionStartUpdateLeadingItem** field.

2.  **Edit the Formula**:
    -   Modify the formula before the `return` statement to ensure proper UOM handling.

    ```
    var x = pepperi.api.transactionLines.setValueByFieldName({
      uuid: GetValueByApiName("PSARefToLeadingOrderItem"),
      fieldName: "TSAAOQMQuantity1",
      value: 1,
    });
    ```

---

#### 2. Workflow Setup

1.  **Merge Actions**:
    -   Add the following fields to **both merge actions**:
        -   **TSAAOQMUOM1**: The UOM field for the item.
        -   **TSAAOQMQuantity1**: The quantity field for the item.

---

### Integration When Price is Retrieved from the Sales Order

In addition to the common setup:

-   Retrieve the item price from the sales order.
    -   Follow the instructions in the line field **TSAPPIPackagePromotionStartUnitPriceCalculated**.

---

### Integration When Price is Calculated in the Package Transaction

In addition to the common setup:

1.  **Install the Pricing Module**:
    -   Install the pricing module on the package transaction (similar to the sales order).
        -   Define the procedure, events, and required fields.

2.  **Add Required Fields**:
    -   Add all fields required by the pricing module (input and output) to the package transaction.
    -   Retrieve their values from the Sales Order transaction using the **TSAPPIPackagePromotionStartGetOriginalOrderFields** field.

3.  **Use Calculated Price**:
    -   Follow the instructions in the line field **TSAPPIPackagePromotionStartUnitPriceCalculated** to use the calculated price for the package.

4.  **Merge Actions**:
    -   Add all required pricing fields (including **TSANPMCalcMessage**) to both merge actions.

5.  **Call the Pricing Module**:
    -   Add a **header checkbox field** named **TSAEmitEventCalcPrice**.
    -   Add an event on **CalcPrice** that:
        -   Calls the pricing module for all cart items.
        -   Triggers the **calculate totals** script.

**Workflow Setup**

-   After the **Calculate Field Formula** step for **‘Set Pricing Field With Promotion Result’**:
    -   Add an **Alert on Condition** for the **TSAEmitEventCalcPrice** field.
    -   Set it to notify when **True** (default).
    -   This triggers the **CalcPrice** event, which calls the pricing code.

---
