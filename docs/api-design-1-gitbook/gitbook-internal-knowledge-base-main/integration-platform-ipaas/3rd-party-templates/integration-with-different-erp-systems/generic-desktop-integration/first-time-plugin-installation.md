# First Time Plugin Installation

SQL integration is similar to SAP integration. Although it has got some peculiarities.

{% hint style="info" %}
[Link to SAP Integration](../sap-integration/)
{% endhint %}

### Extraction

In order to install all the necessary tools you need to download them from the Integration Platform.

1. Go to Integration Pepperi,  open the tools panel and choose **"Desktop applications"**

<figure><img src="../../../../.gitbook/assets/image (1250).png" alt=""><figcaption></figcaption></figure>

2\. Download plugin **Listener Service Includes All.**

<figure><img src="../../../../.gitbook/assets/image (1252).png" alt=""><figcaption></figcaption></figure>

3\. Then **unarchive** the content. As a rule, the plugin are extracted to **C:/Program files(x86)/Pepperi**. \
In some particular cases, when the client uses Quickbooks the path can be C:/Pepperi.

<figure><img src="../../../../.gitbook/assets/image (1254).png" alt=""><figcaption></figcaption></figure>

### &#x20;Installation Configuration

{% hint style="danger" %}
Make sure to **delete OnlineListenerSettings.xml** from the listener folder before installation, **if it is there.**
{% endhint %}

The next step is to configure 2 .bat files: **install.bat** and **uninstall.bat**.&#x20;

1. Open the **Online Listener** folder and right-click on **install.bat** \
   Open it with **Notepad**, **Visual Studio Code**, or any other IDE.
2. On the right, please provide the correct path to **OnlineListenerService.exe**, which should be stored in **Pepperi** folder now
3. Do the same for **uninstall.bat**

<figure><img src="../../../../.gitbook/assets/image (1256).png" alt=""><figcaption></figcaption></figure>

### Installation

1. run install.bat as Administrator.

{% hint style="info" %}
Could be that you will get error '0x80131515' OnlineListenereService.exe could not be loaded. \
Right click on OnlineListenereService.exe, properties, check 'Unblock' in bottom.
{% endhint %}

### General Configuration

After successfully installing the listener, we need to configure it for the future use.

1. **Run settingsEditor.exe as an administrator.**
2. **Click** on **"Generate GUID"**
3. Copy GUID to **ClientID** key as a value.

<figure><img src="../../../../.gitbook/assets/image (148).png" alt=""><figcaption></figcaption></figure>

#### Restart the listener

After configuring the file, you need to restart the listener.

1. Go to Task Manager and find the service "Pepperi Online Listener"
2. Right click on it, then choose "Open services"

<figure><img src="../../../../.gitbook/assets/image (164).png" alt=""><figcaption></figcaption></figure>

3\. Find Pepperi Online listener there right click on it and choose **restart**.

<figure><img src="../../../../.gitbook/assets/image (170).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If the status after reloading is "Running", you can proceed to the next stage
{% endhint %}

{% hint style="danger" %}
If the status is "Starting" it means that firewall blocks the connection and you need to fix that.
{% endhint %}

### Check the listener Status

1. In order to check the status, copy **ClientID,** which was generated previously.
2. Go to integration -> tools -> online listener statuses
3. enter you id in "Listener Client ID" column

<figure><img src="../../../../.gitbook/assets/image (188).png" alt=""><figcaption></figcaption></figure>
