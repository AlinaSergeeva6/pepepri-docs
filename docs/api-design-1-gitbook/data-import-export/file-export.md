---
description: Asynchronously export objects from a data source to a file.
---

# File Export

{% swagger baseUrl="https://api.pepperi.com" path="/v1.0/addons/data/export/file/{addon_uuid}/{resource}" method="post" summary="Export file from data source" %}
{% swagger-description %}
Export objects from an data source query to a CSV/JSON temporary file and returns the file's URL.
{% endswagger-description %}

{% swagger-parameter in="path" name="addon_uuid" required="true" %}
uuid of the addon this resource belongs to
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Format" %}
output format - either json or csv. Defaults to json.
{% endswagger-parameter %}

{% swagger-parameter in="path" name="resource" required="true" %}
the resource we wish to export from
{% endswagger-parameter %}

{% swagger-parameter in="body" name="IncludeDeleted" %}
Include deleted records. Default is false.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Where" %}
Where clause. Empty where clause will export the entire resource.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Fields" %}
The fields to be exported from the object. If omitted, exports the entire object.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Delimiter" %}
in case of CSV. the default is the distributor's default delimiter. Must not be '.' dot. Must be exactly 1 char.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="ExcludedKeys" type="Array" %}
Array of keys that should be excluded from the export. Records that match the keys will not be included in the final export file.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="AdditionalData" type="any" %}
here you can add any data you want.
{% endswagger-parameter %}

{% swagger-response status="200" description="Process finished" %}
```javascript
// after polling the async result
{"URI":"https://cdn.staging.pepperi.com/TemporaryFiles/3975e4e1-711b-4f5e-cc2b-3747a860b2f4",
"Version": "1.0.3"}
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="Error" %}
```
{"Message": ErrMsg}
```
{% endswagger-response %}
{% endswagger %}

Gets records from a data source using a where clause.



### Input:

```javascript
{
    // output format. either json or csv. defaults to json.
    "Format": "csv", 
    
    // include deleted records. Default is false. 
    "IncludeDeleted": "true", 
    
    // Where clause. Empty where clause will export the entire resource.
    "Where": 'Key LIKE "I%"',
    
    // The fields to be exported from the object. If omitted, exports the entire object.
    "Fields": "Key,ExtraField,ImportantField",
    
    // in case of CSV. the default is the distributor's default delimiter.
    // Must not be '.' dot. Must be exactly 1 char.
    "Delimiter": ";",
    
    // Array of keys that should be excluded from the export. 
    // Records that match the keys will not be included in the final export file.
    "ExcludedKeys":["Key1", "Key5"],
    "AdditionalInitData": { //the initial data that will be used in initRelationDataRelativeURL
        "Schema": "Pages",
        "AddonUUID": "f392f0ec-4282-11ee-be56-0242ac120002"
    }
}
```

Returns an object containing a URI of a file with the requested format (CSV or JSON), and the current version of the addon.

Note - This is an asynchronous call. This means that the returned object above is obtainable after polling the audit-log for the result

{% hint style="info" %}
Using this interface is only possible with tables that support Import/Export. In order to support Import/Export, please refer to the [Import](../addon-relations/addons-link-table/relation-names/data-import/) and [export](../addon-relations/addons-link-table/relation-names/data-export.md) relations.
{% endhint %}

{% hint style="info" %}
Exporting using the JSON format is limited to 65,536 items, and 500MB.&#x20;
{% endhint %}
