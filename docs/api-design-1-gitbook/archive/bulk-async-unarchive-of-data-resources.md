# Bulk Async Unarchive Of Data Resources (not implemented)

{% hint style="warning" %}
1. Supports only activities, transactions, all\_activities resources
2. when transaction is unarchived all of its lines will be unarchived as well&#x20;
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/maintenance/{resource name}/unarchive" method="post" summary="Bulk Unarchive By List Of Objects" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="" type="object" %}
`[`\
&#x20;   `{`\
&#x20;        `"UUID" : "d4937135-03ce-4eba-9385-d31b676e6e48"`\
&#x20;   `},`\
&#x20;   `...`\
`]`
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
{
    "UUID": "a48522f8-04e1-4f97-9ee2-c27f208f24da",
    "URI" : "/archive_job_info/a48522f8-04e1-4f97-9ee2-c27f208f24da"
}
```
{% endswagger-response %}
{% endswagger %}
