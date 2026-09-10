---
title: "MS Access Integration"
order: 184
---
# MS Access Integration

### Before the installation:

You need to have user id and password in order to connect to database.

Please make sure that you have remote access to the customer's server.

#1 Step: connect to the customer server via LogMein Rescue Technician Console

!!!info
Detailed instruction you can find here ([https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/remote-control](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/remote-control))
!!!

### Plugin Installation

!!!info
Detailed instruction can be found in Generic Desktop Integration - First Time Plugin Installation ([https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/generic-desktop-integration/first-time-plugin-installation](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/generic-desktop-integration/first-time-plugin-installation))
!!!

If Online Listener Only does not contain install.bat file, you can go

**Tools** ---> **Desktop Applications** ----> **SAP Business One**

and download Sap Listener with corresponding bit-version. It includes all necessary files, you can use it instead of Online Listener Only

### Create settings for connection to database

1) In global settings of the environment in iPaaS add new record with name “signalr\_client\_id” and fill the value with UUID you have generated in previous step

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-368.png)

2) Add new record with name “sql\_connection” and fill it with next value:

Driver={Microsoft Access Driver (\*.mdb)};Dbq=path to database;Uid=login;Pwd=password;

Where *path to database* is a path to file with .mdb extension

If path to database is a network path, here is one of the ways of getting absolute path:

1\. Open ODBC Data Source Administrator

2\. Choose tab ‘System DSN’, click ‘Add’ and select Microsoft Access Driver(\*.mdb)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-369.png)

1.  Click ‘Select’ below the ‘Database’ and find path for corresponding disk name.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-370.png)

#4 How to configure dataflow tasks

Task details:

-   Application: Generic Desktop Connector
-   Source Object: Generic Desktop Export
-   Target Object: Based on your needs

Settings tab, add next records:

1) listener\_run\_exe: path to Exporter.exe (example: .\\exporter32\\Exporter.exe)
2) is\_sql\_source: true

SQL tab:

Client type – ODBC.

SQL statement – write your SQL code

You can view content of database by simply opening .mdb file.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-371.png)

After that, you can choose table you need and check data in it.

Example of SQL statement for getting data from the table you can see above:

```
SELECT
    PIL.SKU AS ExternalID,
    PIL.ID AS TSAID,
    IM.Desc AS Name,
    PIL.Category AS BrandExternalID,
    PIL.[Qty/Case] AS TSACaseQty,
    PIL.SGR AS TSASGR,
    PIL.[Case Qty] AS TSAEquivalentCaseQty,
    PIL.[Active Logic] AS TSAActive
FROM [Pepperi Item List] PIL
LEFT JOIN [tbl_IM] IM ON PIL.SKU = IM.Part_Nbr
```

After these steps you should be able to connect to database and retrieve needed information
