---
title: "Using Custom Form to Update HTML Formatted Field with Line Breaks Using UDT Values"
order: 321
---
# Using Custom Form to Update HTML Formatted Field with Line Breaks Using UDT Values

## Using Custom Form to Update HTML Formatted Field with Line Breaks Using UDT Values

This guide demonstrates how to use a Custom Form in Pepperi to update an HTML Formatted field with values from a User-Defined Table (UDT), displaying each value on a new line. This approach ensures consistent rendering across Web App, iPad, and Android platforms.

---

### Overview

The goal is to display multiple UDT values in a single HTML Formatted field, with each value on a new line. For example:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-43.png)

To achieve this:

1.  Create a UDT with the necessary values.
2.  Create an HTML Formatted field to display the values.
3.  Use a Custom Form to fetch UDT data, format it with line breaks, and update the field.

**Note:** Use an **HTML Formatted** field (not Paragraph Text) to ensure consistent rendering across Web App, iPad, and Android.

---

### Step 1: Set Up the UDTs and Fields

#### Create the UDTs

1.  **UDT 1: CustomerDiscounts**
    -   **Structure:** Unique MainKey (e.g., `AccountExternalID`), multiple SecondaryKey/Value pairs.
    -   Example:
        -   MainKey: `Account123`
        -   SecondaryKey: `DiscountA`, Value: `10`
        -   SecondaryKey: `DiscountB`, Value: `20`

2.  **UDT 2: ArrivalDatePerRegion**
    -   **Structure:** Unique MainKey (e.g., Item ExternalID), SecondaryKey (e.g., Region), Value (e.g., concatenated string like `Date1~Qty1~Date2~Qty2`).
    -   Example:
        -   MainKey: `Item456`
        -   SecondaryKey: `RegionX`, Value: `2025-05-01~100~2025-05-02~200`

#### Create the HTML Formatted Fields

1.  **Transaction Header Field:**
    -   **Field Name:** `TSADiscountNameandValue`
    -   **Type:** HTML Formatted Text
    -   **Purpose:** Displays CustomerDiscounts UDT values (e.g., `DiscountA: 10 \n DiscountB: 20`).

2.  **Transaction Line Field:**
    -   **Field Name:** `TSADAteQty`
    -   **Type:** HTML Formatted Text
    -   **Purpose:** Displays ArrivalDatePerRegion UDT values (e.g., `2025-05-01 - 100 \n 2025-05-02 - 200`).

#### Create a Checkbox Field for Device Detection

1.  **Field Name:** `TSADeviceCheck`
    -   **Type:** Check-Box
    -   **Purpose:** Determines the device type (Web App vs. iPad/Android) to adjust formatting.
    -   Set to `true` by default in the Custom Form, then updated based on the app type.

---

### Step 2: Create the Custom Form

Use the following Custom Form code to fetch UDT values, format them with line breaks, and update the HTML Formatted fields:

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update HTML Field with UDT Values</title>
</head>
<body>
    <script>
        var TSADeviceCheck = true;
        pepperi.app.getContext({ responseCallback: "mycallback" });

        function mycallback(data) {
            console.log(data);
            if (data.appType == 'web') {
                TSADeviceCheck = false;
            }
            pepperi.api.userDefinedTables.getList({
                table: "CustomerDiscounts",
                mainKey: workflowObject.AccountExternalID,
                currentAccountScope: true,
                responseCallback: "updateCallback0"
            });
        }

        function updateCallback0(data) {
            console.log(data);
            if (data.success == false) {
                onClose();
                return;
            }
            var discountData = '';
            data.objects.forEach(function(el) {
                discountData += el.secondaryKey + " : " + el.value + "  \n";
            });
            if (TSADeviceCheck != true && discountData != '') {
                discountData = "<pre>" + discountData + "</pre>";
            }
            console.log(discountData);
            pepperi.app.transactions.update({
                objects: [
                    { UUID: workflowObject.UUID, TSADiscountNameandValue: discountData }
                ],
                responseCallback: "updateCallback1"
            });
        }

        function updateCallback1(data) {
            console.log(data);
            pepperi.api.userDefinedTables.getList({
                table: "ArrivalDatePerRegion",
                currentAccountScope: true,
                responseCallback: "updateCallback"
            });
        }

        function updateCallback(data) {
            if (data.success == false) {
                onClose();
                return;
            }
            console.log(data);
            var arrayToUpdateItemsScope = [];
            data.objects.forEach(function(el) {
                if (workflowObject.AccountTSARegion == el.secondaryKey) {
                    var tmpObj = {};
                    tmpObj.item = { ExternalID: el.mainKey };
                    var res2 = el.value.split('~');
                    var strBroke = '';
                    for (var i = 0; i < res2.length; i++) {
                        if (i % 2) strBroke += res2[i] + "  \n";
                        else strBroke += res2[i] + " - ";
                    }
                    if (TSADeviceCheck != true) {
                        strBroke = "<pre>" + strBroke + "</pre>";
                    }
                    tmpObj.TSADAteQty = strBroke;
                    arrayToUpdateItemsScope.push(tmpObj);
                }
            });
            pepperi.api.transactionScopeItems.update({
                transaction: { UUID: workflowObject.UUID },
                objects: arrayToUpdateItemsScope,
                responseCallback: "UpdateItemsScopeCallback"
            });
        }

        function UpdateItemsScopeCallback(data) {
            console.log(data);
            onClose();
        }
    </script>
</body>
</html>
```

#### Code Explanation

1.  **Device Detection:**
    -   Uses `TSADeviceCheck` to determine the app type (`web` for Web App, otherwise iPad/Android).
    -   If Web App, wraps the output in `<pre>` tags to preserve line breaks.

2.  **Fetching UDT Data:**
    -   **CustomerDiscounts UDT:** Filters by `mainKey` (`AccountExternalID`) to retrieve discounts for the current account.

        ```
        pepperi.api.userDefinedTables.getList({
            table: "CustomerDiscounts",
            mainKey: workflowObject.AccountExternalID,
            currentAccountScope: true,
            responseCallback: "updateCallback0"
        });
        ```

    -   **ArrivalDatePerRegion UDT:** Fetches all records without a `mainKey` filter, then matches by region.

        ```
        pepperi.api.userDefinedTables.getList({
            table: "ArrivalDatePerRegion",
            currentAccountScope: true,
            responseCallback: "updateCallback"
        });
        ```

3.  **Formatting Line Breaks:**
    -   For `CustomerDiscounts`, concatenates `secondaryKey` and `value` with a newline ().
    -   For `ArrivalDatePerRegion`, splits the `value` string (e.g., `Date1~Qty1~Date2~Qty2`) and formats pairs with a dash and newline (e.g., `Date1 - Qty1 \n Date2 - Qty2`).
    -   Adds `<pre>` tags for Web App to ensure proper rendering of line breaks.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-44.png)

4.  **Updating Fields:**
    -   Updates the `TSADiscountNameandValue` header field with formatted discount data.
    -   Updates the `TSADAteQty` line field for matching items in the transaction scope.

---

### Step 3: Configure and Test the Custom Form

1.  **Add the Custom Form to a Program:**
    -   Go to **Settings → Sales Activities → Transaction Types**.
    -   Select the transaction, navigate to the **Programs** tab, and create a new program.
    -   Add the Custom Form as an action and paste the code above.

2.  **Add the Fields to Views:**
    -   Go to **Back Office → Order Center Views → Item Information Page**.
    -   Add `TSADiscountNameandValue` and `TSADAteQty` to the appropriate views (e.g., Header and Line Item views).

3.  **Test Across Platforms:**
    -   **Web App:** Test in Chrome, using Developer Tools (`F12`) to verify the output in the Console. Ensure line breaks render correctly with `<pre>` tags.
    -   **iPad/Android:** Test on a mobile device to confirm line breaks () display properly without `<pre>` tags.

---

### Additional Resources

-   The code is available in **Integration Examples** under the file name "Update fields using UDT values".
-   Refer to the Pepperi Support documentation for more details on UDTs and HTML Formatted fields.

---

### Final Notes

This Custom Form enables you to display UDT values in an HTML Formatted field with proper line breaks, ensuring compatibility across Web App, iPad, and Android. By following these steps and best practices, you can create a seamless and user-friendly experience for displaying structured data in transactions.
