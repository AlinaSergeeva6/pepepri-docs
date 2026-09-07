---
description: This section discuss the addons install/upgrade/downgrade/uninstall
---

# Addons Installation

## Publish Version

We support both dependencies and editors coming from the the addon.config.json file in a new section  called “PublishConfig”.

This section will be sent by the api of publish addon version and will be added as is to the version entry to the column PublishConfig.

PublishConfig format:

```javascript
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
} 
```

## In installation/upgrade/downgrade

### Dependencies:

Before starting install/upgrade/downgrade the dependencies will be checked as follows:&#x20;

every addon in the list with a version will be compared with its creation date against the installed addon version with its name - only if the version **creationDateTime is >=** it will continue, otherwise, error.

#### Only the following names are supported in the dependencies section:

* papi
* cpapi
* webapp
* data\_views
* adal
* pepperi\_elastic\_search
* import\_export\_atd
* pns
* pfs
*

\*\*other addons not supported as dependencies

### Editors:

In the installation/upgrade/downgrade callback function, **if the operation ended with success=true** we take the “Editors” section from the version PublishConfig field and add it to the system data of the installed addon.
