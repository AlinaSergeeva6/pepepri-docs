---
description: Stop a running job which is running (finished or failure status)
---

# Stop Job



{% swagger method="post" path="/addons/jobs/stop" baseUrl="https://api.pepperi.com/v1.0" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="KeyList" type="String[]" required="true" %}
list of job UUIDs
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="list status" %}
array for each key

ignore for job which is still running

```json
[
    {
        "Key": "57638138-76ca-473b-bdee-4f18b8a59888",
        "Status": "Update"
    },
    {
        "Key": "39f5b5c8-6c5e-489e-94e1-5731f7d2c851",
        "Status": "Ignore"
    },
    {
        "Key": "889e22c7-b6df-49cf-9934-4fc247f19e79",
        "Status": "Ignore"
    },
    {
        "Key": "07353574-f6c8-4e6b-9101-ccc3595cbe70",
        "Status": "Ignore"
    }
]
```
{% endswagger-response %}
{% endswagger %}
