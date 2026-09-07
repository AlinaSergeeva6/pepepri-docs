# Get installed add-on editor public path

{% hint style="info" %}
in case there is no license for the editor 400 error with relevant error code NO\_LICENSE will be returned
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/V1.0" path="/addons/installed_addons/{addonUUID}/editor/{name}" method="get" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200" description="" %}
```
http://cdn.aaa.com/addon/editor_name.js
```
{% endswagger-response %}
{% endswagger %}

