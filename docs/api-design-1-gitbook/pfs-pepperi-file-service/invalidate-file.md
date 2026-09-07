# Invalidate File

Create an invalidation for a file.

In case the file has thumbnails, the invalidation will include them as well.

An invalidation takes up to 15 minutes to complete, and in some cases might even fail.



{% swagger method="post" path="/addons/pfs/{AddonUUID}/{SchemaName}/{key}/invalidate" baseUrl="https://api.pepperi.com/v1.0" summary="Create a CDN invalidation for the file." %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200: OK" description="When requesting an invalidation for a file that exists in the schema, the reponse will return the invalidated file" %}
```javascript
{
    "ModificationDateTime": "2022-05-26T08:16:18.854Z",
    "FileVersion": "na_iJsdVWX24TJ2mPw5F7MPwt4By3zRE",
    "Folder": "This4/is4/great4",
    "MIME": "image/png",
    "CreationDateTime": "2022-05-26T08:16:18.854Z",
    "Sync": "None",
    "Description": "Description416692 1313",
    "URL": "https://pfs.pepperi.com/e66154d0-06af-4588-a1ea-d5924aba86f2/f6458728-25fd-469d-9a20-73a99265fe52/MyFifthPfsSchema/This4/is4/great4/file4.png",
    "Hidden": false,
    "Cache": false,
    "UploadedBy": "",
    "Thumbnails": [
        {
            "Size": "200x200",
            "URL": "https://pfs.pepperi.com/thumbnails/e66154d0-06af-4588-a1ea-d5924aba86f2/f6458728-25fd-469d-9a20-73a99265fe52/MyFifthPfsSchema/This4/is4/great4/file4.png_200x200"
        }
    ],
    "Name": "file4.png",
    "Key": "This4/is4/great4/file4.png"
}
```
{% endswagger-response %}

{% swagger-response status="400: Bad Request" description="When requesting an invalidation for a folder" %}
```javascript
{
    "fault": {
        "faultstring": "Failed due to exception: Invalidation request is invalid: Requested path is a folder.",
        "detail": {
            "errorcode": "BadRequest"
        }
    }
}
```
{% endswagger-response %}

{% swagger-response status="404: Not Found" description="When requesting an invalidation for a file that does not exist in the schema" %}
```javascript
{
    "fault": {
        "faultstring": "Failed due to exception: Could not find requested item: 'This4/is4/great4/file4444.png'",
        "detail": {
            "errorcode": "NotFound"
        }
    }
}
```
{% endswagger-response %}
{% endswagger %}

