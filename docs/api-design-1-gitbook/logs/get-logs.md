# 🕵️ Get Logs



{% hint style="info" %}
For var users query all logs

For support-admin users query only own logs (based on distributor UUID or ID).
{% endhint %}

{% hint style="info" %}
Regular admins can only get logs for non system groups.
{% endhint %}

{% hint style="info" %}
Supports one Parse and one Stats in this order, meaning you can activate functions on parsed fields- but not the other way around.
{% endhint %}

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/logs`

Get logs from CloudWatch™

#### Request Body

| Name                                     | Type                                   | Description                                                                                                                                                                                                                                                                             |
| ---------------------------------------- | -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Groups<mark style="color:red;">\*</mark> | Array                                  | <p>List of Pepperi log groups.</p><p>Supports up to 20 AWS log groups in a query.</p><p><a href="https://github.com/Pepperi-Addons/logs-fetcher/blob/master/server-side/config/LogGroups.config.ts">Link to mapping.</a></p>                                                            |
| Filter                                   | String                                 | <p>Query string in <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">insights cloud watch format</a>.<br><strong>Example</strong>: Message like '306637'<br>default: no filter.</p>                                                               |
| Fields                                   | String\[]                              | <p><strong>Default</strong>:<br>["DistributorUUID", "ActionUUID", "UserUUID", "Level", "Message", "DateTimeStamp"]</p><p><strong>Note:</strong> Send either Fields or Stats/Parse.</p>                                                                                                  |
| PageSize                                 | number                                 | **Default** 20, **maximum** 10000                                                                                                                                                                                                                                                       |
| OrderBy                                  | String                                 | <p>Order by which field and in which order.<br><strong>Default</strong>: @timestamp desc</p>                                                                                                                                                                                            |
| DateTimeStamp                            | {   "Start": string,   "End": string } | <p>An object that represents the date and time interval to search logs in.<br><strong>Example value</strong>: <br>{ <br>    "Start": "2022-03-15T12:35:00Z",<br>    "End": "2022-03-15T12:35:00Z"<br>}</p><p><strong>Default:</strong><br>Start: One hour ago,<br>End: Current time</p> |
| Page                                     | number                                 | **Default** 1                                                                                                                                                                                                                                                                           |
| Stats                                    | String                                 | <p>Uses log field values to calculate aggregate statistics.<br><a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">Documentation</a>.<br><strong>Note:</strong> Send either Fields or Stats/Parse.</p>                                              |
| Parse                                    | String                                 | <p>Used to parse a log property and extract new fields from it.<br><a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html">Documentation</a>.<br><strong>Note:</strong> Send either Fields or Stats/Parse.</p>                                          |

{% tabs %}
{% tab title="200: OK " %}
```javascript
[
    {
    // If 'Fields' field is in request returns those.
    // If 'Stats' fields is in request returns calculated fields.
    // If Both are missing returns default fields: 
        "DistributorUUID": "",
        "ActionUUID": "",
        "UserUUID": "",
        "Message": "",
        "DateTimeStamp": "2020-11-08T11:55:10.501Z",
        "Level": "ERROR | DEBUG | INFO | WARN",
    },
    ...
]
```
{% endtab %}
{% endtabs %}

**Possible Log Groups:**

AsyncAddon, CodeJobs, Addon, SyncOperation, CustomDomain, LogFetcher, PAPI, CPAPI, PFS, PNS, FileIntegration, CPAS, OperationInvoker, CORE
