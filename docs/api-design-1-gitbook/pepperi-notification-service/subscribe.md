---
description: Subscribe addon to data change
---

# Subscribe

{% hint style="info" %}
Pepperi Notification Service is based on SNS, which is an AWS notification self-managed service. PNS interface is composed of two major components publish and subscribe
{% endhint %}

{% hint style="info" %}
Subscribe enables the addons to register to a specific “object type” + attribute/s. Every time a message with the matched attributes will be published, The addon function that was registered will be called (POST) using the async API.\
The order of notifications is random.
{% endhint %}

{% hint style="danger" %}
A subscription function can be called more than once.\
This is due to the implementation of SNS and the way pepperi handles notifications
{% endhint %}

{% hint style="info" %}
**Callback Retry**

* If `SynchronousRetries` is not specified or set to zero, an async call will be made to the callback URL with up to 3 retries.
* If `SynchronousRetries` is specified, X synchronous retries will be performed, where X equals the value of `SynchronousRetries`.
{% endhint %}

{% hint style="warning" %}
Addon cannot subscribe twice for the same name. name cannot contains white spaces
{% endhint %}

{% hint style="info" %}
**Resource Endpoint**: /notification/subscriptions\
Support all standard resource endpoint functions

Sending Hidden=true will unsubscribe the addon from notifications
{% endhint %}

{% hint style="info" %}
Example for filter policy is in the publish page, as filter attributes
{% endhint %}

## Subscribe to data change

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/notification/subscriptions`

#### Headers

| Name                | Type   | Description             |
| ------------------- | ------ | ----------------------- |
| X-Pepperi-SecretKey | string | addon key               |
| X-Pepperi-OwnerID   | string | The requested addonUUID |

#### Request Body

| Name   | Type   | Description  |
| ------ | ------ | ------------ |
| object | object | See Response |

{% tabs %}
{% tab title="200 successfully retrieved." %}
```json
{     
   "Name": "", // Mandatory
   "AddonUUID": "", // Mandatory
   "Type": "data" | "action" | "event", // Mandatory on create
   "AddonRelativeURL": "/file/func" // Mandatory on create
   "SynchronousRetries": number // optional on upsert
   "FilterPolicy": {
      [key: string]: string[]
   }
}
```
{% endtab %}
{% endtabs %}

```json
// example for subscribing to uninstall addon message
{
    AddonUUID: "", // the addon you want to be started be PNS
    AddonRelativeURL: "", // the path that will be started, for example /api/test
    Type: "data", 
    Name: "",
    FilterPolicy: {
        Action:['update'],
        ModifiedFields:['Hidden'],
        Resource:['installed_addons'],
        AddonUUID:['00000000-0000-0000-0000-000000000a91']
}
```

```json
// example for subscribing to adal table test1 owned by addon uuid 1e1963b4-87df-4f58-939a-e2a6dc71677a
{
    AddonUUID: "", // the addon you want to be started be PNS
    AddonRelativeURL: "", // the path that will be started, for example /api/test
    Type: "data", 
    Name: "",
    FilterPolicy: {
        Action:['update'],
        Resource:['test1'],
        AddonUUID:['1e1963b4-87df-4f58-939a-e2a6dc71677a']
}
```

```json
// example for subscribing to specific key change, key: key1, schema: test1 
// owned by addon uuid 1e1963b4-87df-4f58-939a-e2a6dc71677a 
{
    AddonUUID: "", // the addon you want to be started be PNS
    AddonRelativeURL: "", // the path that will be started, for example /api/test
    Type: "data", 
    Name: "",
    FilterPolicy: {
        Action:['update'],
        Resource:['test1'],
        AddonUUID:['1e1963b4-87df-4f58-939a-e2a6dc71677a'],
        ModifiedObjects:['key1']
}
```

```json
// example for subscribing to adal table TEST with synchronous retries
{
    AddonUUID: "",
    AddonRelativeURL: "",
    Type: "data", 
    Name: "",
    SynchronousRetries: 5, // Callback will be retried synchronously up to 5 times.
    FilterPolicy: {
        Action:['update'],
        Resource:['TEST'],
        AddonUUID:['1e1963b4-87df-4f58-939a-e2a6dc71677a']
}
```
