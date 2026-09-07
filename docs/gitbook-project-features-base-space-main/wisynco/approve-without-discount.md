---
description: 'Effort Estimation: 8 hours'
---

# Approve Without Discount

{% hint style="info" %}
Allows Sales Rep to approve an order without applied discount.
{% endhint %}

### How to use:

1.  Create a Sales Order and apply a manual discount:<br>

    <figure><img src="../.gitbook/assets/image (24).png" alt=""><figcaption></figcaption></figure>
2. Submit an order. It will go to "Waiting for Approval":\
   ![](<../.gitbook/assets/image (28).png>)
3. Open the order and select "Approve Without Discount":\
   ![](<../.gitbook/assets/image (25).png>)
4.  The order will be submitted and a manual discount will be removed:<br>

    <figure><img src="../.gitbook/assets/image (27).png" alt=""><figcaption></figcaption></figure>

### Implementation details:

* Workflow:&#x20;
  * Waiting For Approval -> Submit:

<details>

<summary>Custom Form: "Remove Discounts"</summary>

```
    <title>Document</title>
    <script>
        var trUUID = '';
        pepperi.app.getContext({ responseCallback: "getLines" });

        function getLines (res) {
            trUUID = res.transaction.uuid;
            pepperi.api.transactionLines.search({
                fields: ["UUID", "TSAManualDiscount", "ItemExternalID"], 
                transactionFilter: {
                    ApiName: "UUID",
                    Operation: "IsEqual",
                    Values: [trUUID],
                },
                filter: {
                    Operation: "AND",
                    LeftNode: {
                        ApiName: "Hidden",
                        Operation: "IsEqual", 
                        Values: ["false"]
                    },
                    RightNode:{
                        Operation: "AND",
                        LeftNode: {
                            ApiName: "TSAManualDiscount",
                            Operation: ">", 
                            Values: ["0"]
                        },
                        RightNode:{
                            ApiName: "UnitsQuantity",
                            Operation: ">", 
                            Values: ["0"]
                        }
                    }
                },
                responseCallback: "cleanLines",
                pageSize: 10000, 
                page: 1
            });
        }

        function cleanLines (res) {
            console.log("--- Lines ---> ", res);
            if (res && res.success && res.objects.length) {
                var arrToUpdate = [];

                for (let i = 0; i < res.objects.length; i++) {
                    const el = res.objects[i];
                    arrToUpdate.push({
                        UUID: res.objects[i].UUID,
                        TSAManualDiscount: 0
                    })
                }
                console.log("arrToUpdate", arrToUpdate);

                pepperi.api.transactionLines.update({
                    objects: arrToUpdate,
                    responseCallback: "transactionLinesUpdate",
                });

            } else {
                onClose();
            }
        }

        function transactionLinesUpdate (res) {
            console.log("update Lines result", JSON.stringify(res));
            var checkLinesUpdate = true;

            if(res && res.success && res.result.length) {
                res.result.forEach(el => {
                    if (el.status != 'updated') {
                        checkLinesUpdate = false;
                    }
                });
            }

            if(checkLinesUpdate) {
                pepperi.api.transactions.update({
                    objects: [ {UUID: trUUID , TSAIsNoManualDiscount: true, TSATestAPI: "set to true" }],
                    responseCallback: "closeForm"
                })
            } else {
                onClose();
            }

        }
        
        function closeForm (res) {
			console.log("update Transaction result", JSON.stringify(res));
			onClose();
		}
    </script>
</head>
<body></body>
```

</details>

<details>

<summary>Calculate Field Formula - Recalculate Without Discounts</summary>

updating totals including the updated line totals

</details>

**Tags**: Workflow, Sales Order, Discount, Waiting For Approval
