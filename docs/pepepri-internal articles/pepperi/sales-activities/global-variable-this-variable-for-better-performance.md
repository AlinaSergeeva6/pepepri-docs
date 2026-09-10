---
title: "Global variable this.variable for better performance"
order: 327
---
# Global variable this.variable for better performance

## Using Global Variables for Better Performance in Pepperi Transactions

When working with transactions in Pepperi, performance can be a concern, especially when Calculated Fields involve frequent API calls to User-Defined Tables (UDTs). This guide explains how to use global variables (`this.variable`) to cache UDT data in a Transaction Header, reducing redundant API calls and improving transaction load times.

---

### Problem

Consider a Calculated Field (e.g., `CalculatedPrice`) that performs complex calculations involving multiple fields and UDT lookups. For example:

```
var price = pepperi.api.userDefinedTables.get({ table: "PriceBook", mainKey: Price, secondaryKey: "PP" });
```

Each time this field is calculated, it fetches data from the `PriceBook` UDT. This API call introduces latency, which becomes noticeable when:

-   The UDT contains a large amount of data.
-   The field is calculated frequently (e.g., for each transaction line).

Repeating this API call for every calculation significantly slows down the transaction opening process.

---

### Solution: Use a Global Variable

To optimize performance, you can cache the UDT data in a global variable stored in the Transaction Header. This allows subsequent calculations to read from the cached data instead of making repeated API calls.

#### Step 1: Fetch and Cache UDT Data in a Global Variable

1.  **Create a Global Variable:** Use `this.variable` in a Transaction Header Calculated Field to store the UDT data. For example, `this.priceBookUDTList` will hold the `PriceBook` UDT data.
2.  **Fetch UDT Data Once:** Retrieve the UDT data once and store it in the global variable. Use a unique identifier (e.g., `WrntyID`) to ensure the data is refreshed only when necessary.

Here’s an example implementation:

```
var tmp = 'Empty';

function getUDT() {
    var udt = pepperi.api.userDefinedTables.getList({
        table: "PriceBook",
        currentAccountScope: true
    });

    if (udt.success) {
        processOrdersData(udt.objects);
    } else {
        console.error("Failed to fetch PriceBook UDT:", udt);
        tmp = "Error: Unable to fetch PriceBook UDT";
    }
}

function processOrdersData(items) {
    this.priceBookUDTList = items;
    tmp = JSON.stringify(items);
}

// Check if the global variable needs to be updated
if (typeof this.transactionWrntyID === "undefined" || this.transactionWrntyID !== WrntyID) {
    this.transactionWrntyID = WrntyID;
    this.priceBookUDTList = [];
    getUDT();
}

return tmp;
```

#### Step 2: Use the Cached Data in Calculations

Once the UDT data is stored in `this.priceBookUDTList`, you can access it directly in other Calculated Fields (e.g., at the Transaction Line level) without making additional API calls. For example:

```
var udtJSON = this.priceBookUDTList;
var margins = udtJSON.filter(function(item) {
    return item.mainKey == Price && item.secondaryKey == "PP";
});
```

**Explanation:**

-   The `this.priceBookUDTList` variable holds the cached UDT data.
-   The `filter` operation retrieves the relevant data (e.g., price margins) without needing to call `pepperi.api.userDefinedTables.get` again.
-   This approach significantly reduces the number of API calls, improving performance.

---

### Step 3: Configure the Calculated Fields

1.  **Header Field:**
    -   **Field Name:** `TSAPriceBookCache` (or similar).
    -   **Type:** Always (to ensure the UDT data is fetched when the transaction loads).
    -   **Code:** Use the first code snippet above to fetch and cache the UDT data in `this.priceBookUDTList`.

2.  **Line Field:**
    -   **Field Name:** `CalculatedPrice` (or similar).
    -   **Type:** On Change or On Demand (to avoid unnecessary recalculations).
    -   **Code:** Use the second code snippet to read from `this.priceBookUDTList` and perform calculations.

---
