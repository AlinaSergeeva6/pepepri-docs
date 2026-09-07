# Insights - Charts examples

### Content:

[#bestsellers-top-5](insights-charts-examples.md#bestsellers-top-5 "mention")

[#top-sales-by-customers](insights-charts-examples.md#top-sales-by-customers "mention")

[#sales-by-main-category-yearly](insights-charts-examples.md#sales-by-main-category-yearly "mention")

[#reps-active-accounts](insights-charts-examples.md#reps-active-accounts "mention")

[#of-active-accounts-based-on-udc](insights-charts-examples.md#of-active-accounts-based-on-udc "mention")



{% hint style="info" %}
_All examples are available within Services Demo Environment_&#x20;
{% endhint %}

***

### Bestsellers Top 5

_The bestsellers' top 5 list features the most popular products based on submitted Sales Order transactions._

<figure><img src="../../.gitbook/assets/image (1102).png" alt=""><figcaption></figcaption></figure>

{% tabs %}
{% tab title="Data Query" %}
### KBint **Example - Bestsellers Top 5**

Value format: Decimal

Resource: transaction\_lines

Series:&#x20;

1. **Aggregator:** Count
2. **Dynamic Series:** true
   * **Break by field**: Item.ExternalID
   * **Limit the number of results**:&#x20;
     * **Number Of**: 5
     * **Order**: Descending
3. **Filter**:&#x20;
   * **Transaction.Type**: sales order
   * **Transaction.StatusName**: submitted
{% endtab %}

{% tab title="Pages" %}
* **Page** "Insights Examples"
* **Title**: Bestsellers Top 5
* **Chart design**: Bar
* **Content** -> KBint Example - Bestsellers Top 5
{% endtab %}
{% endtabs %}

***

### **Top Sales by Customers**

_The "Top Sales by Customers" section displays the Top 5 Customers based on the Total Sum of submitted Sales Order transactions._

<figure><img src="../../.gitbook/assets/image (1103).png" alt=""><figcaption></figcaption></figure>

{% tabs %}
{% tab title="Data Query" %}
### KBint **Example - Bestsellers Top 5**

Value format: Currency, USD

Resource: transaction\_lines

Series:&#x20;

1. **Aggregator:** Sum&#x20;
   * **Aggregated field**: TSATotalPricePerLine
2. **Dynamic Series:** true
   * **Break by field**: Transaction.Account.Name
   * **Limit the number of results**:&#x20;
     * **Number Of**: 5
     * **Order**: Descending
3. **Filter**:&#x20;
   * **Transaction.Type**: sales order
   * **Transaction.StatusName**: submitted
{% endtab %}

{% tab title="Pages" %}
* **Page** "Insights Examples"
* **Title**: Top Sales by Customers
* **Chart design**: Bar
* **Content** -> KBint Example - Top Sales by Customers
{% endtab %}
{% endtabs %}

***

### Sales by Main Category - Yearly

_"Sales by Main Category - Yearly" chart presents sales by the Main Categories by Year. This helps to identify trends and determine which product categories contribute most to the sales over the year._

<figure><img src="../../.gitbook/assets/image (803).png" alt=""><figcaption></figcaption></figure>

{% tabs %}
{% tab title="Data Query" %}
### KBint Example - Sales by Main Category - Yearly

Value format: Currency, USD

Resource: transaction\_lines

Series:&#x20;

1. **Aggregator:** Sum&#x20;
   * **Aggregated field**: TSATotalPricePerLine
2. **Categories:** true
   * Transaction.ActionDateTime:&#x20;
     * **Interval**: Year
     * **Format**: Year
3. **Dynamic Series:** true
   * **Break by field**: Item.MainCategory
   * **Limit the number of results**: false
4. **Filter**:&#x20;
   * **Transaction.Type**: sales order, b2b order
   * **Transaction.StatusName**: submitted
{% endtab %}

{% tab title="Pages" %}
* **Page** "Insights Examples"
* **Title**: Sales by Main Category - Yearly
* **Chart design**: Column
* **Content** -> KBint Example - Sales by Main Category - Yearly
{% endtab %}
{% endtabs %}

***

### Reps Active Accounts

_"_&#x52;eps Active Account&#x73;_" chart is based on UDC KBIntExamples and shows Active Accounts per Sales Rep. This helps to understand the distribution of active customer accounts among Sales Reps._

<figure><img src="../../.gitbook/assets/image (787).png" alt="" width="361"><figcaption></figcaption></figure>

{% tabs %}
{% tab title="Data Query" %}
### KBint Example - Active Accounts from UDC

Value format: Decimal

Resource: KBIntExamples

Series:&#x20;

1. **Aggregator:** Count
2. **Categories:** false
3. **Dynamic Series:** true
   * **Break by field**: salesRep.Name
   * **Limit the number of results**: false
4. **Filter**:&#x20;
   * **isAccountActive**: true
{% endtab %}

{% tab title="UDC" %}
**UDC**: KBIntExamples

**Fields**:

<figure><img src="../../.gitbook/assets/image (789).png" alt=""><figcaption></figcaption></figure>

**Data example**:&#x20;

<figure><img src="../../.gitbook/assets/image (790).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Pages" %}
* **Page** "Insights Examples"
* **Title**: Reps Active Accounts
* **Chart design**: Pie
* **Content** -> KBint Example - Active Accounts from UDC
{% endtab %}
{% endtabs %}

***

### % of Active Accounts based on UDC

_"% of Active Accounts" chart shows the percentage of active customers per Sales Rep._

<figure><img src="../../.gitbook/assets/image (1011).png" alt="" width="563"><figcaption></figcaption></figure>

{% tabs %}
{% tab title="Data Query" %}
### 1) KBint Example - Active Accounts from UDC

Value format: Decimal

Resource: KBIntExamples

Series:&#x20;

1. **Aggregator:** Count
2. **Categories:** false
3. **Dynamic Series:** true
   * **Break by field**: salesRep.Name
   * **Limit the number of results**: false
4. **Filter**:&#x20;
   * **isAccountActive**: true



### 2) KBint Example - Total Accounts from UDC

Value format: Decimal

Resource: KBIntExamples2

Series:&#x20;

1. **Aggregator:** Sum
   * **Aggregated field**: customersTotal
2. **Categories:** false
3. **Dynamic Series:** true
   * **Break by field**: salesRep.Name
   * **Limit the number of results**: false
{% endtab %}

{% tab title="UDC" %}
**UDC**: KBIntExamples2

**Fields**:

<figure><img src="../../.gitbook/assets/image (1009).png" alt=""><figcaption></figcaption></figure>

**Data example**:&#x20;

<figure><img src="../../.gitbook/assets/image (1010).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Pages" %}
* **Page** "Insights Examples"
* **Title**: Reps Active Accounts
* **Chart design**: Pie
* **Content:**

-> KBint Example - Active Accounts from UDC

-> KBint Example - Total Accounts from UDC
{% endtab %}
{% endtabs %}
