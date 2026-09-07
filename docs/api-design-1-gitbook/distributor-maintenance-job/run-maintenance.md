# Run Maintenance

We have two ways to run maintenance on a distributor:

* Phased Maintenance
  * The code that run every day on the distributor in his maintenance window
  * Will run addons upgrade on the distributor according to the addons
* &#x20;Forced Maintenance
  *   Will force upgrade all addons that are not on the latest version, regardless the current deployment phase





<mark style="color:green;">`POST`</mark> `/addons/api/`00000000-0000-0000-0000-000000000a91`/installation/maintenance`&#x20;

run the maintenance&#x20;

**Headers**

| Name          | Value              |
| ------------- | ------------------ |
| Content-Type  | `application/json` |
| Authorization | `Bearer <token>`   |

**Body**

| Name                | Type    | Description                            |
| ------------------- | ------- | -------------------------------------- |
| InitiateDistributor | boolean | optional,  true for forced maintenance |

**Response**

{% tabs %}
{% tab title="200" %}
```json
{
    "success": true,
    "resultObject": {}
}
```
{% endtab %}
{% endtabs %}
