---
description: Hard Delete means removing hidden resource
---

# Hard Delete

## hard delete single object&#x20;

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/{resource}/{key}/hard_delete`

For ADAL the {resource} = addons/data/{addon\_uuid}/{table\_name}\
Deletes the resource permanently from the database. The resource must be hidden before its deletion&#x20;

#### Request Body

| Name  | Type    | Description                                                 |
| ----- | ------- | ----------------------------------------------------------- |
| Force | boolean | if true deletes also none hidden resource, default is false |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}
