---
description: 'Effort Estimation: 2 days'
---

# Relief Rep Assigment

{% hint style="info" %}
The feature allows a user to assign a Relief Rep for a Sales Rep who is out of the office. This temporarily assigns customers and catalogs to the Relief Rep of the unavailable Sales Rep
{% endhint %}

### How to use:&#x20;

1. Select Sales Rep who is out of the office;
2. Select a Relief Rep who will cover the responsibilities of out-of-office Sales Rep;
3. Select Start Date and End Date.

<figure><img src="../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

4.  After Submit, the following notification will appear: <br>

    <figure><img src="../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>
5.  An email will be sent to the user who performed the activity: <br>

    <figure><img src="../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>
6. All accounts and catalogs of the Sales Rep will be assigned to the Relief Rep for the selected period of time and then revert automatically after the End Date.

### Implementation Details

* Relief Rep and Sales Rep drop-downs are based on UDT SalesRepReliefActivity:&#x20;
  * this UDT is updated daily by the dataflow task which takes User data as a source.

***

* When the form is submitted, data is saved to a UDT ReliefReps: &#x20;
  * MainKey: Relief Rep ID&#x20;
  * SecondaryKey: Sales Rep ID&#x20;
  * Values: StartDate\~EndDate &#x20;

***

* Integration:&#x20;
  * Dataflow tasks:&#x20;
    * Get data from UDT ReliefReps;&#x20;
    * Get Account-Users for Relief Reps;&#x20;
    * Export temporary Account-Users for Relief Reps;&#x20;
    * Relief Reps Catalogs Data to UDT.&#x20;

{% hint style="info" %}
Wisynco has a complex logic for Catalog assignment therefore for a different Customer, the last task can be updated to assign Pepperi Catalogs.
{% endhint %}

* The Scheduled Job is run on Submit and Scheduled to run daily. &#x20;

**Tags**: Account Assignment, Assignment Management, Sales Rep Assignment, Catalogs, Account-Users.
