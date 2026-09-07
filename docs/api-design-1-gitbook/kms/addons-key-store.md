# Addons Key Store

## Addons KMS Post

<mark style="color:green;">`POST`</mark> `/addons/kms/:addonUUID/parameters/:key`

Set a key value

**Headers**

| Name                 | Value    |
| -------------------- | -------- |
| X-Pepperi-Secret-Key | `string` |
| X-Pepperi-Owner-UUID | `string` |

**Body**

| Name    | Type  | Description                       |
| ------- | ----- | --------------------------------- |
| `Value` | `any` | The value to store under this key |

**Response**

{% tabs %}
{% tab title="200" %}
```json
{
  "Key": "",
  "Value": "",
  "Hidden": false
  "CreationDateTime": "",
  "ModificationDateTime": ""
}
```
{% endtab %}
{% endtabs %}



### GET by Key

<mark style="color:green;">`GET`</mark> `/addons/kms/:addonUUID/parameters/:key`

Get a key value

**Headers**

| Name                 | Value    |
| -------------------- | -------- |
| X-Pepperi-Secret-Key | `string` |
| X-Pepperi-Owner-UUID | `string` |

**Body**

**Response**

{% tabs %}
{% tab title="200" %}
```json
{
  "Key": "",
  "Value": "",
  "Hidden": false
  "CreationDateTime": "",
  "ModificationDateTime": ""
}
```
{% endtab %}
{% endtabs %}



### CPI Local Storage

{% hint style="info" %}
Sync is currently supported, meaning in the CPI you can only access parameters created in the CPI&#x20;
{% endhint %}

```typescript
const obj = pepperi.addons.kms.uuid(addonUUID).parameters.key(key).get();
// a value of t
const val = obj.Value;

const obj = pepperi.addons.kms.uuid(addonUUID).parameters.key(key).upsert({
    Value: ''
});

```
