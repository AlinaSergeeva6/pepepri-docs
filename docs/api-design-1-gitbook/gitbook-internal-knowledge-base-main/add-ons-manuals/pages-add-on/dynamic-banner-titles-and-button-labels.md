# Dynamic Banner Titles and Button Labels

**Dynamic Banner Titles**:

* Banner titles can now be modified based on flow parameters (e.g., bannerTitle).
* Example parameters: testValue (dynamic value for Button/Banner), bannerTitle (text displayed).

**Dynamic Button Labels and Badges**:

* Button labels and badges can be updated dynamically using flow parameters, similar to banners.

### **Implementation Steps**:

#### **Step 1: Create Flow and Define Parameters**:

* Define parameters like testValue, bannerTitle, accounts, Users, Status.

**In the example below:**\
• testValue – will contain dynamic value for Button/Banner (e.g. Totals, field values)\
• bannerTitle – will contain text that will be shown on Button/Banner

<figure><img src="../../.gitbook/assets/image (1313).png" alt=""><figcaption></figcaption></figure>

#### **Step 2: Add Build Text Logic Block**:

* Input text with placeholders (e.g., {value}).
* Select a parameter to replace the placeholder.
* Save the result in a parameter (e.g., bannerTitle).

<figure><img src="../../.gitbook/assets/image (1316).png" alt=""><figcaption></figcaption></figure>

#### **Step 3: Save and Publish Flow**:

* Publish the flow to apply changes.

{% hint style="info" %}
**Sync may be required.**
{% endhint %}

<figure><img src="../../.gitbook/assets/image (1317).png" alt=""><figcaption></figcaption></figure>

#### **Step 4: Add New Page Block and Select Flow**:

* Assign testValue (can be manual or dynamic).
* Set bannerTitle to "dynamic" and choose the Banner element (identified by UUID in Content -> Action key).

<figure><img src="../../.gitbook/assets/image (1318).png" alt=""><figcaption></figcaption></figure>

* Support for multiple titles (e.g., 1st and 2nd Title for Banners).

<figure><img src="../../.gitbook/assets/image (1319).png" alt=""><figcaption></figcaption></figure>

* Enable 2nd Title in Content to make it available in the parameter dropdown.

<figure><img src="../../.gitbook/assets/image (1321).png" alt=""><figcaption></figcaption></figure>

* Save to update the Banner title dynamically.

<figure><img src="../../.gitbook/assets/image (1320).png" alt=""><figcaption></figcaption></figure>

#### **Button Labels and Badges**:

* Same dynamic update process applies to Button Labels and Badges.

<figure><img src="../../.gitbook/assets/image (1322).png" alt=""><figcaption></figcaption></figure>
