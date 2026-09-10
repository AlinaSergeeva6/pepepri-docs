---
title: "Picture Exporter testing"
order: 201
---
# Picture Exporter testing

How to test PictureExporter uploading on own environment using own device (it's possible without SAP, just using Generic Desktop Connector):

1.  Install Pepperi Online Listener service: [First Time Plugin Installation | Internal Knowledge Base](https://kbint.pepperi.com/integration-platform-ipaas/3rd-party-templates/integration-with-different-erp-systems/generic-desktop-integration/first-time-plugin-installation)
2.  Download Exporter: [Desktop Applications](https://integration.pepperi.com/mgr/PluginManager/DesktopApplications) => SAP Business One => Sap Picture Exporter => Download now
3.  In the folder where Listener was installed (e.g., C:/Program files(x86)/Pepperi), create picture\_exporter folder and extract downloaded exporter there.
4.  Setup dataflow task for upload (e.g. [ACC \[8094\] Dataflow (108241)](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=108241)).
    1.  *signalr\_client\_id* should have id of your Online Listener
    2.  *listener\_run\_exe* should have relative path to PictureExporter.exe (path is relative to Pepperi folder, e.g. .\\picture\_exporter\\PictureUploader\\PictureExporter.exe)

5.  In the folder where PictureExporter.exe is located, generate images.csv file:
    1.  columns *item* contains item ExternalID
    2.  column *image\_path\_1* contains path to base image (e.g., C:\\Users\\admin\\Downloads\\new\_image.jpg)
    3.  up to 6 levels per item are allowed, so more columns can be added (*image\_path\_2, image\_path\_3, image\_path\_4, image\_path\_5, image\_path\_6*)

6.  Press Run on Task
