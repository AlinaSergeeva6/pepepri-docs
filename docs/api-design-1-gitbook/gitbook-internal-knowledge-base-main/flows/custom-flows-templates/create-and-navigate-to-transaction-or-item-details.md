---
description: >-
  This page describes how to set up flow 'Create and navigate to transaction or
  item details'
---

# Create and Navigate to Transaction or Item Details

### Navigation

1. [#script-setup](create-and-navigate-to-transaction-or-item-details.md#script-setup "mention")
2. [#flow-setup](create-and-navigate-to-transaction-or-item-details.md#flow-setup "mention")
3. [#adding-to-pages](create-and-navigate-to-transaction-or-item-details.md#adding-to-pages "mention")
4. [#testing](create-and-navigate-to-transaction-or-item-details.md#testing "mention")

### Script Setup

1. Navigate to Pepperi backoffice -> Configuration -> **Scripts**
2. &#x20;Add new script:
   1. **Title** and **description**: Create and Navigate to Transaction or Item Details&#x20;
   2.  **Parameters**:

       <figure><img src="../../.gitbook/assets/image (973).png" alt=""><figcaption></figcaption></figure>
3. Add the following **code**:

```typescript
export async function main(data) {

    let atd = data.atd_name;
    let catalog = data.catalog_name;
    let accountUUID: string = data.account_uuid;
    let transactionUUID: string;
    let itemUUID: string = data.item_uuid;
    let filter: string = data.filter;
    let viewType: string = data.view_type;
    let smartFilter: string = data.smart_filter;

    if (!transactionUUID) {
        if (!accountUUID) {
            // get the first account
            const accounts = await pepperi.api.accounts.search({
                fields: ['UUID'],
                filter: {
                    FieldType: 'String',
                    ApiName: "ParentExternalID",
                    Operation: "IsEqual",
                    Values: [""],
                }
            })

            if (accounts.objects.length > 0) {
                accountUUID = accounts.objects[0].UUID;
            }
            else {
                console.log('could not find any accounts');
                await client.alert('No Accounts', 'Could not find any accounts');
            }
        }
        accountUUID = accountUUID.replace(/-/g, '')
        console.log(accountUUID)

        if (accountUUID) {
            // get transaction on this account that is in status list
            const statuses = data.status_list.split(',');
            console.log(statuses)

            const transactions_filter = {
                Operation: 'AND',
                RightNode: {
                    Operation: 'AND',
                    LeftNode: {
                        // FieldType: 'Guid',
                        ApiName: 'AccountUUID',
                        Operation: 'IsEqual',
                        Values: [accountUUID]
                    },
                    RightNode: {
                        // FieldType: 'Double',
                        ApiName: 'Status',
                        Operation: 'IsEqual',
                        Values: statuses
                    }
                },
                LeftNode: {
                    Operation: 'AND',
                    LeftNode: {
                        Operation: 'IsEqual',
                        // FieldType: 'String',
                        ApiName: 'Type',
                        Values: [atd]
                    },
                    RightNode: {
                        // FieldType: 'String',
                        ApiName: 'CatalogExternalID',
                        Operation: 'IsEqual',
                        Values: [catalog]
                    }
                }
            }

            console.log('searching for transaction with status ' + statuses.join(' or '))
            const transactions = await pepperi.api.transactions.search({
                fields: ['UUID', 'Status', 'AccountUUID', 'CatalogExternalID', 'ActionDateTime'],
                filter: transactions_filter,
                sorting: [{
                    Field: 'ActionDateTime',
                    Ascending: false
                }]
            });

            if (transactions.objects.length > 1) {
                console.log(`found ${transactions.objects.length} transactions`)
                transactionUUID = transactions.objects[0].UUID
            }

            // create a new one
            if (!transactionUUID ) {
                console.log('could not find any existing transactions, creating a new one')
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
            }
        }

        if (transactionUUID) {
            navigate(transactionUUID, itemUUID, filter, viewType, smartFilter);
        }
    }
    else {
        navigate(transactionUUID, itemUUID, filter, viewType, smartFilter);
    }
    return ''
}

async function navigate(transaction_uuid, item_uuid, filter, view_type, smart_filter) {

    var url_params = '?';

    if (filter) {
        // filter = 'CurrentTab=' + filter;
        url_params += 'CurrentTab=' + filter;
        console.log(url_params);
    }

    if (smart_filter) {
        // smart_filter = 'SmartSearch=' + smart_filter;
        url_params += '&SmartSearch=' + smart_filter;
        console.log(url_params);
    }

    if (view_type) {
        // view_type = 'ViewType=' + view_type;
        url_params += '&ViewType=' + view_type;
        console.log(url_params);
    }

    console.log(url_params);

    if(item_uuid) {
        console.log(item_uuid);
        await client.navigateTo({
            url: '/transactions/item_details/' + transaction_uuid + '/' + item_uuid + url_params
        })
    }
    else {
        await client.navigateTo({
            url: '/transactions/scope_items/' + transaction_uuid + url_params
        })
    }
}
```

4. **Save** the script

### **Flow** Setup

1. Navigate to Pepperi backoffice -> Configuration -> **Flows**
2. Add new flow with name and description **Create and navigate to transaction or item details**
3. You will be redirected to Steps tab of the **Flow editor**
4.  Go to **Parameters tab** and add the following variables:

    <figure><img src="../../.gitbook/assets/image (966).png" alt=""><figcaption></figcaption></figure>
5.  In **Steps tab** add user script block with the following values:<br>

    <figure><img src="../../.gitbook/assets/image (967).png" alt=""><figcaption></figcaption></figure>
6. **Save** changes and update the flow

### **Adding to pages**

1. Navigate to Pepperi backoffice -> Pages -> **Page Builder**
2. Create or select a Page you would like to add the Flow to and click on **Edit**
3. The **page editor** will be opened
4. Drag and drop the blocks, you would like to add the flow to, into the desired section or select **edit** on the existing one.
5. Find **Click Event** in Settings:\
   Usually situated in Block Settings (i.e. Gallery, Banner or Slideshow Settings) -> Content -> Expand element -> **Click Event** Settings
6. Add the flow **Create and navigate to transaction or item details**
7. **Required** parameters:
   1. **atd\_name** - transaction or activity name, i.e. Sales Order, B2B Sales Order, Buyer Order
   2.  **catalog\_name** - catalogs, i.e Default Catalog, Default Catalogue, Pre Order Christmas

       <div data-gb-custom-block data-tag="hint" data-style="danger" class="hint hint-danger"><p>The <strong>catalog_name</strong> must exist on the transaction specified in <strong>atd_name</strong>.</p></div>
8. **Optional** paramaters:
   1. **account\_uuid**\
      It is required for Multi-Account buyer, must be **dynamic** with **AccountUUID** value selected. See how to set up Multi-Account buyer flow in [get-accounts-for-filter.md](get-accounts-for-filter.md "mention"). \
      If there are absent Multi-Account buyers on the environment, it should be left **empty**.
   2. **status\_list**\
      If status is specified and the latest transaction with that status exists, the link will direct to it, and otherwise it will open new transaction . If status is empty (or invalid), the link will **always** open a new transaction.\
      In most cases the value is set **1** for opening transactions in **In Creation**.
   3.  **filter**\
       If you navigate to any order you will see the following:

       <figure><img src="../../.gitbook/assets/image (990).png" alt=""><figcaption></figcaption></figure>

       Choose any category and see that the URL link is changing. The string starting from '**CurrentTab=**' and to the next '**&**' character (or the end of the URL) is the filter **value**. \
       For example, in the following link the **filter value** is **highlighted** in green:\
       https://app.pepperi.com/transactions/scope\_items/3e157e63-016e-46dc-8b72-f94942e042a7?**CurrentTab=**<mark style="background-color:green;">**%22%7B%5C%22JsonFilter%5C%22:%5C%224129630e-16d5-4481-8b80-8b8c317ed78d%5C%22%7D%22**</mark>\&SearchString=\&StartIndex=0\&SearchAll=false\&SmartSearch=%5B%
   4.  **smart\_filter**\
       Similarly to the filter, smart filter can also be viewed in opened transaction - expand one of the sections below the filter, choose value and click **apply**.

       <figure><img src="../../.gitbook/assets/image (989).png" alt=""><figcaption></figcaption></figure>

       Once you have added smart search, you will see that the URL link now contains **SmartSearch** property. The same logic as of taking **value** for the filter applies. \
       So, for instance, in the following URL, the **smart search value** is **highlighted** in green:\
       https://app.pepperi.com/transactions/scope\_items/3e157e63-016e-46dc-8b72-f94942e042a7?CurrentTab=%22%7B%5C%22JsonFilter%5C%22:%5C%22fdb3a99c-b519-4b15-a269-38e2f1202faf%5C%22%7D%22\&SearchString=\&StartIndex=0\&SearchAll=false&**SmartSearch=**<mark style="background-color:green;">**%5B%7B%22ApiName%22:%22ItemTSAProductType%22,%22ComparisonType%22:%22Values%22,%22Values%22:%5B%221%20Cards%22%5D%7D%5D**</mark>
   5.  **view\_type**\
       Open transaction and select any view from the dropdown:

       <figure><img src="../../.gitbook/assets/image (810).png" alt=""><figcaption></figcaption></figure>

       After that, the URL will include the following property (value varies depending on your view selection):\
       **ViewType=**<mark style="background-color:green;">**%7B"Key":"OrderCenterView2","Value":"Small"%7D**</mark>\
       Highlighted in green is the **value** you need to add to the **view\_type** input.
9. Once you added the parameters you need, **save** the flow configuration popup.
10. **Publish** the homepage to move changes to the live page.

### Testing

To test navigate to **live page** (sign in as buyer who has the respective profile to view the homepage you set up) and click on the homepage element you selected - the link you configured will be opened.&#x20;

Alternatively, you can test it in Flow Test or Script Debugger, see article [debugging-scripts-and-flows.md](../../scripts/debugging-scripts-and-flows.md "mention")

{% hint style="warning" %}
**Create and navigate to transaction or item details** flow has to be tested on the live page, testing on pages preview will not work with this flow.
{% endhint %}

