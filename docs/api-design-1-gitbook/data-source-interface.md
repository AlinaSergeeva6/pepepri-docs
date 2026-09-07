---
description: >-
  Every data source in Pepperi must implement the following interface in order
  to work with ADAL
---

# Data Source Interface



{% hint style="info" %}
Every data source must make sure every datum has Pepperi-base-fields™, which are:

* Key
* CreationDateTime
* ModificationDateTime
* Hidden
{% endhint %}

{% hint style="info" %}
**Data Source Base URL**

The data source base URL is build using the following logic:

* if schema has 'DataSourceBaseURL' field, use it's value.
* Else, use the schema type value - {PapiBaseURL}/addons/{Type}.
{% endhint %}

## Schema Functions

{% swagger method="post" path="/schemes" baseUrl="{DataSourceBaseURL}" summary="Verify/Modify a new schema" %}
{% swagger-description %}
Data source will verify, change and save relevant data.\
ADAL will upsert the schema after the data source returns successfully. Parameters Body
{% endswagger-description %}

{% swagger-parameter in="body" name="Schema" required="true" type="object" %}
A new schema we want to create
{% endswagger-parameter %}

{% swagger-parameter in="body" name="ExistingSchema" type="object | undefined" required="true" %}
The current schema data (before the upsert)
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="Valid schema" %}
```javascript
{
    Schema: {
    // The schema after modifications (if needed)
    }
}
```
{% endswagger-response %}
{% endswagger %}

{% swagger method="post" path="/purge" baseUrl="{DataSourceBaseURL}" summary="Drop all items of resource and any related data" %}
{% swagger-description %}
Async function, schema will only be deleted once all data was purged. Parameters Body
{% endswagger-description %}

{% swagger-parameter in="body" name="Schema" type="object" required="true" %}
The schema to purge.
{% endswagger-parameter %}
{% endswagger %}
