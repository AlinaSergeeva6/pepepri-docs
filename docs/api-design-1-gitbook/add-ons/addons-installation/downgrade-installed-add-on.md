# Downgrade installed add-on



{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="addons/installed_addons/{addonUUID}/downgrade/{versionID}" method="post" summary="Downgrade installed add-on version" %}
{% swagger-description %}
For internal use of the above downgrade
{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="Same as code job execute now" %}
```
{ ExecutionUUID = "{DeploymentAuditLogUUID}", = ""}
```
{% endswagger-response %}
{% endswagger %}



{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="addons/installed_addons/downgrade/callback" method="post" summary="Downgrade installed add-on version - Callback" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="Authorization" type="string" %}

{% endswagger-parameter %}

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

* &#x20;The callback function will update the downgrade version in the DB installed addon row&#x20;
