# Bulk Asyc Archive Of Data Resources

{% hint style="warning" %}
1. Supports only activities and transactions resources
2. when transaction is archived all of its lines will be archived as well&#x20;
3. For each resource type you can send array of internalIDs from that type
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/maintenance/archive" method="post" summary="Bulk Asyc Archive By List Of Objects" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="{resource type}" type="array" %}
array of internalIDs
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

