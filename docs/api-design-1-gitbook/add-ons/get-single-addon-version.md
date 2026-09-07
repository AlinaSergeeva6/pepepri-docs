# Get addon single version

{% hint style="danger" %}
Obsolete&#x20;

Please use **Get** **single addon version**
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons/{addon UUID}/versions/{version id}" method="get" summary="Get add-on single version" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
{
  "VersionID": "1.2",
  "Files": [
    {
      "FileName": "my file",
      "URL": "",
      "Base64Content": ""
    },
  ...
}
```
{% endswagger-response %}
{% endswagger %}
