# Get list of all addons versions



{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/addons/versions?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}" method="get" summary="Var api - Get list of all add-ons versions" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}
var admin permission
{% endswagger-parameter %}

{% swagger-response status="200" description="Return list of all addons versions (filtered if asked) without the version files (for now)" %}
```javascript
 [ 
    {
       "UUID": "",
       "Hidden": false,
       "CreationDateTime": "",
       "ModificationDateTime": "",
       "VersionID": "1",
       "Description": "",
       "Available": true,
       "Phased": false,
       "StartPhasedDateTime": "",
       "AddonUUID": "",
       "PhasedFunction": "",
       "PublishConfig":
        {
            "Editors": 
            [
              {
                  "ParentPackageName": "Automated Jobs",
                  "PackageName": "scheduler?view=jobs",
                  "Description": "Scheduled Jobs"
              },
              {
                  "ParentPackageName": "Automated Jobs",
                  "PackageName": "scheduler?view=executions",
                  "Description": "Execution Log"
               },
              ...
             ],
     
            "Dependencies":
            {
                "papi":"9.5.296",
                "cpapi":"V121",
                "webapp":"16.41.34",
                "data_views":"0.0.10"
            }
        } 
     },
     ...
  ]
```
{% endswagger-response %}
{% endswagger %}



{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons/versions?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}" method="get" summary="Get list of all add-ons versions" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}
Admin permission
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
 [ 
    {
       "UUID": "",
       "Hidden": false,
       "CreationDateTime": "",
       "ModificationDateTime": "",
       "VersionID": "1",
       "Description": "",
       "Available": true,
       "Phased": false,
       "StartPhasedDateTime": "",
       "AddonUUID": "",
       "PhasedFunction": ""
     },
     ...
  ]
```
{% endswagger-response %}
{% endswagger %}
