---
title: "Services Demo Environment Example"
description: "How it works"
order: 63
---
# Services Demo Environment Example

*How it works*

## Live Demo

Go to the **Service Demo Environment** and open a **Coffee Order with the PPM add-on.**

Choose one of the following accounts to see how pricing works:

-   **AA Kyiv Coffee Shop**
-   **AA Odesa Coffee Shop**
-   **AA Chernigiv Coffee Shop**
-   **AA Kharkiv Coffee Shop**
-   **AA Sumy Coffee Shop**

---

## General files we'll use for set up PPM module:

**Accounts:**

740B

[API Accounts.csv](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FLbAu5UfOzg8eSSaQtFlB%2FAPI%20Accounts.csv?alt=media&token=2b3261bd-c859-4563-bd60-b0084b446f39)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FLbAu5UfOzg8eSSaQtFlB%2FAPI%20Accounts.csv?alt=media&token=2b3261bd-c859-4563-bd60-b0084b446f39)

**Items:**

Before uploading items, make sure you create the necessary fields for **UOM (Unit of Measure)**.

1.  Go to **Items -> UOM**.
2.  Add a new record with the following details:
    -   **id**: `EA`
    -   **name**: `EA`
    -   **factor**: `1`

679B

[Items.csv](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FhBqvzrbzsXaBTVoPI3WC%2FItems.csv?alt=media&token=26dec884-31e9-4c9c-81e5-463c1aeb6c32)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FhBqvzrbzsXaBTVoPI3WC%2FItems.csv?alt=media&token=26dec884-31e9-4c9c-81e5-463c1aeb6c32)

**Items Inventory:**

138B

[Inventory.csv](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FPOG4hTKM84rxZOs8NlAn%2FInventory.csv?alt=media&token=893f6f03-bca4-488a-b5ec-6e9e3cbda00f)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FPOG4hTKM84rxZOs8NlAn%2FInventory.csv?alt=media&token=893f6f03-bca4-488a-b5ec-6e9e3cbda00f)

**Catalog assignment for new account:**

!!!warning
1.  Create a catalog named **"Coffee Drinks"** (if it doesn’t already exist).
2.  Assign only **"Coffee Drinks"** items to this catalog.

!!!

229B

[API Catalog.csv](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FyDHSR5DYcMZu6gwD1zLd%2FAPI%20Catalog.csv?alt=media&token=95698e3c-c546-4808-9156-481753b6c550)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FyDHSR5DYcMZu6gwD1zLd%2FAPI%20Catalog.csv?alt=media&token=95698e3c-c546-4808-9156-481753b6c550)

---

## Steps to reproduce:

### 1. Install add-ons.

-   First, install the required add-ons to your environment if they are not already installed.
-   Additionally, install the **UOM (Unit of Measure)** add-on, as this example uses UOM for pricing calculations.

---

### 2. Upload necessary files.

1.  Go to **ERP Integration -> File Upload and Logs**.
2.  Upload the files provided above.

---

### 3. Create and prepare new transaction.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-793.png)

Creating new transaction for PPM module

#### 1. Install UOM add-on for this transaction

1.  Go to the **UOM** tab.
2.  Click **Install** -> **Ok**.
3.  Set the parameters as shown in the screenshot below and click **Save**.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-794.png)

#### 2. Create necessary fields.

-   Header lever:
    -   *TSAPPMLastUpdate*
        -   Type: **Single Line Text**

    -   *TSAHasLicense*
        -   Type: **Checkbox**

    -   *TSAHasLicenseString - workaround for checkbox*
        -   Type: **Single Line Text (Calculated Field)**
        -   Formula**:** `return TSAHasLicense ? "true" : "false";`
        -   Available fields: **TSAHasLicense**

-   Line Level:
    -   *TSAItemTax*
        -   Type: **Currency**

    -   *TSANPMCalcMessage*
        -   Type: **Single Line Text**

    -   *TSANPMPricingData*
        -   Type: **Single Line Text**

    -   *TSAPPMUnitPrice*
        -   Type: **Currency**

    -   *TSAPPMLastLinePricingUpdate*
        -   Type: **Single Line Text**

    -   *TSAPPMTotalUnitsPrice*
        -   Type: **Currency**

#### 3. Configure views.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-02-18-161023.png)

Order banner view

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-02-18-160033.png)

Grid Line View

#### 4. Configure setting to show only new catalog.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-795.png)

Settings tab

---

### 4. Create UDC Collections and UDTs.

1.  Create **two UDC collections** as described in the **"General Setup"** article.
2.  Create **two UDTs (User Defined Tables)** to store pricing data.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-796.png)

!!!info
Don't forget to publish your collections.
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-797.png)

---

### 5. Upload scripts that will be used in flows.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-798.png)

Scripts page after uploading scripts

---

### 6. Create flows for transaction.

-   Using the **"General Setup"** article, create all the flows described there.
-   Here’s how the setup should look:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-799.png)

Flow list page

!!!info
Don't forget to publish your flows!
!!!

---

### 7. Add this flow to transaction events.

1.  Go to **Sales Activities -> Transaction Types -> Coffee Order with PPM Add-on -> Events**.
2.  Add events for:
    -   **Transaction load**.
    -   Every field that will be used in the calculation.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-02-18-122328.png)

Transaction Event Tab

In our example, we use the following fields:

-   **TSAHasLicense** (header field): Use a flow to calculate the price if this header field is changed.
-   **TSAAOQMQuantity1** (line field): Use a flow to calculate the price if this line field is changed.
-   **TSAAOQMUOM1** (line field): Use a flow to calculate the price if this line field is changed.

---

### 8. Create config file for PPM module and upload it.

3KB

[config.json](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FMZVPBL86OYwnP62hmO41%2Fconfig.json?alt=media&token=ded53a12-2a22-401c-ac4d-4d22fe557747)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FMZVPBL86OYwnP62hmO41%2Fconfig.json?alt=media&token=ded53a12-2a22-401c-ac4d-4d22fe557747)

Our config.json file

For this example, we’ll use the following **config.json** file. Let’s break down what it does:

#### PPM_General:

```
"PPM_General": {
    "QuantityCriteriaField": "UnitsQuantity",
    "PriceCriteriaField": "TSAPPMUnitPrice",
    "TotalPriceCriteria": {
      "Type": "Block",
      "Name": "CityDiscount"
    },
    "CalcDateField": "",
    "UOM": {
      "ConfigurationField": "ItemTSAUOMConversionObject",
      "AllowedUomsField": "ItemTSAAllowedUOM",
      "Fields": [
        {
          "Type": "TSAAOQMUOM1",
          "Quantity": "TSAAOQMQuantity1"
        }
      ]
    },
    "UDC": [
      "PricingGeneral"
    ]
  }
```

**Base Criteria Fields**

-   **Quantity**: Set to `UnitsQuantity`.
-   **Price**: Set to our custom field for price calculation, `TSAPPMUnitPrice`.
-   **TotalPrice**: Set to the final block, `CityDiscount`.

Additionally, configure the **UOM add-on** for pricing and assign UOM fields to it. For future requirements, point to the **UDC pricing table**.

#### PPM_CalcProcedures:

```
"PPM_CalcProcedures": [
    {
      "Key": "proc",
      "Blocks": [
        {
          "Key": "Base",
          "ConditionsOrder": [
            "INIP"
          ],
          "InitialPrice": {
            "Type": "Field",
            "Name": "ItemPrice"
          },
          "CalculatedOfPrice": {
            "Type": "Field",
            "Name": "TSAPPMUnitPrice"
          }
        },
        {
          "Key": "LicenseTax",
          "ConditionsOrder": [
            "LTIP"
          ],
          "InitialPrice": {
            "Type": "Block",
            "Name": "Base"
          },
          "CalculatedOfPrice": {
            "Type": "Block",
            "Name": "Base"
          }
        },
        {
          "Key": "CityDiscount",
          "ConditionsOrder": [
            "CDIP"
          ],
          "InitialPrice": {
            "Type": "Block",
            "Name": "LicenseTax"
          },
          "CalculatedOfPrice": {
            "Type": "Block",
            "Name": "LicenseTax"
          }
        }
      ],
      "CalculatedItemFields": [
        {
          "Name": "TSAPPMUnitPrice",
          "Type": "=",
          "Operand1": {
            "Type": "Block",
            "Name": "CityDiscount"
          },
          "BlockPriceField": {
            "Type": "Single",
            "UomIndex": 1
          }
        },
        {
          "Name": "TSAItemTax",
          "Type": "-",
          "Operand1": {
            "Type": "Block",
            "Name": "LicenseTax"
          },
          "Operand2": {
            "Type": "Block",
            "Name": "Base"
          },
          "BlockPriceField": {
            "Type": "Single",
            "UomIndex": 1
          }
        },
        {
          "Name": "TSAPPMTotalUnitsPrice",
          "Type": "=",
          "Operand1": {
            "Type": "Block",
            "Name": "CityDiscount"
          },
          "BlockPriceField": {
            "Type": "Total"
          }
        }
      ]
    }
  ],
```

This section describes the procedures for calculating the price for items. There are three blocks of price calculations:

!!!warning
If no pricing data is found in the tables for condition and item, the pricing module uses the `InitialPrice` as the final price.
!!!

1.  **Base**:
    -   **Condition**: `INIP` (Initial Price).
    -   Takes the initial price from the item price loaded with the items (item cost price).
    -   **CalculatedOfPrice**: Field used to calculate the price, which is then added to the base price.

2.  **LicenseTax**:
    -   **Condition**: `LTIP` (License Tax Initial Price).
    -   Takes the initial price from the previous block (**Base**).
    -   **CalculatedOfPrice**: Points to the previous block (**Base**), so the calculation uses the final price from the **Base** block, recalculates it, and adds it to the **Base** price.

3.  **CityDiscount**:
    -   Uses the same logic as the **LicenseTax** block, but all calculations are based on the **LicenseTax** block.

**Calculated Item Fields**

-   **TSAPPMUnitPrice**: Contains the price from the final block (**CityDiscount**). The `UOM Index` is set to `1`, so it represents the price for one unit.
-   **TSAItemTax**: Contains the item tax. The calculation logic is the difference between the **LicenseTax** price and the **Base** price.
-   **TSAPPMTotalUnitsPrice**: Represents the total price of all calculations multiplied by the units quantity. The price is taken from the final block (**CityDiscount**).

#### PPM_Conditions

```
"PPM_Conditions": [
    {
      "Key": "INIP",
      "Name": "INIP",
      "TablesSearchOrder": [
        "TBL1"
      ]
    },
    {
      "Key": "LTIP",
      "Name": "LTIP",
      "TablesSearchOrder": [
        "TBL2"
      ]
    },
    {
      "Key": "CDIP",
      "Name": "CDIP",
      "TablesSearchOrder": [
        "TBL3"
      ]
    }
  ],
```

This section describes the conditions and tables where the pricing data will be searched when a specific condition is met.

#### PPM_Tables

```
"PPM_Tables": [
    {
      "Key": "TBL1",
      "KeyFields": [
        "ItemExternalID"
      ]
    },
    {
      "Key": "TBL2",
      "KeyFields": [
        "ItemExternalID",
        "TransactionTSAHasLicenseString"
      ]
    },
    {
      "Key": "TBL3",
      "KeyFields": [
        "ItemExternalID",
        "TransactionAccountCity"
      ]
    }
  ]
```

This is the final part of the config, where we describe the tables from the **PPM\_Conditions** section and their keys.

-   For example, for **TBL3**, the keys are `ItemExternalID` and `TransactionAccountCity`. When the pricing module searches this table, it uses these values from the transaction to find a match.

#### Uploading config

1.  After creating the config file, go to **Configuration -> UDC -> PricingConfig**.
2.  Click **Add**.
3.  Use the following details:
    -   **Key**: `"main"`.
    -   **Schema**: Copy and paste the JSON from the config file.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-800.png)

---

### 9. Define the procedure that will run for transaction.

-   Export the transaction to retrieve its **UUID**.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-801.png)

Transaction export JSON

1.  Go to **Configuration -> UDC -> PricingATD**.
2.  Click **Add**.
3.  Use the following details:
    -   **Key**: Use the `TransactionUUID` copied from the exported JSON file.
    -   **Procedure**: Use the name of the procedure from the `config.json` file.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-802.png)

---

### 10. Check if addon configured correctly

1.  Start a new order and check the following:
    -   If the **NPM Calc Message** shows an empty array.
    -   If the **PPM Unit Price** displays the base price.
    -   If both conditions are met, the configuration is correct.

2.  Proceed to upload pricing data for the items.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-803.png)

NPM Calc Message fields show empty array

---

### 11. Upload pricing data.

6KB

[PPM\_Values.csv](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FQFkH0MI6gSaCPIuAs955%2FPPM_Values.csv?alt=media&token=2e54e7c9-f180-4e89-a222-832a23bf49bd)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FQFkH0MI6gSaCPIuAs955%2FPPM_Values.csv?alt=media&token=2e54e7c9-f180-4e89-a222-832a23bf49bd)

Pricing data csv

!!!warning
Before upload this csv, change delimiter to ***;*** in ERP configuration
!!!

The pricing data file contains the same structure for all items and conditions. Here’s a breakdown of some examples:

-   **First Block Pricing Data**:
    -   **Condition**: `INIP``@``TBL1``@``Espresso`
        -   Condition type: `INIP`.
        -   Table: `TBL1` with fields `ExternalID`.

    -   **Data**:

        ```
        [[true,"","","1","","INIP_TBL1",[[0, "I", 5, "P", "", 0, "", "", 0]],"EA",""]]
        ```

        -   This means the price is increased by **5** for any quantity of items. Applied to the EA unit.

-   **Second Block Pricing Data**:
    -   **Condition**: `LTIP``@``TBL2``@``Espresso``@``false`
        -   Condition type: `LTIP`.
        -   Table: `TBL2` with fields `ExternalID` \+ `TSAHasLicense`

    -   **Data**:

        ```
        [[true,"","","1","","LTIP_TBL2",[[0, "I", 3, "%", "", 0, "", "", 0]],"EA",""]]
        ```

        -   This means the price is increased by **3%** for any quantity of items. Applied to the EA unit.

-   **Third Block Pricing Data**:
    -   **Condition**: `CDIP``@``TBL3``@``Espresso``@``Kyiv`
        -   Condition type: `CDIP`.
        -   Table: `TBL3` with fields `ExternalID` \+ `AccountCity`.

    -   **Data**:

        ```
        [[true,"","","1","","CDIP_TBL3",[[0, "D", 0.25, "%", "", 0, "", "", 0]],"EA",""]]
        ```

        -   This means the price is decreased by **0.25%** for any quantity of items. Applied to the EA unit.

1.  Go to **ERP Integration -> File Upload and Logs**.
2.  Click **Upload**, select **"API MapData"**, and choose the pricing data file.

---

### 12. Check if pricing data calculates correctly

1.  Create a new order and select one of the previously uploaded accounts.
2.  Wait for the transaction to load.
3.  If everything is configured correctly, you will see the expected results.
4.  Check the **"Has License"** checkbox and observe how the price changes dynamically.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-02-18-164102.png)

!!!success
You’ve successfully set up and configured the PPM module. Now it’s time to enjoy a well-deserved cup of tea or coffee as a victory drink! 🎉☕
!!!
