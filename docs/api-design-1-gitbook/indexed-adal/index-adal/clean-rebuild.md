# Clean Rebuild

{% hint style="info" %}
Works only for ADAL tables with schema of type data&#x20;

phase 1 - only schemes owned by PFS and UDC
{% endhint %}

## Clean the data index and build data index for the table  - Async function

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com /v1.0/addons/data/schemes/{table_name}/clean_rebuild`

The clean rebuild Lock the POST and GET of type data when using indexed ADAL

#### Headers

| Name                                                  | Type   | Description      |
| ----------------------------------------------------- | ------ | ---------------- |
| x-pepperi-secretkey<mark style="color:red;">\*</mark> | String | addon secret key |
| x-pepperi-owneid<mark style="color:red;">\*</mark>    | String | addon owner uuid |

{% tabs %}
{% tab title="200: OK " %}
```javascript
{
{
    "ExecutionUUID": "574a460e-d369-46ae-a557-0272d4e6118a",
    "URI": "/audit_logs/574a460e-d369-46ae-a557-0272d4e6118a"
}}
```
{% endtab %}
{% endtabs %}

