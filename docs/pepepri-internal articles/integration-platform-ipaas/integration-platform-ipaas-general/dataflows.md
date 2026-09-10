---
title: "Dataflows"
description: "General information about Dataflow Tasks. Examples are in the 'Integration - Examples' (6685) account"
order: 257
---
# Dataflows

*General information about Dataflow Tasks. Examples are in the 'Integration - Examples' (6685) account*

Dataflow task - really powerful tool for working with data They allows you to send or get any data using HTTP, Desktop application or another Dataflow Task To create it, open 'Manage Tasks' tab in your integration account. Select 'Dataflow task' from the dropdown

![](/static/image-277.png)

Specify such parameters (all of them are mandatory):

### Task Name

Just a name of Task

### Application

Here you should write an application that task will use. Use table below to select correct application

|  |  |
| --- | --- |
| Name | Desription |
| Generic Cloud Internal Connector | Usage with different Source Objects:<br><br>1\. Define existing task name as "source" and do data maniplation on it. **Example - Generic Cloud Intenral Connector - Export Tabular Data**<br><br>2\. Manually upload a file which will be saved as a task temporary table. **Example - Generic Cloud Intenral Connector - Manual File Upload**<br><br>3\. Items images uploading using existing task as a source<br><br>4. [FTP Image Uploader](https://kbint.pepperi.com/integration-platform-general/upload-images-from-ftp) \- scan FTP folder and upload images to Pepperi. Target object is not important. **Example - Generic Cloud Internal Connector - FTP Image Uploader**<br><br>5 All Async Export Objects - are used to extract data from Pepperi in bulk faster than paging and upload to any target object. **Example - Generic Cloud Intenral Connector - Pepperi Accounts Data Async** |
| NetSuite Plugin, Xero Plugin, Quickbooks Plugin, MYOB Plugin | All these applications has 2 types of Source Objects:<br><br>1.All types of data objects supported in those systems - and its mainly legacy .<br><br>2.Generic Connector HTTP Exporter - used in new projects - enables writing HTTP requests to get data from ANY data type of these systems. Why is it part of these application and not HTTP application ? This is because the ability to use existing general settings keys used in those application. |
| SQL On Public IP Plugin, Oracle Sales Cloud Plugin | Not in use |
| QuickBooks Desktop Plugin | The Source Objects are specific data objects names (Items, Accounts etc) the reason for that is that all the object types are triggering an EXE using the listener - but this EXE (QB\_Exporter.exe) is not a generic EXE but one that knows how to extract specific data types from QB. |
| SAP Desktop Plugin | Both are using [Online Listener](https://kbint.pepperi.com/sap-integration/first-time-plugin-installation) - and when exporting data they are running the EXE defined on each task : [listener\_run\_exe](https://kbint.pepperi.com/sap-integration/integration-settings#settings-configuration)<br><br>The EXE is triggered by the listener and is responsible to return a CSV to the server which will be saved as the Task's File/Temp.<br><br>EXE types supporter for the desktop connector:<br><br>1.  Exporter.exe - can get data from SQL, ODBC or local files<br><br>2.  HTTP Plugin EXE - used to get HTTP data from local web services (not exposed to the internet)<br><br>Source Objects : According to the name you can select Source object to upload data into Pepperi<br><br>Generic Export and Image Uploader - the image uploader works exactly the same as the one defined under Generic Cloud Internal Connector - the reason that its also here - is the same as with the HTTP in QB and MYOB - to be able to use the other task's general settings fields. |
| Generic HTTP Connector | Allows to work with any HTTP application and send GET/POST/PUT, etc requests to any page. Use this application if you would like to use HTTP protocol to get or send the data<br><br>Source objects:<br><br>1.Generic HTTP Exporter - Runs HTTP Requests defined in the HTTP Task Tab<br><br>2.Generic Image Uploader - Allows to upload images via links from<br><br>3.HTTP Local Exporter - to export data<br><br>4.[Email Sender](https://kbint.pepperi.com/integration-platform-examples/email-sender) - sends emails based on predefined existing dataflow tasks data |
| Generic Desktop Connector | Allows to work with any Desktop application and send requests to desktop application. Use this application if you would like to use listener on the remote server. Works in the same way as SAP Desktop Plugin |

### Target Object

1.  All Pepperi Export Objects (Items, Account...) are using to upload the data to these objects
2.  Store table for later use - for tests or making data available for reporting or use as a source for further data manipulation before upload
3.  Other - use when target is not required such as any image upload
4.  Test Connection - is used only for Application Provider Wizard - Every provider must have connection testing task to be triggered when the wizard runs
