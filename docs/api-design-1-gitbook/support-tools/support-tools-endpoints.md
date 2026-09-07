# Support Tools Endpoints

{% swagger method="post" baseUrl="https://api.pepperi.com" summary="Upload a user sqlite file to a PFS scheme and retrieve the file URL" path="/v1.0/var/support/{dist_uuid}/cpas/backup_user_db" %}
{% swagger-description %}
Admin only
{% endswagger-description %}

{% swagger-parameter in="body" name="UserUUID" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Description" %}

{% endswagger-parameter %}

{% swagger-parameter in="path" name="dist_uuid" required="true" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
Success

```json
{
            "ModificationDateTime": "2024-01-18T14:48:42.956Z",
            "CreationDateTime": "2024-01-18T14:37:41.638Z",
            "Description": "",
            "URL": "https://pfs.staging.pepperi.com/8bff801e-fa07-4ac9-87b5-31422f930293/76fe8cf0-da3f-44d3-accf-e661cdaea235/sqlite_paths_pfs_scheme/11535771.zip"
}
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="No user data" %}

{% endswagger-response %}
{% endswagger %}

{% swagger method="post" baseUrl="https://api.pepperi.com" summary="Execute resync only if the user is not logged in" path="/v1.0/var/support/{dist_uuid}/cpas/resync" %}
{% swagger-description %}
Admin only
{% endswagger-description %}

{% swagger-parameter in="body" name="UserUUID" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="path" name="dist_uuid" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
&#x20;       [sync return object](https://apidesign.pepperi.com/application/post-sync-applications-data)

```json
// check object in link above
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="An Error instance" %}

{% endswagger-response %}
{% endswagger %}

{% swagger method="post" baseUrl="https://api.pepperi.com" summary="Kill a user webapp process" path="/v1.0/var/support/{dist_uuid}/cpas/kill_process" %}
{% swagger-description %}
Admin only.
{% endswagger-description %}

{% swagger-parameter in="body" name="UserUUID" %}

{% endswagger-parameter %}

{% swagger-parameter in="path" name="dist_uuid" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```json
{ 
  ProcessData?: {
    // check for available process params.
    // if no such param, user is not logged in
  },
  DBData?: {
    CreationDateTime: string,
    ModificationDateTime: string,
    Size : number, // KB,
    LastAccessDateTime: string
  }
}
```
{% endswagger-response %}

{% swagger-response status="500: Internal Server Error" description="An Error instance" %}

{% endswagger-response %}
{% endswagger %}

{% swagger method="post" baseUrl="https://api.pepperi.com" path="/v1.0/var/support/{dist_uuid}/cpas/replace_user_db" summary="Replace DB by UserUUID" %}
{% swagger-description %}
Admin only. \
Validate user is not logged in. \
Backup current db before replacement
{% endswagger-description %}

{% swagger-parameter in="body" name="UserUUID" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="BackupURL" required="true" %}
Output URL of backup\_user\_db.

Mutually exclusive with SyncUUID.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="SyncUUID" %}
Resync uuid only.

Mutually exclusive with BackupURL.
{% endswagger-parameter %}

{% swagger-parameter in="path" name="dist_uuid" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```json
{
    Success: true
}
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="An Error instance" %}

{% endswagger-response %}
{% endswagger %}

{% swagger method="post" baseUrl="https://api.pepperi.com" path="/v1.0/var/support/{dist_uuid}/cpas/user_status" summary="Get multiple users status" %}
{% swagger-description %}
Admin only. \
Get multiple users status based on user uuid list.
{% endswagger-description %}

{% swagger-parameter in="body" name="KeyList" required="true" type="Array" %}
an array of user\_uuid
{% endswagger-parameter %}

{% swagger-parameter in="path" name="dist_uuid" required="true" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="JSON " %}
```typescript
// Response intrfaces

export interface DBData {
    CreationDateTime: string
    ModificationDateTime: string
    FileSizeKB: number
}

export interface ProcessData {
    Node: string, // The machine
    ProcessId: number,
    CreationDate: string,
    CPUUsageSeconds: number,
    RAMUsageMB: number,
}

export interface UserStatus {
    ProcessData?: ProcessData,
    DBData?: DBData,
    UserKey: string
}
```

<pre class="language-typescript"><code class="lang-typescript"><strong>// Example
</strong>{
    "Statuses":[
     { // UserStatus
        "UserKey": "987f2bc8-4c96-4257-99a3-5ac69176df84",
        "ProcessData": { // NOTE! if ProcessData param is missing - user is not logged in
           "Node": "SANDBOX-CPI01", // Machine name
           "CreationDate": "2024-04-05T13:20:18.000Z", // can be used to calculate process uptime
           "ProcessId": "5572",
           "CPUUsageSeconds": 6.4375,
           "RAMUsageMB": 353.3046875
        },
        "DBData": { // NOTE! if param is missing - user has no recent login to webApp. no files exist.
           "CreationDateTime": "2024-01-25T15:23:01.671Z",
            "ModificationDateTime": "2024-01-25T15:23:05.123Z",
            "FileSizeKB": 827
        }
    }]
}

</code></pre>
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="An Error instance" %}

{% endswagger-response %}
{% endswagger %}
