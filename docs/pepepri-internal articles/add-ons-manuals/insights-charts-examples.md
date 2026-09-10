---
title: "Insights - Charts examples"
order: 70
---
# Insights - Charts examples

### Content:

Bestsellers Top 5

Top Sales by Customers

Sales by Main Category - Yearly

Reps Active Accounts

% of Active Accounts based on UDC

!!!info
*All examples are available within Services Demo Environment*
!!!

---

### Bestsellers Top 5

*The bestsellers' top 5 list features the most popular products based on submitted Sales Order transactions.*

![](/static/image-763.png)

### KBint Example - Bestsellers Top 5

Value format: Decimal

Resource: transaction\_lines

Series:

1.  **Aggregator:** Count
2.  **Dynamic Series:** true
    -   **Break by field**: Item.ExternalID
    -   **Limit the number of results**:
        -   **Number Of**: 5
        -   **Order**: Descending

3.  **Filter**:
    -   **Transaction.Type**: sales order
    -   **Transaction.StatusName**: submitted

-   **Page** "Insights Examples"
-   **Title**: Bestsellers Top 5
-   **Chart design**: Bar
-   **Content** -> KBint Example - Bestsellers Top 5

---

### Top Sales by Customers

*The "Top Sales by Customers" section displays the Top 5 Customers based on the Total Sum of submitted Sales Order transactions.*

![](/static/image-764.png)

### KBint Example - Bestsellers Top 5

Value format: Currency, USD

Resource: transaction\_lines

Series:

1.  **Aggregator:** Sum
    -   **Aggregated field**: TSATotalPricePerLine

2.  **Dynamic Series:** true
    -   **Break by field**: Transaction.Account.Name
    -   **Limit the number of results**:
        -   **Number Of**: 5
        -   **Order**: Descending

3.  **Filter**:
    -   **Transaction.Type**: sales order
    -   **Transaction.StatusName**: submitted

-   **Page** "Insights Examples"
-   **Title**: Top Sales by Customers
-   **Chart design**: Bar
-   **Content** -> KBint Example - Top Sales by Customers

---

### Sales by Main Category - Yearly

*"Sales by Main Category - Yearly" chart presents sales by the Main Categories by Year. This helps to identify trends and determine which product categories contribute most to the sales over the year.*

![](/static/image-765.png)

### KBint Example - Sales by Main Category - Yearly

Value format: Currency, USD

Resource: transaction\_lines

Series:

1.  **Aggregator:** Sum
    -   **Aggregated field**: TSATotalPricePerLine

2.  **Categories:** true
    -   Transaction.ActionDateTime:
        -   **Interval**: Year
        -   **Format**: Year

3.  **Dynamic Series:** true
    -   **Break by field**: Item.MainCategory
    -   **Limit the number of results**: false

4.  **Filter**:
    -   **Transaction.Type**: sales order, b2b order
    -   **Transaction.StatusName**: submitted

-   **Page** "Insights Examples"
-   **Title**: Sales by Main Category - Yearly
-   **Chart design**: Column
-   **Content** -> KBint Example - Sales by Main Category - Yearly

---

### Reps Active Accounts

*"*Reps Active Accounts*" chart is based on UDC KBIntExamples and shows Active Accounts per Sales Rep. This helps to understand the distribution of active customer accounts among Sales Reps.*

![](/static/image-766.png)

### KBint Example - Active Accounts from UDC

Value format: Decimal

Resource: KBIntExamples

Series:

1.  **Aggregator:** Count
2.  **Categories:** false
3.  **Dynamic Series:** true
    -   **Break by field**: salesRep.Name
    -   **Limit the number of results**: false

4.  **Filter**:
    -   **isAccountActive**: true

**UDC**: KBIntExamples

**Fields**:

![](/static/image-767.png)

**Data example**:

![](/static/image-768.png)

-   **Page** "Insights Examples"
-   **Title**: Reps Active Accounts
-   **Chart design**: Pie
-   **Content** -> KBint Example - Active Accounts from UDC

---

### % of Active Accounts based on UDC

*"% of Active Accounts" chart shows the percentage of active customers per Sales Rep.*

![](/static/image-769.png)

### 1) KBint Example - Active Accounts from UDC

Value format: Decimal

Resource: KBIntExamples

Series:

1.  **Aggregator:** Count
2.  **Categories:** false
3.  **Dynamic Series:** true
    -   **Break by field**: salesRep.Name
    -   **Limit the number of results**: false

4.  **Filter**:
    -   **isAccountActive**: true

### 2) KBint Example - Total Accounts from UDC

Value format: Decimal

Resource: KBIntExamples2

Series:

1.  **Aggregator:** Sum
    -   **Aggregated field**: customersTotal

2.  **Categories:** false
3.  **Dynamic Series:** true
    -   **Break by field**: salesRep.Name
    -   **Limit the number of results**: false

**UDC**: KBIntExamples2

**Fields**:

![](/static/image-770.png)

**Data example**:

![](/static/image-771.png)

-   **Page** "Insights Examples"
-   **Title**: Reps Active Accounts
-   **Chart design**: Pie
-   **Content:**

\-> KBint Example - Active Accounts from UDC

\-> KBint Example - Total Accounts from UDC
