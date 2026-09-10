---
title: "Troubleshooting Promotion Issues in Pepperi"
order: 74
---
# Troubleshooting Promotion Issues in Pepperi

This guide provides solutions to common technical issues encountered when working with promotions in Pepperi, ensuring smooth transaction processing.

---

### Overview

This article addresses the following issues related to promotions:

1.  Managing this Context Conflicts in Promotion Transactions

---

### 1. Managing this Context Conflicts in Promotion Transactions

#### Overview

In Pepperi, a parent transaction (e.g., Sales Order) may utilize the this context for its logic. When a promotion transaction (e.g., PPI\_PackagePromotion) also uses this to cache data, it can overwrite the parent’s this context. This disruption affects the parent’s logic and requires isolation using this.ppi to maintain stability.

#### Issue Description

-   **Problem:** When a promotion transaction modifies this, it overwrites the parent transaction’s this context, resulting in:
    -   Logic failures within the parent transaction.
    -   Inconsistent behavior in workflows or calculations.
    -   Loss of performance benefits from caching mechanisms.

-   **Cause:** The this context is shared across the transaction hierarchy. Without proper isolation, changes made by the promotion transaction impact the parent’s state.

#### Solution: Isolate Global Data with this.ppi

Isolate global data in a this.ppi object within the promotion transaction. Use a self variable for internal operations and access data via this.ppi to prevent conflicts.

**Steps to Implement**

1.  **Initialize** this.ppi**:** Create a this.ppi object to serve as an isolated storage for global data in the promotion transaction.
2.  **Create a** self **Reference:** Define var self = this.ppi to simplify internal data handling.
3.  **Store Data in** self**:** Cache necessary data (e.g., UDT results) within self to keep it separate from the parent’s context.
4.  **Access Data via** this.ppi**:** Retrieve the isolated data in other parts of the transaction using this.ppi.

**Example Code**

**Header Field Code**

```
/**
 * Isolates global data in this.ppi to prevent context conflicts in promotion transactions
 *
 * Definition:
 ** Level: Transaction
 ** Trigger: Always
 *
 * Available Fields:
 ** None
 */

let tmp = '';  // Local Variable: Temporary return value

this.ppi = this.ppi || {};  // Global Variable: Isolated context for promotion
let self = this.ppi;  // Local Variable: Reference to this.ppi

self.globalVariable1 = 0;  // Global Variable: Example global value

/**
 * Example global function to manipulate data
 * 01/01/2022 - First/Last Names - 'Initial implementation'
 * @param param - string. 'UUID or identifier'
 * @param param2 - number. 'Numeric value for calculation'
 * @return void
 */
self.globalFunction1 = function(param, param2) {
    self.globalVariable1 += param2;
};
```

**Line Field Code**

```
/**
 * Retrieves and uses data from this.ppi in a promotion transaction
 *
 * Definition:
 ** Level: Transaction Lines
 ** Trigger: On Change
 *
 * Available Fields:
 ** None
 */

let data = 0;  // Local Variable: Stores retrieved data
let globalVar = 0;  // Local Variable: Stores global variable value

/* Main Code */

data = this.ppi.globalFunction1 ? this.ppi.globalFunction1('test', 10) : 0;
globalVar = this.ppi.globalVariable1 || 0;

return globalVar;

/* END OF THE MAIN CODE, AFTER IT ONLY ADDITIONAL FUNCTIONS */
```

**Why This Works**

-   **Isolation:** this.ppi creates a distinct context for the promotion transaction, protecting the parent’s this.
-   **Stability:** Prevents unintended overwrites, ensuring consistent behavior across transactions.

---
