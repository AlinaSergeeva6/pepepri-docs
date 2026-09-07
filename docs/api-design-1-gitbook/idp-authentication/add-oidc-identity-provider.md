---
description: Add IdP provider per Org
---

# Add OIDC Identity Provider

## Add OIDC IdP&#x20;

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/oauth/idps`

#### Request Body

| Name | Type   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ---- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|      | object | <p><code>{</code><br><code>"CustomIdPConfiguration" :</code><br><code>{</code><br><code>"IdPName" : "Google",</code><br><code>"OptionalSettings" :</code><br><code>[</code><br><code>{"Key" : "IdPEmailClaimField", "Value" : "email"},</code><br><code>{"Key" : "IdPUserIDClaimField", "Value" :  "subject"},</code><br><code>{"Key" : "IdPFirstNameClaimField", "Value" : "given_name"},</code><br><code>{"Key" : "IdPLastNameClaimField","Value" : "family_name"},</code><br><code>{"Key" : "GetClaimsFromUserInfoURL", "Value" : "true"</code><br><code>]</code><br><code>},</code><br><code>"ClientConfiguration" :</code><br><code>{</code><br><code>"ClientID" : "",</code><br><code>"ClientSecret" : ""</code> <br><code>},</code><br><code>"OIDCWellKnownURL" : "https://accounts.google.com/.well-known/openid-configuration"</code> <br><code>}</code></p> |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}
