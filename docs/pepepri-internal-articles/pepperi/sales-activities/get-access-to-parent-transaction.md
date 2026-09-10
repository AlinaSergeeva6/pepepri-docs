---
title: "Get access to Parent Transaction"
order: 325
---
# Get access to Parent Transaction

Often we use not only main transaction , like a Sales Order or smth else, we always used Campaigns , Promotions , and it is like a subtransaction. Regular task is make changes, recalculations in main transaction when something was changed in subtransaction. To write such code, we need to have a link between these transactions, let’s call in **ParentUUID**.

you can get it in 2 ways:

**1) Create a field in subtransaction :**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2020-03-03_09h56_10.png)

**2) Do not create an additional field, do it in a Сustom Form:**

```
var parentUUID = '';

    pepperi.app.transactions.getValueByFieldName({
        uuid: workflowObject.UUID,
        fieldName: "PSARefToLeadingOrder",
        responseCallback: "receiveParentUUID"
    }
    );
    function receiveParentUUID(data) {
        parentUUID = data.value;

// here continuation of your code
    }
```
