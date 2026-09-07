# Distributor

{% swagger baseUrl="https://papi.pepperi.com/v1.0/" path="distributor" method="get" summary="Distributor Resource" %}
{% swagger-description %}
Standard single pepperi resource on the Distributor (i.e. the pepperi tenant).&#x20;

Admin users cannot set all parameters returned in the GET, refer to the the respond and look for "ReadOnly" comment next to each property to get a clear list of what is allowed to change by regular admin permission&#x20;
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" required="true" %}
Authentication token of an admin user
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{
        "InternalID": 1110703, // ReadOnly
        "UUID": "f577c6ac-737e-49fd-839d-e62bf9338f1b", // ReadOnly
        "Name": "ido.t",
        "CreationDateTime":"2012-11-18 06:06:32.550", // ReadOnly
        "ModificationDateTime":"2020-08-23 06:40:26.120", // ReadOnly
        "TrialExpirationDateTime": "2030-08-10T00:00:00", // readonly or VAR
        "MaxEmployees": 1004, // readonly or VAR
        "Email": "ido1@ido.com",
        "Phone":"0523464156",
        "Street": "",
        "City":"Raanana",
        "ZipCode":"",
        "CultureName": "en-SB",
        "Country": {
                "ID": 1201,
                "Name": "USA" // ReadOnly
        },
        "State": {
                "ID": 45654,
                "Name": "Texas" // ReadOnly
        },
        "AccountingStatus": { // readonly or VAR
                "ID": 1,
                "Name": "Trial"
        },
        "Currency": {
                "ID": 3,
                "Name":"USD" // ReadOnly
        },
         "SuperAdminUser": {
                "ID": 348464,
                "Name":"Ido.t" // ReadOnly
        },
        "Maintenance":{
                "MaintenanceWindow":"01:00:00.0000000",
                "AutomaticUpgradeAfter":"",
                "AutomaticUpgradeAfterX%":""
        }
}
```
{% endswagger-response %}
{% endswagger %}

### Accounting Status

&#x20;There are 3 accounting status - Paying (0), Trial(1), Disabled(2)&#x20;

When account is in trial status and the trial expiration date has passed the system will do 2 things: hide all users (excluding the internal system user) and all buyers hence blocking users from accessing Pepperi API.&#x20;

When moving back account into valid trial or paying status, all users and buyers that were hidden will be restored. Note, the account will still work as usual in terms of all jobs (i.e. version updates, integrations, etc...)

Six months after trial expiration date has passed all addons will be uninstalled and the account will be disabled for good&#x20;

{% hint style="info" %}
unlike regular resources the distributor resource is a single resource per customer so it is not returned as an array

It is a "regular" resource for var users&#x20;
{% endhint %}

