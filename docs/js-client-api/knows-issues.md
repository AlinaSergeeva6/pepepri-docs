# Known Issues

### Overview

This guide addresses a known issues in the Pepperi JS Client Side API Rule Engine.

***

### Issue Description

* **Problem:** The Rule Engine currently does not support the Optional Chaining Operator (?.).
* **Impact:** Using this operator, such as `x?.success`, may cause errors in UDFs, stopping script execution.
* **Recommendation:** Avoid using the Optional Chaining Operator in Rule Engine scripts.

#### Incorrect Usage

```javascript
let x = pepperi.api.userDefinedTables.getList({});
let data = x?.success ? x.objects : [];  // This will cause an error
```

#### Correct Workaround

```javascript
let x = pepperi.api.userDefinedTables.getList({});
let data= x && x.success ? x.objects : []; // Safe alternative
```

* **Explanation:** The workaround uses a conditional check (`x && x.success`) to safely access `x.objects`, defaulting to an empty array the condition fails.
