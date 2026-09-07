# Uninstall add-on from distributor



{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons/installed_addons/{addonUUID}/uninstall" method="post" summary="Uninstall installed add-on by add-on UUID" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{ ExecutionUUID = "{DeploymentAuditLogUUID}", URI = ""}
```
{% endswagger-response %}
{% endswagger %}



{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="addons/installed_addons/uninstall/callback" method="post" summary="Uninstall installed add-on version - Callback" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="callbackData" type="object" %}
Dictionary that contains executionUUID, response (of the upgrade function in the installation.js file) ,body (Request.body)
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{ success = "", errorMessage = ""}
```
{% endswagger-response %}
{% endswagger %}
