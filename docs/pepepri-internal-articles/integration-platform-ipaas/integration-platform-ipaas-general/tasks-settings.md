---
title: "Tasks Settings"
description: "How to configure settings tab"
order: 256
---
# Tasks Settings

*How to configure settings tab*

**Setting fields have 2 levels of Hierarchy :**

1.  Task level
2.  General Settings level

It means that settings field that does not exist in task but exist in general settings will be taken from there, and in case it exists in both and the value is different - the settings of the task wins.

General settings are assigned to application per client - so in case 2 applications needs the same settings field they will have to use 2 different fields for each application.

It is important to note that every task is defined as part of a specific application - so the general settings will be taken from this application's settings for this client.

### Settings configuration

|  |  |  |  |
| --- | --- | --- | --- |
| Name | Application | Example Value | Description |
| [is\_sftp](/integration-platform-ipaas/email/upload-images-from-sftp.md) | FTP | 1/0 |  |
| [sftp\_user](/integration-platform-ipaas/email/upload-images-from-sftp.md) | FTP |  |  |
| [sftp\_password](/integration-platform-ipaas/email/upload-images-from-sftp.md) | FTP |  |  |
| [sftp\_host](/integration-platform-ipaas/email/upload-images-from-sftp.md) | FTP |  |  |
| [sftp\_images\_folder](/integration-platform-ipaas/email/upload-images-from-sftp.md) | FTP |  |  |
| [ftp\_image\_upload\_level\_seperator](/integration-platform-ipaas/email/upload-images-from-sftp.md) | FTP |  |  |
| [ftp\_image\_upload\_level\_seperator](/integration-platform-ipaas/email/upload-images-from-ftp.md) | FTP |  |  |
| [ftp\_image\_upload\_level](/integration-platform-ipaas/email/upload-images-from-ftp.md) | FTP |  |  |
| [dataflow\_email\_from](/integration-platform-ipaas/pdf/send-email-sequence-for-ui-tasks.md) | HTTP | email |  |
| [ftp\_images\_folder](/integration-platform-ipaas/email/upload-images-from-ftp.md) | FTP |  |  |
| [ftp\_source\_port](/integration-platform-ipaas/email/upload-images-from-ftp.md) | FTP | port |  |
| [dataflow\_email\_subject](/integration-platform-ipaas/pdf/send-email-sequence-for-ui-tasks.md) | HTTP | text |  |
| [dataflow\_email\_to](/integration-platform-ipaas/pdf/send-email-sequence-for-ui-tasks.md) | HTTP | email |  |
| [dataflow\_email\_body\_html](/integration-platform-ipaas/pdf/send-email-sequence-for-ui-tasks.md) | HTTP | html |  |
| [response\_id\_sql](/integration-platform-ipaas/email/transactions-status-regular-and-draft.md) | All | sql |  |
| [run\_job\_id](/integration-platform-ipaas/email/splitting-transactions.md) | All | id |  |
| [run\_wait\_seconds](/integration-platform-ipaas/email/splitting-transactions.md) | All | sec |  |
| add\_nowdate | All | 1/0 | Is to add column with current Date column NowDateCol |
| [is\_debug\_sap\_xml](/integration-platform-ipaas/email/transactions-status-regular-and-draft.md) | All | 1/0 |  |
| [is\_debug\_dataset](/integration-platform-ipaas/email/transactions-status-regular-and-draft.md) | All | 1/0 |  |
| [trn\_status](/integration-platform-ipaas/email/transactions-status-regular-and-draft.md) | All | 1/0 |  |
| [task\_table\_sql\_query](/integration-platform-ipaas/integration-platform-ipaas-dataflow-tasks/sql-based-dataflow-ui-task-output-tables.md) | All | SQL query |  |
| [task\_table\_sql\_source](/integration-platform-ipaas/integration-platform-ipaas-dataflow-tasks/sql-based-dataflow-ui-task-output-tables.md) | All | Name of task |  |
| [save\_task\_table\_to\_sql](/integration-platform-ipaas/integration-platform-ipaas-dataflow-tasks/sql-based-dataflow-ui-task-output-tables.md) | All | 1/0 |  |
| [exp\_retry](/integration-platform-ipaas/integration-platform-ipaas-webhook-tasks/retry-failed-transactions.md) | All | Retry webhook if condition returns 1 |  |
| [parsed\_object\_update](/integration-platform-ipaas/integration-platform-ipaas-webhook-tasks/save-values-from-customer-response-in-pepperi-field.md) | All | Allow save values from client response to Pepperi field |  |
| append\_between\_each\_line | HTTP | Any symbol, comma is default, if http header is content-type : application/json | Is usefull if it necessary to add additional symbol when you are using @@lines syntax for transaction lines, loop\_over\_table |
| auth\_net\_api\_base\_uri | HTTP |  |  |
| auth\_net\_forms\_base\_uri | HTTP |  |  |
| auth\_net\_merchant\_name | HTTP |  |  |
| auth\_net\_merchant\_trn\_key | HTTP |  |  |
| auto | All | Number | Name of auto-increment field |
| auto\_prefix | All | pref | Prefix before autonum value |
| autonum\_groupby | All | ItemName | Add sequence number column by group |
| cols\_to\_rows | All | 3, Name,Value | generate rows from columns. structure: &lt;start\_col\_index>, &lt;new\_col\_name>, &lt;new\_col\_value> |
| confirm\_email\_body\_html | All/Webhook | &lt;html> | If is\_email\_confirm=1 this field allows to set body of html email |
| confirm\_email\_display\_from | All/Webhook | email@email.com | If is\_email\_confirm=1 this field allows to set display from of html email |
| confirm\_email\_from | All/Webhook | email@email.com | If is\_email\_confirm=1 this field allows to set "from" of html email |
| confirm\_email\_subject | All/Webhook | Subject | If is\_email\_confirm=1 this field allows to set subject of html email |
| confirm\_email\_to | All/Webhook | email@email.com | If is\_email\_confirm=1 this field allows to set "to" of html email |
| connector\_type | Generic Desktop Connector | SAP | Name of Connector Type |
| create\_categories | All | 1/0 | Allows to create images for categories during items uploading |
| [data\_features\_order](/integration-platform-ipaas/email/email-sender.md) | All | remove\_duplicates,filter | Change process order. Default is: filter,join,pivot,cols\_to\_rows,union, split,eml\_columns,html\_columns, replace,auto,exp,autonum\_groupby, func\_groupby\_cols,remove\_duplicates, change,format,remove |
| [delim](/integration-platform-ipaas/email/splitting-transactions.md) | FTP | comma is default | Delimiter in csv file |
| donotsend | All | 1/0 | Each dataflow task has Target Object - where to place the data after running task. This function allows you not to send data to the Pepperi. |
| eml\_columns | HTTP | column1,column2 | Alows to specify XML columns for GMAIL email when it sends to pepperi |
| encoding-in | FTP | utf | CSV file encoding |
| encoding-out | FTP | utf | CSV file encoding |
| exp\_response\_id | HTTP/Webhook | expression | Expression for webhook to get response ID |
| exp\_response\_message | HTTP/Webhook | expression | Expression for webhook to change response message [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| exp\_success\_status | HTTP/Webhook | expression | Expression to get the response status in cases if use\_http\_status is equal 0 [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| exporter\_dates\_format | HTTP | yyyy-mm | dates format for http export |
| exporter\_dates\_format\_columns | HTTP | first,second | dates columns for http export |
| failure\_message\_field\_update | HTTP/Webhook | TSAError | Allows to update transaction/account/webhook field with message data in case of failure [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| failure\_status\_update | HTTP/Webhook | 2,4,9.. | Failure status number to update back to Pepepri object (Transaction.Status) |
| fields\_place\_holder\_1 | All | $ | $#exp#$ symbol change |
| fields\_place\_holder\_2 | All | # | $#exp#$ symbol change |
| fields\_settings\_place\_holder\_1 | All | ! | !%exp%! symbol change |
| fields\_settings\_place\_holder\_2 | All | % | !%exp%! symbol change |
| filter | All | ItemName&lt;>'' | Filter the data according to the SQL-based string, specified in this field. You can use column names in this string. Use \[New Column\] syntax if column name contains spaces |
| [filter\_loop\_over\_table](/integration-platform-ipaas/email/splitting-transactions.md) | All | sql | sql expression for loop over table |
| [format](/integration-platform-ipaas/integration-platform-ipaas-general/integration-tasks-tabs.md) | All | 1/0 | format tab |
| from\_now\_add | HTTP |  | like get date - use getDate primary |
| ftp\_source\_file\_name | FTP | dash.csv | Name of the FTP source \*.csv file |
| [ftp\_source\_server](/integration-platform-ipaas/email/upload-images-from-ftp.md) | FTP | 192.168.0.1 | FTP source server |
| ftp\_source\_folder | FTP | ftpFolder | Name of folder on the FTP server |
| [ftp\_source\_user](/integration-platform-ipaas/email/upload-images-from-ftp.md) | FTP | username | Username for ftp server access |
| [ftp\_source\_pass](/integration-platform-ipaas/email/upload-images-from-ftp.md) | FTP | \*\*\*\*\*\*\* | Password for ftp server access |
| [func\_col](/integration-platform-ipaas/email/email-sender.md) | All | TransactionUUID | column or expression to run function on |
| [func\_groupby\_cols](/integration-platform-ipaas/email/email-sender.md) | All | ItemName,ItemExternalID | columns to group by |
| generic\_app\_id | HTTP | gmail/facebook selector | OAUTH |
| get\_from\_ftp | FTP | 1/0 | Allows to get the data via ftp |
| group\_func | All | sum/count/max/min | grouping function |
| header\_property | HTTP | prop1,prop2 | Properties of header if is\_header\_lines\_json=1 |
| html\_columns | HTTP | header1,header2 | Allows to specify columns |
| http\_date\_format | HTTP/FTP | yyyy-mm | date header columns |
| [http\_export\_add\_parents](/integration-platform-ipaas/generic-desktop-integration/http-row-element-dataflow-task-setting.md) | HTTP | parent::\*/parent::,..... | Allows to specify parents (xpath) [https://kbint.pepperi.com/integration-platform-examples/http\_row\_element-dataflow-task-setting](https://kbint.pepperi.com/integration-platform-examples/http_row_element-dataflow-task-setting) |
| http\_export\_add\_parents\_prefixes | HTTP | prefix | Allows to add prefix to parents (xpath) |
| http\_export\_skip\_childs | HTTP | child1,child2 | Allows to skip childs during export (xpath) |
| http\_is\_include\_attributes | HTTP | 0/1 | Allows to read xml attribute |
| http\_is\_include\_headers | HTTP | 0/1 | Allows to add response headers as lines |
| http\_is\_include\_parent\_child | HTTP | 0/1 | Allows to add childs (xpath) |
| http\_request\_timeout\_seconds | HTTP | 10 | Waiting time for response |
| [http\_row\_element](/integration-platform-ipaas/generic-desktop-integration/http-row-element-dataflow-task-setting.md) | HTTP | row | Allows to specify row element in json response and to create rows according to the objects in array 'row' [https://kbint.pepperi.com/integration-platform-examples/http\_row\_element-dataflow-task-setting](https://kbint.pepperi.com/integration-platform-examples/http_row_element-dataflow-task-setting) |
| http\_sleep\_miliseconds | HTTP | 10 | Timeout between requests |
| images\_task | All | Task Name | Task for images |
| is\_abort\_job | All | 0/1 | Allows to abort job on error |
| is\_edit\_allowed | All/Webhook | 1/0 | Allows to resubmit Webhook |
| is\_email\_confirm | All/Webhook | 1/0 | Allows to send email confirmation |
| is\_header\_lines\_json | HTTP | 1/0 | Allows to specify header and lines in JSON |
| is\_http\_throws\_error | HTTP | 1/0 | if you want to cath error in JSON |
| is\_json\_as\_string | HTTP | 1/0 | response body |
| is\_loop\_over\_table\_mandatory | All | 1/0 | ignore if table not exist |
| [is\_loop\_over\_table\_per\_execution](/integration-platform-ipaas/email/send-an-e-mail-about-abandoned-cart-transactions-within-a-pe.md) | All | 1/0 | default 1<br><br>to use the same table |
| is\_loop\_over\_wfobject | All | 1/0 | is to use the workflow object as a source to loop over |
| is\_mid\_workflow |  | 1/0 | is the http request is not the end of workflow |
| is\_new\_api |  | 1/0 | Is using new Pepperi API |
| is\_parser\_throws\_error |  | 1/0 |  |
| is\_token\_url\_encoded |  |  |  |
| is\_url\_encoded |  |  |  |
| [join](/integration-platform-ipaas/integration-platform-ipaas-general/integration-tasks-tabs.md) | All | 1/0 | activates/disactivates Join Tab |
| [join\_loop\_over\_table](/integration-platform-ipaas/email/splitting-transactions.md) |  | 1/0 | Join response to the loop over table |
| keepsource |  | 1/0 | Do not delete source file |
| key\_val\_hidden\_col |  |  |  |
| key\_val\_is\_add\_col\_name |  | 1/0 | Is to add column names to the UDT values |
| [key\_val\_is\_json\_array](/services-demo-environment/updating-udt-with-json-values.md) |  | 1/0 | UDT values string type - stringified Array |
| [key\_val\_is\_json\_object](/services-demo-environment/updating-udt-with-json-values.md) |  | 1/0 | UDT values string type - stringified JSON |
| [key\_val\_main\_key\_col](/services-demo-environment/updating-udt-with-json-values.md) |  | ItemName | Allows to set field as UDT MainKey |
| [key\_val\_secondary\_key\_col](/services-demo-environment/updating-udt-with-json-values.md) |  | ItemExternalID | Allows to set field as UDT SecondaryKey |
| [key\_val\_separator](/services-demo-environment/updating-udt-with-json-values.md) |  | ~ | UDT values separator |
| [key\_val\_table\_id](/services-demo-environment/updating-udt-with-json-values.md) |  | UDTSuperTable | Name of the UDT table |
| lines\_place\_holder |  |  |  |
| lines\_property | HTTP | is\_header | Properties of lines if is\_header\_lines\_json=1 |
| [lock\_online\_trn](/integration-platform-ipaas/email/splitting-transactions.md) |  | 0/1 |  |
| [loop\_over\_table](/integration-platform-ipaas/email/loop-over-table.md) |  | Task Name | Takes the data from this task to make loop over the table |
| [loop\_over\_table\_distinct](/integration-platform-ipaas/email/loop-over-table.md) |  | FieldName | Makes loop over this field in the table |
| maxbuff |  | value | Maximum csv reader buffer |
| md5\_expression |  |  |  |
| new\_api\_base\_uri | HTTP |  | Replaces base Pepperi URI in http requests to server |
| newdelim |  |  |  |
| nowdate\_days\_add |  |  |  |
| ntlm\_domain |  |  |  |
| ntlm\_password |  |  |  |
| ntlm\_user |  |  |  |
| on\_task\_error\_send\_email |  |  | webhook |
| [orderby](/integration-platform-ipaas/email/email-sender.md) |  | ItemName | Order by, column Name |
| overwrite\_type |  | none/selective/full | Overwrite type |
| p\_view\_append\_between\_each\_line |  |  |  |
| [page\_interval](/integration-platform-ipaas/acumatica-image-integration/quickbooks-online-api-integration-using-http-connector.md) |  |  |  |
| page\_num\_count\_field |  |  |  |
| page\_num\_count\_header |  |  |  |
| page\_num\_count\_limit |  |  |  |
| [page\_num\_start](/integration-platform-ipaas/acumatica-image-integration/quickbooks-online-api-integration-using-http-connector.md) |  |  |  |
| pass |  | \*\*\*\*\*\*\*\* | wrnty ftp Password. Used by exporter. defined per client. |
| [pivot](/integration-platform-ipaas/integration-platform-ipaas-general/integration-tasks-tabs.md) | All | 1/0 | activates/disactivates Pivot Tab |
| pivot\_text |  |  |  |
| [prefix](/integration-platform-ipaas/acumatica-image-integration/quickbooks-online-api-integration-using-http-connector.md) |  |  | FTP |
| reconfig |  |  |  |
| remap |  |  |  |
| remove |  | 1/0 | Removes all of the fields, which were not specified in the Mapping Tab |
| remove\_chars |  | ASCII | Delete selected symbol |
| [remove\_duplicates](/integration-platform-ipaas/email/email-sender.md) |  | ItemName | Removes duplicates of the specified column. Creates an additional column with "Y" mark in the rows, where duplcates were found |
| removecols |  | ItemName | Columns to remove |
| request\_params\_place\_holder\_1 |  | \* |  |
| request\_params\_place\_holder\_2 |  | SQL |  |
| response\_external\_link |  |  |  |
| response\_id\_col |  |  |  |
| response\_internal\_id\_col |  |  |  |
| response\_message\_col |  |  |  |
| response\_skip\_elements |  |  |  |
| result\_is\_new\_client\_yes |  |  |  |
| result\_status\_ok |  |  |  |
| sequence\_num\_prefix |  |  |  |
| shared\_param\_name\_1 |  |  |  |
| smtp\_subject |  |  |  |
| smtp\_task\_error\_subject |  |  |  |
| smtp\_task\_error\_to |  |  |  |
| smtp\_to |  |  |  |
| sort\_loop\_over\_table |  |  | \----- |
| [source](/integration-platform-ipaas/email/splitting-transactions.md) | Cloud | Get Data | Task Name as data source for current task |
| [split](/integration-platform-ipaas/integration-platform-ipaas-general/integration-tasks-tabs.md) | All | 1/0 | activates/disactivates Split Tab |
| [sub\_type\_id](/integration-platform-ipaas/acumatica-image-integration/quickbooks-online-api-integration-using-http-connector.md) | All | 256245 | Allows to specify ActivityTypeID for Activities export or AccountTypeID for accounts |
| success\_message\_field\_update |  |  | success message field name to update back to Pepepri object |
| success\_status\_col |  |  | Column index of success status response |
| success\_status\_update |  | 2,4,9... | Success status number to update back to Pepepri object (Transaction.Status) |
| [sys\_last\_image\_upload](/integration-platform-ipaas/email/upload-images-from-ftp.md) | FTP | time |  |
| [sys\_ui\_task\_url\_params](/integration-platform-ipaas/pdf/send-email-sequence-for-ui-tasks.md) |  |  | system field - latest query string used for test |
| [sys\_ui\_task\_wfobject](/integration-platform-ipaas/pdf/send-email-sequence-for-ui-tasks.md) |  |  | system field - latest workflow object used for test |
| text\_qualifier |  |  |  |
| throw\_error\_on\_no\_data | UI | 1/0. default 1 | get\_data - throws error when no data is returned. 1- if you want to see an error, 0 - if you want to get just file with headers in UI |
| trn\_html\_response\_template\_approved |  |  |  |
| trn\_html\_response\_template\_declined |  |  |  |
| trn\_import\_filter |  |  |  |
| trn\_retry\_after\_minutes |  |  |  |
| ui\_data\_filter | UI | ItemName LIKE '\*~name~\*' | SQL-based filter to filter data from the dataflow task using post\_array variable **name** |
| ui\_get\_data\_json | UI |  |  |
| ui\_get\_data\_max\_json\_log | UI |  |  |
| [ui\_page\_body](/integration-platform-ipaas/pdf/send-email-sequence-for-ui-tasks.md) | UI | &lt;body> | UI task body html |
| [ui\_page\_head](/integration-platform-ipaas/pdf/send-email-sequence-for-ui-tasks.md) | UI | &lt;head> | UI task head html |
| ui\_partial\_view | UI |  |  |
| [union](/integration-platform-ipaas/integration-platform-ipaas-general/integration-tasks-tabs.md) | All | 1/0 | activates/disactivates Union Tab |
| use\_http\_status | Webhook/HTTP | 1/0 | Allows to use/not to use http status as confirmation Webhook status [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| user |  | Username | wrnty ftp Username. Used by exporter. defined per client. |
| webapi |  |  |  |
| webhook\_account\_fields | Webhook | UUID,Name | Allows to specify fields, that will be retrieved by Webhook from account [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| webhook\_activity\_fields | Webhook | UUID,ActionDateTime | Allows to specify fields, that will be retrieved by Webhook from activity [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| webhook\_contact\_fields | Webhook | UUID,Name | Allows to specify fields, that will be retrieved by Webhook from contact [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| webhook\_dataset\_skip\_elements | Webhook | FieldName | Elements to skip when generating dataset from the API |
| webhook\_is\_async | Webhook |  |  |
| webhook\_trn\_header\_fields | Webhook | GrandTotal, ActionDateTime | Allows to specify fields, that will be retrieved by Webhook from transaction headers [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| webhook\_trn\_line\_fields | Webhook | UnitsQuantity,UnitPrice | Allows to specify fields, that will be retrieved by Webhook from transaction lines [Example](https://kbint.pepperi.com/integration-platform-webhook-tasks-examples/change-error-field-in-pepperi-according-to-the-recieved-data-from-http-request) |
| write\_debug\_zip\_file |  |  |  |
| [write\_key\_val\_file](/services-demo-environment/updating-udt-with-json-values.md) |  | 1/0 | record to csv stringified JSON |
