# Install add-on to distributor

## Install add-on by add-on UUID

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/installed_addons/{addonUUID}/install`

Install the latest version of the add-on

#### Path Parameters

| Name          | Type   | Description |
| ------------- | ------ | ----------- |
| Authorization | string | Admin       |

{% tabs %}
{% tab title="200 " %}
```
{ExecutionUUID = "{DeploymentAuditLogUUID}", URI = ""}
```
{% endtab %}
{% endtabs %}



## Install specific add-on version&#x20;

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/installed_addons/{addonUUID}/install/{versionID}`

Install specific add-on version

#### Path Parameters

| Name          | Type   | Description |
| ------------- | ------ | ----------- |
| Authorization | string | Admin       |

{% tabs %}
{% tab title="200 " %}
```
{ExecutionUUID = "{DeploymentAuditLogUUID}", URI = ""}
```
{% endtab %}
{% endtabs %}



## Install add-on - Callback

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/installed_addons/install/callback`

#### Path Parameters

| Name          | Type   | Description |
| ------------- | ------ | ----------- |
| Authorization | string |             |

#### Request Body

| Name         | Type   | Description                                                                                                                                                                          |
| ------------ | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| callbackData | object | Dictionary that contains executionUUID, response (of the upgrade function in the installation.js file) ,body (Request.body that was sent to the upgrade function in installation.js) |

{% tabs %}
{% tab title="200 " %}
```
{ success = "", errorMessage = ""}
```
{% endtab %}
{% endtabs %}





#### In case of response.success=false

* &#x20;The install addon row in DB will be set to hidden=true&#x20;
