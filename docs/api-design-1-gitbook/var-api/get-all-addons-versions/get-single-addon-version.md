# Get single addon version



{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/addons/versions/{UUID}" method="get" summary="Var API - Get single add-on version" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}
Var admin permission
{% endswagger-parameter %}

{% swagger-response status="200" description="return the asked addon version" %}
```javascript
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
            "Editors":[
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
     
            "Dependencies":{
                "papi":"9.5.296",
                "cpapi":"V121",
                "webapp":"16.41.34",
                "data_views":"0.0.10"
            }
        },
       "Files": [
       {
          "FileName": "",
          "URL": "",
          "Base64Content": ""
          
       },
       ...
       ]
}
```
{% endswagger-response %}
{% endswagger %}

