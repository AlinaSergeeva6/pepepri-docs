# Multipart Finalization



{% swagger method="post" path="/v1.0/addons/data/import/multipart_overwrite/finalize/{addonUUID}/{resource}" baseUrl="https://api.pepperi.com" summary="Finalizes the multipart import by applying the overwriteTable operation to all uploaded files." %}
{% swagger-description %}
Completes the multipart import process, applying the `overwriteTable` feature.
{% endswagger-description %}

{% swagger-parameter in="body" name="Key" required="true" %}
Multipart key used in multipart session
{% endswagger-parameter %}

{% swagger-parameter in="query" name="addonUUID" required="true" %}
the uuid of the addon
{% endswagger-parameter %}

{% swagger-parameter in="query" name="resource" required="true" %}
Resource name
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="OverwriteTable successfully finalized" %}

{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="Invalid or missing "MultipartKey"" %}

{% endswagger-response %}
{% endswagger %}

The final step in the multipart import process is the finalization phase, which applies the `overwriteTable` operation for all separately uploaded files within the session. This approach allows for the efficient management and update of large datasets by overwriting the existing contents of the destination table with the data from multiple uploaded files, ensuring the table only contains the most current and relevant data.
