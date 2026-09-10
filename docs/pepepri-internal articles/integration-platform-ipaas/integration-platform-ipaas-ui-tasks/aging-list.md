---
title: "Aging List"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account, UI task: \"AgingList\""
order: 210
---
# Aging List

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account, UI task: "AgingList"*

Aging List - it is general template which looks like activities in Pepperi App. In the sample you can see Aging List:

![](/static/1-27.png)

It is completely responsive, so you can change anything, while spending as little time as possible.

![](/static/2-20.png)

![](/static/3-14.png)

![](/static/4-11.png)

You can choose default date picker value:

![](/static/5-9.png)

If you need to see all data click button “Clear” or choose another default date picker value.

As you can see in the header of table we have total of items:

![](/static/6-8.png)

Here you can see total for some of columns:

![](/static/7-6.png)

Here you can see total for chosen items for Debit column:

![](/static/8-4.png)

Than you can click top buttons, in case of "**Cash**":

![](/static/9-4.png)

in case of "**Cheque**":

![](/static/10-3.png)

In this template you can very easy create table with quantity of columns which you need, with quantity and functionality of smart search which you need, date picker, with styles like in pepperi app. You can found in the start of code in object which named gs (general scope) all that you need:

![](/static/1-28.png)

Firstable, you need to choose and add your configuration and main fields which you need (fields for columns we add later)

you can do it in this part of code:

```
config: {// configuration for api coll
   ActivityTypeID: ["270494"],
   Status: [""],
},
fields: [ // fiels which you need, but you don't want to add it's to table
   "UUID",
   "Status",
],
```

After that add setting to columns.

We have 5 types of columns: checkbox, link, price, text, date.

As you can see in this part of code they have personal settings for each of them:

```
 columns: function (data, element) {
 column = {
  col1: {
   id: element.InternalID ? element.InternalID : "",// id for checkbox, it's should be unique value
   type: 'checkbox', //type of column
   disablet: element.TSACredit > 0 && element.TSADebit == null ? "disabled" : "",//desadled of checkbox
   onclickvalue1: element.InternalID,  // id wich you need to move to payment
   onclickvalue2: element.TSADebit,  // value wich you need to move to payment
   onclickfunction: "calcTotal", // function wich colled if you click to checkbox, in this case to move to payment
   style: 'border-radius: 0.25rem 0 0 0.25rem !important;', // you can change style of checkbox here
   class: 'asc', //don't change it
  },
  col2: {
   colName: 'Invoice', //Name of column
   type: 'link', //type of column
   value: element.InternalID, //value which you need to see in table
   nameField: 'InternalID', // name of field wich need to search in activitys for add to column
   urlTemplate: function (key) { var a = ``; return a = `http://app.pepperi.com/activities/details/${gs.columns(gs.activityData, element)[key].urlField}` },// link to url
   urlField: element.UUID,// you can change if you need, it's use only in urlTemplate
   style: "" // you can change style here
  },
  col3: {
   colName: 'Debit', //Name of column
   type: 'price', //type of column
   value: element.TSADebit, //value which you need to see in table
   nameField: 'TSADebit',// name of field wich need to search in activitys for add to column
   currency: 'USD', //currency of your "price", you can select 'USD'->$ 'EUR'->€ 'GBP'->£
   decimalPlace: 2, // the value indicates the number of decimal places.
   style: "" // you can change style here
   },
  col4: {
   colName: 'Symbol',//Name of column
   type: 'text',//type of column
   value: element.TSASymbol ? element.TSASymbol : '',//value which you need to see in table
   nameField: 'TSASymbol',// name of field wich need to search in activitys for add to column
   style: "" // you can change style here
  },
  col5: {
   colName: 'ActionDateTime',//Name of column
   type: 'date', //type of column
   value: element.ActionDateTime,//value which you need to see in table
   nameField: 'ActionDateTime',// name of field wich need to search in activitys for add to column
   style: ""// you can change style here
 },
}
}
```

the order in which the columns are displayed depends on the order of the properties in the object.

Here you can see how to change column which should calculate total:

```
columns: function (data, element) {
 column = {
  col1: {
   id: element.InternalID ? element.InternalID : "",// id for checkbox, it's should be unique value
   type: 'checkbox', //type of column
   disablet: element.TSACredit > 0 && element.TSADebit == null ? "disabled" : "",//desadled of checkbox
   onclickvalue1: element.InternalID,  // id wich you need to move to payment
   onclickvalue2: element.TSADebit,  // value wich you need to move to payment
   onclickfunction: "calcTotal", // function wich colled if you click to checkbox, in this case to move to payment
   style: 'border-radius: 0.25rem 0 0 0.25rem !important;', // you can change style of checkbox here
   class: 'asc', //don't change it
  },
```

“onclickfunction” – function which calculated total

“onclickvalue1” – main key for calculated total

“onclickvalue2” – from this column would be calculated total

For manage sum you need to those objects and arrays in ”gs“:

```
ValueForSumOfColunms:{//You can customize totals for colunms
            1: function (i) { return a = gs.activityData[i].TSA130Days},
            2: function (i) { return a = gs.activityData[i].TSA31to60Days},
            3: function (i) { return a = gs.activityData[i].TSAOver90Days}
        },
        NameForSumOfColunms:[//quantity of names of sum for colunms shuold be equel quantity of properties ValueForSumOfColunms
        '1-30 Days',
        '31-60 Days',
        'Over 90 Days'
        ],
        OptionsForSumOfColunms:{
        currency: 'USD', //you can select currency
        decimalPlace: 2, // the value indicates the number of decimal places.
        }
```

After that add smart search and setting for it:

We have 3 types of smart search 1="checkbox", 2="comparison" 3="checkboxes"

Please, use number for named type of smart search, like in the samples.

As you can see in this part of code they have personal settings for each of them:

```
SmartSearch: {
  PaymentStatus: {//value of object property should be unique
   name: "Payment Status",//name of smart search should be unique
   typeSearch: 1,//now we have 3 type of smart search 1:"checkbox", 2:"comparison" 3:"checkboxes"
   data: function (i) { return a = gs.activityData[i] }, // data for search
   searchBy: function (i) { return a = gs.activityData[i].TSAPaymentStatus },//the column on which the search will take place
   condition: true,//it's condition which you want to see after triggered
   check: 0,//don't change this
   CheckDraw: false,//don't change this
   checkClear: 0,//don't change this
            },
 Debit: {//value of object property should be unique
   name: "Debit",//name of smart search should be unique
   typeSearch: 2,//now we have 3 type of smart search 1:"checkbox", 2:"comparison" 3:"checkboxes"
   data: function (i) { return a = gs.activityData[i] },// data for search
   searchBy: function (i) { return a = gs.activityData[i].TSADebit },//the column on which the search will take place
   condition: null,//it's condition which you want to see after triggered
   check: 0,//don't change this
   CheckDraw: false,//don't change this
   checkClear: 0,//don't change this
            },
 PaymentStatus1: {//value of object property should be unique
   name: "Payment",//name of smart search should be unique
   typeSearch: 3,//now we have 3 type of smart search 1:"checkbox", 2:"comparison" 3:"checkboxes"
   data: function (i) { return a = gs.activityData[i] },// data for search
   searchBy: function (i) { return a = gs.activityData[i].TSAPaymentStatus ? "Paid" : "To Be Paid" },//the column on which the search will take place
   pointForSearch: function (i) { return a = globalData[i].TSAPaymentStatus ? "Paid" : "To Be Paid" //need only for property "typeSearch: 3"should be include to globalData
   condition: true,//it's condition which you want to see after triggered
   check: 0,//don't change this
   CheckDraw: false,//don't change this
   checkClear: 0,//don't change this
            },
        },
```

In date picker you can change data for search and default value of filter like in next code:

```
DatePicker: {//don't change this
 data: function (i) { return a = gs.activityData[i] },/},// data for search
 searchBy: function (i) { return a = gs.activityData[i].ActionDateTime },
 DefaultOption: "In the Last",//You can add default option... //mandatory
 DefaultOptionValue: 1,//... and value of it...               //mandatory
 DefaultOptionTimeType: "Years",//... and type                //mandatory
 CurrentOption: '',//don't change this
 CurrentOptionValue: '',//don't change this
 CurrentOptionTimeType: '' //don't change this
 },
```
