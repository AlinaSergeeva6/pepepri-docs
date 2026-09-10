---
title: "Upgrade Online Listener and Exporter Versions for SAP B1"
order: 149
---
# Upgrade Online Listener and Exporter Versions for SAP B1

### 0.Before the upgrading, be sure that all of the settings in General Settings tab are correct

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-460.png)

### 1.Download latest version from Integration Manager Tools>>Desktop Applications (Sap Listener 32)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-461.png)

### 2. Backup existing "online listener" folder

### 3. Stop Listener Service

### 4. Overwrite all files from the above download

### 5. Check connection settings - inside each listener there is a folder : connection_tester>> Run the Pepperi _SAP_Connection_Tester.exe and this is how it should be configured for perfect performance:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-462.png)

### 6. Restart Service

### 7. Submit an Order and check that it inserts to SAP. (Successful Status)

## Knowing issues

### 1. Generating GUID

You can generate new Client ID to be sure that this value is properly the same you have in both connection nodes To generate it, press 'Generate GUID' in Settings editor and copy it to the General Settings tab in Integration

### 2. Restarting the service in case of listener failures

In Services - > Pepperi Online Listener - > Properties - > Recovery specify such fields:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-463.png)

These settings will allow to restart the service in cases of failures

Now you can see logs like this(with really poor description):

![](https://alinasergeeva6.github.io/pepepri-docs/static/3-20.png)

To improve the description of the logs, you can do the following:

Find this:

![](https://alinasergeeva6.github.io/pepepri-docs/static/1-38.png)

Find this 2 files:

![](https://alinasergeeva6.github.io/pepepri-docs/static/2-27.png)

Replace these files with the files that are attached in the attachment and then you will be able to see more detailed logs

![](https://alinasergeeva6.github.io/pepepri-docs/static/2020-02-27_15h29_49.png)

To download the necessary files for updating or installing, follow **Tools** ----> **Desktop Applications**\-----> SAP Business One.

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-24.PNG)
