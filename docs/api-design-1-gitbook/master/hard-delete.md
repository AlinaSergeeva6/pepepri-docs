---
description: Delete resource
---

# Hard Delete

{% hint style="warning" %}
partial implementation - works only on distributors, account\_user&#x73;_, all\_&#x61;_&#x63;tivities
{% endhint %}

{% hint style="info" %}
Hard Delete issues "Remove" PNS&#x20;
{% endhint %}

{% hint style="danger" %}
This operation is unreversible&#x20;
{% endhint %}

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1/{pepperi_resource}/hard_delete`

permanently deletes the given keys from this specific resource &#x20;

#### Request Body

| Name                                      | Type         | Description                  |
| ----------------------------------------- | ------------ | ---------------------------- |
| KeyList<mark style="color:red;">\*</mark> | String array | Array of keys to be removed  |
