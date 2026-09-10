---
title: "Dataflows SQL Configuration"
order: 132
---
# Dataflows SQL Configuration

### General Settings

Add these 2 fields:

**sql\_connection**: Data Source=**Server Name**;Initial Catalog=DB**Name**;Integrated Security=False;User ID=**your** **value**;Password=**password**

**signalr\_client\_id:** clientID

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-491.png)

### Dataflow task

**listener\_run\_exe:** ./exporter/exporter.exe (path to **exporter.exe** on the client's server from the listener's folder.)

**is\_sql\_source: true**

**is\_new\_api: true**

-   **Application:** Generic Desktop Connector
-   **Source Object:** Generic Desktop Export
-   **Target Object:** Store Data Table For Later Use

write your SQL code here
