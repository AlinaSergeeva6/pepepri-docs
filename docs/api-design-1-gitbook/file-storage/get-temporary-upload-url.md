# Create Temporary Upload URL

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/file_storage/temporary_upload_url" method="post" summary="Create temporary upload url" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="allow_cache" type="string" %}
The default is true
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Authentication token to track down who is emptying our stocks.
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
{
  "UploadUrl": "https://pepperi-storage-staging.s3.us-west-2.amazonaws.com/TemporaryFiles/94d512db-f4d9-45f2-b804-86b3b6dfa48d?X-Amz-Expires=86400&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA3SWCYKQB5M3HEYIO/20200719/us-west-2/s3/aws4_request&X-Amz-Date=20200719T151331Z&X-Amz-SignedHeaders=host&X-Amz-Signature=7e8e92a5916dd3f9db8acd9da232c8754c7f96a4de2e591f4a2073e1396d97c0",
  "PublicUrl": "https://cdn.staging.pepperi.com/TemporaryFiles/94d512db-f4d9-45f2-b804-86b3b6dfa48d"
}
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```javascript
{
    "our standart error"    
}
```
{% endswagger-response %}
{% endswagger %}

