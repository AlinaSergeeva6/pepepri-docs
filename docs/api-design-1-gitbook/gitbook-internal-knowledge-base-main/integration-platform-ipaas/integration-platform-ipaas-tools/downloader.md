---
description: 4h to move from Old version to New. 8h to establish from scratch
---

# Downloader

### Description:

Downloader is program that allows you to download orders to client server.

There are 2 types of downloader&#x20;



{% tabs %}
{% tab title="Old Downloader" %}
Old downloader takes its settings from ImporterEditor.exe file and frequently triggered by Pepperi scheduler or Windows Scheduler.&#x20;

Therfore no webhooks are needed. In some ocasions there will be webhook that triggers Downloader. All webhook settings are irrelevant because it is serves only as trigger. \
\
It takes the orders from the pepperi FTP. To create an order on pepperi FTP, there is "Export XML" action in workflow that sends it there.
{% endtab %}

{% tab title="New Downloader" %}
New downloader works with webhook. It means that it is getting settings not from file on the server but from webhook.&#x20;

This gives better performance and flexibility in terms of settings as old downloader has few settigns and part of them are not relevat anymore.
{% endtab %}
{% endtabs %}

***

### **Advantages and disadvantages**

{% hint style="warning" %}
Old Downloader can't use a lot of Integration settings. Only one that are listed in ImporterEditor.exe
{% endhint %}

{% hint style="success" %}
Downloader is great if you need to save Orders somewhere on the client server&#x20;
{% endhint %}

{% hint style="success" %}
Downloader gives you possibility to trigger any custom application/file on the client server&#x20;
{% endhint %}

***

### Demo - how does it work:

_Saving file with custom set of columns to client server in not standart folder_&#x20;

1. We have Sales Order that on submit triggers webhook. [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=82683](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=82683)
2. In the settngs tab we filling neccessary fields
   * listener\_run\_exe - path to downloader.exe
   * encoding-out - could be different for languages other then english
   * localfolder - path for the default order export
   *   downloader\_final\_file - path and name of the file which will be generated using settigns below

       * filedelim - create custom file
       * webhook\_trn\_line\_fields - what line fields to export
       * webhook\_trn\_header\_fields - what header fields to export
       * columns - order of the columns in file



       <figure><img src="../../.gitbook/assets/image (562).png" alt=""><figcaption></figcaption></figure>

       <figure><img src="../../.gitbook/assets/image (564).png" alt=""><figcaption></figcaption></figure>
3. Then the file will be generated on the server with the structure of "columns" setting

<figure><img src="../../.gitbook/assets/image (565).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Note that opening final file in different programs will result in reading this file using different encodings. \
\
**encoding-out** could mismatch with **encoding-in** of the program.
{% endhint %}

***

### How to install (new version):

To install downloader on the server firstly download necessary files

<figure><img src="../../.gitbook/assets/image (536).png" alt=""><figcaption></figcaption></figure>

Then create folder "Downloader" in the Pepperi folder on clients server and extract files in this folder. There is no need to configure ananything else on the server.

<figure><img src="../../.gitbook/assets/image (567).png" alt=""><figcaption></figcaption></figure>

***

Create webhook with next details:

* Application: Generic Desktop Connector
* Source Object: Pepperi Transaction Webhook
* Target Object: Generic Desktop Import

Settings

| Name of setting     | Value                                  |
| ------------------- | -------------------------------------- |
| listener\_run\_exe  | C:\path\_to\_downloader\Downloader.exe |
| signalr\_client\_id | listener GUID                          |
| localfolder         | C:\path\_to\_downloader\Orders         |

Backoffice

Add the webhook to the workflow.

***

_Done, when order will be submitted, the order file will be created in C:\path\_to\_downloader\Orders folder_

***

### **Advanced configuration**:

There are some variants of use-cases, for that additional settings must be added.

#### If you want to create file with different style oppose to default&#x20;

| Name of setting              | Value                                       |
| ---------------------------- | ------------------------------------------- |
| columns                      | coma separate fields, both header and lines |
| writeheaders                 | ✅                                           |
| filedelim                    | ✅                                           |
| webhook\_trn\_header\_fields | coma separate header fields                 |
| webhook\_trn\_line\_fields   | coma separate line fields                   |
| downloader\_final\_file      | path to the folder and file name            |

{% hint style="info" %}
"webhook\_trn\_header\_fields" AND "webhook\_trn\_line\_fields"

Only fields from this settings will be pulled from pepperi, therefore only this fields could be used in mapping or other settings
{% endhint %}

{% hint style="info" %}
"columns" setting will fill the corresponding fields with data for each TransactionLine, example below&#x20;
{% endhint %}

```
columns: "WrntyID,AccountName,ItemExternalID,UnitsQuantity"

final file:
123456,John Doe Market,Abc1,2
123456,John Doe Market,Abc2,10
123456,John Doe Market,Abc3,100
```

{% hint style="info" %}
"writeheaders" will add "columns" to the final file
{% endhint %}

```
columns: "WrntyID,AccountName,ItemExternalID,UnitsQuantity"
writeheaders: ✅

final file:
WrntyID,AccountName,ItemExternalID,UnitsQuantity
123456,John Doe Market,Abc1,2
123456,John Doe Market,Abc2,10
123456,John Doe Market,Abc3,100
```

***

#### Logs

For creating log files - create the logconfig.xml, and after the next run it will create DownloaderLogs

***

#### Testing

In order to test old downloader, new folder needs to be created "testfiles"

<figure><img src="../../.gitbook/assets/image (534).png" alt=""><figcaption></figcaption></figure>

Next, order from ftp should be placed inside

<figure><img src="../../.gitbook/assets/image (535).png" alt=""><figcaption></figcaption></figure>

Last step, open ImportEditor.exe and change "test" to 1.

Downloader will take orders from this folder and not from pepperi FTP
