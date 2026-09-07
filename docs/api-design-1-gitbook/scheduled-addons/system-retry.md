# Internal: System retry

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="pjobs/system_retry" method="post" summary="System retry" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="header" name="EncryptedAddonUUID" type="string" %}
Encrypted addonUUID to verify request
{% endswagger-parameter %}

{% swagger-parameter in="body" name="JobMessage" type="object" %}
Job Message Data object
{% endswagger-parameter %}

{% swagger-response status="200" description="successfully retrieved." %}
```
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
Do not use this function, this function is uses for retry in case of failure accessing papi
{% endhint %}
