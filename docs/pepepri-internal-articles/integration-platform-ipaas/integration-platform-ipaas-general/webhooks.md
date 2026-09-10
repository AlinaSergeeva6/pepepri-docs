---
title: "Webhooks"
description: "You can find examples in “Integration Examples” (6685) Pepperi integration platform account"
order: 252
---
# Webhooks

*You can find examples in “Integration Examples” (6685) Pepperi integration platform account*

Webhook - tool that allows you to send transaction data somewhere, for example to ERP. Each Order, Activity, Account that you create in Pepperi must be sent to the client. This is released by webhooks. Also webhook is used for implementation additional logic, for example , you can run program via webhook ect.

To create Webhook Task you have to select "Webhook Tasks" in 'Manage Tasks' and press 'Add New Task'

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-11.jpg)

### Task Name

Just a name of Task

### Application

Here you should write an application that task will use. Use table below to select correct application

|  |  |
| --- | --- |
| Name | Desription |
| Pepperi | not to use |
| Generic Cloud Internal Connector | Allows to work with Pepperi Integration Platform tasks. |
| NetSuite Plugin | Should be used if data is to be sent to NetSuite environment |
| Xero Plugin | Should be used if data is to be sent to Xero environment |
| QuickBooks Plugin | Should be used if data is to be sent to QuickBooks environment |
| MYOB Plugin | Should be used if data is to be sent to MYOB environment |
| SQL On Public IP Plugin |  |
| Oracle Sales Cloud Plugin |  |
| QuickBooks Desktop Plugin |  |
| SAP Desktop Plugin | Should be used if data is to be sent to SAP environment |
| Generic HTTP Connector | Allows to work with any HTTP application and send GET/POST/PUT, etc requests to any page. Use this application if you would like to use HTTP protocol to get or send the data |
| Generic Desktop Connector | Allows to work with any Desktop application and send requests to desktop application. Use this application if you would like to use listener on the remote server |

### Source Object

This option could be different for each application

### Target Object

This option allows you to select the destination of the data you get:

|  |
| --- |
| Name |
| Generic cloud connector importer |
| NetSuite Sales Order Transaction Header |
| NetSuite Sales Order Transaction Line |
| NetSuite Invoice Transaction Header |
| NetSuite Invoice Transaction Line |
| NetSuite Estimate Transaction Header |
| NetSuite Estimate Transaction Line |
| NetSuite Credit Memo Transaction Header |
| NetSuite Credit Memo Transaction Line |
| NetSuite Cash Sale Transaction Header |
| NetSuite Cash Sale Transaction Line |
| NetSuite Cash Refund Transaction Header |
| NetSuite Cash Refund Transaction Line |
| NetSuite Sales Order Transaction Account |
| NetSuite Estimate Transaction Account |
| NetSuite Invoice Transaction Account |
| NetSuite Cash Sale Transaction Account |
| NetSuite Credit Memo Transaction Account |
| NetSuite Cash Refund Transaction Account |
| NetSuite Return Authorization Transaction Header |
| NetSuite Return Authorization Transaction Lines |
| NetSuite Return Authorization Transaction Account |
| NetSuite Items Fulfillment Header |
| NetSuite Items Fulfillment Lines |
| NetSuite Items Fulfillment Account |
| NetSuite - Generic Http Importer |
| Xero Invoice Transaction Header |
| Xero Invoice Transaction Line |
| Xero Invoice Account |
| Xero Import Account |
| Xero - Generic Connector Http Importer |
| QuickBooks Import Invoice Header |
| QuickBooks Import Invoice Line |
| QuickBooks Import Estimate Header |
| QuickBooks Import Estimate Line |
| QuickBooks Import Estimate Account |
| QuickBooks Import Account |
| QuickBooks - Generic Connector Http Importer |
| MYOB Import Invoice Header |
| MYOB Import Invoice Line |
| MYOB Import Order Header |
| MYOB Import Order Line |
| MYOB Import Invoice Account |
| MYOB Import Order Account |
| MYOB - Generic Connector Http Importer |
| SQL Server Import Order Header |
| SQL Server Import Order Line |
| SQL Server Import Order Account |
| Oracle SC Import Account |
| Oracle SC Import Contact |
| Oracle SC Import Activity |
| QuickBooks Desktop Import Order Header |
| QuickBooks Desktop Import Order Line |
| QuickBooks Desktop Import Order Account |
| QuickBooks Desktop Import Sales Receipt Header |
| QuickBooks Desktop Import Sales Receipt Line |
| QuickBooks Desktop Import Sales Receipt Account |
| QuickBooks Desktop Import Invoice Header |
| QuickBooks Desktop Import Invoice Line |
| QuickBooks Desktop Import Accounts |
| Quickbooks Desktop Import Credit Memo Header |
| Quickbooks Desktop Import Credit Memo Line |
| QuickBooks Desktop Estimate Header |
| QuickBooks Desktop Estimate Lines |
| QuickBooks Desktop Transfer Inventory Header |
| QuickBooks Desktop Transfer Inventory Lines |
| SAP B1 Desktop Import Order Header |
| SAP B1 Desktop Import Order Line |
| SAP B1 Desktop Import Order Account |
| SAP B1 Desktop Import Return Header |
| SAP B1 Desktop Import Return Line |
| SAP B1 Desktop Import Return Account |
| SAP B1 Desktop Import Quotation Header |
| SAP B1 Desktop Import Quotation Line |
| SAP B1 Desktop Import Invoice Header |
| SAP B1 Desktop Import Invoice Line |
| SAP B1 Desktop Import Delivery Note Header |
| SAP B1 Desktop Import Delivery Note Line |
| SAP B1 Desktop Import Account |
| SAP B1 Desktop Import Activity |
| SAP B1 Desktop Import Inventory Transfer Request Header |
| SAP B1 Desktop Import Inventory Transfer Request Lines |
| SAP B1 Desktop Import Stock Transfer Header |
| SAP B1 Desktop Import Stock Transfer Lines |
| SAP B1 Desktop Import Payment |
| SAP B1 Desktop Import Credit Note Header |
| SAP B1 Desktop Import Credit Note Lines |
| SAP B1 Import Service Call |
| SAP B1 Desktop Import PO Order Header |
| SAP B1 Desktop Import PO Order Lines |
| SAP B1 Desktop Import PO Invoice Header |
| SAP B1 Desktop Import PO Invoice Lines |
| SAP B1 Desktop Import PO Request Header |
| SAP B1 Desktop Import PO Request Lines |
| SAP B1 Desktop Import PO Quotation Header |
| SAP B1 Desktop Import PO Quotation Lines |
| SAP B1 Desktop Import Price Changes |
| SAP B1 Desktop Import PO Return Header |
| SAP B1 Desktop Import PO Return Lines |
| SAP B1 Desktop Import PO Delivery Note Header |
| SAP B1 Desktop Import PO Delivery Note Lines |
| SAP B1 Desktop Import Return Request Header |
| SAP B1 Desktop Import Return Request Lines |
| SAP B1 Desktop Import Goods Return Request Header |
| SAP B1 Desktop Import Goods Return Request Lines |
| SAP B1 Desktop Import Inventory Counting Header |
| SAP B1 Desktop Import Inventory Counting Lines |
| Generic Http Importer |
| Generic Desktop Import |
