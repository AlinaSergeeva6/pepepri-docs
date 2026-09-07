---
description: Connect single buyer to single or multiple accounts
---

# Account buyers

{% hint style="info" %}
Buyer can be connected only to accounts under the same chain
{% endhint %}

{% hint style="info" %}
Available only for active buyer (with user)
{% endhint %}

{% hint style="info" %}
To disconnect buyer from account need to send the relation with Hidden=true
{% endhint %}

{% swagger method="post" path="/account_buyers" baseUrl="https://api.pepperi.com/v1.0" summary="generic resource" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200: OK" description="" %}
```
{
        "CreationDateTime": "2017-10-25T05:48:52.000Z",
        "Hidden": false,
        "ModificationDateTime": "2017-10-25T05:48:52.000Z",
        "Account": "63b4ae71-b110-46b6-a378-03355eb5c839",
        "Buyer": "843e6c57-4a3a-4b13-ab18-8e7c8228d2bd",
        "Key": "09da49d0-c031-474e-bac6-6a84ba4a28b2"
},
```
{% endswagger-response %}
{% endswagger %}
