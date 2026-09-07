---
description: abstract schema - generic resource
---

# Chains

Chains are collections of accounts, allowing the admin to create groups of accounts and manage the connections between those accounts to their buyers. Those connections can also be managed by chain-managers defined by the Admin.

{% hint style="info" %}
Only admin can upsert chains
{% endhint %}

**Chains API**

Will implement generic resource [api](../generic-resources/introduction.md)&#x20;

{% swagger method="post" path="/resources/chains" baseUrl="https://api.pepperi.com/v1.0" summary="Chain upsert" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="ExternalID" %}
unique field
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Name" %}
chain name
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Description" %}
chain description
{% endswagger-parameter %}
{% endswagger %}

**Chains schema**:

{

```
Name: "chains",
Type: 'abstract',
Fields: {
    Key: {
        Type: "String"
    },
    ExternalID: {
        Type: "String",
        Unique: true
    },
    Name: {
        Type: "String",
        Indexed: true
    },
    Description: {
        Type: "String"
    }
}
```

}
