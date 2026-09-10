---
title: "Content Management Solution"
description: "Effort Estimation: 4h"
order: 49
---
# Content Management Solution

*Effort Estimation: 4h*

Content Management Solution is a Quick Setup, which allows you to configure basic Files Integrations.

Basically it will create a scheduled job with dataflow tasks based on your configuration. You can create multiple configurations and for each of them separate dataflow tasks and scheduled jobs will be created on current IPAAS Account.

!!!info
Firstly, please check out the next article: [Content Management Solution Quick Setup](https://support.pepperi.com/hc/en-us/articles/6769755409308-Content-Management-Solution-Quick-Setup) - this article contains basic knowledge about Content Management Solution.

Current article in turn provides a more detailed explanation & more complicated use cases.
!!!

!!!info
You can find the examples of using Content Management Solution on Services Demo Environment (7343) (30013939).
!!!

## First Installation

1\. Open the IPAAS Account where you want to use Content Management Solution;

2\. Under the Tools tab open Quick Setup:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-900.png)

3\. From the list of available Quick Setups find the Content Management Solution and click Install:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-901.png)

4\. After successful instalation you will see the message and a new Launch button:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-902.png)

## Sections Overview

!!!info
Do not forget that as in any of the Quick Setups you can hover over some dropdown / input / etc. to get a tooltip:
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-903.png)

### Case Example

All of the sections will be explained on the next use case:

> We have a Webhook on In Creation - Submit step in Sales Order transaction (PDF Email and FTP (66560)), the main purpose of which is to send the email with generated pdf file to some user, and to send the pdf which has the name in \[TransactionInternalID\].pdf format to the FTP server.
>
> On FTP server these files look like this:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-904.png)

> We need to have a scheduled job, which will work every day, and which will generate a link for each of these files and set it to another Link typed transaction header-level field in Sales Order, so we could have possibility to open this pdf file directly from the transaction.

### Configuration Actions

On the first launch you will have only one empty configuration named "Default". You have possibility to rename, copy, delete or add new configuration.

!!!warning
NOTE: your configuration will not be added / renamed / copied until you click Save button.
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-905.png)

### Logs Tab

Logs tab contains the list of ui tasks / jobs runs.

1.  UI tasks:
    1.  QuickSetup Files Connector Setup - the UI task of Quick Setup which you can see on Content Management Solution Launch;
    2.  QuickSetup Files Connector Main - the UI task which allows to preview the data;

2.  Jobs Runs: contains the list of runs of the jobs which were created for each existing configurations inside the Content Management Solution Quick Setup.

### General Tab

#### General

The main purpose of the Content Management Solution is to get some file from the FTP / SFTP server based on string value which is in the **File Name Field** (in this example - Sales Order transaction header-level TSAStringID field). This string value is the name of the wanted file on server. When the Content Management job already have this file - it will generate a clickable link, which will open this file. This link will be set to the **Link Field:**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-906.png)

In this example, we have two main fields which were created before in Sales Order transaction on the header level:

1\. TSAStringID - Single Line Text - the value to this field is set in another On Demand Calculated field - TSASetStringIDFTP:

```
SetValueByApiName("TSAStringID", GetValueByApiName("InternalID") + "");
return "";
```

So the File Name Field TSAStringID will contain InternalID of current transaction;

2\. TSALinkToFTP - Link - Link Field which will contain generated link to the pdf file which name is \[TransactionInternalID\].pdf from FTP server:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-907.png)

**Enable Link TTL** enables Link Time To Live - after defined period of time link will not be available.

**TTL Hours** are the Time To Live in Hours. Please note it should be more than job delay.

If **Enable Link TTL** is disabled or TTL Hours input is empty generated links will be available all the time.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-908.png)

#### Pepperi SFTP

This section provides a possibility to create an SFTP instance. If it was already created you will see a green arrow as a Status.

If you check the "Use as AWS S3" checkbox - it will be sending the requests directly to AWS S3 which is much faster, than sending requests to ftp server. If you use SFTP server you will also have some additional functional in "FTP Configuration" section, such as: file upload, preview, archive.

Check Status button will check if the SFTP instance was already created and if no - it will create it.

Populate button will populate the FTP Configuration section with details of created SFTP instance in Pepperi SFTP section:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-909.png)

#### FTP Configuration

As in current example we're not using SFTP instance, we will need to populate all server connection details ourself:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-910.png)

1\. Configuration Level:

a. Task Settings - all of server connection-related settings will be different for each configuration and will be saved in dataflow tasks created for current configuration;

b. Client Settings - all of server connection-related settings will be the same for all configurations and will be saved in client settings;

2\. Connection Protocol - FTP or SFTP;

3\. FTP Address - Source data FTP server DSN or IP;

4\. Port - FTP source server port;

5\. FTP Username;

6\. FTP Password;

7\. Timeout (Sec) - FTP connection timeout;

8\. Folder Path - path to folder you want to use (from root);

Clicking on folder icon makes request to FTP to get files / folders structure and show it as tree.

!!!info
NOTE: the loading of the files tree could take some time.
!!!

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-911.png)

9\. Test Connection - will check the connection to the server;

10\. Preview - is only for AWS S3 - will open files tree with possibility to upload, preview and archive files;

11\. Get Custom Form HTML - is only for AWS S3 - will copy the code for Pepperi Custom Form which will open ui task with files tree preview.

#### Schedule Link Field Refresh

This section provides possibility to schedule the job which tasks were created based on current configuration.

To schedule it just add schedule information the same as while scheduling the job on IPAAS, check "Use Scheduler" checkbox and click "Run Flow" - it will run the job and you will be able to open it and check out the results:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-912.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-913.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-914.png)

After job run is successfully finished, the links are generated and saved to the Link Field from the configuration. In this example it's transaction header-level TSALInkToFTP field:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-915.png)

You can copy one of generated links and open it in your browser:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-916.png)

## Deep Dive Into SFTP AWS S3 Instance Usage

!!!info
You can find an example on Services Demo Environment (7343) (30013939), Test AWS Logic configuration.
!!!

Basically, you will use the SFTP AWS S3 instance for the same purposes as you do it with simple FTP server, but SFTP AWS S3 provides more flexible and faster solution, as the tasks will send the requests directly to AWS S3.

Lets check out Test AWS S3 Logic configuration.

### General

General section have defined settings for fields which we should use in this configuration:

1\. Resource Type - Transactions - we will use transaction header-level fields;

2\. Sub Type - Sales Order - transaction type name;

3\. Link Field - TSAContentManagementLink - transaction header-level field which will contain generated link after job run is finished;

4\. File Name Field - TSAStringID - the field which contains InternalID of transaction is the name of wanted file on the server for which we should generate the link;

5\. Time To Live settings - we have no need in them, so we leave them untouched:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-917.png)

### Pepperi SFTP

The Status says that we already have instance, but you can click Check Status button to check it again:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-918.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-919.png)

Check "Use as AWS S3" checkbox and click Populate button.

### FTP Configuration

Now check out FTP Configuration section - you will see that all of the server details are fullfilled:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-920.png)

#### Preview

If you click Preview button you will see files tree. You have possibility to open it in the new tab and also to view it with different device views:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-921.png)

Desktop Preview

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-922.png)

Tablet Preview

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-923.png)

Phone Preview

To open a folder, double click on it:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-924.png)

To show file in the new tab, click just once on wanted file and click "Show File" button:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-925.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-926.png)

To show file details in current tab enable "View Details" and select wanted file again:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-927.png)

You can also archive file, upload a new one and create new folder:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-928.png)

#### Get Custom Form HTML

Get Custom Form HTML button provides a possibility to select a folder from files tree and get custom form code for opening ui task to preview this folder.

Additional settings:

1\. Create folder and Upload allowed - enables to allow user to add (upload), remove files/folders. It's available only for desktop use and AWS S3;

2\. Archive allowed - allows to Archive (.zip) selected files / folder and download it;

3\. Use Internal ID For Upload File Name - should use Resource (Transaction / Activity) Internal Id For Upload File Name:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-929.png)

On Proceed button click the custom form code will be copied.

### Custom Form

How to add

1\. Login with admin user (in this example - [ukr\_templates@pepperi.com](mailto:ukr_templates@pepperi.com)) and go to the settings;

2\. Under Sales Activities select Transaction or Activity Types and open the transaction or activity type which you want to update with custom form (in example - Sales Order transaction type);

3\. Open Programs tab and create a new program which will have Custom Form as action:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-930.png)

4\. Paste to the custom from the code which you got from the Content Management Solution confuguration (Get Custom Form HTML button) and save the changes:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-931.png)

!!!info
Make sure your new program was added to the one of the views, for example, Order Center Menu or Cart Menu.
!!!

#### How to test

1\. Do a synchronization by going to the HomePage and opening, for example, Activities;

2\. Go back to the HomePage and start Sales Order (or your transaction / activity type which you were updating in previous steps);

3\. Open the custom form (in example - ContentManagement) from the menu:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-932.png)

You can preview, archive, upload new files and create new folders now:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-933.png)
