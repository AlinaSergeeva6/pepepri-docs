# Rebuild retry  (internal)

{% hint style="info" %}
In case the rebuild status is failure because of some unexpected reason like bad getaway, timeout and etc.., we can do retry to try continue the build of the data index from the last InternalID it stop.

Inside that function we check if the status is Failure - if so we retry, If not- nothing will happen.
{% endhint %}

{% swagger baseUrl="https://papi.pepperi.com" path="/V1.0/bulk/data_index/rebuild/retry/all_activities" method="post" summary="Retry of all activities data index rebuild" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
bearer token of admin user
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



{% swagger baseUrl="https://papi.pepperi.com" path="/V1.0/bulk/data_index/rebuild/retry/transaction_lines" method="post" summary="Retry of transaction lines data index rebuild" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
bearer token of admin user
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
