# Table of contents

* [Pepperi Resource](README.md)
  * [Search](master/search.md)
  * [Hard Delete](master/hard-delete.md)
* [Generic Resources](generic-resources/README.md)
  * [Introduction](generic-resources/introduction.md)
  * [examples](generic-resources/examples.md)
  * [Resources](generic-resources/resources.md)
  * [slugs](generic-resources/slugs.md)
  * [Application Header](generic-resources/application-header.md)
  * [Related Items](generic-resources/related-items.md)
* [Page](page.md)
* [Data Source Interface](data-source-interface.md)
* [Pepperi Resource Schema](pepperi-resource-schema/README.md)
  * [Extending 'abstract' Schema](pepperi-resource-schema/extending-abstract-schema.md)
* [Legacy PUT](sync/legacy-put.md)

## Advantive One

* [Introduction](advantive-one/introduction.md)
* [extract data](advantive-one/extract-data.md)

## Sync

* [Sync Needed](sync/sync-needed.md)
* [Sync Events](sync/sync-events.md)
* [Sync (sync 2.0 Pull)](sync/sync-sync-2.0-pull.md)
* [Pull Data](sync/pull-data.md)
* [Open Sync](sync/open-sync/README.md)
  * [Concept](sync/open-sync/concept.md)
  * [Sync Source Manager](sync/open-sync/sync-source-manager.md)
  * [Source](sync/open-sync/source.md)
  * [Cache Interface](sync/open-sync/cache-interface/README.md)
    * [Graph Cache](sync/open-sync/cache-interface/graph-cache.md)
  * [Examples](sync/open-sync/examples.md)

## User Defined Events <a href="#events" id="events"></a>

* [Intro (flows)](Events/intro-flows/README.md)
  * [user\_defined\_flows](Events/intro-flows/user_defined_flows.md)
* [Intro (deprecated)](Events/introduction.md)

## IdP (Authentication)

* [Add OAuth App](idp-authentication/add-oauth-app.md)
* [Get List Of OAuth Apps](idp-authentication/get-list-of-oauth-apps/README.md)
  * [Get Single OAuth App](idp-authentication/get-list-of-oauth-apps/untitled.md)
* [Delete Single OAuth App](idp-authentication/delete-single-oauth-app.md)
* [Add OIDC Identity Provider](idp-authentication/add-oidc-identity-provider.md)

## Users

* [Get list of users](users/get-list-of-users/README.md)
  * [Get Single User by ExternalID](users/get-list-of-users/get-single-user-by-externalid.md)
  * [Get Single user by UUID](users/get-list-of-users/get-single-user-by-uuid.md)
  * [Get Single User By ID](users/get-list-of-users/get-single-user-by-id.md)
* [Create User](users/create-user.md)
* [Update User](users/upsert-new-user.md)
* [Convert Contact/s To User/s ("Buyers")](users/convert-contact-s-to-user-s-buyers.md)

## Meta Data

* [Data Views](meta-data/data-views/README.md)
  * [Field Bank](meta-data/data-views/field-bank-1/README.md)
    * [Upsert field for specific Field Bank](meta-data/data-views/field-bank-1/field-bank.md)
    * [Get Field from Field Bank](meta-data/data-views/field-bank-1/get-field-bank-by-api-name-uuid.md)
    * [Get Field Bank By UUID](meta-data/data-views/field-bank-1/get-field-bank-by-uuid.md)
    * [Delete Field from specific Field Bank](meta-data/data-views/field-bank-1/delete-field-from-specific-field-bank.md)
  * [Get list of Data Views](meta-data/data-views/get-list-of-data-views/README.md)
    * [Configuration](meta-data/data-views/get-list-of-data-views/configuration.md)
    * [Menu](meta-data/data-views/get-list-of-data-views/menu.md)
    * [Form/Large/Line/Card etc.](meta-data/data-views/get-list-of-data-views/form-large-line-card-etc..md)
    * [Grid Data View](meta-data/data-views/get-list-of-data-views/grid-data-view.md)
  * [Upsert a Single Data View (Update/Create)](meta-data/data-views/upsert-a-single-data-view-update-create.md)
  * [Batch upsert](meta-data/data-views/batch-upsert.md)
* [Types](meta-data/types/README.md)
  * [Get List Of Object Types](meta-data/types/meta-data-get-list-of-object-types/README.md)
    * [Get Single Object Type](meta-data/types/meta-data-get-list-of-object-types/meta-data-get-single-object-type/README.md)
      * [Get Addons of object type](meta-data/types/meta-data-get-list-of-object-types/meta-data-get-single-object-type/get-addons-of-object-type.md)
  * [Post Object Type](meta-data/types/post-object-type.md)
* [Transactions Settings](meta-data/transactions-settings/README.md)
  * [Get Settings Of Object Type](meta-data/transactions-settings/get-settings-of-object-type.md)
  * [Post Settings Of Object Type](meta-data/transactions-settings/post-settings-of-object-type.md)
* [Fields](meta-data/fields/README.md)
  * [Get list of object fields](meta-data/fields/get-list-of-object-fields.md)
  * [Get list of typed object fields](meta-data/fields/get-list-of-typed-object-fields/README.md)
    * [Get Single Field By Type and Field ID](meta-data/fields/get-list-of-typed-object-fields/get-single-field-by-type-and-field-id.md)
  * [Post Standard Resource Single User Defined Field](meta-data/fields/meta-data-post-single-user-defined-field/README.md)
    * [Post Typed Resource Single User Defined Field](meta-data/fields/meta-data-post-single-user-defined-field/post-typed-resource-single-user-defined-field.md)
    * [Batch upsert Standard Resource Single User Defined Field](meta-data/fields/meta-data-post-single-user-defined-field/post-in-bulk-standard-resource-single-user-defined-field.md)
  * [Rename Typed Resource User Defined Field ID](meta-data/fields/rename-user-defined-field/README.md)
    * [Rename Standard User Defined Field](meta-data/fields/rename-user-defined-field/rename-standard-user-defined-field.md)
  * [Delete Typed Resource User Defined Field](meta-data/fields/delete-user-defined-field/README.md)
    * [Delete Standard Resource User Defined Field](meta-data/fields/delete-user-defined-field/delete-standard-resource-user-defined-field.md)
* [User Defined Tables](meta-data/user-defined-tables/README.md)
  * [Get list of User Defined Tables](meta-data/user-defined-tables/get-list-of-user-defined-tables/README.md)
    * [Get Addons for User defined tables](meta-data/user-defined-tables/get-list-of-user-defined-tables/get-addons-for-user-defined-tables.md)
    * [Get single User Defined Table](meta-data/user-defined-tables/get-list-of-user-defined-tables/get-single-user-defined-table.md)
  * [POST single User Defined Table](meta-data/user-defined-tables/post-single-user-defined-table.md)
  * [Delete User Defined Table](meta-data/user-defined-tables/delete-user-defined-table.md)
* [Generic Lists](meta-data/generic-lists/README.md)
  * [Get List Of Generic Lists](meta-data/generic-lists/get-list-of-generic-lists.md)
* [Import Export Activity Type Definition](meta-data/import-export-activity-type-definition/README.md)
  * [Export Type Definition](meta-data/import-export-activity-type-definition/export-type-definition.md)
  * [Import Type Definition](meta-data/import-export-activity-type-definition/import-type-definition.md)

## Add-ons

* [Addon support notes](add-ons/addon-support-notes.md)
* [The addon.config.json file](add-ons/the-addon.config.json-file.md)
* [Get list of Add-ons](add-ons/get-list-of-add-ons/README.md)
  * [Get single add-on by id](add-ons/get-list-of-add-ons/get-single-add-on-by-id.md)
* [Get List of Addons Versions](add-ons/get-list-of-addons-versions.md)
* [Search Addon Version](add-ons/search-addon-version.md)
* [Upsert single add-on version](add-ons/upsert-single-add-on-version.md)
* [Get list of installed add-ons](add-ons/get-list-of-installed-add-ons/README.md)
  * [Get a single installed add-on](add-ons/get-list-of-installed-add-ons/get-a-single-installed-add-on.md)
* [Get installed add-on current version](add-ons/get-installed-add-on-current-version.md)
* [Upsert installed add-on](add-ons/upsert-installed-add-on.md)
* [Addons Installation](add-ons/addons-installation/README.md)
  * [Install add-on to distributor](add-ons/addons-installation/install-add-on-to-distributor.md)
  * [Upgrade installed add-on](add-ons/addons-installation/upgrade-installed-add-on.md)
  * [Downgrade installed add-on](add-ons/addons-installation/downgrade-installed-add-on.md)
  * [Uninstall add-on from distributor](add-ons/addons-installation/uninstall-addon-from-distributor.md)
  * [Delete single installed](add-ons/addons-installation/delete-single-installed-add-on-version.md)
* [POST add-on function - await](add-ons/post-add-on-function-await.md)
* [GET add-on function - await](add-ons/get-add-on-function-await.md)
* [Installation.JS](add-ons/installation.js.md)
* [Execute addon code - Node.js documentation](add-ons/executedcode-node.js-documentation.md)
* [Get Company's Month-To-Date Code Jobs Execution Budget](add-ons/get-companys-month-to-date-jobs-execution-budget.md)
* [Obsolete - Get addon single version](add-ons/get-single-addon-version.md)

## Addon Relations

* [Addon Relations](addon-relations/addons-link-table/README.md)
  * [Relation Types](add-ons/addons-link-table/addon-ui-within-another-addon/README.md)
    * [AddonAPI](addon-relations/addons-link-table/addon-ui-within-another-addon/addon-api.md)
    * [Navigate](addon-relations/addons-link-table/addon-ui-within-another-addon/navigate.md)
    * [NgComponent](addon-relations/addons-link-table/addon-ui-within-another-addon/component.md)
    * [CPIAddonAPI](addon-relations/addons-link-table/addon-ui-within-another-addon/cpiaddonapi.md)
  * [Relation Names](addon-relations/addons-link-table/relation-names/README.md)
    * [BeforeSync](addon-relations/addons-link-table/relation-names/beforesync.md)
    * [AfterSyncProcessData](addon-relations/addons-link-table/relation-names/beforesync-1.md)
    * [AfterSync](addon-relations/addons-link-table/relation-names/beforesync-2.md)
    * [JourneyEvent](addon-relations/addons-link-table/relation-names/journeyevent.md)
    * [List Grid View Block](addon-relations/addons-link-table/relation-names/list-grid-view-block.md)
    * [List Menu Block](addon-relations/addons-link-table/relation-names/list-menu-block/README.md)
      * [Resource List Menu Block](addon-relations/addons-link-table/relation-names/list-menu-block/resource-list-menu-block.md)
    * [Form View Block](addon-relations/addons-link-table/relation-names/form-view-block.md)
    * [ATD Export](add-ons/addons-link-table/relation-names/atd-export-callback.md)
    * [Var Settings](add-ons/addons-link-table/relation-names/var-settings.md)
    * [ATD Import](addon-relations/addons-link-table/relation-names/atd-import-callback.md)
    * [🤓 Import Resource](addon-relations/addons-link-table/relation-names/data-import/README.md)
      * [AddonRelativeURL](addon-relations/addons-link-table/relation-names/data-import/addonrelativeurl.md)
      * [MappingRelativeURL](addon-relations/addons-link-table/relation-names/data-import/mappingrelativeurl.md)
      * [FixRelativeURL](addon-relations/addons-link-table/relation-names/data-import/fixrelativeurl.md)
      * [InitRelationDataRelativeURL](addon-relations/addons-link-table/relation-names/data-import/fixrelativeurl-1.md)
    * [Export Resource](addon-relations/addons-link-table/relation-names/data-export.md)
    * [Import Data Source](addon-relations/addons-link-table/relation-names/import-data-source.md)
    * [Export Data Source](addon-relations/addons-link-table/relation-names/export-data-source.md)
    * [Data Queries](addon-relations/addons-link-table/relation-names/data-queries.md)
    * [UI Bank of Fields](add-ons/addons-link-table/relation-names/ui-bank-of-fields.md)
    * [Usage Monitor](add-ons/addons-link-table/relation-names/usage-monitor.md)
    * [Type List](add-ons/addons-link-table/relation-names/list-menu-entries/README.md)
      * [Specific Lists](add-ons/addons-link-table/relation-names/list-menu-entries/specific-lists.md)
    * [Page Block](addon-relations/addons-link-table/relation-names/page-block.md)
    * [Theme Tabs](addon-relations/addons-link-table/relation-names/page-block-1.md)
    * [Logic Block](addon-relations/addons-link-table/relation-names/logic-block.md)
    * [🧑‍⚕️ 🧑⚕ 🧑⚕ Health Monitor](addon-relations/addons-link-table/relation-names/health-monitor.md)
    * [User Events](addon-relations/addons-link-table/relation-names/user-events.md)

## ABI - Addon Block Interface

* [Addon Block API](abi-addon-block-interface/addon-block-api/README.md)
  * [Configurations](abi-addon-block-interface/addon-block-api/configurations.md)
  * [Pages](abi-addon-block-interface/addon-block-api/pages.md)
  * [Assets Manager Picker](abi-addon-block-interface/addon-block-api/assets-manager-picker.md)
  * [DIMX](abi-addon-block-interface/addon-block-api/dimx.md)
  * [Script Picker](add-ons/addon-block-api/script-picker.md)
  * [Audit Data Log](add-ons/addon-block-api/audit-data-log.md)
  * [Audit Data Field Log](abi-addon-block-interface/addon-block-api/audit-data-field-log.md)
  * [Resource Picker](abi-addon-block-interface/addon-block-api/resource-picker.md)
  * [Events](abi-addon-block-interface/addon-block-api/events.md)
  * [FlowPicker](abi-addon-block-interface/addon-block-api/flowpicker.md)
  * [Lists configuration editor](abi-addon-block-interface/addon-block-api/lists-configuration-editor.md)
  * [Lists](abi-addon-block-interface/addon-block-api/lists.md)
  * [Selection List](abi-addon-block-interface/addon-block-api/selection-list.md)
  * [Forms Configuration Editor](abi-addon-block-interface/addon-block-api/forms-configuration-editor.md)
  * [Forms](abi-addon-block-interface/addon-block-api/forms.md)
  * [Async Jobs](abi-addon-block-interface/addon-block-api/async-jobs.md)

## Configurations

* [Intro](configurations/intro.md)
* [Configurations Schemes](configurations/configurations-schemes.md)
* [Drafts](configurations/drafts.md)
* [Configuration Objects](configurations/configuration-objects.md)
* [Versions](configurations/versions.md)
* [Configuration Models](configurations/configuration-models/README.md)
  * [Lists](configurations/configuration-models/lists.md)
  * [Forms](configurations/configuration-models/forms.md)
  * [ATD Configuration Object](configurations/configuration-models/atd-configuration-object.md)

## Headless - On Client

* [Headless Application](internal-events/headless-application.md)
* [Example Operation](headless-on-client/example-operation.md)
* [Survey events](headless-on-client/survey-events/README.md)
  * [Survey Field Change](headless-on-client/survey-events/survey-field-change.md)
  * [Survey Load](headless-on-client/survey-events/survey-load.md)
  * [Survey Question Change](headless-on-client/survey-events/survey-question-change.md)
  * [Survey Question Click](headless-on-client/survey-events/survey-question-click.md)
* [Pepperi pack events](headless-on-client/pepperi-pack-events/README.md)
  * [After Addon Files Unzipped](headless-on-client/pepperi-pack-events/survey-field-change.md)
* [Themes events](headless-on-client/themes-events.md)
* [Visit Flow events](headless-on-client/visit-flow-events.md)
* [Slideshow Events](internal-events/slideshow-events.md)
* [Gallery Events](internal-events/gallery-events.md)
* [Buttons bar events](headless-on-client/buttons-bar-events.md)
* [Banner bar events](headless-on-client/banner-bar-events.md)
* [Rich Text events](internal-events/rich-text-events.md)
* [Pages events](headless-on-client/pages-events/README.md)
  * [Page Load](headless-on-client/pages-events/page-load.md)
  * [Page State Change](internal-events/pages-events/page-state-change.md)
  * [Page Button Click](internal-events/pages-events/page-button-click.md)
* [Application Header View Events](internal-events/application-header-view-events.md)
* [Transaction events](headless-on-client/transaction-events.md)
* [Lists Client Events](headless-on-client/resource-view-event/README.md)
  * [List Actions](resource-views/list-actions.md)
* [Form events](headless-on-client/form-events/README.md)
  * [Form Load](headless-on-client/form-events/form-load.md)
  * [Field Change](headless-on-client/form-events/field-change.md)
  * [Button Click](headless-on-client/form-events/button-click.md)
  * [Form View Block Components](headless-on-client/form-events/form-view-block-components.md)

## code jobs

* [Upsert Addon Code Job](code-jobs/upsert-code-job.md)
* [Get List Of Addons Code Jobs](code-jobs/get-list-of-addons-code-jobs/README.md)
  * [Get Single Addon Code Job](code-jobs/get-list-of-addons-code-jobs/get-single-addon-code-job.md)
* [Delete Addon Code Job](code-jobs/delete-addon-code-job.md)

## Async Task Execution

* [Job](async-task-execution/job.md)
* [POST add-on function - async](async-task-execution/execute-add-on-function-async.md)
* [POST add-on function - async queue](async-task-execution/execute-add-on-function-async-1.md)
* [GET add-on function - async](async-task-execution/get-add-on-function-async.md)
* [Restart Job](async-task-execution/restart-job.md)
* [Stop Job](async-task-execution/stop-job.md)
* [POST progress - async](async-task-execution/post-progress-async.md)

## Scheduled Addons

* [Retry](scheduled-addons/retry.md)
* [Internal: Create callback function for add-on async api](scheduled-addons/create-callback-function-for-add-on-async-api.md)
* [Internal: System retry](scheduled-addons/system-retry.md)
* [Execute now codejob](scheduled-addons/execute-now-codejob.md)

## Company

* [Get company's configuration](company/get-companys-configuration.md)
* [Get company's specific single configuration](company/get-companys-specific-single-configuration.md)

## Bulk Upload

* [Get List of Job Info objects](bulk-upload/get-list-of-job-info-objects.md)

## PEPPERI NOTIFICATION SERVICE

* [Subscribe](pepperi-notification-service/subscribe.md)
* [Publish message](pepperi-notification-service/publish-message.md)

## ADAL - Schemes <a href="#adal" id="adal"></a>

* [Create Schema](adal/create-schema.md)
* [Get Schema](adal/get-schema.md)
* [Get Schemes](adal/get-schemes.md)
* [Truncate](adal/truncate.md)
* [Purge - Drop Table](adal/droptable.md)

## ADAL - DOC DB

* [ADAL DocDB](adal-doc-db/adal-docdb.md)
* [Upsert Document](adal-doc-db/savedataindynamo.md)
* [Insert Document](adal-doc-db/insertdataindynamo.md)
* [Get Documents](adal-doc-db/getdatafromdynamo.md)
* [Get Document by key](adal-doc-db/getdatafromdynamo-by-key.md)
* [Search](adal-doc-db/search.md)
* [❄️ Distinct Values](adal-doc-db/distinct-values.md)
* [Hard Delete](adal/hard-delete.md)
* [Batch Upsert](adal/batch-upsert.md)
* [🤹 Get By Keys From Multiple Schemes](adal-doc-db/get-by-keys-from-multiple-schemes.md)
* [Check Document Existence by Key](adal-doc-db/check-document-existence-by-key.md)

## ADAL files

* [ADAL Files](adal-files/get-files.md)

## PFS - Pepperi File Service

* [File](pfs-pepperi-file-service/file.md)
* [Get Files](pfs-pepperi-file-service/get-files.md)
* [Search](pfs-pepperi-file-service/search.md)
* [Invalidate File](pfs-pepperi-file-service/invalidate-file.md)
* [Temporary File](pfs-pepperi-file-service/temporary-file.md)

## Data Import Export

* [DIMXObject™](data-import-export/imported-object.md)
* [Data Import](data-import-export/data-import.md)
* [File Import](data-import-export/file-import.md)
* [File Export](data-import-export/file-export.md)
* [Create Recursive Mapping](data-import-export/create-recursive-mapping.md)
* [Recursive File Import](data-import-export/recursive-file-import.md)
* [Recursive File Export](data-import-export/recursive-file-export.md)
* [🧩 Multipart Import](data-import-export/multipart-import/README.md)
  * [Multipart Initialization](data-import-export/multipart-import/multipart-initialization.md)
  * [Multipart Finalization](data-import-export/multipart-import/multipart-finalization.md)

## ✨ Nebula Graph Database

* [🧹 Clear Graph](nebula-graph-database/clear-graph.md)
* [🧱 Rebuild](nebula-graph-database/rebuild.md)
* [🔁 Find Schemes Requiring Sync](nebula-graph-database/find-resources-requiring-sync.md)
* [🔂 Find Records Requiring Sync](nebula-graph-database/find-records-requiring-sync.md)
* [🔃 Find Schemes & Records Requiring Sync](nebula-graph-database/find-schemes-and-records-requiring-sync.md)
* [🔍 Search](nebula-graph-database/search.md)

***

* [🦎 Crawler](crawler/README.md)
  * [🐍 Crawl](crawler/crawl.md)
  * [🎯 Source & Target API](crawler/source-and-target-api.md)
  * [🔂 Pager](crawler/pager.md)
  * [🤹 Multi-Crawler](crawler/multi-crawler.md)

## 🗑️ Febula

* [🔗 Filter](febula/filter/README.md)
  * [Upsert Filter](febula/filter/upsert-filter.md)
* [🗺️ Profile-Filter](febula/profile-filter/README.md)
  * [Upsert Profile-Filter](febula/profile-filter/upsert-profile-filter.md)

***

* [🌟 Nebulus](nebulus/README.md)
  * [🏗️ Rebuild](nebulus/rebuild.md)

## Data Index (Elastic)

* [Index](data-index-elastic/index.md)
* [Update Data by Query](data-index-elastic/update-data-by-query.md)
* [Search Data by Query](data-index-elastic/search-data-by-query.md)
* [Delete Data by Query](data-index-elastic/delete-data-by-query.md)

## Maintenance>>Archive <a href="#archive" id="archive"></a>

* [Bulk Asyc Archive Of Data Resources](archive/bulk-asyc-archive-of-data-resources.md)
* [Bulk Async Unarchive Of Data Resources (not implemented)](archive/bulk-async-unarchive-of-data-resources.md)
* [Get List Of Archived Objects By Resource (not implemented)](archive/get-list-of-archived-objects-by-resource.md)

## Application

* [Start Sync Application's Data Job (Async)](application/post-sync-applications-data.md)
* [Get Sync Job Info](application/get-sync-job-info.md)
* [Get Single Sync Data](application/sync-data.md)
* [Update Single Sync Data](application/update-single-sync-data.md)
* [Connect Account](application/connect-account.md)

## Audit Log

* [Get List Of Audit Log Entries](audit-log/get-list-of-audit-log-records/README.md)
  * [Get a Single Audit Log Entry](audit-log/get-list-of-audit-log-records/get-a-single-audit-log-entry.md)
* [Create and Update an Audit Log Entry](audit-log/create-update-an-audit-log-entry.md)
* [Get List of Audit Log Entry Line Details](audit-log/get-audit-log-entry-details.md)
* [Create List of Log Entry Line Details](audit-log/create-list-of-log-entry-line-details.md)
* [Batch Upsert Audit Data Logs](audit-log/batch-upsert-audit-data-logs.md)

## Actions Queue

* [Get List of Actions Queue](get-all-actions-queue/README.md)
  * [Get a Single Action from Queue](get-all-actions-queue/get-a-single-action-from-queue.md)
* [Post - Execute Retry On Queued Action](post-execute-retry-on-queued-action.md)

## File Storage

* [Get List Of Storage Files](file-storage/get-list-of-storage-files.md)
* [Get Configuration File By InternalID or Name](file-storage/get-configuration-file-by-uuid-or-externalid.md)
* [Create And Update File Storage](file-storage/upsert-file-storage.md)
* [Create Temporary Upload URL](file-storage/get-temporary-upload-url.md)

## CPI Node

* [Addons](cpi-node/addons/README.md)
  * [Example](cpi-node/addons/example.md)

## OPEN CATALOG - ElasticSearch <a href="#open-catalog" id="open-catalog"></a>

* [Open Catalog Entry](open-catalog/open-catalog-entry.md)
* [Get Single Item](open-catalog/get-single-item.md)
* [Get Items](open-catalog/get-items.md)
* [Get Filters](open-catalog/get-filters.md)
* [Get Configurations](open-catalog/get-settings.md)

## Open Catalog - Dynamo

* [Get Single Category](open-catalog-dynamo/get-single-category.md)
* [Get Categories](open-catalog-dynamo/get-categories.md)
* [Post Category](open-catalog-dynamo/post-category.md)

## Var API

* [Get list of add-ons](var-api/get-list-of-add-ons/README.md)
  * [Get single add-on by id](var-api/get-list-of-add-ons/get-single-add-on-by-id.md)
* [Get Addon secret key](var-api/get-addon-secret-key.md)
* [Upsert single add-on](var-api/post-single-add-on.md)
* [Delete add-on](var-api/delete-add-on.md)
* [Get list of all addons versions](var-api/get-all-addons-versions/README.md)
  * [Get single addon version](var-api/get-all-addons-versions/get-single-addon-version.md)
* [Upsert addon single version](var-api/upsert-addon-single-version.md)
* [Bulk upsert addons versions](var-api/bulk-upsert-addons-versions.md)
* [Upsert add-on single version using secret key](var-api/upsert-add-on-version-using-secret-key.md)
* [Validate Secret Key](var-api/validate-secret-key.md)
* [Delete addon version](var-api/delete-addon-version.md)
* [Query installed addons](var-api/monitor-addons-upgrades-between-dates.md)
* [Get audit log no tenant filter](var-api/get-audit-log-no-tenant-filter.md)

## DISTRIBUTOR

* [Distributor](distributor/distributor.md)
* [Upgrade all installed addons](distributor/upgrade-all-installed-addons.md)
* [Internal: Create Distributor](distributor/internal-create-distributor.md)

## Pepperi ElasticSearch

* [Pepperi ElasticSearch Entry](pepperi-elasticsearch/pepperi-elasticsearch-entry.md)
* [Internal: Post Bulk Data](pepperi-elasticsearch/post-bulk-data.md)
* [Internal: Post Search Data](pepperi-elasticsearch/post-search-data.md)
* [Internal: Post Delete Data](pepperi-elasticsearch/internal-delete-data.md)
* [Internal: Post Update Data](pepperi-elasticsearch/internal-post-update-data.md)
* [Internal: Post Mapping](pepperi-elasticsearch/internal-post-mapping.md)
* [Internal: Create Index](pepperi-elasticsearch/internal-create-index.md)
* [Internal: Clear Index](pepperi-elasticsearch/internal-clear-index.md)
* [Get data by where clause](pepperi-elasticsearch/get-data-by-where-clause.md)
* [Get totals](pepperi-elasticsearch/get-totals.md)

## System Health Alerts

* [Alerts](system-health-alerts/alerts/README.md)
  * [ADAL Index](system-health-alerts/alerts/adal-alerts.md)
  * [ADAL Index - Clean Rebuild](system-health-alerts/alerts/adal-alerts-1.md)
  * [Queue Stuck](system-health-alerts/alerts/adal-alerts-2.md)
  * [Orphaned Job](system-health-alerts/alerts/adal-alerts-3.md)
  * [Stuck Job](system-health-alerts/alerts/adal-alerts-4.md)
  * [Max Retries Exceeded](system-health-alerts/alerts/adal-alerts-5.md)

## INTERNAL

* [Get list of Security Groups](internal/get-list-of-security-groups.md)
* [Bulk search](internal/bulk-search.md)
* [BatchPut](internal/batch-put.md)
* [😥 BulkGet (Archived)](internal/bulk-get.md)
* [Scripts](internal/scripts.md)

## Pages

* [Pages](internal/pages.md)
* [Import](pages/import.md)
* [Export](pages/export.md)

## User Defined Parameters

* [User Defined Parameters](user-defined-parameters/global_parameters.md)

## Pepperi Pack

* [Blocks support](pepperi-pack/blocks-support.md)
* [Client Packages](pepperi-pack/client-packages.md)
* [Sync Terminated](pepperi-pack/sync-terminated.md)

## Charts

* [Charts](charts/upsert-chart.md)
* [Charts interface](charts/charts-interface.md)

## Data Queries

* [DataQueries](data-queries/dataqueries.md)
* [Search data index by query](data-queries/search-data-index-by-query/README.md)
  * [Search data index by query - Debug](data-queries/search-data-index-by-query/search-data-index-by-query-debug.md)
  * [Search data index by query - parallel](data-queries/search-data-index-by-query/search-data-index-by-query-parallel.md)

## PAPI Index

* [Papi Functions (internal use only)](papi-index/papi-functions/README.md)
  * [Rebuild Data Index (internal)](papi-index/papi-functions/rebuild-data-index.md)
  * [Rebuild Polling (internal)](papi-index/papi-functions/rebuild-polling.md)
  * [Rebuild retry (internal)](papi-index/papi-functions/rebuild-retry.md)

## TODO training

* [Get todo](todo-training/get-todo.md)
* [Upsert todo](todo-training/upsert-todo.md)

***

* [Slugs](slugs/README.md)
  * [Get Slugs](slugs/get-todo.md)
  * [Upsert Slug](slugs/upsert-asset.md)

## Assets Manager

* [Upsert Asset](assets-manager/upsert-asset.md)
* [Get Assets](assets-manager/get-assets.md)

## USER DEFINED COLLECTIONS

* [Get Collections](user-defined-collections/get-collections.md)
* [Drop Collection](user-defined-collections/drop-collection.md)
* [Get Documents](user-defined-collections/get-documents.md)

## Logs

* [🕵️ Get Logs](logs/get-logs.md)

***

* [User Device](user-device/README.md)
  * [Statistics from logs](logs/statistics-from-logs.md)

## KMS

* [Get By Key](kms/get-by-key.md)
* [Addons Key Store](kms/addons-key-store.md)

## Indexed ADAL

* [Index -ADAL](indexed-adal/index-adal/README.md)
  * [Clean Rebuild](indexed-adal/index-adal/clean-rebuild.md)
  * [🧱 Rebuild Index for a Table](indexed-adal/index-adal/rebuild-index-for-a-table.md)
  * [🧱 Rebuild Indexes](indexed-adal/index-adal/rebuild-indexes.md)
  * [🧱 Cleanse Index](indexed-adal/index-adal/cleanse-index.md)

## HEALTH MONITOR

* [👩‍⚕️ 👩⚕ 👩⚕ Health Monitor](health-monitor/health-monitor.md)
* [VAR Notifications (internal)](health-monitor/var-notifications-internal.md)
* [VAR Addons Webhooks (internal)](health-monitor/var-addons-webhooks-internal.md)

## Theme

* [Upsert Theme](theme/upsert-theme.md)

## 🚓 Permissions

* [🗃️ Upsert Policy](permissions/upsert-policy.md)
* [🎟️ Upsert Profile](permissions/upsert-profile.md)

***

* [Base Activities](base-activities/README.md)
  * [Base Surveys](base-activities/base-surveys.md)
* [Survey](survey.md)
* [Internal events](internal-events/README.md)
  * [TransactionEvents](internal-events/transactionevents.md)
* [User events](user-events/README.md)
  * [Survey events](user-events/survey-events.md)
  * [Visit Flow events](user-events/visit-flow-events.md)
  * [Order Center](user-events/order-center/README.md)
    * [Smart Search events](user-events/order-center/smart-search-events.md)

## Notifications

* [Notifications](notifications/notifications.md)
* [Internal: Notifications - Branded App](notifications/notifications-branded-app.md)

## Deep Links

* [Deep Links](deep-links/deep-links.md)

## Users, Employees and Buyers

* [Users, Employees, Buyers](users-employees-and-buyers/users-employees-buyers.md)
* [Users](users-employees-and-buyers/users.md)
* [Account Users](users-employees-and-buyers/account-users.md)
* [Buyers](users-employees-and-buyers/buyers/README.md)
  * [Activate buyer](users-employees-and-buyers/buyers/activate-buyer.md)
  * [Deactivate buyer](users-employees-and-buyers/buyers/deactivate-buyer.md)
  * [Account buyers](users-employees-and-buyers/buyers/account-buyers.md)

## Chains

* [Chains](chains/chains.md)
* [Accounts](chains/accounts/README.md)
  * [Assign account(s) to chain](chains/accounts/assign-account-s-to-chain.md)
  * [Unassign account(s) from chain](chains/accounts/unassign-account-s-from-chain.md)

## AI BOT

* [Rebuild](ai-bot/rebuild.md)
* [Query](ai-bot/query.md)

## Journey + KPI

* [KPI](kpi/README.md)
  * [KPI Object](kpi/kpi-object.md)
  * [KPIs](journey-+-kpi/kpi/kpis.md)
  * [Log KPI Object](journey-+-kpi/kpi/log-kpi-object.md)
* [Journey Tracker Files](journey-tracker/journey-tracker-files.md)

## CPI Node SDK

* [Functions](cpi-node-sdk/functions/README.md)
  * [Translation](cpi-node-sdk/cpinode-sdk/translation.md)

***

* [Internal - Create Private Account](internal-create-private-account.md)
* [Internal - Set Security Group for Users](internal-set-security-group-for-users.md)

## SUPPORT TOOLS

* [Support Tools Endpoints](support-tools/support-tools-endpoints.md)

## Nuc RestAPI

* [General](nuc-restapi/general/README.md)
  * [generic upsert](nuc-restapi/general/generic-upsert.md)
  * [Test Sync](nuc-restapi/general/test-sync.md)
  * [Legacy Sync](nuc-restapi/general/legacy-sync.md)
  * [Get Light Data Table](nuc-restapi/general/get-light-data-table.md)

## Distributor Maintenance Job

* [Run Maintenance](distributor-maintenance-job/run-maintenance.md)

## Not In Use

* [WebAPI](not-in-use/webapi/README.md)
  * [Get Region WebAPI BaseURL](not-in-use/webapi/get-region-webapi-baseurl.md)
* [Post Filter](not-in-use/post-filter.md)
* [Get Filters](not-in-use/get-filters/README.md)
  * [Get Single Filter](not-in-use/get-filters/get-single-filter.md)
* [Get Code Job Executions](not-in-use/get-code-jobs-executions/README.md)
  * [Get All Code Jobs Executions List](not-in-use/get-code-jobs-executions/get-all-code-jobs-executions-list.md)
  * [Get Single Code Job Execution](not-in-use/get-code-jobs-executions/get-single-code-job-execution.md)
* [Get List of Login Audit Log Entries](not-in-use/login.md)
* [Get List Of Branded App Audit Log Entries](not-in-use/get-list-of-custom-domain-audit-log-records.md)
* [Get List Of Code Job Audit Log Entries](not-in-use/get-code-jobs-audit-logs/README.md)
  * [Get installed add-on editor public path](not-in-use/get-code-jobs-audit-logs/get-installed-add-on-editor-public-path.md)
* [Clone Object type](not-in-use/clone-object.md)
* [Get system field usage](not-in-use/get-system-field-usage.md)
* [Get Data Views](not-in-use/meta-data-get-data-views.md)
* [Get single Data View](not-in-use/get-single-data-view.md)
* [Untitled](not-in-use/untitled.md)
* [Obsolete: Get machine](not-in-use/get-machine.md)
* [Get References Mapping](not-in-use/get-references-mapping.md)

## Items Images

* [Delete Images](items-images/delete-images.md)
