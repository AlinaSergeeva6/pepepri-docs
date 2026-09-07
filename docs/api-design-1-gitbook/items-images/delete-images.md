---
description: Delete an item's images
---

# Delete Images

## Delete Images

<mark style="color:green;">`POST`</mark> /items/{ObjectID}/delete\_images

**Body**

| Name       | Type      | Description                                                                                      |
| ---------- | --------- | ------------------------------------------------------------------------------------------------ |
| ImageTypes | string\[] | <p>Image type, same as field.<br>Valid values: Image, Image2, Image3, Image4, Image5, Image6</p> |

**Response**

{% tabs %}
{% tab title="200" %}
```jsonc
[ // An array with a status object for each image type in the request.
    {
        "ImageType": "Image" | "Image2" | "Image3" | "Image4" | "Image5" | "Image6",
        "Status": "Deleted" | "Failed",
        "ErrorMessage": "" // Empty when status="Deleted"
    },
    ...
]
```
{% endtab %}

{% tab title="400" %}
```json
{
  "error": "Invalid request"
}
```
{% endtab %}
{% endtabs %}
