---
description: >-
  describe the generic upsert in the RestAPI with focus for each specific
  resource if need
---

# generic upsert

## Upsert resource&#x20;

<mark style="color:green;">`POST`</mark>`http://nuc_url:{port}/upsert/{resource}`

The body in the post is the object which is defined in nucleus, it is not 1-1 the official api object of the resource but the 1-1 object which is stored in the nuc cache&#x20;

Below we will add example object per resource that will be supported

**Headers**

| Name          | Value              |
| ------------- | ------------------ |
| Content-Type  | `application/json` |
| Authorization | `Bearer <token>`   |

**Body**

| Name   | Type   | Description       |
| ------ | ------ | ----------------- |
| `body` | object | the internal body |

**Response**

{% tabs %}
{% tab title="200" %}
```json
{
  "id": 1,
  "name": "John",
  "age": 30
}
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

####
