---
description: sync partial data based on resource
---

# Connect Account

Th

{% swagger method="post" path="/sync/resource" baseUrl="https://papi.pepperi.com/v1.0" summary="" %}
{% swagger-description %}
returns a JSON (based on legacy connect account format) that provides the data that was changes based on Modification Date and on the requested resource (and all of the derivatives required by this resource to work in offline mode)
{% endswagger-description %}

{% swagger-parameter in="body" name="Resource" %}
all_activities|accounts - default accounts
{% endswagger-parameter %}

{% swagger-parameter in="body" name="KeyList" type="string[]" %}
Key list of the resource that should be synchronized
{% endswagger-parameter %}

{% swagger-parameter in="body" name="CoreResourcesModificationDate" %}
nuc sync 1/1/1970 is the default 
{% endswagger-parameter %}

{% swagger-parameter in="body" name="ResourcesModificationDate" %}
ADAL sync 1/1/1970 is the default
{% endswagger-parameter %}

{% swagger-parameter in="body" name="{Resource}CoreResourcesModificationDate" type="[key, Date]" %}
Only accounts supported
{% endswagger-parameter %}

{% swagger-parameter in="body" name="{Resource}ResourcesModificationDate" type="[Key,Date]" %}
Only accounts supported
{% endswagger-parameter %}
{% endswagger %}

The Resource Modification Date is provided to minimize the data returned by sync, if there is no relevant time provided for a synched resource the global modification date will be used&#x20;
