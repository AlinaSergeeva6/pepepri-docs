---
title: "Sage50 import Sales Order"
description: "Canadian edition"
order: 136
---
# Sage50 import Sales Order

*Canadian edition*

### Description:

To insert Sales Order to Sage50, Swagman Software is needed. As there is no straightforward integration like with the SAP, the process of importing Sales Orders is much more complicated.

Also Downloader is needed to complete integration.

### Setup:

---

Simplified workflow

1.  Firstly, Downloader is creating final file in specific csv format. (The correct mapping could be found in Swagman)
2.  Then Downloader is triggering next file -> "**concatenate\_csv**.bat". Usually located in "incoming" folder. "**concatenate\_csv**.bat" will format the final file to the corect style and will move it to the "Tools -> Maps" folder as "**output.txt**".
3.  After this done, "**concatenate\_csv**.bat" will trigger "**Pepper2SAGE**.bat" which is located in "Tools -> SSD Importer". This file will open Swagman Software with necessary arguments.

---

To start importing process Downloader.exe must be triggered.

There are 2 ways of triggering Downloader.exe

!!!info
While the default listener can trigger Downloader.exe, in case of Sage50 integration we will need to trigger Swagman application using .bat files. Only listener capable of triggering the exe files is QuickBooks listener. Because the services can't trigger exe files and QBlistener is exe and not service.
!!!

Usually there will be "scheduler" folder which will have exe file.

It will trigger Downloader even when it is not needed.

!!!info
Scheduler is working only with old Downloader.
!!!

### Setup

If there is no scheduler.exe then Windows Task Scheduler must be setup.

Create the new job and configure triggers and actions next way:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-477.png)

Add the path to the old Downloader.exe

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-478.png)

Run the job and check if it is calling Downloader.exe after 5 minutes.

### Configuration of old Downloader

In order for Downloader to work, correct credentials must be updated.

User and Pass could be found in Backoffice -> ERP Integration -> Configuration

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-479.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-480.png)

| Setting | Value |
| --- | --- |
| xsldataset | name of the xslt config file in route folder |
| runexe\_afterlife | path to the concatenate\_csv.bat |
| writedatase | ✅ |
| localfolder | \\Orders |
| prefix | O\_ |

The Downloader will be triggered only after Sales Order submit.

!!!info
Webhook will work only with new Downloader
!!!

!!!warning
QuickBook listener must be installed
!!!

### Installation

Firstly install QB\_listener using link and replace the **OnlineListener.exe** and **OnlineListener.pdb** files using zip attached.

Add QB\_listener to the startup.

116KB

[QB\_listener--with--Downloader--integration.zip](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2F47Fhba6LxqkqaDwztmwu%2FQB_listener--with--Downloader--integration.zip?alt=media&token=9e4234d9-0c5c-47a8-8eaf-01b85978ce31)

archive

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2F47Fhba6LxqkqaDwztmwu%2FQB_listener--with--Downloader--integration.zip?alt=media&token=9e4234d9-0c5c-47a8-8eaf-01b85978ce31)

create backup of default files

Create webhook (example: https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=83183) and configure next settings:

| Name of Setting | Value |
| --- | --- |
| columns | must be in exact same way as in a Swagman Mapping File |
| writeheaders | ✅ |
| filedelim | ✅ |
| localfolder | \*path\_to\_downloader\\Downloader\\Orders |
| listener\_run\_exe | \*path\_to\_downloader\\Downloader\\Downloader.exe |
| signalr\_client\_id | QB listener GUID |
| downloader\_final\_file | \*path\_to\_downloader\\Downloader\\Orders\\Dataset\\Orders\\O\_$#InternalID#$ |
| runexe\_afterfile | \*path\_to\_concatenate\_csv.bat\\concatenate\_csv.bat |

Add webhook to the workflow onSubmit.

!!!warning
It is important to start QB listener not as admin, because the import will broke and only way to fix it is to restart listener manually.
!!!

!!!info
Also when implementing new Downloader it could be helpfull to keep old downloader and keep sending orders to FTP. Because in case of Sage not being started, you can run the old downloader and import all missing orders.
!!!

---

### Configuring bat files

In order for integration to work, bat files must be configure properly

```
// concatenate_csv.bat

@echo on
Set "MyProcess=Sage50Accounting.exe"

// Path to the downloader final file
set Pathname="C:\Pepperi\Downloader\Orders\DataSet\Orders"

// path to the Pepperi2SAGE.bat
set Pathname2="C:\Pepperi\Tools\SSD Importer"

// path to the BackUp folder
set Pathname3="C:\Pepperi\Downloader\Orders\DataSet\Orders\Backup"

// path to the folder where final output.txt will be moved
set Pathname4="C:\Pepperi\Tools\Maps"

... Everything else does not need to be changed
```

```
// Pepperi2SAGE.bat

C:
CD\

// path to the Swagman Software
CD "C:\Program Files (x86)\SSI Applications\SSI Importer"

// call for Swagman app, with
// 1 path - to the company file (ask customer where)
// 2 path - to the final output.txt file
saCSVfull.exe sa,C:\Users\Admin\Documents\Comptabilite\itacadirect.SAI,,,6,,,"C:\Pepperi\Tools\Maps\output.txt"
exit
```

### Advanced configuration:
