# Batch upsert

{% swagger baseUrl="https://api.pepperi.com" path="/meta_data/data_views_batch" method="post" summary="Get Cakes" %}
{% swagger-description %}
Bulk upsert data-views.
{% endswagger-description %}

{% swagger-parameter in="body" name="" type="array" %}
an array of data-views
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
```
[
    {
        "InternalID": 4936448,
        "UUID": "00000000-0000-0000-0000-000000000000",
        "ExternalID": "",
        "Status": "Update",
        "Message": "Row updated.",
        "URI": "/meta_data/data_views?where=InternalID=4936448"
    },
    {
        "InternalID": 4936449,
        "UUID": "00000000-0000-0000-0000-000000000000",
        "ExternalID": "",
        "Status": "Ignore",
        "Message": "No changes in this row. The row is being ignored.",
        "URI": "/meta_data/data_views?where=InternalID=4936449"
    },
    {
        "InternalID": 4936450,
        "UUID": "00000000-0000-0000-0000-000000000000",
        "ExternalID": "",
        "Status": "Insert",
        "Message": "Row inserted.",
        "URI": "/meta_data/data_views?where=InternalID=4936450"
    }
]
```
{% endswagger-response %}
{% endswagger %}

