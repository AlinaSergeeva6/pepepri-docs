# Upsert Addon Code Job

{% hint style="info" %}
1. Update is done using the UUID only&#x20;
2. when Posting **IsScheduled** parameter = true it does the actual scheduling.
3. Cron Expression changes are affecting the NextRunTime as well as the IsScheduled - but only IsScheduled will insert it into scheduling.
{% endhint %}

{% hint style="warning" %}
When OwnerID of a Code Job object is presented at object creation - an update to this object must include custom authorization header: &#x20;

&#x20;**`X-Pepperi-OwnerID :  <the OwnerID>`**
{% endhint %}

{% hint style="info" %}
Note: CodeJob execution returns a codeJobUUID string.
{% endhint %}

## &#x20;Upsert Code Job

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/code_jobs`

Upsert By UUID

#### Headers

| Name                                                | Type   | Description              |
| --------------------------------------------------- | ------ | ------------------------ |
| X-Pepperi-OwnerID<mark style="color:red;">\*</mark> | String | the requested addon uuid |

#### Request Body

| Name      | Type | Description |
| --------- | ---- | ----------- |
| json body | json |             |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}

{% hint style="info" %}
Note: use 5 fields cron expression - without seconds and year fields
{% endhint %}

```javascript
{
       "UUID" : "", // mandatory for update
       "CodeJobName" : "", // mandatory for insert
       "Description" : "",
       "CronExpression" : "",
       "IsScheduled" : true,
       "AddonPath" : "addon_file_name", // mandatory for insert
       "AddonUUID" : "", // mandatory for insert
       "NumberOfTries": 2,
       "FunctionName": "" // mandatory for insert
  }

```



### Error Codes : <a href="#error-codes" id="error-codes"></a>

| Scenario                                                                            | Error Code            | Fault String                                                                      | HTTP Status Code |
| ----------------------------------------------------------------------------------- | --------------------- | --------------------------------------------------------------------------------- | ---------------- |
| OwnerID is different from DB ownerID                                                | InvalidParameterCJ006 | Invalid addon owner uuid                                                          | 400              |
| Update - Cannot find Code Job                                                       | InvalidParameterCJ004 | { jobUUID } does not exist.                                                       | 404              |
| Insert - No CodeJobName                                                             | InvalidParameterCJ005 | Invalid field value. Field: CodeJobName: Value cannot be null or empty.           | 400              |
| Delta Between Two Events.TotalMinutes < codeJobDelayRetryInMinutes \* numberOfTries | InvalidParameterCJ007 | Number of tries is not valid. Job next run time cannot be less than the next try. | 400              |
| Insert - No CodeJob Type                                                            | InvalidParameterCJ016 | Requested job type is not valid                                                   | 400              |
| Try to update job type property                                                     | InvalidParameterCJ013 | Can not update job type                                                           | 400              |
| Insert - AddonJob type without AddonUUID or AddonPath                               | InvalidParameterCJ015 | Invalid field value. Field: {FieldName}: Value cannot be null or empty.           | 400              |

## Cron Expressions Format:

| Field Name   | Mandatory | Allowed Values   | Allowed Special Characters |
| ------------ | --------- | ---------------- | -------------------------- |
| Seconds      | YES       | 0-59             | , - \* /                   |
| Minutes      | YES       | 0-59             | , - \* /                   |
| Hours        | YES       | 0-23             | , - \* /                   |
| Day of month | YES       | 1-31             | <p>, - * ? / L W<br></p>   |
| Month        | YES       | 1-12 or JAN-DEC  | , - \* /                   |
| Day of week  | YES       | 1-7 or SUN-SAT   | , - \* ? / L #             |
| Year         | NO        | empty, 1970-2099 | , - \* /                   |

A cron expression is a string comprised of 6 or 7 fields separated by white space. Fields can contain any of the allowed values, along with various combinations of the allowed special characters for that field. The fields are as follows:

## Examples of Cron Expressions:

| \*\*Expression\*\* | \*\*Meaning\*\*                    |
| ------------------ | ---------------------------------- |
| 0 12 \* \* \*      | Fire at 12pm (noon) every day      |
| 15 10 \* \* \*     | Fire at 10:15am every day          |
| 0 9 16 12 \*       | Fire at 9:00am on 16/12 every year |

{% hint style="info" %}
Free Online Cron Generator : [https://www.freeformatter.com/cron-expression-generator-quartz.html](https://www.freeformatter.com/cron-expression-generator-quartz.html)
{% endhint %}
