---
title: "UOM Add-on Module"
description: "UOM Module Implementation Guide"
order: 68
---
# UOM Add-on Module

*UOM Module Implementation Guide*

## UOM Module Implementation Guide

### 1. Installation

Before you start working with the UOM add-on, you need to install it to your environment. To do this, use Postman and the following POST API requests:

[https://papi.pepperi.com/v1.0/addons/installed\_addons/1238582e-9b32-4d21-9567-4e17379f41bb/installpapi.pepperi.com](https://papi.pepperi.com/v1.0/addons/installed_addons/1238582e-9b32-4d21-9567-4e17379f41bb/install)

UOM Add-on request

### 2. UOM Definitions Setup

#### Creating Unit of Measures

-   Navigate to: **Items → UOMs → Add**

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-782.png)

-   Define your UOMs with:
    -   **ID**: Technical name (e.g., "CS", "EA")
    -   **Name**: Description (e.g., "Case", "Each")
    -   **Factor**: Package quantity (e.g., 6 for "CS" meaning 6 units per case)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-783.png)

*Example Configuration:*

| ID | Name | Factor |
| --- | --- | --- |
| CS | Case | 6 |
| EA | Each | 1 |
| PK | Pack | 12 |

---

### 3. Item Configuration

#### Custom Fields Setup

1.  Navigate to: **Items → Fields → Add Custom Field**
2.  Create two fields:

-   **TSAAllowedUOMs**: Stores available UOMs (JSON array)

    ```
    ["CS", "EA"]
    ```

-   **TSAUOMConversionObject**: Defines base UOM relationships

    ```
    [{"UOMKey":"CS","Factor":6},{"UOMKey":"EA","Factor":1}]
    ```

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-784.png)

8KB

[Exportitems\_25875820.csv](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FRzH15vuyjcQA9XMPpBe7%2FExportitems_25875820.csv?alt=media&token=f938bac0-977b-4b92-a82a-fd72a04da215)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FRzH15vuyjcQA9XMPpBe7%2FExportitems_25875820.csv?alt=media&token=f938bac0-977b-4b92-a82a-fd72a04da215)

Example of csv file with UOM data

---

### 4. Transaction Configuration

1.  Go to: **Sales Activity → Transaction Types → &lt;Your Transaction>→ UOM Tab**

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-785.png)

2.  Map fields:
    -   **Allowed UOMs Field** → `TSAAllowedUOMs`
    -   **UOM Configuration Field** → `TSAUOMConversionObject`

3.  Click **Install**
    -   Add-on installs 4 fields that have **AOQM prefix**.

#### AOQM Fields (Auto-created by Add-on)

| Field | Purpose |
| --- | --- |
| `TSAAOQMUOM1` | Primary UOM dropdown (dynamic values) |
| `TSAAOQMUOM2` | Secondary UOM dropdown (optional) |
| `TSAAOQMQuantity1` | Quantity for primary UOM |
| `TSAAOQMQuantity2` | Quantity for secondary UOM |

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-786.png)

---

### 5. User Workflow Example

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-787.png)

1.  **Select Item**: HT3010 (pre-configured with CS=6 units)
2.  **Choose UOM**: Select "CS" from `TSAAOQMUOM1` dropdown
3.  **Enter Quantity**: 10 cases
4.  **System Calculates**:

    Copy

    ```
    10 cases × 6 units/case = 60 units
    ```

5.  **Verification**: Check `UnitsQuantity` field auto-updates to 60

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-788.png)

---

### Troubleshooting

| Issue | Solution |
| --- | --- |
| UOMs not appearing | Verify `TSAAllowedUOMs` JSON format |
| Incorrect quantities | Check `TSAUOMConversionObject` factors |
| Missing AOQM fields | Reinstall UOM add-on for transaction |

---
