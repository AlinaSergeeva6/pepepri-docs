---
description: detailed instruction
---

# First Time Plugin Installation

Before the installation please be sure that you have Remote Access to the customer server.\
Instructions how to get it you can read [here](https://pepperi.gitbook.io/internal-knowledge-base/logmein-rescue-instructions/remote-control).

**PAY ATTENTION**   --     be sure you have access to the customer server \
&#x20;                                       via **LogMein Rescue Technician Console** when you must set SAP integration, \
&#x20;                                       the **permanent connection to the server is required**

**REMARKS**  \
another type of connection can lead to some difficulties and issues while working on SAP integration

### &#xD;#1 Step:  connect to the customer server via LogMein Rescue Technician Console

### #2 choose **Tools** ---> then **Desktop Applications** ----> then **SAP Business One**----> and download the files

&#x20;                                                          a.     **Sap Listener 64**\
&#x20;                                                          b.     **Exporter 64 version**\
&#x20;                                                          c.     **Sap Picture Exporter**\
&#x20;                                                          d.     **If SAP version 10 –  Version 10 of Sap Importer Only must be**\
&#x20;                                                                  **downloaded too**&#x20;

![](<../../../../.gitbook/assets/image (49).png>)

![](<../../../../.gitbook/assets/image (414).png>)

### &#xD;#3 **Step:** download the folder **Sap Listener 64**&#x20;

1. Open the file **install.bat** ---->  **Edit**    -----> add **the correct path to your listener**

![](<../../../../.gitbook/assets/image (57).png>)

![](<../../../../.gitbook/assets/image (428).png>)

After making sure you have the correct way to the listener inside the file **install.bat** \
**------>** **run it as administrator**

{% hint style="info" %}
Could be that you will get error '0x80131515' OnlineListenereService.exe could not be loaded. \
Right click on OnlineListenereService.exe, properties, check 'Unblock' in bottom.
{% endhint %}

**PAY ATTENTION**   ---           following that you will have the **Service tab** in your Task Manager and  \
&#x20;                                              **online\_listener  (pepperi\_onlinelistener)** in it **stop the listener**

![](<../../../../.gitbook/assets/Capture (35).PNG>)

\
**2.** **Generating a UUID.** \
Open the file **SettingsEditor.exe  as administrator** ---> Generate **GUID for clientid --->** **Save Settings**

\-------------------------------------------------------------------\
**key**                               **value**\
clientid                                             \*need to generate\
\-------------------------------------------------------------------

**PAY ATTENTION**      – to generate **GUID for clientid** --->  push the button **Generate GUID**

![ ](<../../../../.gitbook/assets/image (409).png>)



![](<../../../../.gitbook/assets/Capture (29).PNG>)

\*this **GUID** should be saved afterwards in client’s General Settings\
**PAY ATTENTION!** To test this GUID you can choose any client’s dataflow task \
\---> set the new field **signal\_client\_id** -----> add as a **value** the     generated GUID

![](<../../../../.gitbook/assets/image (319).png>)

3\. After the GUID has been generated, we **Start the listener**.

![](<../../../../.gitbook/assets/Capture (24).PNG>)

\
4\. Open online\_listener via **Open Service  ---->** find **Pepperi Online Listener  ------->** open via **Properties**

![](<../../../../.gitbook/assets/image (282).png>)

![](<../../../../.gitbook/assets/image (285).png>)

5\.&#x20; **These three settings (First failure; Second failure; Subsequent failures) are important to be prepared in a case of listener failure**

![](<../../../../.gitbook/assets/image (71).png>)



{% hint style="info" %}
**PAY ATTENTION –** if all steps above were completed, listener should work properly \
&#xNAN;**!!BUT sometimes** the possible issue with webhooks can appear when client doesn’t   have SAP DI API running (both versions, 32 and 64 bit) or if SAP version is 10

**SOLUTION:        upgrade importer  Version 10 of Sap Importer Only**\
&#x20;                               it has two files: **SAP\_Importer.exe**\
&#x20;                               **SAP\_Importer.pdb**
{% endhint %}

![](<../../../../.gitbook/assets/image (411).png>)

![](<../../../../.gitbook/assets/image (419).png>)

\
These two files (**SAP\_Importer.exe; SAP\_Importer.pdb**) should be added + with replace into the folder of online\_listener  where the file install.bat is\
Before doing this make sure that Service is stopped otherwise you will get an error\
&#xNAN;**\*Stop the Service and then add + replace the files after it Start the Service again**

![](<../../../../.gitbook/assets/image (283).png>)

![](<../../../../.gitbook/assets/image (52).png>)

**REMARKS**\
SAP Version 10 is only 64-bit but in compatibility mode 32-bit DI API is still working. A lot of clients forget to install it and Pepperi cannot work without it.\
\
**RULE:            SAP Version 10 works with availability of two versions 64-bit and 32-bit** \
&#x20;                       **and listener must be updated**

6\. Let’s take **General Settings example** to get through **all SAP settings** \
&#x20;    all these settings must be prepared for the client:

![](<../../../../.gitbook/assets/image (66).png>)

![](<../../../../.gitbook/assets/image (443).png>)

**SAP Desktop Plugin**          licenseserve \* should be given by the client (domain+ port)\
&#x20;**REMARKS**\
&#x20;**sql\_connection** and **signalr\_client\_id** are  responsible for dataflow tasks\
&#x20;(so if you have any issues with dataflow tasks, probably you have got the incorrect info in these fields) the rest of the fields are for webhooks mostly.\
&#x20;

check&#x20;&#x20;**SAP migration. Summary**



