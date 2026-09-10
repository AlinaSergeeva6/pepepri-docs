---
title: "Connect dotdigital abandon card for custom homepage"
order: 289
---
# Connect dotdigital abandon card for  custom homepage

First of all you ask dotDigital to create a program for abandon card and take id of this program.

After that you add a script which they send for you (here you can see this script [https://support.dotdigital.com/hc/en-gb/articles/216885158-Setting-up-abandoned-carts](https://support.dotdigital.com/hc/en-gb/articles/216885158-Setting-up-abandoned-carts)

For getting last active transaction you need to add an api request:

```
    this.lastTransaction = function (accountUUID) {
 	console.log(accountUUID);
      pepperi.api.transactions.search({
          fields: [
            "UUID",
            "GrandTotal",
            "AccountUUID",
            "WrntyID",
            "AgentEmail",
            "AgentFirstName"
          ],
          filter: {
            Operation: "AND",
            RightNode: {
              ApiName: "ActionDateTime",
              Operation: "InTheLast",
              Values: ["4", "Weeks"],
            },
            LeftNode: {
              Operation: "AND",
              RightNode: {
                ApiName: "Account.UUID",
                Operation: "IsEqual",
                Values: ['' + accountUUID],
              },
              LeftNode: {
                Operation: "AND",
                RightNode: {
                  ApiName: "Hidden",
                  Operation: "IsEqual",
                  Values: ['false'],
                },
                LeftNode: {
                  ApiName: "Status",
                  Operation: "IsEqual",
                  Values: ["1"],
                },
              },
            },
          },
        sorting: [{
          Field: "ActionDateTime",
          Ascending: false
        }],
        pageSize: 1,
        page: 1,
        responseCallback: "customHeader.getRecentTransactionForAccountCallback"
      });
}
```

For getting last transaction when user go to transaction’s cart you need to add this function:

```
window.addEventListener('popstate', function(){
if(window.location.href.includes('transactions/cart')){
        customHeader.lastTransaction(customHeader.accountUUID);
      }
    })
```

After you get last active transaction you need to take transaction lines. To get that add this function:

```
    this.getRecentTransactionForAccountCallback = function (resPre) {
    console.log(resPre.objects[0].UUID);
    customHeader.lastTransactionUUID = resPre.objects[0].UUID
    pepperi.api.transactionLines.search({
      fields: [
        "UUID",
        "ItemName",
        "UnitsQuantity",
        "UnitPrice",
        "Image",
        "ItemExternalID",
        "ItemWrntyID",
        "ItemLongDescription",
        "ItemMainCategory",
        "ItemDiscount",
        "UnitPriceAfterDiscount",
        "UnitDiscountPercentage"
      ],
      filter: {
        Operation: "AND",
        RightNode: {
          ApiName: "Transaction.UUID",
          Operation: "IsEqual",
          Values: [customHeader.lastTransactionUUID],
        },
        LeftNode: {
          ApiName: "Hidden",
          Operation: "IsEqual",
          Values: ['false'],
        }
      },
      sorting: [{
        Field: "ActionDateTime",
        Ascending: false
      }],
      responseCallback: "customHeader.getRecentTransactionLinesForAccountCallback",
      requestID: resPre.objects[0]
    });
  }
```

After you get transaction lines you need to format it for sending dotDigital, for it add this function:

```
this.getRecentTransactionLinesForAccountCallback = function (res) {
    console.log(res);
    console.log(res.requestID);
    var allLines = [];

    res.objects.forEach(element => {
      var lineItems = {};
      total = element.UnitPrice * element.UnitsQuantity
      lineItems = {
        "sku": element.ItemWrntyID,
        "name": element.ItemName,
        "description": element.ItemLongDescription,
        "category": element.ItemMainCategory,
        "unitPrice": element.UnitPrice,
        "salePrice": element.UnitDiscountPercentage,
        "quantity": element.UnitsQuantity,
        "totalPrice": element.UnitPriceAfterDiscount,
        "imageUrl": element.Image,
        "productUrl": `https://app.pepperi.com/transactions/item_details/${customHeader.lastTransactionUUID}/${element.ItemExternalID}`
      }
      allLines.push(lineItems)
    });

    (function (w, d, u, t, o, c) {
      w['dmtrackingobjectname'] = o;
      c = d.createElement(t);
      c.async = 1;
      c.src = u;
      t = d.getElementsByTagName(t)[0];
      t.parentNode.insertBefore(c, t);
      w[o] = w[o] || function () {
        (w[o].q = w[o].q || []).push(arguments);
      };
    })(window, document, '//static.trackedweb.net/js/_dmptv4.js', 'script', 'dmPt');

    window.dmPt('create', 'DM-0395272459-02', 'shop.ogieyewear.com,ogieyewear.com');

    // Identify the user via email
    window.dmPt('identify', res.requestID.split(":")[2].split(",")[0].replace(/["']/g, ""));
    console.log(res.requestID.split(":")[2].split(",")[0].replace(/["']/g, ""));
    // debugger

    // Track your cart
    window.dmPt("cartInsight", {
      "programID": 28305,
      "cartDelay": 300,
      "cartID": res.requestID.split(":")[5].split(",")[0].replace(/["]/g,"").replace(/[\\]/g,""),
      "cartPhase": "CUSTOMER_LOGIN",
      "currency": "USD",
      "subtotal": res.requestID.split(":")[4].split(",")[0],
      "shipping": 0,
      "discountAmount": 0,
      "taxAmount": 0,
      "grandTotal":res.requestID.split(":")[4].split(",")[0],
      "cartUrl": `https://app.pepperi.com/transactions/cart/${customHeader.lastTransactionUUID}`,
      "other": {"firstName": res.requestID.split(":")[3].split(",")[0]},
      "lineItems": allLines
    });
  }
```

In that function we format all transaction lines and send to dotDigital. You will need to ask a customer emails and dotDigital code for **window.dmPt('create', 'DM-0395272459-02', 'shop.ogieyewear.com,ogieyewear.com');** function. After this you just change ProgramID here:

```
    window.dmPt("cartInsight", {
    "programID": 28305,
      "cartDelay": 300,
      "cartID": res.requestID.split(":")[5].split(",")[0].replace(/["]/g,"").replace(/[\\]/g,""),
      "cartPhase": "CUSTOMER_LOGIN",
      "currency": "USD",
      "subtotal": res.requestID.split(":")[4].split(",")[0],
      "shipping": 0,
      "discountAmount": 0,
      "taxAmount": 0,
      "grandTotal":res.requestID.split(":")[4].split(",")[0],
      "cartUrl": `https://app.pepperi.com/transactions/cart/${customHeader.lastTransactionUUID}`,
      "other": {"firstName": res.requestID.split(":")[3].split(",")[0]},
      "lineItems": allLines
    });
```

**Very important to check** that **"cartPhase" : "CUSTOMER\_LOGIN"**

Ask customer how much time they want to give for cart before it change status to abandoned cart **"cartDelay": 300**,

After you finished with your custom homepage file, you need to create a custom form with this code:

```
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
</head>

<script>
      var lastTransactionData;
      var lastTransactionUUID;
      console.log( workflowObject.AccountUUID);
      pepperi.api.transactions.search({
          fields: [
            "UUID",
            "GrandTotal",
            "AccountUUID",
            "WrntyID",
            "AgentEmail",
            "AgentFirstName"
          ],
          filter: {
            Operation: "AND",
            RightNode: {
              ApiName: "ActionDateTime",
              Operation: "InTheLast",
              Values: ["4", "Weeks"],
            },
            LeftNode: {
              Operation: "AND",
              RightNode: {
                ApiName: "Account.UUID",
                Operation: "IsEqual",
                Values: ['' + workflowObject.AccountUUID],
              },
              LeftNode: {
                ApiName: "Hidden",
                  Operation: "IsEqual",
                  Values: ['false'],
              },
            },
          },
        sorting: [{
          Field: "ActionDateTime",
          Ascending: false
        }],
        pageSize: 1,
        page: 1,
        responseCallback: "getRecentTransactionForAccountCallback"
      });

  function getRecentTransactionForAccountCallback(resPre) {
    console.log("resPre",resPre)
    lastTransactionData = resPre.objects[0]
    lastTransactionUUID = resPre.objects[0].UUID
    console.log("lastTransactionUUID",lastTransactionUUID)
    pepperi.api.transactionLines.search({
      fields: [
        "UUID",
        "ItemName",
        "UnitsQuantity",
        "UnitPrice",
        "Image",
        "ItemExternalID",
        "ItemWrntyID",
        "ItemLongDescription",
        "ItemMainCategory",
        "ItemDiscount",
        "UnitPriceAfterDiscount",
        "UnitDiscountPercentage"
      ],
      transactionFilter: {
        ApiName: "UUID",
        Operation: "IsEqual",
        Values: [lastTransactionUUID],
        },
      filter: {
          ApiName: "Hidden",
          Operation: "IsEqual",
          Values: ['false'],
      },
      responseCallback: "getRecentTransactionLinesForAccountCallback"
    });
  }

  function getRecentTransactionLinesForAccountCallback(res) {
    console.log("transactionLines",res);
    //console.log(res.requestID);
    var allLines = [];

    res.objects.forEach(element => {
      var lineItems = {};
      lineItems = {
        "sku": element.ItemWrntyID,
        "name": element.ItemName,
        "description": element.ItemLongDescription,
        "category": element.ItemMainCategory,
        "unitPrice": element.UnitPrice,
        "salePrice": element.UnitDiscountPercentage,
        "quantity": element.UnitsQuantity,
        "totalPrice": element.UnitPriceAfterDiscount,
        "imageUrl": element.Image,
        "productUrl": `https://app.pepperi.com/transactions/item_details/${lastTransactionUUID}/${element.ItemExternalID}`
      }
      allLines.push(lineItems)
    });

    (function (w, d, u, t, o, c) {
      w['dmtrackingobjectname'] = o;
      c = d.createElement(t);
      c.async = 1;
      c.src = u;
      t = d.getElementsByTagName(t)[0];
      t.parentNode.insertBefore(c, t);
      w[o] = w[o] || function () {
        (w[o].q = w[o].q || []).push(arguments);
      };
    })(window.parent, document, '//static.trackedweb.net/js/_dmptv4.js', 'script', 'dmPt');

    window.parent.dmPt('create', 'DM-0395272459-02', 'shop.ogieyewear.com,ogieyewear.com');

    console.log("lastTransactionData",lastTransactionData);
    // Identify the user via email
    window.parent.dmPt('identify', lastTransactionData.AgentEmail);
    //console.log(res.requestID.split(":")[2].split(",")[0].replace(/["']/g, ""));
    //debugger

    // Track your cart
    window.parent.dmPt("cartInsight", {
      "programID": 28305,
      "cartDelay": 300,
      "cartID": lastTransactionData.WrntyID,
      "cartPhase": "ORDER_COMPLETE",
      "currency": "USD",
      "subtotal": lastTransactionData.GrandTotal,
      "shipping": 0,
      "discountAmount": 0,
      "taxAmount": 0,
      "grandTotal":lastTransactionData.GrandTotal,
      "cartUrl": `https://app.pepperi.com/transactions/cart/${lastTransactionUUID}`,
      "other": {"firstName": lastTransactionData.AgentFirstName},
      "lineItems": allLines
    });
    onClose()
  }
</script>
</html>
```

This custom form will change status of card from abandon cart to submitted card.

**Here you will need to change program ID and window.parent.dmPt('create', 'DM-0395272459-02', 'shop.ogieyewear.com,ogieyewear.com'); (DM code and emails)**

Put this custom form in the last place between in creation and submitted:

![](/static/123.png)

Full code of Custom Header here:

26KB

[customweb\_header.html](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MeP5w1Zw-XdaB1VNz2E%2F-MeP67d8NnbfNdCZDJ1M%2Fcustomweb_header.html?alt=media&token=e5b95a63-f5ce-45fd-808a-2cb5f4fd11f0)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MeP5w1Zw-XdaB1VNz2E%2F-MeP67d8NnbfNdCZDJ1M%2Fcustomweb_header.html?alt=media&token=e5b95a63-f5ce-45fd-808a-2cb5f4fd11f0)
