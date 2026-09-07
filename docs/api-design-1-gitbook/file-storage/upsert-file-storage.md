# Create And Update File Storage

{% hint style="info" %}
"IsSync" & Configuration object are mutually exclusive, if you send them both, it will be an error.
{% endhint %}

{% hint style="info" %}
The file upload can be by URL or by base64, if you put both - the file will upload by base64.
{% endhint %}

####

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/file_storage" method="post" summary="Create File Storage" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="" type="object" %}
Same object as the GET
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
```
{% endswagger-response %}
{% endswagger %}

#### Post Body Sample:

```csharp
[
// Only one of the fields "configuration" and "isSync" can be sent in body
        {
        "InternalID" : 1243,
        "Title" : "myjpg",  //Currently : Name
        "Description" : "",
        "FileName": "myjpg.png", //Currently : UploadedFileName (Mandatory)
       	"MimeType":"jpg",
       // is its new file- Configuration = null
        "Configuration": 
            { 
            "ObjectType":"PortfolioItem",
            "RequiredOperation":"Dashboard",
            "Type":"EmailBody"
            },
        // The file upload can be by url or by base64
        // if you put both - the file will upload by base64 
        "URL": "https://www.gstatic.com/webp/gallery3/1.png",
        "Content": ""   
        "Hidden" : false,
        // ReadOnly : 
        "CreationDateTime" : "",
        "ModificationDateTime": "",
        "MimeType": "image/png",
        "IsSync" : true  // if not sent - default is false
    },
    ...
]
```

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/file_storage" method="post" summary="Update File Storage By InternalID" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="" type="object" %}
Same object as the GET
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
```
{% endswagger-response %}
{% endswagger %}
