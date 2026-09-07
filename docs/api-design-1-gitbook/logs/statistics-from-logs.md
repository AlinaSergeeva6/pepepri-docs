---
description: returns statistics from logs based on JSON objects
---

# Statistics from logs

<mark style="color:green;">`POST`</mark> `http://api.pepperi.com/v1.0/logs/stats`

Function that runs on JSON objects written as logs&#x20;

NOTE - use same parameters as "Get Logs" + the below

#### Request Body

| Name                                       | Type   | Description                              |
| ------------------------------------------ | ------ | ---------------------------------------- |
| Key<mark style="color:red;">\*</mark>      | String | name of the JSON Key to look for         |
| KeyValue<mark style="color:red;">\*</mark> | String | The value to filter                      |
| StatsKey<mark style="color:red;">\*</mark> | String | name of the JSON key to perform stats on |
| StatsFunction                              | String | SUM\|AVG default is SUM                  |

{% tabs %}
{% tab title="400: Bad Request " %}
```javascript
{
    // Response
}
```
{% endtab %}

{% tab title="200: OK " %}
```javascript
{
    "SUM": 34343.22
}
```
{% endtab %}
{% endtabs %}
