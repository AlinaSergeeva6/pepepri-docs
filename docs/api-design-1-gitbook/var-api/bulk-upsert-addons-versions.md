# Bulk upsert addons versions



{% hint style="info" %}
Insert :\
\- AddonUUID and VersionID are mandatory fields.\
\- VersionID in unique per addonUUID.\
\- If no file was sent or if installation.js file was not sent -  installation.js will be created by default.
{% endhint %}

{% hint style="info" %}
Edit:\
&#x20;\- By UUID only.\
&#x20; \- Cant update VerisionID.
{% endhint %}

{% hint style="info" %}
The files format:\
Files:  \[ { "FileName": "my file", "URL": "", "Base64Content": ""},...]

### File name MUST be in lower case
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/addons/versions/bulk" method="post" summary="Upsert add-ons versions in bulk" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Autorization" type="string" %}
Var admin only
{% endswagger-parameter %}

{% swagger-parameter in="body" name="addonsVersions" type="array" %}
Array of addons versions to upsert
{% endswagger-parameter %}

{% swagger-response status="200" description="return list of the updated/inserted addon version, without the files (for now)" %}
```
Returns the GET object.
```
{% endswagger-response %}
{% endswagger %}

