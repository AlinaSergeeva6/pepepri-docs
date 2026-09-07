# 🎟️ Upsert Profile

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/policy_profiles`

Profile add/edit/delete

#### Request Body

<table><thead><tr><th width="301">Name</th><th>Type</th><th>Description</th></tr></thead><tbody><tr><td>PolicyAddonUUID<mark style="color:red;">*</mark></td><td>String</td><td>The policy owner</td></tr><tr><td>PolicyName<mark style="color:red;">*</mark></td><td>String</td><td>The policy name</td></tr><tr><td>ProfileID<mark style="color:red;">*</mark></td><td>String</td><td>Profile ID (employee type)</td></tr><tr><td>Hidden</td><td>Boolean</td><td>Only used for deletion<br>Default: false</td></tr><tr><td>Allowed<mark style="color:red;">*</mark></td><td>Boolean</td><td>Profile permission</td></tr></tbody></table>

{% tabs %}
{% tab title="200: OK " %}
```javascript
{
    Key: "",
    PolicyAddonUUID: "",
    PolicyName: "",
    ProfileID: "",
    Allowed: true,
}
```
{% endtab %}
{% endtabs %}

{% hint style="info" %}
Permission checking is done by calling: `client.ValidatePermission(policyName)`
{% endhint %}
