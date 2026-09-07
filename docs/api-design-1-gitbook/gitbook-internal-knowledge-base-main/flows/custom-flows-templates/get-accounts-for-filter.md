---
description: This page describes how to set up flow 'Get Accounts for Filter'
---

# Get Accounts for Filter

### **Flow Setup**

1. Navigate to Pepperi backoffice -> Configuration -> **Flows**
2. Add new flow with the name **Get Accounts for Filter**
3. Once the flow is created you will be redirected to **Steps** Tab of the **Flow Editor**&#x20;
4. Drag **Get Values** block to the **Used Logic Blocks** section
5. In the popup go to **Mapped** tab and add the following input:

<figure><img src="../../.gitbook/assets/image (950).png" alt=""><figcaption></figcaption></figure>

6. Click **Done** and update the flow

### **Adding flow to Pages**

1. Navigate to Pepperi backoffice -> Pages -> **Page Builder**
2. Create or select a Page you would like to add the Flow to and click on **Edit**
3. The **page editor** will be opened
4. Drag and drop the **Filter** block into the desired section&#x20;
5. The **Filter Settings** will be opened:

<figure><img src="../../.gitbook/assets/image (951).png" alt=""><figcaption></figcaption></figure>

6. Go to **Content tab** and click **Add filter**:\
   a. Add Title **Select Account**\
   b. Select **AccountUUID** as page parameter key \
   c. **Use first value** checkbox must be **true**.

<figure><img src="../../.gitbook/assets/image (955).png" alt=""><figcaption></figcaption></figure>

7.  Click on **Choose Flow** and select **Get Accounts for Filter** option

    <figure><img src="../../.gitbook/assets/image (957).png" alt=""><figcaption></figcaption></figure>
8. **Save** the changes
9.  Go to **Preview** to see the Account dropdown. \
    You can also **publish** the homepage, in order to view the changes on the **live page**.

    <figure><img src="../../.gitbook/assets/image (960).png" alt=""><figcaption></figcaption></figure>
