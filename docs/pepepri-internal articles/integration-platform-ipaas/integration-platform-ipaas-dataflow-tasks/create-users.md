---
title: "Create Users"
description: "The examples you can find in 'Integration Examples' (6685); 'Users table' (64052) - folder for dataflow tasks"
order: 244
---
# Create Users

*The examples you can find in 'Integration Examples' (6685);  'Users table' (64052) - folder for dataflow tasks*

The main idea of ​​this article is to show how to load users into pepperi

In order to upload users follow the next steps:

1.  Сreate a dataflow task, which will upload a manually created file with columns like

![](/static/98Capture.PNG)

**IMPORTANT** column is ID (ExternalID)

![](/static/C567apture.PNG)

2\. Сreate a dataflow task, which will take a table with data and do loop\_over\_table of the first dataflow task

![](/static/78.PNG)

**the most important parameters are:**

"ExternalID": "$#ID#$" - ID with a column from the table

"InternalID": value - we take this value from Tools - Pepperi Resources - Users (add Role and Profile) and see value (6554)

![](/static/67Capture.PNG)

![](/static/kkkk.PNG)

Send an HTTP request [https://papi.pepperi.com/V1.0/createUser](https://papi.pepperi.com/V1.0/createUser)

Enter the current token in Authorization

![](/static/56.PNG)

we also create a json Body, the code is given below

```
        {
        "ExternalID": "$#ID#$",
        "Email": "$#Email#$",
        "FirstName": "$#First#$",
        "IsInTradeShowMode": false,
        "LastName": "$#Last#$",
        "Profile": {
            "Data": {
                "InternalID":71398
            }
        },
        "Role": {
            "Data": {
                "InternalID": 6533
            }
        }
    }
```

Ready. Enjoy)
