# Multipart Initialization

{% swagger method="post" path="/v1.0/addons/data/import/multipart_overwrite/initialize/{addonUUID}/{resource}" baseUrl="https://api.pepperi.com" summary="Initiates a multipart import session, generating a unique MultipartKey for uploading file parts." %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="addonUUID" required="true" %}
the UUID of the addon
{% endswagger-parameter %}

{% swagger-parameter in="query" name="resource" required="true" %}
Resource name
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Key" %}
optional specific MultipartOverwriteKey to initialize
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="Multipart key created" %}
```
{
  "MultipartOverwriteKey": "unique-session-id"
}
```
{% endswagger-response %}
{% endswagger %}

### Usage:

To utilize the multipart import functionality for large file uploads where data in the destination table needs to be completely overwritten, the first step is to call this endpoint. The MultipartOverwriteKey received from this call is to be used in all subsequent file part uploads. This approach simplifies the management of large data imports and ensures that only the most recent and relevant data is retained in the destination table, aligning with the overarching goal of the `overwriteTable` feature.

If you wish to use a specific key for the Multipart initialization, you could provide it in the "Key" Property.
