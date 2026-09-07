---
description: UOM Module Implementation Guide
---

# UOM Add-on Module

## **UOM Module Implementation Guide**

### 1.  **Installation**

Before you start working with the UOM add-on, you need to install it to your environment. To do this, use Postman and the following POST API requests:

{% embed url="https://papi.pepperi.com/v1.0/addons/installed_addons/1238582e-9b32-4d21-9567-4e17379f41bb/install" %}
UOM Add-on request
{% endembed %}

### **2. UOM Definitions Setup**

#### **Creating Unit of Measures**

*   Navigate to: **Items → UOMs → Add**

    <figure><img src="../.gitbook/assets/image (1311).png" alt="" width="563"><figcaption></figcaption></figure>
*   Define your UOMs with:

    * **ID**: Technical name (e.g., "CS", "EA")
    * **Name**: Description (e.g., "Case", "Each")
    * **Factor**: Package quantity (e.g., 6 for "CS" meaning 6 units per case)

    <figure><img src="../.gitbook/assets/image (1312).png" alt="" width="332"><figcaption></figcaption></figure>

_Example Configuration:_

| ID | Name | Factor |
| -- | ---- | ------ |
| CS | Case | 6      |
| EA | Each | 1      |
| PK | Pack | 12     |

***

### **3. Item Configuration**

#### **Custom Fields Setup**

1. Navigate to: **Items → Fields → Add Custom Field**
2. Create two fields:

*   **TSAAllowedUOMs**: Stores available UOMs (JSON array)

    ```json
    ["CS", "EA"]
    ```
*   **TSAUOMConversionObject**: Defines base UOM relationships

    ```json
    [{"UOMKey":"CS","Factor":6},{"UOMKey":"EA","Factor":1}]
    ```

<figure><img src="../.gitbook/assets/image (1305).png" alt=""><figcaption></figcaption></figure>

{% file src="../.gitbook/assets/Exportitems_25875820.csv" %}
Example of csv file with UOM data
{% endfile %}

***

### **4. Transaction Configuration**

1.  Go to: **Sales Activity → Transaction Types → \<Your Transaction>→ UOM Tab**

    <figure><img src="../.gitbook/assets/image (1306).png" alt="" width="563"><figcaption></figcaption></figure>
2. Map fields:
   * **Allowed UOMs Field** → `TSAAllowedUOMs`
   * **UOM Configuration Field** → `TSAUOMConversionObject`
3. Click **Install**
   * Add-on installs 4 fields that have **AOQM prefix**.

#### **AOQM Fields (Auto-created by Add-on)**

| Field              | Purpose                               |
| ------------------ | ------------------------------------- |
| `TSAAOQMUOM1`      | Primary UOM dropdown (dynamic values) |
| `TSAAOQMUOM2`      | Secondary UOM dropdown (optional)     |
| `TSAAOQMQuantity1` | Quantity for primary UOM              |
| `TSAAOQMQuantity2` | Quantity for secondary UOM            |

<figure><img src="../.gitbook/assets/image (1307).png" alt="" width="563"><figcaption></figcaption></figure>

***

### **5. User Workflow Example**

<figure><img src="../.gitbook/assets/image (1309).png" alt="" width="563"><figcaption></figcaption></figure>

1. **Select Item**: HT3010 (pre-configured with CS=6 units)
2. **Choose UOM**: Select "CS" from `TSAAOQMUOM1` dropdown
3. **Enter Quantity**: 10 cases
4.  **System Calculates**:

    Copy

    ```
    10 cases × 6 units/case = 60 units
    ```
5. **Verification**: Check `UnitsQuantity` field auto-updates to 60

<figure><img src="../.gitbook/assets/image (1310).png" alt="" width="563"><figcaption></figcaption></figure>

***

### **Troubleshooting**

| Issue                | Solution                               |
| -------------------- | -------------------------------------- |
| UOMs not appearing   | Verify `TSAAllowedUOMs` JSON format    |
| Incorrect quantities | Check `TSAUOMConversionObject` factors |
| Missing AOQM fields  | Reinstall UOM add-on for transaction   |

***
