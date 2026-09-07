---
description: 'Effort Estimation: 4h'
---

# Content Management Solution

Content Management Solution is a Quick Setup, which allows you to configure basic Files Integrations.

Basically it will create a scheduled job with dataflow tasks based on your configuration. You can create multiple configurations and for each of them separate dataflow tasks and scheduled jobs will be created on current IPAAS Account.

{% hint style="info" %}
Firstly, please check out the next article: [Content Management Solution Quick Setup](https://support.pepperi.com/hc/en-us/articles/6769755409308-Content-Management-Solution-Quick-Setup) - this article contains basic knowledge about Content Management Solution.

Current article in turn provides a more detailed explanation & more complicated use cases.
{% endhint %}

{% hint style="info" %}
You can find the examples of using Content Management Solution on Services Demo Environment (7343) (30013939).
{% endhint %}

## First Installation

1\. Open the IPAAS Account where you want to use Content Management Solution;

2\. Under the Tools tab open Quick Setup:

<figure><img src="../.gitbook/assets/image (1186).png" alt=""><figcaption></figcaption></figure>

3\. From the list of available Quick Setups find the Content Management Solution and click Install:

<figure><img src="../.gitbook/assets/image (1189).png" alt=""><figcaption></figcaption></figure>

4\. After successful instalation you will see the message and a new Launch button:

<figure><img src="../.gitbook/assets/image (1190).png" alt=""><figcaption></figcaption></figure>

## Sections Overview

{% hint style="info" %}
Do not forget that as in any of the Quick Setups you can hover over some dropdown / input / etc. to get a tooltip:
{% endhint %}

<figure><img src="../.gitbook/assets/image (1194).png" alt=""><figcaption></figcaption></figure>

### Case Example

All of the sections will be explained on the next use case:

> We have a Webhook on In Creation - Submit step in Sales Order transaction (PDF Email and FTP (66560)), the main purpose of which is to send the email with generated pdf file to some user, and to send the pdf which has the name in \[TransactionInternalID].pdf format to the FTP server.
>
> On FTP server these files look like this:

<figure><img src="../.gitbook/assets/image (1197).png" alt=""><figcaption></figcaption></figure>

> We need to have a scheduled job, which will work every day, and which will generate a link for each of these files and set it to another Link typed transaction header-level field in Sales Order, so we could have possibility to open this pdf file directly from the transaction.

### Configuration Actions

On the first launch you will have only one empty configuration named "Default". You have possibility to rename, copy, delete or add new configuration.

{% hint style="warning" %}
NOTE: your configuration will not be added / renamed / copied until you click Save button.
{% endhint %}

<figure><img src="../.gitbook/assets/image (1191).png" alt=""><figcaption></figcaption></figure>

### Logs Tab

Logs tab contains the list of ui tasks / jobs runs.

1. UI tasks:
   1. QuickSetup Files Connector Setup - the UI task of Quick Setup which you can see on Content Management Solution Launch;
   2. QuickSetup Files Connector Main - the UI task which allows to preview the data;
2. Jobs Runs: contains the list of runs of the jobs which were created for each existing configurations inside the Content Management Solution Quick Setup.

### General Tab

#### General

The main purpose of the Content Management Solution is to get some file from the FTP / SFTP server based on string value which is in the **File Name Field** (in this example - Sales Order transaction header-level TSAStringID field). This string value is the name of the wanted file on server. When the Content Management job already have this file - it will generate a clickable link, which will open this file. This link will be set to the **Link Field:**

<figure><img src="../.gitbook/assets/image (1192).png" alt=""><figcaption></figcaption></figure>

In this example, we have two main fields which were created before in Sales Order transaction on the header level:

1\. TSAStringID - Single Line Text - the value to this field is set in another On Demand Calculated field - TSASetStringIDFTP:

```javascript
SetValueByApiName("TSAStringID", GetValueByApiName("InternalID") + "");
return "";
```

So the File Name Field TSAStringID will contain InternalID of current transaction;

2\. TSALinkToFTP - Link - Link Field which will contain generated link to the pdf file which name is \[TransactionInternalID].pdf from FTP server:

<figure><img src="../.gitbook/assets/image (1195).png" alt=""><figcaption></figcaption></figure>

**Enable Link TTL** enables Link Time To Live - after defined period of time link will not be available.

**TTL Hours** are the  Time To Live in Hours. Please note it should be more than job delay.

If **Enable Link TTL** is disabled or TTL Hours input is empty generated links will be available all the time.

<figure><img src="../.gitbook/assets/image (1198).png" alt=""><figcaption></figcaption></figure>

#### Pepperi SFTP

This section provides a possibility to create an SFTP instance. If it was already created you will see a green arrow as a Status.

If you check the "Use as AWS S3" checkbox - it will be sending the requests directly to AWS S3 which is much faster, than sending requests to ftp server. If you use SFTP server you will also have some additional functional in "FTP Configuration" section, such as: file upload, preview, archive.

Check Status button will check if the  SFTP instance was already created and if no - it will create it.

Populate button will populate the FTP Configuration section with details of created SFTP instance in Pepperi SFTP section:

<figure><img src="../.gitbook/assets/image (1199).png" alt=""><figcaption></figcaption></figure>

#### FTP Configuration

As in current example we're not using SFTP instance, we will need to populate all server connection details ourself:

<figure><img src="../.gitbook/assets/image (1202).png" alt=""><figcaption></figcaption></figure>

1\. Configuration Level:

&#x20;   a. Task Settings - all of server connection-related settings will be different for each configuration and will be saved in dataflow tasks created for current configuration;

&#x20;   b. Client Settings - all of server connection-related settings will be the same for all configurations and will be saved in client settings;

2\. Connection Protocol - FTP or SFTP;

3\. FTP Address - Source data FTP server DSN or IP;

4\. Port - FTP source server port;

5\.  FTP Username;

6\. FTP Password;

7\. Timeout (Sec) - FTP connection timeout;

8\. Folder Path - path to folder you want to use (from root);

Clicking on folder icon makes request to FTP to get files / folders structure and show it as tree.

{% hint style="info" %}
NOTE: the loading of the files tree could take some time.
{% endhint %}

<figure><img src="../.gitbook/assets/image (1204).png" alt=""><figcaption></figcaption></figure>

9\. Test Connection - will check the connection to the server;

10\. Preview - is only for AWS S3 - will open files tree with possibility to upload, preview and archive files;

11\. Get Custom Form HTML - is only for AWS S3 - will copy the code for Pepperi Custom Form which will open ui task with files tree preview.

#### Schedule Link Field Refresh

This section provides possibility to schedule the job which tasks were created based on current configuration.

To schedule it just add schedule information the same as while scheduling the job on IPAAS, check "Use Scheduler" checkbox and click "Run Flow" - it will run the job and you will be able to open it and check out the results:

<figure><img src="../.gitbook/assets/image (1205).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1206).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1207).png" alt=""><figcaption></figcaption></figure>

After job run is successfully finished, the links are generated and saved to the Link Field from the configuration. In this example it's transaction header-level TSALInkToFTP field:

<figure><img src="../.gitbook/assets/image (1208).png" alt=""><figcaption></figcaption></figure>

You can copy one of generated links and open it in your browser:

<figure><img src="../.gitbook/assets/image (1180).png" alt=""><figcaption></figcaption></figure>

## Deep Dive Into SFTP AWS S3 Instance Usage

{% hint style="info" %}
You can find an example on Services Demo Environment (7343) (30013939), Test AWS Logic configuration.
{% endhint %}

Basically, you will use the SFTP AWS S3 instance for the same purposes as you do it with simple FTP server, but SFTP AWS S3 provides more flexible and faster solution, as the tasks will send the requests directly to AWS S3.

Lets check out Test AWS S3 Logic configuration.

### General

General section have defined settings for fields which we should use in this configuration:

1\. Resource Type - Transactions - we will use transaction header-level fields;

2\. Sub Type - Sales Order - transaction type name;

3\. Link Field - TSAContentManagementLink - transaction header-level field which will contain generated link after job run is finished;

4\. File Name Field - TSAStringID - the field which contains InternalID of transaction is the name of wanted file on the server for which we should generate the link;

5\. Time To Live settings - we have no need in them, so we leave them untouched:

<figure><img src="../.gitbook/assets/image (1175).png" alt=""><figcaption></figcaption></figure>

### Pepperi SFTP

The Status says that we already have instance, but you can click Check Status button to check it again:

<figure><img src="../.gitbook/assets/image (1210).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1211).png" alt=""><figcaption></figcaption></figure>

Check "Use as AWS S3" checkbox and click Populate button.

### FTP Configuration

&#x20;Now check out FTP Configuration section - you will see that all of the server details are fullfilled:

<figure><img src="../.gitbook/assets/image (1164).png" alt=""><figcaption></figcaption></figure>

#### Preview

If you click Preview button you will see files tree. You have possibility to open it in the new tab and also to view it with different device views:

<figure><img src="../.gitbook/assets/image (1165).png" alt=""><figcaption><p>Desktop Preview</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1166).png" alt=""><figcaption><p>Tablet Preview</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1168).png" alt=""><figcaption><p>Phone Preview</p></figcaption></figure>

To open a folder, double click on it:

<figure><img src="../.gitbook/assets/image (1169).png" alt=""><figcaption></figcaption></figure>

To show file in the new tab, click just once on wanted file and click "Show File" button:

<figure><img src="../.gitbook/assets/image (1170).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1171).png" alt=""><figcaption></figcaption></figure>

To show file details in current tab enable "View Details" and select wanted file again:

<figure><img src="../.gitbook/assets/image (1173).png" alt=""><figcaption></figcaption></figure>

You can also archive file, upload a new one and create new folder:

<figure><img src="../.gitbook/assets/image (1174).png" alt=""><figcaption></figcaption></figure>

#### Get Custom Form HTML

Get Custom Form HTML button provides a possibility to select a folder from files tree and get custom form code for opening ui task to preview this folder.

Additional settings:

1\. Create folder and Upload allowed - enables to allow user to add (upload), remove files/folders. It's available only for desktop use and AWS S3;

2\. Archive allowed - allows to Archive (.zip) selected files / folder and download it;

3\. Use Internal ID For Upload File Name - should use Resource (Transaction / Activity) Internal Id For Upload File Name:

<figure><img src="../.gitbook/assets/image (1179).png" alt=""><figcaption></figcaption></figure>

On Proceed button click the custom form code will be copied.

### Custom Form

How to add

1\. Login with admin user (in this example - [ukr\_templates@pepperi.com](mailto:ukr_templates@pepperi.com)) and go to the settings;

2\. Under Sales Activities select Transaction or Activity Types and open the transaction or activity type which you want to update with custom form (in example - Sales Order transaction type);

3\. Open Programs tab and create a new program which will have Custom Form as action:

<figure><img src="../.gitbook/assets/image (1182).png" alt=""><figcaption></figcaption></figure>

4\. Paste to the custom from the code which you got from the Content Management Solution confuguration (Get Custom Form HTML button) and save the changes:

<figure><img src="../.gitbook/assets/image (1183).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Make sure your new program was added to the one of the views, for example, Order Center Menu or Cart Menu.
{% endhint %}

#### How to test

1\. Do a synchronization by going to the HomePage and opening, for example, Activities;

2\. Go back to the HomePage and start Sales Order (or your transaction / activity type which you were updating in previous steps);

3\. Open the custom form (in example - ContentManagement) from the menu:

<figure><img src="../.gitbook/assets/image (1184).png" alt=""><figcaption></figcaption></figure>

You can preview, archive, upload new files and create new folders now:

<figure><img src="../.gitbook/assets/image (1185).png" alt=""><figcaption></figcaption></figure>

