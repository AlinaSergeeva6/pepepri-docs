---
title: "SQL Webhook configuration"
order: 131
---
# SQL Webhook configuration

### General Settings

Add these 2 fields:

**sql\_connection**: Data Source=**Server Name**;Initial Catalog=DB**Name**;Integrated Security=False;User ID=**your** **value**;Password=**password**

**signalr\_client\_id:** clientID

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-491.png)

### Webhook

**listener\_run\_exe: ./sql\_importer/sql\_importer.exe**

-   **Application:** Generic Desktop Connector
-   **Source Object:** Pepperi Transaction Webhook
-   **Target Object:** Generic Desktop Import

!!!info
In order to generate lines use this pattern to generate the query
!!!

```
@begin_sql
DECLARE @status varchar(1);
DECLARE @message varchar(8000);
SET @status='1';
SET @message='$#IIF(TSAOrderType='IN',IIF(TSAPepperiFinalOrderID='',TSAInvoiceID,TSAPepperiFinalOrderID),InternalID)#$';
BEGIN TRANSACTION;
BEGIN TRY
//your sql code
@begin_lines
//sql lines code
@end_lines
END TRY
BEGIN CATCH

SET @message=ERROR_MESSAGE();
SET @status='0';

IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;

select   @status as status_col  ,@message as message_col
@end_sql
```
