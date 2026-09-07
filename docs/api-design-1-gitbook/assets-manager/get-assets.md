---
description: A regular ADAL resource for Assets Manager addon.
---

# Get Assets

{% swagger baseUrl="https://papi.pepperi.com/V1.0/" path="assets" method="get" summary="Get Assets" %}
{% swagger-description %}
An asset is a resource describing a file (e.g. image, pdf, doc, …) used by the system.\
A standard ADAL resource supporting GET, POST etc.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}
Access token from the IdP
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
[
    {
        // mandatory, unique
        // /'s in the name will organize the files in folders
        "Name": "my-images/7535.jpg", 
        
        // optional
        "Description": "Red shoe",
        
        // The file mime type
        // by default is taken from the file extension
        // if file extension is unknown or doesn't exist
        // an error is thrown
        "MIME": "image/jpeg",
        
        // optional
        // the asset manager creates thumbnails for this assest
        // when this is true
        // throws an error if it isn't an image type
        // Currently only 200x200 size is supported
        "Thumbnails": ['200x200'], // Only for image type
        
        // optional
        // If sent, it is validated against the secret key header
        // and then the file can't be edited only by the addon
        "AddonUUID": "fcbc8ee0-2b42-4fa6-8666-389fdf6892ca", 

        // optional
        // default is None
        // Device syncs the 200x200 thumbnail as well if it exists
        // DeviceThumbnail syncs only the 200x200 thumbnail
        // Always means syncing to WebAPI as well - use only if you understand what this means
        "Sync": "None" | "Device" | "DeviceThumbnail" | "Always",
        
        // the CDN URL 
        // Read only
        "URL": "http://cdn.pepperi.com/...",
        
        // optional
        // "URI" and "LinkedURL" are mutually exclusive
        // Only on POST
        // Can be a http URL or base64 data URI
        "URI": "",
        

        // optional
        // "URI" and "LinkedURL" are mutually exclusive
        // Only on POST
        // Http URL
        "LinkedURL": ""
    }
]
```
{% endswagger-response %}
{% endswagger %}

{% hint style="warning" %}
The file should be deleted from s3 once the resource object is removed (expired)
{% endhint %}
