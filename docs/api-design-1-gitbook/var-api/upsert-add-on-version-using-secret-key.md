# Upsert add-on single version using secret key



{% hint style="info" %}
Update:\
&#x20;\- By UUID only.\
&#x20; \- Cant update VerisionID.
{% endhint %}

{% hint style="info" %}
Insert :\
\- AddonUUID and VersionID are mandatory fields.\
\- VersionID is unique per addonUUID.\
\- If no file was sent or if installation.js file was not sent -  installation.js will be created by default.
{% endhint %}

{% hint style="info" %}
The files format:\
Files:  \[ { "FileName": "my file", "URL": "", "Base64Content": ""},...]
{% endhint %}



{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/var/sk/addons/versions" method="post" summary="Upsert add-ons single version using secret key" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="xx-pepperi-addon-secret-key" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="addonVersion" type="object" %}
single addon version to upsert
{% endswagger-parameter %}

{% swagger-response status="200" description="return list of the updated/inserted addon version, without the files (for now)" %}
```
Returns the GET object.
```
{% endswagger-response %}
{% endswagger %}

