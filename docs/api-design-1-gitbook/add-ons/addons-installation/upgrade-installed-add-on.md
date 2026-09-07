# Upgrade installed add-on

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="addons/installed_addons/{addonUUID}/upgrade" method="post" summary="Upgrade installed add-on version" %}
{% swagger-description %}
Upgrade to the latest phased version of the add-on
{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="Same as code job execute now" %}
```
{ ExecutionUUID = "{DeploymentAuditLogUUID}", URI = ""}
```
{% endswagger-response %}
{% endswagger %}



{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="addons/installed_addons/{addonUUID}/upgrade/{versionID}" method="post" summary="Upgrade installed add-on version" %}
{% swagger-description %}
Upgrade to a specific version of the add-on
{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="Same as code job execute now" %}
```
{ ExecutionUUID = "{DeploymentAuditLogUUID}", URI = ""}
```
{% endswagger-response %}
{% endswagger %}



{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="addons/installed_addons/upgrade/callback" method="post" summary="Upgrade installed add-on version - Callback" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="callbackData" type="object" %}
Dictionary that contains executionUUID, response (of the upgrade function in the installation.js file) ,body (Request.body that was sent to the upgrade function in installation.js)
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
{ success = "", errorMessage = ""}
```
{% endswagger-response %}
{% endswagger %}

#### In case of response.success=true&#x20;

* &#x20;The callback function will update the new version in the DB installed addon row&#x20;

