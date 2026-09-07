# Internal: Create Distributor

{% swagger method="post" path="var/distributors/create" baseUrl="https://api.pepperi.com/v1.0/" summary="Create and initiate a new distributor" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="FirstName" type="String" required="true" %}
The first user's first  name
{% endswagger-parameter %}

{% swagger-parameter in="body" name="LastName" type="String" required="true" %}
The first user's last name
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Email" type="String" required="true" %}
The first user's email address
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Company" type="String" required="true" %}
The distributor's name
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Password" type="String" %}
The first user's password
{% endswagger-parameter %}

{% swagger-parameter in="body" name="ApiToken" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Phone" type="String" %}
The distributor's phone number
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Country" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="CultureName" type="String" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Currency" type="String" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
{
    "DistributorUUID": "81289592-b66d-48ce-b1d0-6a8e278aa446",
    "UUID": "7125c957-b649-4526-a48b-1de9e671d4e4",
    "CreationDateTime": "2021-12-08T10:02:11.6510518Z",
    "ModificationDateTime": "2021-12-08T10:02:11.6510518Z",
    "AuditType": "action",
    "Event": {
        "Type": "addon_job_execution",
        "User": {
            "InternalID": 11480740,
            "UUID": "1ec8684a-358c-4762-97f3-b6ee85ce3fce",
            "Email": "SupportAdminUser_30015312@Wrnty.com"
        }
    },
    "SourceAuditLogUUID": null,
    "Status": {
        "ID": 1,
        "Name": "Success"
    },
    "AuditInfo": {
        "ResultObject": "{\"success\":true,\"resultObject\":{\"install\":null,\"upgrade\":null}}",
        "JobMessageData": {
            "UUID": "7125c957-b649-4526-a48b-1de9e671d4e4",
            "MessageType": "AddonMessage",
            "SchemaVersion": 4,
            "DistributorUUID": "81289592-b66d-48ce-b1d0-6a8e278aa446",
            "FunctionPath": "Addon/Public/00000000-0000-0000-0000-000000000a91/9.5.470/installation.js",
            "ExecutionMemoryLevel": 4,
            "UserUUID": "1ec8684a-358c-4762-97f3-b6ee85ce3fce",
            "NumberOfTry": 1,
            "NumberOfTries": 1,
            "FunctionName": "maintenanceJob",
            "StartDateTime": "2021-12-08T10:02:00.092Z",
            "EndDateTime": "2021-12-08T10:02:10.693Z",
            "Request": {
				...
			}
		}
	}
}

```
{% endswagger-response %}
{% endswagger %}

{% swagger method="post" path="var/sk/distributors/create" baseUrl="https://api.pepperi.com/v1.0/" summary="Create and initiate a new distributor using secret key" %}
{% swagger-description %}
body and response are the same as create distributor above without the secret key
{% endswagger-description %}

{% swagger-parameter in="header" name="xx-pepperi-create-distributor-secret-key" required="true" %}
The create distributor secret key
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
same as above
{% endswagger-response %}
{% endswagger %}

