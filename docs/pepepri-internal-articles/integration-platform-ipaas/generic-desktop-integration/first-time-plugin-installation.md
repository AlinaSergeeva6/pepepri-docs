---
title: "First Time Plugin Installation"
order: 133
---
# First Time Plugin Installation

SQL integration is similar to SAP integration. Although it has got some peculiarities.

!!!info
[Link to SAP Integration](/integration-platform-ipaas/sap-integration/index.md)
!!!

### Extraction

In order to install all the necessary tools you need to download them from the Integration Platform.

1.  Go to Integration Pepperi, open the tools panel and choose **"Desktop applications"**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-483.png)

2\. Download plugin **Listener Service Includes All.**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-484.png)

3\. Then **unarchive** the content. As a rule, the plugin are extracted to **C:/Program files(x86)/Pepperi**. In some particular cases, when the client uses Quickbooks the path can be C:/Pepperi.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-485.png)

### Installation Configuration

!!!danger
Make sure to **delete OnlineListenerSettings.xml** from the listener folder before installation, **if it is there.**
!!!

The next step is to configure 2 .bat files: **install.bat** and **uninstall.bat**.

1.  Open the **Online Listener** folder and right-click on **install.bat** Open it with **Notepad**, **Visual Studio Code**, or any other IDE.
2.  On the right, please provide the correct path to **OnlineListenerService.exe**, which should be stored in **Pepperi** folder now
3.  Do the same for **uninstall.bat**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-486.png)

### Installation

1.  run install.bat as Administrator.

!!!info
Could be that you will get error '0x80131515' OnlineListenereService.exe could not be loaded. Right click on OnlineListenereService.exe, properties, check 'Unblock' in bottom.
!!!

### General Configuration

After successfully installing the listener, we need to configure it for the future use.

1.  **Run settingsEditor.exe as an administrator.**
2.  **Click** on **"Generate GUID"**
3.  Copy GUID to **ClientID** key as a value.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-487.png)

#### Restart the listener

After configuring the file, you need to restart the listener.

1.  Go to Task Manager and find the service "Pepperi Online Listener"
2.  Right click on it, then choose "Open services"

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-488.png)

3\. Find Pepperi Online listener there right click on it and choose **restart**.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-489.png)

!!!info
If the status after reloading is "Running", you can proceed to the next stage
!!!

!!!danger
If the status is "Starting" it means that firewall blocks the connection and you need to fix that.
!!!

### Check the listener Status

1.  In order to check the status, copy **ClientID,** which was generated previously.
2.  Go to integration -> tools -> online listener statuses
3.  enter you id in "Listener Client ID" column

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-490.png)
