# Pages with flows

### Description

Flows allow us to have multiple steps in one action triggered by the click/change of some homepage elements. They usually consist of script and logic blocks.

This article contains information about configuring a basic homepage using Pages and Flows addons that support multi-account buyers. It's divided into 3 main sections:

1. [#homepage-scrips](pages-with-flows.md#homepage-scrips "mention")
2. Creating Flows
3. Pages configuration

#### Required addons:

* Pages
* Scripts
* Flows
* Filter
* Logic blocks

#### Page block addons that support flows:

* Gallery (2nd Generation)
* Slideshow (2nd Generation)
* Rich Text
* Banners
* Buttons Bar
* Filter

***

## **Homepage Scrips**

This section contains code examples of scripts used on Pages. Basic Scripts configuration can be found in this article:

{% content-ref url="../scripts/" %}
[scripts](../scripts/)
{% endcontent-ref %}

### Get Transaction UUID

This script is a must-have. It searches the last opened transaction for the selected Account.  Otherwise, it creates a new transaction. In both cases, the returned result is **transaction UUID**.

Parameters:

1. atd\_name - transaction name
2. catalog - catalog name
3. status\_list - statuses for existing orders
4. accountUUID - account UUID

Code:

{% code title="Get Transaction UUID" %}
```javascript
export async function main(data) {
  let atd = data.atd_name;
  let catalog = data.catalog;
  let accountUUID = data.accountUUID;
  let transactionUUID: string;
  let status_list = data.status_list;

  accountUUID = accountUUID.replace(/-/g, '')

  //await client.alert('accountUUID:', accountUUID);
  

  if (!transactionUUID) {

    if (accountUUID) {
        
      // get transaction on this account that is in status list
      const statuses = status_list.split(",");

      const transactions_filter = {
        Operation: "AND",
        RightNode: {
          Operation: "AND",
          LeftNode: {
            // FieldType: 'Guid',
            ApiName: "AccountUUID",
            Operation: "IsEqual",
            Values: [accountUUID]
          },
          RightNode: {
            // FieldType: 'Double',
            ApiName: "Status",
            Operation: "IsEqual",
            Values: statuses
          }
        },
        LeftNode: {
          Operation: "AND",
          LeftNode: {
            Operation: "IsEqual",
            // FieldType: 'String',
            ApiName: "Type",
            Values: [atd]
          },
          RightNode: {
            // FieldType: 'String',
            ApiName: "CatalogExternalID",
            Operation: "IsEqual",
            Values: [catalog]
          }
        }
      };


      console.log("searching for transaction with status " + statuses.join(" or "));
      const transactions = await pepperi.api.transactions.search({
        fields: ["UUID", "Status", "AccountUUID", "CatalogExternalID", "ActionDateTime"],
        filter: transactions_filter,
        sorting: [
          {
            Field: "ActionDateTime",
            Ascending: false
          }
        ]
      });


      if (transactions.objects.length > 1) {
        console.log(`found ${transactions.objects.length} transactions`);
        transactionUUID = transactions.objects[0].UUID;
      }

      // create a new one
      if (!transactionUUID) {
        console.log("could not find any existing transactions, creating a new one");
        const res = await pepperi.app.transactions.add({
          type: {
            Name: atd
          },
          references: {
            account: {
              UUID: accountUUID
              // UUID:
            },
            catalog: {
              Name: catalog
            }
          }
        });

        if (res.status === "added") {
          transactionUUID = res.id;
        }
      }
    }
  }
  // await client.alert('transaction, account:', `${transactionUUID}, ${accountUUID}`);
  return { transactionUUID: transactionUUID };
}

```
{% endcode %}

### Get Item UUID

This script may come in handy when a customer uses multiple item IDs and you need to get ItemUUID to open its details inside the transaction. In this case, the custom field TSANetSuiteID is used for the search.

Only parameter - itemID

Code:

{% code title="" %}
```javascript
export async function main(data) {

    let itemID = data.itemID;
    let itemUUID: string;

    if(!itemUUID) {
        if(itemID) {
            const itemData =  await pepperi.api.items.search({
                fields: ['UUID'],
                filter: { 
                    Operation: 'AND',
                    LeftNode: {
                        ApiName: 'TSANetSuiteID',
                        Operation: 'IsEqual',
                        Values: [itemID]
                    },
                    RightNode: {
                        ApiName: 'Hidden',
                        Operation: 'IsEqual',
                        Values: ["false"]
                    }
                },
            });

            if(itemData.success && itemData.objects.length > 0) {
                itemUUID = itemData.objects[0].UUID
            } else {
                await client.alert('No Item', "Couldn't find the item");
            }


        } else {
            await client.alert('No Item', 'No Item ID was provided');
        }
    }
    
    return { "itemUUID": itemUUID };
}
```
{% endcode %}

### Get Parameters On Load

The script is used for updating parameters, specifically here - isMultiAccount. This parameter can be used to hide some blocks of a page later.

Parameters:

1. accountUUID
2. isMultiAccount

Code:

```javascript
export async function main(data)  {
    // await client.alert('debug', JSON.stringify(data));
    let accountUUID = data.accountUUID;
    let isMultiAccount = data.isMultiAccount;
  
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
        if(!accountUUID) {
            accountUUID = accounts.objects[0].UUID;
        }

        if (accounts.objects.length > 1 && !isMultiAccount) {
            isMultiAccount = 'true';
        }
    } else {
        console.log('could not find any accounts');
        await client.alert('No Accounts', 'Could not find any accounts');
    }
    
    data.accountUUID = accountUUID;
    data.isMultiAccount = isMultiAccount;
    
    return data;
  }
```

### Demo - how does it work:

### How to copy to another environment:

### **Advanced configuration**:
