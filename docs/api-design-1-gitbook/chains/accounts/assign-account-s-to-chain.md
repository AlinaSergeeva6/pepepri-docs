# Assign account(s) to chain

{% hint style="info" %}
Admin only
{% endhint %}

{% swagger method="post" path="/accounts/assign/{chain_key}" baseUrl="https://api.pepperi.com/v1.0" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="chain_key" type="string" required="true" %}
chain key for assignment
{% endswagger-parameter %}

{% swagger-parameter in="body" name="AccountsKeys" type="array" required="true" %}
List of accounts for assigning to chain
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```json
{
    {
        "UUID": "b888b24c-3022-4ca9-8322-63ada2780f9e",
        "Status": "Ignore",
        "Message": "No changes in this row. The row is being ignored."
    },
    {
        "UUID": "351935be-70a1-4b92-9cc2-49a66a105477",
        "Status": "Update",
        "Message": "Row updated."
    }
}
```
{% endswagger-response %}
{% endswagger %}
