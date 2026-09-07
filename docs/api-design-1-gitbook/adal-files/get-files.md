# ADAL Files

This add-on is use for manage fields from type file (image, signature, etc.)

### Delete file. <a href="#create-a-cdn-invalidation-for-the-file" id="create-a-cdn-invalidation-for-the-file"></a>

`GET` `https://api.pepperi.com/v1.0/addons/adal_files/{ResourceName}/{FieldKey}/{ObjectKey}/delete`

### Get a file from a specific key <a href="#geta-single-file-folder-from-a-specific-key" id="geta-single-file-folder-from-a-specific-key"></a>

`GET` `https://api.pepperi.com/v1.0/addons/adal_files/{ResourceName}/{FieldKey}/{ObjectKey}`

Refer to the Upsert response

### Upsert file <a href="#upsert-a-single-file-folder" id="upsert-a-single-file-folder"></a>

`POST` `https://api.pepperi.com/v1.0/addons/adal_files/{ResourceName}/{FieldKey}/{ObjectKey}`

**Request body**

```
{
    ResourceName: string;   // The UDC resource
    FieldKey: string;       // The schema field key
    ObjectKey: string;      // The object key (for example the account key)
    MimeType: string;       // "image/bmp" | "image/x-icon" | "image/vnd.microsoft.icon" | "image/tiff" | "image/apng" | "image/avif" | "image/gif" | "image/jpeg" | "image/png" | "image/svg+xml" | "image/webp"
    Uri: string;            // The URI of the file
}
```

**Response**

{% tabs %}
{% tab title="200: OK " %}
```javascript
{
    Key: string; // created by ADALFiles addon - "resourceName_fieldKey_objectKey"
    Folder?: string;
    Name?: string;
    Description?: string;
    MIME?: string;
    Thumbnails?: [
        {
            Size: '200x200';
            URL?: string;
        },
    ];
    Sync?: 'None' | 'Device' | 'DeviceThumbnail' | 'Always';
    URL?: string;
    /**
     * DataURI ot a URL link to the file.
     * Mutually exclusive with "TemporaryFileURLs".
     */
    URI?: string;
    FileVersion?: string;
    Cache?: boolean;
    UploadedBy?: string;
    FileSize?: number;
    /**
     * A list of TemporaryFileURLs from which the final file will be constructed.
     * Mutually exclusive with "URI".
     */
    TemporaryFileURLs?: string[];
}
```
{% endtab %}
{% endtabs %}
