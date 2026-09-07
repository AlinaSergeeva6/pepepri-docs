# Search



## Search endpoint

<mark style="color:green;">`POST`</mark> `/addons/pfs/search/{AddonUUID}/{ResourceName}`

Runs a Search on the requested {ResourceName} schema, owned by the {AddonUUID}.



#### Query parameters



| Name                                           | Type   | Description                                             |
| ---------------------------------------------- | ------ | ------------------------------------------------------- |
| AddonUUID<mark style="color:red;">\*</mark>    | string | The owner of the schema                                 |
| ResourceName<mark style="color:red;">\*</mark> | string | The schema's name on which the search will be performed |

**Body**

Same as DocDB Search endoint.

**Response**

{% tabs %}
{% tab title="200" %}
Same as DocDB Search endoint.
{% endtab %}
{% endtabs %}
