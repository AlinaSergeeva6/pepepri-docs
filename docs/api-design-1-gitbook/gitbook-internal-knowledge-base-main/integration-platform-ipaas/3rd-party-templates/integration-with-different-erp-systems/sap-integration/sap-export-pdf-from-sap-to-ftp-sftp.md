---
description: 'Effort Estimation: 2h'
---

# SAP - Export PDF from SAP to FTP/SFTP

### Description:&#x20;

Allows to export .pdf files from SAP to FTP/SFTP. Consists of two dataflow tasks: SAP Export Files Data and SAP Upload Files to SFTP.

{% hint style="info" %}
The process is the same as with picture exporter
{% endhint %}

### **Advantages and disadvantages**

{% hint style="success" %}
Could be copied from Services Demo Environment (7343) and then adjusted
{% endhint %}

{% hint style="warning" %}
Could be buggy
{% endhint %}

{% hint style="warning" %}
The name of the listener of the second task (PictureExporter.exe) could be confusing as in this case it’s not used for picture exporting but for file exporting
{% endhint %}

### Demo - how does it work:



#### Install picture exporter to Clients server

1. To install picture exporter, you need to go to [https://integration.pepperi.com/mgr/PluginManager/IntegrationAccounts](https://integration.pepperi.com/mgr/PluginManager/IntegrationAccounts)
2. select **tools** dropdown **-> desktop applications**

&#x20;

<figure><img src="../../../../.gitbook/assets/Screenshot 2023-08-08 at 11.44.21.png" alt=""><figcaption></figcaption></figure>

3. Choose Application Name "**SAP Business One**" download **Sap Picture Exporter.**
4. Install picture exporter to the client's server and update 2 files there using files from this archive

{% file src="../../../../.gitbook/assets/Archive.zip" %}

#### Dataflow Task - _SAP Export Files Data_

_This task generates .csv file on the server with data that will be used in the next dataflow task for file exporting._



{% tabs %}
{% tab title="Details:" %}
* Description: \[_name of the dataflow task_]
* Application: SAP Desktop Plugin
* Source Object: SAP - Generic Desktop SQL Export
* Target Object: Store Data Table For Later Use
{% endtab %}

{% tab title="Settings:" %}
| **Field name**     | **Field value**                              |
| ------------------ | -------------------------------------------- |
| listener\_run\_exe | Path to the listener                         |
| is\_sql\_source    | True                                         |
| staticfile         | Path to the .csv file that will be generated |
{% endtab %}

{% tab title="SQL:" %}
\[_add SQL code to create and format .csv file_]
{% endtab %}
{% endtabs %}



The generated file should consist of two columns:

| <ul><li>Item</li></ul>                                               |
| -------------------------------------------------------------------- |
| <ul><li>file_path (which is the path to the Item from p.1)</li></ul> |



#### Dataflow Task - SAP Upload Files to SFTP

_This task extracts files based on data from .csv file from the previous task._

{% tabs %}
{% tab title="Details:" %}
* Description: \[name of the dataflow task]
* Application: SAP Desktop Plugin
* Source Object: SAP - Generic Desktop SQL Export
* Target Object: Store Data Table For Later Use
{% endtab %}

{% tab title="Settings: " %}
| listener\_run\_exe                                                                  | Path to the listener PictureExporter.exe |
| ----------------------------------------------------------------------------------- | ---------------------------------------- |
| is\_sftp                                                                            | True                                     |
| upload\_to\_ftp                                                                     | True                                     |
| <p>sftp_folder<br>sftp_host</p><p>sftp_password</p><p>sftp_port</p><p>sftp_user</p> | _sftp credentials_                       |
{% endtab %}
{% endtabs %}



### How to copy to another environment:

1\)     Go to _Services Demo Environment (7343);_

2\)     Manage tasks -> Dataflow task;

3\)     Find SAP Export Digital Invoice (77971)  ([https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=77971](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=77971));

4\)     Click “Copy to client” and choose the client you need;

5\)     Go to the client you copied tasks to and adjust both dataflow tasks as you need.
