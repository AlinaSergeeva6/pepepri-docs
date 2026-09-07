---
description: Check the status of the rebuild
---

# Rebuild Polling (internal)

{% hint style="info" %}
In case the rebuild status is InProgress, we check if we need to restart the rebuild (i.e. maybe papi crashed).\
If so-  we will restart the rebuild from the lastInternalID we exported (and not from the beginning).\
If not - we will return the rebuild data and status (see the object we return in the response tab)\
There are 3 statues available -  InProgress, Success/Failure
{% endhint %}



## Polling of all activities data index rebuild

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/bulk/data_index/rebuild/polling/all_activities`

#### Headers

| Name           | Type   | Description                |
| -------------- | ------ | -------------------------- |
| Authentication | string | bearer token of admin user |

{% tabs %}
{% tab title="200 " %}
```javascript
{
  "StartDateTime":
  "ModificationDateTime": "",
  "FieldsToExport":[], // the fields that is being exported
  "Status":"InProgress", // the status of the rebuild
  "Count": 100000,//total count of the rows that will be exported
  "Current":1000,//current number of rows that already was exported 
  "LastInternalID":2389292 // the last internalID that was processed(will be used in case of api crashes in the middle of the build and retry)
  "Message":"in case of failure we should see here the error message"
}
```
{% endtab %}
{% endtabs %}



## Polling of transaction lines data index rebuild&#x20;

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/bulk/data_index/rebuild/polling/transaction_lines`

#### Headers

| Name           | Type   | Description                |
| -------------- | ------ | -------------------------- |
| Authentication | string | bearer token of admin user |

{% tabs %}
{% tab title="200 " %}
```javascript
{
  "StartDateTime":
  "ModificationDateTime": "",
  "FieldsToExport":[], // the fields that was sent 
  "Status":"InProgress",
  "Count": 100000,//total count of the rows that will be exported
  "Current":1000,//current number of rows that already was exported 
  "LastInternalID":2389292 // the last internalID that was exported (will be used in case of api crashes in the middle of the build)
  "Message":"in case of failure we should see here the error message"
}
```
{% endtab %}
{% endtabs %}
