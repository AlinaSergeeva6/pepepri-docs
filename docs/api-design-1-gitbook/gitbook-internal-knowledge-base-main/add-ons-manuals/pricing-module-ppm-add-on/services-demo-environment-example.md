---
description: How it works
---

# Services Demo Environment Example

## Live Demo

Go to the **Service Demo Environment** and open a **Coffee Order with the PPM add-on.**

Choose one of the following accounts to see how pricing works:

* **AA Kyiv Coffee Shop**
* **AA Odesa Coffee Shop**
* **AA Chernigiv Coffee Shop**
* **AA Kharkiv Coffee Shop**
* **AA Sumy Coffee Shop**

***

## General files we'll use for set up PPM module:

**Accounts:**

{% file src="../../.gitbook/assets/API Accounts.csv" %}

**Items:**

Before uploading items, make sure you create the necessary fields for **UOM (Unit of Measure)**.

1. Go to **Items -> UOM**.
2. Add a new record with the following details:
   * **id**: `EA`
   * **name**: `EA`
   * **factor**: `1`

{% file src="../../.gitbook/assets/Items.csv" %}

**Items Inventory:**

{% file src="../../.gitbook/assets/Inventory.csv" %}

**Catalog assignment for new account:**

{% hint style="warning" %}
1. Create a catalog named **"Coffee Drinks"** (if it doesn’t already exist).
2. Assign only **"Coffee Drinks"** items to this catalog.
{% endhint %}

{% file src="../../.gitbook/assets/API Catalog.csv" %}

***

## Steps to reproduce:&#x20;

### 1. Install add-ons.

* First, install the required add-ons to your environment if they are not already installed.
* Additionally, install the **UOM (Unit of Measure)** add-on, as this example uses UOM for pricing calculations.

***

### 2. Upload necessary files.

1. Go to **ERP Integration -> File Upload and Logs**.
2. Upload the files provided above.

***

### 3. Create and prepare new transaction.

<figure><img src="../../.gitbook/assets/image (757).png" alt="" width="426"><figcaption><p>Creating new transaction for PPM module</p></figcaption></figure>

#### 1. Install UOM add-on for this transaction

1. Go to the **UOM** tab.
2. Click **Install** -> **Ok**.
3. Set the parameters as shown in the screenshot below and click **Save**.

<figure><img src="../../.gitbook/assets/image (759).png" alt="" width="563"><figcaption></figcaption></figure>

#### 2. Create necessary fields.

* Header lever:
  * _TSAPPMLastUpdate_&#x20;
    * Type: **Single Line Text**
  * _TSAHasLicense_
    * Type: **Checkbox**
  * _TSAHasLicenseString - workaround for checkbox_
    * Type: **Single Line Text (Calculated Field)**
    * Formul&#x61;**:** \
      `return TSAHasLicense ? "true" : "false";`
    * Available fields: **TSAHasLicense**
* Line Level:&#x20;
  * _TSAItemTax_
    * Type: **Currency**
  * _TSANPMCalcMessage_
    * Type: **Single Line Text**
  * _TSANPMPricingData_
    * Type: **Single Line Text**
  * _TSAPPMUnitPrice_
    * Type: **Currency**
  * _TSAPPMLastLinePricingUpdate_
    * Type: **Single Line Text**
  * _TSAPPMTotalUnitsPrice_
    * Type: **Currency**

#### 3. Configure views.

<figure><img src="../../.gitbook/assets/Screenshot 2025-02-18 161023.png" alt="" width="190"><figcaption><p>Order banner view</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2025-02-18 160033.png" alt="" width="196"><figcaption><p>Grid Line View</p></figcaption></figure>

#### 4. Configure setting to show only new catalog.

<figure><img src="../../.gitbook/assets/image (760).png" alt=""><figcaption><p>Settings tab</p></figcaption></figure>

***

### 4. **Create UDC Collections and UDTs.**

1. Create **two UDC collections** as described in the **"General Setup"** article.
2. Create **two UDTs (User Defined Tables)** to store pricing data.

<figure><img src="../../.gitbook/assets/image (764).png" alt="" width="563"><figcaption></figcaption></figure>

{% hint style="info" %}
Don't forget to publish your collections.
{% endhint %}

<figure><img src="../../.gitbook/assets/image (765).png" alt=""><figcaption></figcaption></figure>

***

### 5. Upload scripts that will be used in flows.

<figure><img src="../../.gitbook/assets/image (766).png" alt=""><figcaption><p>Scripts page after uploading scripts</p></figcaption></figure>

***

### 6. Create flows for transaction.

* Using the **"General Setup"** article, create all the flows described there.
* Here’s how the setup should look:

<figure><img src="../../.gitbook/assets/image (767).png" alt=""><figcaption><p>Flow list page</p></figcaption></figure>

{% hint style="info" %}
Don't forget to publish your flows!
{% endhint %}

***

### 7. Add this flow to transaction events.

1. Go to **Sales Activities -> Transaction Types -> Coffee Order with PPM Add-on -> Events**.
2. Add events for:
   * **Transaction load**.
   * Every field that will be used in the calculation.

<figure><img src="../../.gitbook/assets/Screenshot 2025-02-18 122328.png" alt="" width="563"><figcaption><p>Transaction Event Tab </p></figcaption></figure>

In our example, we use the following fields:

* **TSAHasLicense** (header field):\
  Use a flow to calculate the price if this header field is changed.
* **TSAAOQMQuantity1** (line field):\
  Use a flow to calculate the price if this line field is changed.
* **TSAAOQMUOM1** (line field):\
  Use a flow to calculate the price if this line field is changed.

***

### 8. Create config file for PPM module and upload it.

{% file src="../../.gitbook/assets/config.json" %}
Our config.json file
{% endfile %}

For this example, we’ll use the following **config.json** file. Let’s break down what it does:

#### PPM\_General:

```json
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

* **Quantity**: Set to `UnitsQuantity`.
* **Price**: Set to our custom field for price calculation, `TSAPPMUnitPrice`.
* **TotalPrice**: Set to the final block, `CityDiscount`.

Additionally, configure the **UOM add-on** for pricing and assign UOM fields to it. For future requirements, point to the **UDC pricing table**.

#### **PPM\_CalcProcedures:**

```json
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

{% hint style="warning" %}
If no pricing data is found in the tables for condition and item, the pricing module uses the `InitialPrice` as the final price.
{% endhint %}

1. **Base**:
   * **Condition**: `INIP` (Initial Price).
   * Takes the initial price from the item price loaded with the items (item cost price).
   * **CalculatedOfPrice**: Field used to calculate the price, which is then added to the base price.
2. **LicenseTax**:
   * **Condition**: `LTIP` (License Tax Initial Price).
   * Takes the initial price from the previous block (**Base**).
   * **CalculatedOfPrice**: Points to the previous block (**Base**), so the calculation uses the final price from the **Base** block, recalculates it, and adds it to the **Base** price.
3. **CityDiscount**:
   * Uses the same logic as the **LicenseTax** block, but all calculations are based on the **LicenseTax** block.

**Calculated Item Fields**

* **TSAPPMUnitPrice**: Contains the price from the final block (**CityDiscount**). The `UOM Index` is set to `1`, so it represents the price for one unit.
* **TSAItemTax**: Contains the item tax. The calculation logic is the difference between the **LicenseTax** price and the **Base** price.
* **TSAPPMTotalUnitsPrice**: Represents the total price of all calculations multiplied by the units quantity. The price is taken from the final block (**CityDiscount**).

#### **PPM\_Conditions**

```json
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

#### PPM\_Tables

```json
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

* For example, for **TBL3**, the keys are `ItemExternalID` and `TransactionAccountCity`. When the pricing module searches this table, it uses these values from the transaction to find a match.

#### Uploading config

1. After creating the config file, go to **Configuration -> UDC -> PricingConfig**.
2. Click **Add**.
3. Use the following details:
   * **Key**: `"main"`.
   * **Schema**: Copy and paste the JSON from the config file.

<figure><img src="../../.gitbook/assets/image (771).png" alt=""><figcaption></figcaption></figure>

***

### 9. Define the procedure that will run for transaction.

* Export the transaction to retrieve its **UUID**.

<figure><img src="../../.gitbook/assets/image (772).png" alt=""><figcaption><p>Transaction export JSON</p></figcaption></figure>

1. Go to **Configuration -> UDC -> PricingATD**.
2. Click **Add**.
3. Use the following details:
   * **Key**: Use the `TransactionUUID` copied from the exported JSON file.
   * **Procedure**: Use the name of the procedure from the `config.json` file.

<figure><img src="../../.gitbook/assets/image (773).png" alt=""><figcaption></figcaption></figure>

***

### 10. Check if addon configured correctly

1. Start a new order and check the following:
   * If the **NPM Calc Message** shows an empty array.
   * If the **PPM Unit Price** displays the base price.
   * If both conditions are met, the configuration is correct.
2. Proceed to upload pricing data for the items.

<figure><img src="../../.gitbook/assets/image (774).png" alt=""><figcaption><p>NPM Calc Message fields show empty array</p></figcaption></figure>

***

### 11. Upload pricing data.

{% file src="../../.gitbook/assets/PPM_Values.csv" %}
Pricing data csv
{% endfile %}

{% hint style="warning" %}
Before upload this csv, change delimiter to _<mark style="color:red;">**;**</mark>_ in ERP configuration
{% endhint %}

The pricing data file contains the same structure for all items and conditions. Here’s a breakdown of some examples:

* **First Block Pricing Data**:
  * **Condition**: <mark style="color:blue;">`INIP`</mark>`@`<mark style="color:purple;">`TBL1`</mark>`@`<mark style="color:orange;">`Espresso`</mark>
    * Condition type: <mark style="color:blue;">`INIP`</mark>.
    * Table: <mark style="color:purple;">`TBL1`</mark> with fields <mark style="color:orange;">`ExternalID`</mark>.
  *   **Data**:

      ```json
      [[true,"","","1","","INIP_TBL1",[[0, "I", 5, "P", "", 0, "", "", 0]],"EA",""]]
      ```

      * This means the price is increased by **5** for any quantity of items. Applied to the EA unit.
* **Second Block Pricing Data**:
  * **Condition**: <mark style="color:blue;">`LTIP`</mark>`@`<mark style="color:purple;">`TBL2`</mark>`@`<mark style="color:orange;">`Espresso`</mark>`@`<mark style="color:red;">`false`</mark>
    * Condition type: <mark style="color:blue;">`LTIP`</mark>.
    * Table: <mark style="color:purple;">`TBL2`</mark> with fields <mark style="color:orange;">`ExternalID`</mark> + <mark style="color:red;">`TSAHasLicense`</mark>
  *   **Data**:

      ```json
      [[true,"","","1","","LTIP_TBL2",[[0, "I", 3, "%", "", 0, "", "", 0]],"EA",""]]
      ```

      * This means the price is increased by **3%** for any quantity of items. Applied to the EA unit.
* **Third Block Pricing Data**:
  * **Condition**: <mark style="color:blue;">`CDIP`</mark>`@`<mark style="color:purple;">`TBL3`</mark>`@`<mark style="color:orange;">`Espresso`</mark>`@`<mark style="color:red;">`Kyiv`</mark>
    * Condition type: <mark style="color:blue;">`CDIP`</mark>.
    * Table: <mark style="color:purple;">`TBL3`</mark> with fields <mark style="color:orange;">`ExternalID`</mark> + <mark style="color:red;">`AccountCity`</mark>.
  *   **Data**:

      ```json
      [[true,"","","1","","CDIP_TBL3",[[0, "D", 0.25, "%", "", 0, "", "", 0]],"EA",""]]
      ```

      * This means the price is decreased by **0.25%** for any quantity of items. Applied to the EA unit.

1. Go to **ERP Integration -> File Upload and Logs**.
2. Click **Upload**, select **"API MapData"**, and choose the pricing data file.

***

### 12. Check if pricing data calculates correctly

1. Create a new order and select one of the previously uploaded accounts.
2. Wait for the transaction to load.
3. If everything is configured correctly, you will see the expected results.
4. Check the **"Has License"** checkbox and observe how the price changes dynamically.

<figure><img src="../../.gitbook/assets/Screenshot 2025-02-18 164102.png" alt=""><figcaption></figcaption></figure>

{% hint style="success" %}
You’ve successfully set up and configured the PPM module. Now it’s time to enjoy a well-deserved cup of tea or coffee as a victory drink! 🎉☕
{% endhint %}
