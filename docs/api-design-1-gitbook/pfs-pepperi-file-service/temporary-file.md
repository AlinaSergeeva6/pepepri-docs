# Temporary File

{% swagger method="post" path="/addons/pfs/temporary_file" baseUrl="https://api.pepperi.com/v1.0" summary="Create a temporary file" %}
{% swagger-description %}
Create a temporary file.


{% endswagger-description %}

{% swagger-parameter in="body" name="TempFileName" %}
If none provided, a random UUID is used.
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
{
    // Could be passed in the array TemporaryFileURLs to create a PFS object.
    TemporaryFileURL: string,
    
    // The URL to which to PUT the binary of the file.
    PutURL: string
}
```
{% endswagger-response %}
{% endswagger %}
