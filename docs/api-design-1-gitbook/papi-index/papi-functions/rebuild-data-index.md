# Rebuild Data Index (internal)

{% hint style="danger" %}
Must install the Data Index addon so those papi functions will work.
{% endhint %}

{% hint style="info" %}
We export to the data index only rows with hidden=0.\
We export rows that was archived.
{% endhint %}

{% hint style="info" %}
In those two endpoints we check if the status is already at InProgress - \
\- if yes, we do nothing, just returning the rebuild data and status.\
\- if not - we start the process of exporting the full data from scratch.\
In the Body there should be a list of fields to be exported
{% endhint %}

## Fields to export limitations

We support most of the ApiNames as in the API with the following limitations:

1. TSA reference fields are **not** supported for now
2. TSA from type button not supported
3. We do not support all the calculated fields\
   (calculated fields are fields that doesn't have db column and usually being calculated in runtime by the nucleus code of the API) \
   We supports only the following calculated fields:
   * On **all activities**:
     * StatusName
   * On **transaction lines**:
     * TotalUnitsPriceAfterDiscount
     * TotalUnitsPriceBeforeDiscount
4. On **transaction lines data index**, if you want to export reference fields from the **Transaction** (i.e fields like Transaction.ActionDateTime, Transaction.StatusName, Transaction.Agent.Email) you **must** rebuild data index for all activities before you rebuild data index for transaction lines.\
   Also If you will not export the above field to the all\_activities data index - you will get the value null exported to the transaction lines as value of those fields.
5. Second level (or third level) reference on account or item support only parent reference field (for example on all activities field like Account.Parent.ExternalID, on transaction line Item.Paren.ExternalID or Transaction.Account.Parent.ExternalID)
6. Unlike the API if specific row doesn't have value for a specific TSA field we do not export it in the document (in the API those TSAs will be have value null, in the data index they will not appear)

{% swagger baseUrl="https://papi.pepperi.com" path="/V1.0/bulk/data_index/rebuild/all_activities" method="post" summary="Rebuild all activities data index" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
bearer token of admin user
{% endswagger-parameter %}

{% swagger-parameter in="body" name="FieldsToExport" type="array" %}
List of field to export
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
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
{% endswagger-response %}
{% endswagger %}



{% swagger baseUrl="https://papi.pepperi.com" path="/V1.0/bulk/data_index/rebuild/transaction_lines" method="post" summary="Rebuild transaction lines data index" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
bearer token of admin user
{% endswagger-parameter %}

{% swagger-parameter in="body" name="FieldsToExport" type="array" %}
List of field to export 
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
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
{% endswagger-response %}
{% endswagger %}

