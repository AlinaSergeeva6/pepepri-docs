# Get List Of Storage Files

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/file_storage" method="get" summary="Get files from storage (e.g: configuration files)" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="X-Pepperi-OwnerID" type="string" %}
The addon UUID that created this cunstomization file
{% endswagger-parameter %}

{% swagger-parameter in="query" name="is_distinct" type="boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="include_deleted" type="boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page_size" type="number" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="page" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="fields" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="order_by" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="where" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
[
    {
        "InternalID" : 1243,
        "Title" : "myjpg",  
        "Description" : "",
        "FileName": "myjpg.png",
        "Configuration": 
            { 
            "ObjectType":"PortfolioItem",
            "RequiredOperation":"Dashboard",
            "Type":"EmailBody"
            }, 
        "URL": "https://www.gstatic.com/webp/gallery3/1.png",
        "Content": ""   
        "Hidden" : false, 
        "CreationDateTime" : "2020-11-23T09:18:16Z", 
        "ModificationDateTime": "2020-11-23T09:18:16Z",
        "MimeType": "image/png", 
        "IsSync" : true,
        "SyncType": "None"| "Mobile" | "All"
    } 
]
```
{% endswagger-response %}
{% endswagger %}

{% hint style="warning" %}
"IsSync" & Configuration fields are mutually exclusive.\
\
`IsSync` will have a value only for a file uploaded using[ Create and Update File Storage](upsert-file-storage.md), otherwise, the `Configuration` will have a value.
{% endhint %}

{% hint style="info" %}
The file upload can be by URL or by base64, if you put both - the file will upload by base64.
{% endhint %}

#### Customization file object&#x20;

|  **Attribute**                                                     |  **Type** |  **Description**                                                                                                                                                                                                           |
| ------------------------------------------------------------------ | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| InternalID                                                         | number    | Identifier in Pepperi                                                                                                                                                                                                      |
| Title                                                              | string    | Title of customization file in Pepperi                                                                                                                                                                                     |
| Description                                                        | string    | Description of customization                                                                                                                                                                                               |
| FileName                                                           | string    | File name of customization file                                                                                                                                                                                            |
| [Configuration](get-list-of-storage-files.md#configuration-object) | object    | Configuration of customization file                                                                                                                                                                                        |
| Content                                                            | string    | Base64 file content                                                                                                                                                                                                        |
| Hidden                                                             | boolean   |                                                                                                                                                                                                                            |
| CreationDateTime                                                   | string    | ISO8601 - UTC                                                                                                                                                                                                              |
| ModificationDateTime                                               | string    | ISO8601 - UTC                                                                                                                                                                                                              |
| MimeType                                                           | string    | Format of the customization file                                                                                                                                                                                           |
| IsSync                                                             | boolean   | Determines if the file will be synced to mobile or not                                                                                                                                                                     |
| SyncType                                                           | string    | <p>Determines how the file will be synced. stronger then "IsSync".</p><p>In case of "None" - its like "IsSync=false", in case if "Mobile" - its like "IsSync=false", in case of ""All" it will be download also to CPI</p> |

#### Configuration Object <a href="#configuration-object" id="configuration-object"></a>

| Attribute         | Type   | Description                                                                                                                                                                |
| ----------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ObjectType        | string | **Options**: StoreOrganizationsRelation, Order, PortfolioItem, GeneralActiviy,  Distributor, WebAppMainBar, Payment                                                        |
| Type              | string | **Options**: Export, EmailBody, Email, FileName, Internal,Widget, CustomClientForm, PrivateFile                                                                            |
| RequiredOperation | string | **Options**: NoOperation, XMLSpreadSheet2Excel, JustApplyXSLT, ForgotPasswordHTMLTemplate, ApplyXSLTOnUIControlXML,TopBar, Widget, PaymentPDF, HTML2PDFLandscape, HTML2PDF |
