# Client Packages

Get symlinks files data.

## Get symlinks files data&#x20;

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/v1.0/addons/client_packages`

#### Request Body

| Name         | Type   | Description                   |
| ------------ | ------ | ----------------------------- |
| Dependencies | Object | Like in the package.json file |

{% tabs %}
{% tab title="200 " %}
```json
Symlinks: [
    {
        PartialFileNameToExclude: 'angular_common_http',
        AdditionalData: {} // any, will Added to addon_package.json as is.
    }
]
```
{% endtab %}
{% endtabs %}
