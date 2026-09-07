# SQL Webhook configuration

### General Settings

Add these 2 fields:

**sql\_connection**: Data Source=**Server Name**;Initial Catalog=DB**Name**;Integrated Security=False;User ID=**your** **value**;Password=**password**

**signalr\_client\_id:** clientID

<figure><img src="../../../../.gitbook/assets/image (160).png" alt=""><figcaption></figcaption></figure>

### Webhook

{% tabs %}
{% tab title="Settings" %}
**listener\_run\_exe: ./sql\_importer/sql\_importer.exe**
{% endtab %}

{% tab title="Details" %}
* **Application:** Generic Desktop Connector
* **Source Object:** Pepperi Transaction Webhook
* **Target Object:** Generic Desktop Import
{% endtab %}

{% tab title="SQL" %}
{% hint style="info" %}
In order to generate lines use this pattern to generate the query
{% endhint %}

```sql
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
{% endtab %}
{% endtabs %}

