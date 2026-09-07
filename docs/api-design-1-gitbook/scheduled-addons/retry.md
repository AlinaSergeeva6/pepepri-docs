# Retry

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="pjobs/addons/retry_now" method="post" summary="Retry" %}
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
Do not use the http request, instead use client.Retry(delayTime) function.

delayTime is in milliseconds and have to be smaller than 60000 milliseconds.&#x20;
{% endhint %}
