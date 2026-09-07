---
description: Create a mapping object to use in Recursive File Import
---

# Create Recursive Mapping

{% swagger method="post" path="/v1.0/addons/data/mapping/{addon_uuid}/{resource}" baseUrl="https://api.pepperi.com" summary="Create mapping for records due to be imported." %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="addon_uuid" required="true" %}
UUID of the addon this resource belongs to
{% endswagger-parameter %}

{% swagger-parameter in="path" name="resource" required="true" %}
the resource these records were exported from
{% endswagger-parameter %}

{% swagger-parameter in="body" name="URI" required="true" %}
URL of the main JSON data to be mapped
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Resources" %}
Array of referenced resources to be mapped alongside the original request
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="Process finished" %}
```javascript
{
    "Mapping":{
        "addonUUID1_resource1": {
            "originalKey1": {
                "Action":"Replace",
                "NewKey":"newKey1"
            },
            "originalKey2": {
                "Action":"Ask",
                "NewKey":"newKey2"
            },
        },
        {
        "addonUUID2_resource2": {
            "originalKey1": {
                "Action":"Ask",
                "NewKey":"newKey1"
            },
            "originalKey2": {
                "Action":"Replace",
                "NewKey":"newKey2"
            },
        }
    }
}
```
{% endswagger-response %}
{% endswagger %}

Objects requested to be imported via [Recursive File Import](recursive-file-import.md#reference-fixing) might need to have their keys fixed when imported to a different system. For example, an item could have the ID 10 in one system, and the ID 83 in another system. When importing a record to another system, we need to create a map from the old system keys to the new system keys. This endpoint receives objects and returns a mapping of the keys.

### Input:

```javascript
{
    "URI": "https://pfs.staging.pepperi.com/0a3af4e7-32de-4118-8ccf-5d9dbd79c041/44c97115-6d14-4626-91dc-83f176e9a0fc/DIMX_import/8d6baa51-bcc0-421d-bb9c-d4ba505b62dd.json",
    "Version":"1.0.3"
    "Resources": [
        {
            "URI": "https://pfs.staging.pepperi.com/0a3af4e7-32de-4118-8ccf-5d9dbd79c041/44c97115-6d14-4626-91dc-83f176e9a0fc/DIMX_import/01e1d25d-62eb-4e8e-9619-ba3ad5734b63.json",
            "AddonUUID": "b78f61f0-e9f0-4650-9ab1-d8b0906505ec",
            "Resource": "recursive3",
            "Version": "1.0.12"
        }
    ]
}
```
