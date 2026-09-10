---
title: "Environment duplication instructions"
order: 268
---
# Environment duplication instructions

**Estimated time to implement** - at least 4h (actual time depends on amount of features to be copied)

**Time estimation:** for relatively small environments duplication is a fast and easy process which indeed can take about 4h. But for larger ones that have significant amount of transactions and new features like UDCs, pages, insights, VisitFlow etc. it may take few days to complete (not including testing).

## How to duplicate

1.  **Duplicate iPaaS and Pepperi environments**

-   1.1. Open iPaaS accounts manager page [https://integration.pepperi.com/mgr/PluginManager/IntegrationAccounts](https://integration.pepperi.com/mgr/PluginManager/IntegrationAccounts)
-   1.2. In ‘Tools’ select ‘Create Pepperi + iPaaS Account’:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-244.png)

img 1.

-   1.3. Fullfil the details accordingly and click ‘create’:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-245.png)

img 2.

*Pepperi distributor template email* and *password* are optional fields, hovewer, if you leave them empty, Pepperi environment’s setup won’t be duplicated - you will have duplicated iPaaS with new and clean Pepperi environment. If you fullfill those fields with correct credentials, part of Pepperi setup will be duplicated: account, item, catalog, contact fields; homepage, account dashboard, catalog views; activity lists, activities and transactions etc.

#### Common issues while duplication:

**Issue**: creating new environments takes enormous amount of time and then fails with timeout error.

**What to do**: most probably this happens due to relatively large size of Pepperi environment. Wait few minutes and check if you can login to your new environment. If you cannot, contact support.

**Issue**: after logging in you see blank page or error messages.

**What to do**: see if you can get idp\_token in session storage (contact support if it is missing) and check installed addons via Postman:

GET [https://papi.pepperi.com/v1.0/addons/installed\_addons](https://papi.pepperi.com/v1.0/addons/installed_addons)

check if essential addons are installed: Core Resources, Cross Platform Engine, Cross Platform Engine Data, Cross Platforms API, Webapp platform etc.

If you see some missing essential addon - try to install it via Postman.

**Issue**: Pepperi account is not linked to iPaaS environment. You may see some errors in webapp (iPaaS settings in webapp)

**What to do**: re-link account in iPaaS. Find it in accounts list and click ‘re-link’

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-246.png)

img 3.

After providing admin credentials of the new environment issue should be fixed.

### Pepperi environment setup

Now it’s time to fix/confirm the setup in webapp. This section will contain possible topics to handle. If original environment does not contain some of those, you can skip them.

***Note****:* It is recommended to work in the same order as it goes in this section, as some features depend on others.

### Addons

*Settings -> Configuration -> Add-on Manager*

Most of the addons will be installed automatically, but some won’t be (like VisitFlow, scripts, surveys etc.). To identify which addons are missing you can use a script attached (CompareAddons.js). You need to install missing addons and update them to same versions as in origin env.

***Note****:* please get approval for installing Nebula if you need it.

#### Common issues:

**Issue:** addon installation fails with error

**What to do:** depends on the error, but commonly it may happen due to some dependencies were not installed. If you were installing addon with Postman, you can check audit log to see the error message.

There were some cases when Core Resources addon could not be updated if main account type was written with small first letter - “customer”.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-247.png)

img 4.

You need to rename it in order to fix the issue.

### Var settings

Part of these setting is copied with Pepperi environment. However, configurations of “Addons settings” are not copied. Please contact Services team manager/Support/Success manager in order to copy them.

### Users

*Settings -> Users*

Profiles will be duplicated with env, but not roles. Create them manually.

### Scripts

*Settings -> Configuration -> Scripts*

If you have lot’s of scripts to copy, than you can use next script **(PostData.ts)** to create them much faster.

-   Export all the scripts in original environment with call to GET [https://papi.pepperi.com/V1.0/addons/api/9f3b727c-e88c-4311-8ec4-3857bc8621f3/api/scripts](https://papi.pepperi.com/V1.0/addons/api/9f3b727c-e88c-4311-8ec4-3857bc8621f3/api/scripts)
-   Paste scripts json to the ‘dataToPost’ variable and provide a bearer token of destination environment. For scripts, you can use same endpoint as GET to post the data.
-   Run script (the easiest way is to run it with ‘Code Runner’ extension straight in VSCode).

    ***Note****:* this approach can be used for other resources if needed (but not for all).

### Flows

*Settings -> Configuration -> Flows*

-   Export all flows using GET [https://papi.pepperi.com/V1.0/addons/api/dc8c5ca7-3fcc-4285-b790-349c7f3908bd/api/flows](https://papi.pepperi.com/V1.0/addons/api/dc8c5ca7-3fcc-4285-b790-349c7f3908bd/api/flows)
-   Create flows using POST to previous endpoint (one object per request)

### User Defined Collections

*Settings -> Configuration -> User Defined Collections*

-   Export UDC schemes with GET [https://papi.pepperi.com/v1.0/user\_defined\_collections/schemes](https://papi.pepperi.com/v1.0/user_defined_collections/schemes)
-   Create schemes using POST to previous endpoint (one object per request)

***Note:*** some UDCs may have reference resource fields to other UDCs. Such UDCs, that serve as resources need to be created first.

### User Defined Tables

*Settings -> Configuration -> User Defined Tables*

Just manually create tables or use script (CreateUDTsInBulk.js) if there are too many of them.

### Catalogs

*Settings -> Catalogs*

Catalogs are not copied with environment, but in order to setup transactions correctly you need to create them.

-   Create catalog custom fields if they were not created.
-   Check if item custom fields were created in Items -> Fields
-   Create item filters in Items -> Filters
-   Manually copy catalogs. You will not be able to setup items tab in catalog, as items are not uploaded yet - you will need to setup it later.

### Activity Lists

*Settings -> Sales Activities-> Activity Lists*

Activity lists are copied, but you need to check filter tab, those filters that contain ActivityTypeId will be empty.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-248.png)

img 5.

### Promotions

*Settings -> Promotion Setup*

Go to ‘Promotion Setup’ tab and copy configuration for each promo type used

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-249.png)

img 6.

Promo transactions are not duplicated, so you need to generate them in promo setup tab (for order and package promotions). When you will be uploading items, you may want also to upload package items. To fully duplicate package promos you need:

-   export items from origin env with filter “CampaignID is not null”
-   This field contains ActivityTypeID of package transaction, you need to replace it with ids from duplicated env
-   Update items with correct CampaignID field
-   Copy data from PPI\_PackagePromotion\_Details UDT

### ERP Integration, Pricing Policy and other

-   Go to Settings -> ERP Integration -> Configuration and copy the setup.
-   Go to Settings -> Pricing Policy tab and copy configuration and price lists (if you use it).
-   Go to Settings -> Company Profile -> Email Settings and copy it if customer uses custom SMTP server
-   Go to Settings -> Branded App and see what needs to be copied. Mainly, it can be settings / images / styling for webapp and branded apps (if used).

### Transactions & Activities

*Settings -> Sales Activities*

Even though transactions and activities are duplicated, they might not work as expected.

What can go wrong with transaction types:

-   UDT table names are empty in UDT dropdowns and UDT type fields
-   Reference and list of objects type fields are broken / refer to wrong resource
-   Transaction is connected only to Default Catalog
-   Custom forms that are used in workflow and programs are not duplicated
-   Accounts tab is not correctly set

and other possible issues. Most common way to fix it is import json of corresponding transaction from original environment. However, you can still manually fix them by checking each of above points.

### Possible issues while importing:

**Issue:** Error. Error message: Failed due to exception: https://papi.pepperi.com/V1.0/meta\_data/activities/types/337149/fields?include\_owned=false&include\_internal=true failed with status: 400 - Bad Request error: {"fault":{"faultstring":"The field: TSASomething refers to a type definition: XXXX that doesn't exist","detail":{"errorcode":"InvalidData"}}}

**What to do:** find the field and re-create it. In case of activities it may not help, in this case the best option is to rename activity and delete it.

**Issue:** Error. Error message: Failed due to exception: Cannot read properties of undefined (reading 'InternalID')

**What to do:** check ‘Accounts’ tab, it may have had a custom setup. Confirm the setup and click ‘save’, now you can try to import again.

**Issue:** errors related to [https://papi.pepperi.com/V1.0/meta\_data/transactions/types/{{TYPE\_ID}}/workflow\_legacy.](https://papi.pepperi.com/V1.0/meta_data/transactions/types/%7b%7bTYPE_ID%7d%7d/workflow_legacy.)

**What to do:** sometimes happens if workflow contains a custom form. Export corresponding transaction/activity from original env and in json find “Workflow” property. Replace broken references to custom forms (or remove file ids) and POST it to mentioned endpoint.

Don’t forget to replace webhook and other URLs in a workflow. Also, update custom forms that open UI tasks with correct html.

### UOM and other transaction tabs

-   Go to Settings -> Items -> UOMs and manually create lines
-   Setup UOM tab per each relevant transaction. Don’t forget to click ‘save’ at top right corner
-   Don’t forget to copy setup for other transaction tabs like ‘Events’, ‘Related Items’ etc.

### Pricing module

For now, there is no UI to set up pricing (but it will be implemented). However, you can do it with Postman:

-   Get pricing configuration of origin env with GET [https://papi.pepperi.com/v1.0/addons/api/adb3c829-110c-4706-9168-40fba9c0eb52/api/configuration](https://papi.pepperi.com/v1.0/addons/api/adb3c829-110c-4706-9168-40fba9c0eb52/api/configuration)
-   POST this config to the destination env using same URL
-   Retrieve ATD config with GET [https://papi.pepperi.com/v1.0/addons/api/adb3c829-110c-4706-9168-40fba9c0eb52/api/atd\_configuration](https://papi.pepperi.com/v1.0/addons/api/adb3c829-110c-4706-9168-40fba9c0eb52/api/atd_configuration)
-   Prepare retrieved config - property ‘Key’ should be updated with corresponding uuid of transaction type (you can use GET [https://papi.pepperi.com/v1.0/meta\_data/transactions/types](https://papi.pepperi.com/v1.0/meta_data/transactions/types) to retrieve uuids)
-   POST config to the same endpoint, one object per request

### Insights

-   Go to Settings -> Insights -> Data Index, copy fields and run re-indexing
-   Export all data queries using GET [https://papi.pepperi.com/V1.0/data\_queries](https://papi.pepperi.com/V1.0/data_queries)
-   POST to the same endpoint, one object per request
-   Copy settings from other tabs if needed

### Resource views

*Settings -> Pages -> Resource Views*

Use next guide (written by RnD) only if you have a lot resource views to copy. Otherwise, manual duplication will be faster.

Viewers and editors can be configured with different search settings, fields for views etc. These configs are called data views and also need to be duplicated.

In order to copy the views & editors of the resource lists following steps should be executed:

-   GET all views using the following endpoint

    [https://papi.pepperi.com/V1.0/addons/api/0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa3/api/views](https://papi.pepperi.com/V1.0/addons/api/0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa3/api/views)

-   Create the views 1 by 1 using POST to the previous endpoint.

    GET all editors using the following endpoint

    [https://papi.pepperi.com/V1.0/addons/api/0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa3/api/editors](https://papi.pepperi.com/V1.0/addons/api/0e2ae61b-a26a-4c26-81fe-13bdd2e4aaa3/api/editors)

-   l Create the editors 1 by 1 using POST call to the previous endpoint

    run the following script (on TS Playground) where 'POSTMAN\_RESULT' is the object return from the views endpoint (attached). the script will output to console a list of api calls to be executed to receive all the Data Views connected to each view/editor

```
const views = {{POSTMAN_RESULT}};
const DataViewsURL = new Set();
const editorsKeys = new Set();
const baseURL = `https://papi.pepperi.com/V1.0/meta_data/data_views?where=`
views.forEach(view => {
const viewKey = view.Key.replace(/-/g, '');
DataViewsURL.add(`${baseURL}Context.Name like '%25${viewKey}%25'`);
if(view.Editor) {
const editorKey = view.Editor.replace(/-/g, '');
DataViewsURL.add(`${baseURL}Context.Name like '%25${editorKey}%25'`)
}
})
console.log('api urls', DataViewsURL)
```

-   Create the data views using the batch upsert endpoint (/meta\_data/data\_views\_batch) on the data\_views api:

    [https://papi.pepperi.com/V1.0/meta\_data/data\_views\_batch](https://papi.pepperi.com/V1.0/meta_data/data_views_batch)

-   ***Note:*** before posting final json to data views endpoint you should prepare it: 1) delete InternalID property from every data view object 2) There are references to profiles and those have InternalID property. You should replace origin profile internalID with id in duplicated environment. Use GET [https://papi.pepperi.com/v1.0/Profiles](https://papi.pepperi.com/v1.0/Profiles) to get profile ids.

### Pages

*Settings -> Pages -> Page Builder*

-   Export all pages with GET [https://papi.pepperi.com/v1.0/pages?page\_size=-1](https://papi.pepperi.com/v1.0/pages?page_size=-1)
-   Post them one by one to [https://papi.pepperi.com/v1.0/pages](https://papi.pepperi.com/v1.0/pages)

### Slugs

*Settings -> Pages -> Slugs*

-   Export all slugs with GET [https://papi.pepperi.com/V1.0/addons/api/4ba5d6f9-6642-4817-af67-c79b68c96977/api/slugs](https://papi.pepperi.com/V1.0/addons/api/4ba5d6f9-6642-4817-af67-c79b68c96977/api/slugs)
-   Create with POST to the same endpoint (one slug per request).

    Usually, slug mappings are automatically resolved after creating slugs

### Nebula & Febula

*Settings -> Febula -> System Level Filtering*

Copy data in ‘Filters’, ‘Sync-Filters’ and ‘Online-Filters’ tabs.

### VisitFlow

Refer to article with VisitFlow installation [https://kbint.pepperi.com/add-ons-manuals/pages-add-on/visit-flow-event](https://kbint.pepperi.com/add-ons-manuals/pages-add-on/visit-flow-event)

Don’t forget to setup UDC events:

-   Open Settings -> User Defined Collections -> Edit VisitFlow UDC schema
-   Copy events tab, it includes ‘onVisitFlowStepClick’ and ‘onVisitFlowDataLoad’ events

Then, you may want to copy VisitFlowGroups and VisitFlows UDC data. Pay attention, that group key in VisitFlowGroups UDC is auto generated, so importing into VisitFlows UDC without replacing old uuids with new may not work.

Possible issues while duplicating:

**Issue:** Any errors related to VF\_VisitFlowMainActivity custom fields (e.g. TSAFlowID, TSAVisitSelectedGroup).

**What to do:** try re-creating the field. If it didn’t help, try to delete it and re-install VisitFlow addon.

### Surveys

Refer to article [https://kbint.pepperi.com/services-demo-environment/features/surveys-feature](https://kbint.pepperi.com/services-demo-environment/features/surveys-feature)

### iPaaS environment setup

All the task, scheduled jobs, settings are copied, but there are few things to check:

-   **Addons**. Go to Tools -> Add-ons Manager and see if addons are installed correctly. Click ‘check for updates’ to make sure there are no issues. Most probably you will see UUIDs mismatch error:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-250.png)

img 7

Copy correct uuid and paste it to relevant general setting (based on addon)

\-> webhook\_addon\_installed\_uuid

\-> server\_side\_script\_addon\_installed\_uuid

\-> homepage\_editor\_addon\_installed\_uuid

-   Check quick setups settings and update credentials if needed
-   If you have webhooks that trigger a scheduled job - review it and re-select the job
-   Check tasks that import activities/transactions/transaction\_lines into Pepperi, and update sub\_type\_id setting
-   All scheduled jobs are disabled by default - enable them when needed

Now, when setup is done, you can upload data (items, accounts, UDTs etc.) and start testing the environment.

2KB

[CompareAddons.js](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FFQY8j4aJpthQ8AIgMgls%2FCompareAddons.js?alt=media&token=daa56e61-ef52-45d5-9f41-d993d04af00b)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FFQY8j4aJpthQ8AIgMgls%2FCompareAddons.js?alt=media&token=daa56e61-ef52-45d5-9f41-d993d04af00b)

4KB

[CreateUDTsInBulk.js](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FNAGhDhDFEEdxXIcJjOfT%2FCreateUDTsInBulk.js?alt=media&token=f238982a-df22-4db5-9e6b-1e29065ecab2)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FNAGhDhDFEEdxXIcJjOfT%2FCreateUDTsInBulk.js?alt=media&token=f238982a-df22-4db5-9e6b-1e29065ecab2)

3KB

[PostData.js](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FZkPodOZEuqbZadCBuXSo%2FPostData.js?alt=media&token=c378e6df-e77a-42b3-b7b8-76430fcbeab5)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FZkPodOZEuqbZadCBuXSo%2FPostData.js?alt=media&token=c378e6df-e77a-42b3-b7b8-76430fcbeab5)
