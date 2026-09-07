# 🗃 Upsert Policy

{% swagger method="post" path="/policies" baseUrl="https://api.pepperi.com/v1.0" summary="Create/Edit a policy" %}
{% swagger-description %}
A policy is used in the scope of an endpoint, the profiles determines who can and can't access it.&#x20;
{% endswagger-description %}

{% swagger-parameter in="body" name="AddonUUID" required="true" type="String" %}
The policy owner
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Name" required="true" type="String" %}
The policy name.\
Unique per addon.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Description" type="String" required="false" %}
A short description of the policy
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Hidden" type="Boolean" %}
Only used for deletion\
Default: false
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
{
    Key: "{AddonUUID}_{PolicyName}"
    Name: ""
    Description: ""
}
```
{% endswagger-response %}
{% endswagger %}

