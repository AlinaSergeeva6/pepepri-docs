# Validate Secret Key

## validate secret key matches the addon uuid

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/var/sk/addons/{addon_uuid}/validate`

this endpoint checks that the secret key in the header can authenticate the given addon&#x20;

#### Path Parameters

| Name         | Type   | Description                                     |
| ------------ | ------ | ----------------------------------------------- |
| addon\_uuid  | string | the addon uuid that should match the secret key |

#### Headers

| Name                | Type   | Description |
| ------------------- | ------ | ----------- |
| X-Pepperi-SecretKey | string |             |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}

{% tab title="401 " %}
```
in case secret key does not match the addon 
```
{% endtab %}
{% endtabs %}

