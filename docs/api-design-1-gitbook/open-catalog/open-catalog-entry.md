# Open Catalog Entry

The Open Catalog goal is to create an open source catalog that based on Pepperi's order center with fast performance. The Open Catalog data export data to ElasticSearch,  a search engine that provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents.\
\
On ElasticSearch there is an index per user, created from installing Pepperi ElasticSearch addon.\
**Index: oc-{distributorUUID}**\
Installing the OpenCatalog addon will create a new type on the user's index: open\_catalog.\
In order to work with versions of open\_catalog and allow multiple catalog the API works on scopes containing pointing to the specific catalog (transaction type) and version - no option to get/post data on more then one specific scope at a call.\
**ElasticSearchType: open\_catalog**\
**ElasticSearchSubType: {transactionUUID}\_{version}**\
\
This specific scope will contains all the needed data for the open catalog:\
1\. Items (transaction line scope exported from Pepperi order center).\
2\. Categories (based on Pepperi filters).\
\
The open catalog scope will export the needed fields for the items and categories and create them dynamically, except from the non indexed fields, those for display only. The non indexed fields will be save on an array, so in case the user will change his mind it will be possible to index this field (because the enable setting for existing fields cannot be updated). The array will save only the formatted values, therefore from data type string.

On Dynamo will be the categories data. We know there should not be data storing on ElasticSearch. Categories are new objects based on Pepperi filters, hence their data will be stored on Dynamo that will operate as a Category table. Items are an object on Pepperi DB therefore no need to saved them on Dynamo.\
\
Limitations:

* GET limit amount of records is 10,000.
* For now not supporting matrix items.

## Export Open Catalog

For each user open catalog there is a transaction type that connected to single catalog. The transaction type will contain the information of which items fields to export and their implementation (search, filtering, display only...). \
\
All the settings information chosen by the user for export of the open catalog scope will be saved on a schema on Dynamo (ADAL). \
\
After the user set the settings of the open catalog scope, the export can be made. \
During the export all transaction line scope items will be exported with the relevant item fields. The categories will be created with their path as a unique identifier and save on Dynamo. Also the relation between categories to their items will be set on the export.\
The data, items and categories, will be uploaded by bulk calls to ElasticSearch. \
\
Changing the open catalog data on ElasticSearch will not be available because it is a bad practice. ElasticSearch is not a DB. There are two options to changing the open catalog data:

1. If the user desires to change the open catalog settings, for ex: adding/removing field to item, change the filters on the catalog. Need to set again the transaction type and then export open catalog again.
2. If the user desires to change the data of specific items or categories, the user will need to change the data on the DB or Dynamo respectively. Can be done on the API. Then export open catalog again.
