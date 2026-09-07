---
description: This page describes how to set up flow 'Open Online - Demos Transaction'
---

# Open Online - Demos Transaction

### **Example**

The following **template** is implemented on **V Suarez** (7046) (30013401) environment, admin: **liortest@vsuarez.com**.

### Navigation

1. [#script-setup](open-online-demos-transaction.md#script-setup "mention")
2. [#flow-setup](open-online-demos-transaction.md#flow-setup "mention")
3. [#adding-to-pages](open-online-demos-transaction.md#adding-to-pages "mention")
4. [#testing](open-online-demos-transaction.md#testing "mention")

### Script Setup

1. Navigate to Pepperi backoffice -> Configuration -> **Scripts**
2. &#x20;Add new script:
   1. **Title** and **description**: Create Transaction (if Empty)&#x20;
   2.  **Parameters**:<br>

       <figure><img src="../../.gitbook/assets/image (992).png" alt=""><figcaption></figcaption></figure>
3. Add the following **code**:

```typescript
export async function main(data) {

    let atd = data.activityTypeDefinition;
    let catalog = data.catalogExternalId;
    let accountUUID: string = data.accountUUID;
    let transactionUUID: string = data.transactionUUID;

    if (!transactionUUID || transactionUUID === "") {
        accountUUID = accountUUID.replace(/-/g, '')
        console.log(accountUUID)

        if (accountUUID) {
            // create a new one
            const res = await pepperi.app.transactions.add({
                type: {
                    Name: atd
                },
                references: {
                    account: {
                        UUID: accountUUID
                    },
                    catalog: {
                        Name: catalog
                    }
                }
            });
            if (res.status === 'added') {
                transactionUUID = res.id;
            }
            else {
                await client.alert("Error", "No Transaction")
            }
        }
    }

    return { "transactionUUID": transactionUUID };

}
```

4. **Save** the script

### **Flow** Setup

1. Navigate to Pepperi backoffice -> Configuration -> **Flows**
2.  Add new onLoad flow:\
    Name: **Homepage On Load - Multi Account**\
    Parameters:<br>

    <figure><img src="../../.gitbook/assets/image (907).png" alt=""><figcaption></figcaption></figure>

    Steps:\
    As Transaction type add the **transaction name** from the environment, i.e. Sales Order, B2B Sales Order, Buyer Order, etc.

    <figure><img src="../../.gitbook/assets/image (908).png" alt=""><figcaption></figcaption></figure>
3. Add new **onChange** Flow:\
   Name: **Homepage On AccountUUID Change**\
   Parameters and Steps are the same as on **Homepage On Load - Multi Account** (input values of Active Transaction ahould also match)
4.  Add new flow for opening transaction:

    Name: **Open Online - Demos Transaction**\
    Parameters:

    <figure><img src="../../.gitbook/assets/image (909).png" alt=""><figcaption></figcaption></figure>

    Steps:

    1.  **User Script** block:

        <figure><img src="../../.gitbook/assets/image (910).png" alt=""><figcaption></figcaption></figure>
    2. After that, add **Navigate To** Logic Block:

    <figure><img src="../../.gitbook/assets/image (995).png" alt=""><figcaption></figcaption></figure>
5. **Save** changes and update the flow

### **Adding to pages**

1. Navigate to Pepperi backoffice -> Pages -> **Page Builder**
2. Create or select a Page you would like to add the Flow to and click on **Edit**
3.  In page settings add onLoad flow:<br>

    <figure><img src="../../.gitbook/assets/image (915).png" alt=""><figcaption></figcaption></figure>
4.  Also add the page onChange flow:<br>

    <figure><img src="../../.gitbook/assets/image (916).png" alt=""><figcaption></figcaption></figure>
5. Edit the block you need to add the flow to and find **Click Event**:\
   Usually situated in Content -> Expand element -> **Click Event** Settings
6. Add the flow **Open Online - Demos Transaction**
7.  **Dynamic** parameters:\
    Parameters accountUUID, transactionUUID, catalogExId, atdName should be dynamic:

    <figure><img src="../../.gitbook/assets/image (906).png" alt=""><figcaption></figcaption></figure>
8. **queryParams** paramater:\
   To add **multiple params** join them with '**&**' character, for example:\
   CurrentTab=%22%7B%5C%22JsonFilter%5C%22:%5C%224129630e-16d5-4481-8b80-8b8c317ed78d%5C%22%7D%2&#x32;**&**&#x53;martSearch=%5B%7B%22ApiName%22:%22ItemTSAProductType%22,%22ComparisonType%22:%22Values%22,%22Values%22:%5B%221%20Cards%22%5D%7D%5&#x44;**&**&#x56;iewType=%7B"Key":"OrderCenterView2","Value":"Small"%7D
   1. **filter** param\
      If you navigate to any order you will see the following:\
      ![](<../../.gitbook/assets/image (990).png>)\
      Choose any category and see that the URL link is changing. To add to **queryParams**, copy the string starting with '**CurrentTab=**' and to the next '**&**' character, like:\
      **CurrentTab=%22%7B%5C%22JsonFilter%5C%22:%5C%224129630e-16d5-4481-8b80-8b8c317ed78d%5C%22%7D%22**
   2. **smart\_filter** param\
      To add smart filter, open transaction -> expand one of the sections below the filter -> choose value -> click **apply**.\
      ![](<../../.gitbook/assets/image (989).png>)\
      Once you have added smart search, you will see that the URL link now contains **SmartSearch** property. \
      To add smart search **copy** the **SmartSearch** property string to the **queryParams**, it should look similar to this:\
      **SmartSearch=%5B%7B%22ApiName%22:%22ItemTSAProductType%22,%22ComparisonType%22:%22Values%22,%22Values%22:%5B%221%20Cards%22%5D%7D%5D**
   3. **view\_type**\
      Open transaction and select any view from the dropdown:\
      ![](<../../.gitbook/assets/image (810).png>)\
      After that, the URL will include property similar to:\
      **ViewType=%7B"Key":"OrderCenterView2","Value":"Small"%7D** \
      This is the **input value** you should add to **queryParams**.
9. Once you added the parameters you need, **save** the flow configuration popup.
10. **Publish** the homepage to move changes to the live page.

### Testing

To test navigate to **live page** (sign in as buyer who has the respective profile to view the homepage you set up) and click on the homepage element you selected - the link you configured will be opened.&#x20;

Alternatively, you can test it in Flow Test or Script Debugger, see article [debugging-scripts-and-flows.md](../../scripts/debugging-scripts-and-flows.md "mention")

{% hint style="warning" %}
**Open Online - Demos Transaction** flow has to be tested on the live page, testing on pages preview will not work with this flow.
{% endhint %}

