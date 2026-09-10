---
title: "Integration settings"
description: "How to configure connection between SAP and Pepper"
order: 148
---
# Integration settings

*How to configure connection between SAP and Pepper*

## Settings Editor

Open **SAP Business One\\online\_listener\\SettingsEditor.exe**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-464.png)

|  |  |  |  |
| --- | --- | --- | --- |
| **Key** | Value example | Need to be configured | Description |
| broker\_url | //url | No | Defines the path to the signalr. |
| clientid | 40dfa463-6ac8-4704-85b8-31dbe24dca71 | No | Uniqe value for each listener-account pair to define their communication |
| retry\_after\_seconds | 5 | No |  |
| ping\_every\_minutes | 10 | Yes | Defines time between ping requests in minutes. Min value = 5 |
| trace\_days | 4 | No |  |
| trace\_level | all | No |  |
| force\_long\_pol | 0 | No |  |
| seconds\_wait\_for\_ping | 10 | Yes | Define time while listener waits for ping in seconds. |

## Pepperi settings

There are a lot of the options in Plugin Settings to configure integration. General settings are common for all of the tasks. Inside the task additional settings could be configured. In the Task Settings the same settings as in the General Settings could also be configured, but Tasks settings have higher priority than General.

For **Webhook Tasks** all of these settings **should be used in the Header Task**. Using them inside the Lines Tasks Settings will bring errors.

### Settings configuration

|  |  |  |  |
| --- | --- | --- | --- |
| Name | Example Value | Optional/mandatory | Description |
| client\_directory | \\path\\ | Optional |  |
| commandtimeout | 1200 (seconds) | Optional | Timeout for SQL command |
| companydb | SBODEMOGB | Mandatory | SQL Company DB |
| companylang | 3 | Optional | SAP Company Language for messages (OLNG SAP Table) |
| companyuser | SAPusername | Mandatory | SAP Company username |
| companypass | SAPpassword | Mandatory | SAP Company password |
| dbuser | username | Mandatory | SQL database username |
| dbpass | \*\*\*\*\*\* | Mandatory | SQL database password |
| desktop\_response\_timeout | 1200000 | Optional | Timeout when sending response back to Pepperi (miliseconds) |
| desktop\_response\_write\_timeout | 1200000 | Optional | Timeout when writing response back to Pepperi (miliseconds) |
| donotsend | 1/0 | Optional | Allows not to send data to the task Target Object. Task works like it\`s Target object is Store Data for Later Use |
| is\_alert\_email\_on\_retry | 1/0 | Optional | Send email on errors of type retry |
| is\_debug\_dataset | 1/0 | Optional | Allows to see more wide log with additional details. Uses only for debug purposes (it slows transaction) |
| is\_edit\_allowed | 1/0 | Optional | Allows to resubmit the order in the SAP and create new order ID in SAP |
| is\_new\_api | 1/0 | Mandatory | Mandatory field for all of the tasks, excepting FTP |
| is\_sql\_source | 1/0 | Optional | Listener setting - it define SQL tab in Integration as listener source |
| licenseserver | qb1:3000 | Mandatory | SAP License Server Address |
| listener\_run\_exe | .\\Exporter\\Exporter.exe | Mandatory | Specify path to the desktop executable application |
| listener\_temp\_folder | .\\Online\_Orders | Optional | Defines temporary folder for export |
| response\_id\_sql | `SELECT ...` | Optional | Allows to change SAP response in the Pepperi |
| on\_trn\_error\_send\_email | 1/0 | Optional | Send Email On Transaction Error |
| on\_task\_error\_send\_email | 1/0 | Optional | Send Email On Task Error |
| order\_wrntyid | InternalID | Optional | Pepperi Primary Key Field Name |
| server | QB1\\SQLEXPRESS | Mandatory | SQL server name |
| servertype | 2012 | Mandatory | SQL Server Version/ Hana.<br><br>Query: `SELECT @@VERSION AS 'SQL Server Version';` |
| signalr\_client\_id | \*-\*-\*-\*-\* | Mandatory | Online Listener Client ID. |
| smtp\_to | email@email.com | Optional | SMTP email address to send integration errors |
| smtp\_subject | text | Optional | SMTP subject of integration errors |
| smtp\_task\_error\_subject | text | Optional | SMTP email subject of message when task error occurred |
| smtp\_task\_error\_to | email@email.com | Optional | SMTP email address to send task errors |
| sql\_connection | Data Source=QB1;<br><br>Integrated Security=False;<br><br>User ID=sa;<br><br>Password=Wrnty8888 | Mandatory | SQL connection string |
| timerinterval | 10000 | Optional | Time Interval To Shut Down the Importer |
| trn\_status | regular<br><br>draft<br><br>none | Optional | Different tables for different transaction statuses - allows |
| trn\_import\_filter | `UnitsQuantity<>0`<br><br>`AND`<br><br>`and ItemExternalID <> ''` | Optional | Filter lines |
| wintrusted | true/false | Optional | Allows Windows Trusted Mode for SQL |

## Old settings

|  |  |  |  |
| --- | --- | --- | --- |
| Name |  |  |  |
| wizard\_log |  |  |  |
| is\_sap\_stay\_connected |  |  |  |
