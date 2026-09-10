---
title: "SAP - Export PDF from SAP to FTP/SFTP"
description: "Effort Estimation: 2h"
order: 140
---
# SAP - Export PDF from SAP to FTP/SFTP

*Effort Estimation: 2h*

### Description:

Allows to export .pdf files from SAP to FTP/SFTP. Consists of two dataflow tasks: SAP Export Files Data and SAP Upload Files to SFTP.

!!!info
The process is the same as with picture exporter
!!!

### Advantages and disadvantages

!!!success
Could be copied from Services Demo Environment (7343) and then adjusted
!!!

!!!warning
Could be buggy
!!!

!!!warning
The name of the listener of the second task (PictureExporter.exe) could be confusing as in this case it’s not used for picture exporting but for file exporting
!!!

### Demo - how does it work:

#### Install picture exporter to Clients server

1.  To install picture exporter, you need to go to [https://integration.pepperi.com/mgr/PluginManager/IntegrationAccounts](https://integration.pepperi.com/mgr/PluginManager/IntegrationAccounts)
2.  select **tools** dropdown **-> desktop applications**

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot-2023-08-08-at-11.44.21.png)

1.  Choose Application Name "**SAP Business One**" download **Sap Picture Exporter.**
2.  Install picture exporter to the client's server and update 2 files there using files from this archive

117KB

[Archive.zip](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FUhcNnnXI4XuPi8rmilBY%2FArchive.zip?alt=media&token=9b2c81c4-2dd1-4c74-b536-831be357d2b7)

archive

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FUhcNnnXI4XuPi8rmilBY%2FArchive.zip?alt=media&token=9b2c81c4-2dd1-4c74-b536-831be357d2b7)

#### Dataflow Task - SAP Export Files Data

*This task generates .csv file on the server with data that will be used in the next dataflow task for file exporting.*

-   Description: \[*name of the dataflow task*\]
-   Application: SAP Desktop Plugin
-   Source Object: SAP - Generic Desktop SQL Export
-   Target Object: Store Data Table For Later Use

|  |  |
| --- | --- |
| **Field name** | **Field value** |
| listener\_run\_exe | Path to the listener |
| is\_sql\_source | True |
| staticfile | Path to the .csv file that will be generated |

\[*add SQL code to create and format .csv file*\]

The generated file should consist of two columns:

|  |
| --- |
| -   Item |
| -   file\_path (which is the path to the Item from p.1) |

#### Dataflow Task - SAP Upload Files to SFTP

*This task extracts files based on data from .csv file from the previous task.*

-   Description: \[name of the dataflow task\]
-   Application: SAP Desktop Plugin
-   Source Object: SAP - Generic Desktop SQL Export
-   Target Object: Store Data Table For Later Use

|  |  |
| --- | --- |
| listener\_run\_exe | Path to the listener PictureExporter.exe |
| is\_sftp | True |
| upload\_to\_ftp | True |
| sftp\_folder sftp\_host<br><br>sftp\_password<br><br>sftp\_port<br><br>sftp\_user | *sftp credentials* |

### How to copy to another environment:

1) Go to *Services Demo Environment (7343);*
2) Manage tasks -> Dataflow task;
3) Find SAP Export Digital Invoice (77971) ([https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=77971](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=77971));
4) Click “Copy to client” and choose the client you need;
5) Go to the client you copied tasks to and adjust both dataflow tasks as you need.
