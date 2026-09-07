# Get Files

Get files by where clause.

{% hint style="info" %}
Thumbnails - Sending an array of thumbnails (on creation or on update) will create the requested thumbnails.&#x20;

Updating the data of a file that has thumbnails will also automatically update the thumbnails to represent the new data.

To delete thumbnails, you can update the file passing an empty array of thumbnails.
{% endhint %}

{% swagger method="get" path="/addons/pfs/{AddonUUID}/{SchemaName}" baseUrl="https://api.pepperi.com/v1.0" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="folder" required="true" %}
returns files (including folders) immediately under this folder (none recursive) for root folder use '/'
{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" %}

{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
[
    {
        // mandatory, unique
        // /'s in the name will organize the files in folders
        // if the key ends with '/' it means we are creating a folder 
        "Key": "/my-images/7535.jpg", 
        // readonly
        "Folder": "/my-images",
        // readonly 
        "Name": "7535.jpg",
        
        // optional on file creation/update
        "Description": "Red shoe",
        
        // Mandatory on creation 
        // in case of folder MIME type is "pepperi/folder"
        // if pepperi/folder is provided on creation and the key is not ending with '/' the POST should fail
        "MIME": "image/jpeg",
        
        // optional on file creation/update
        // the PFS creates thumbnails for this assest
        // for each size specified below
        // throws an error if it isn't an image type
        // Currently only 200x200 size is supported
        // in this example a file 
        "Thumbnails": [
            {
                "Size": '200x200', // Only for image type
                "URL": "http://cdn.pepperi.com/private_pfs/dakhdakhd_200x200.jpg" // readonly
            }
        ],
            
        // optional on file creation/update
        // default is None
        // Device syncs the 200x200 thumbnail as well if it exists
        // DeviceThumbnail syncs only the 200x200 thumbnail
        // Always means syncing to WebAPI as well - use only if you understand what this means
        "Sync": "None" | "Device" | "DeviceThumbnail" | "Always",
        
        // the CDN URL 
        // Read only
        "URL": "http://cdn.pepperi.com/...",
        
        // URI and TemporaryFileURLs are mutually exclusive.
        // If one of them is passed, the other one must not be passed.
        // Can be a http URL or base64 data URI
        // optional on create/update 
        "URI": "",
        
        // URI and TemporaryFileURLs are mutually exclusive.
        // If one of them is passed, the other one must not be passed.
        // A list of TempFile URLs, to be consolidated into a single file.
        // The order of the URLs dictates the order of parts.
        // Minimal part size: 5 MB, excpet for the last part.
        // Maximal part size: 5 GB.
        // Maximal number of parts: 10,000.
        "TemporaryFileURLs":[string]
        
        // The FileVersion can be used to be notified about file data changes.
        // Read only
        "FileVersion": "3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo",
        
        // Default is true.
        // If Cache value is set to false, each GET request to the CDN link will cause an MD5 comparison against the file source. In case of a missmatch, a new version will be served and cached in the CDN. Otherwise the cached version will be served from CDN.
        // If Cache value is true, the cached version in the CDN will be served. Each cached version has a TTL of 24 hours. Please refer to the invalidation endpoint to refresh CDN on demand. 
        // (Using Cache = true, you can still get the latest version by passing a "Content-Control":"no-cache" header on the GET request, to create a similar behavior to the one where Cache was set to false.)
        "Cache": true,
        
        // Read only.
        // The UUID of the last user to change a file's content,
        // or Hidden value.
        // The field is an empty string when uploaded by SupportAdminUser (Integration, etc.)
        // The field isn't returned for folders.
        "UploadedBy": '1e39b29e-e259-11ec-8fea-0242ac120002'    
        
        // Read only
        // The file's size in bytes.
        "FileSize": 342567
    }
]
```
{% endswagger-response %}
{% endswagger %}
