---
description: Describes the state of an object in the DIMX import/export process.
---

# DIMXObject™



* **Key:** The unique key this object is identified by in the database
* **Status:** The current state of the object. Can be one of the following:
  * **InProgress -** Not yet in a stable state (object is still being processed)
  * **Update -** Object has been updated successfully in the database
  * **Insert -** Object has been inserted successfully to the database
  * **Ignore -** Object has been ignored because it already exists in the database
  * **Error -** Object was not uploaded/exported due to an error. Read 'Details' for more information.
  * **Merge -** Object was not uploaded since an object with the same key was found in the input array, and they were both merged to a single request. Read 'Details' for the merged index.
* **Object:** The object intended for upload/export
* **Details:** More details about the result, in case of ERROR or MERGE.
* **CRUDOperation**: Identifies whether this object is to be updated or inserted to the database.
  * **Update** - Object exists in the database and will be updated
  * **Insert** - Object does not exist in the database and will be inserted

Error messages:

Since a relation can alter the DIMXObject™ and perform validations of its own, not all possible error messages are known in advance.&#x20;

Possible error messages include but are not limited to:

| Error Message                                                               | Description                                                                                                                                                                                                                               |
| --------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| "BatchPut: Upload failed"                                                   | BatchPut failed to upload the object after several retries.                                                                                                                                                                               |
| "Relation: Permission denied"                                               | Table does not support import/export. Refer to the appropriate relations for [import](../addon-relations/addons-link-table/relation-names/data-import/) and [export](../addon-relations/addons-link-table/relation-names/data-export.md). |
| "OwnerUUID is invalid"                                                      | The OwnerUUID entered does not match the OwnerUUID of this record                                                                                                                                                                         |
| "X-Pepperi-OwnerID is a mandatory header for a resource of type meta-data." | OwnerID is mandatory for the upsert of records in a meta-data resource.                                                                                                                                                                   |
| "Key is missing"                                                            | Key was not found in DIMXObject.Object                                                                                                                                                                                                    |

&#x20;

{% hint style="info" %}
The "Object" attribute will contain an object IF AND ONLY IF the "Status" attribute is equal to InProgress. If "Status" is anything other than InProgress and the "Object" attribute is not empty, the value will either be ignored, or deleted.
{% endhint %}
