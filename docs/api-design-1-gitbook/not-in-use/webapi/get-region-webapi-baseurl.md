# Get Region WebAPI BaseURL

{% swagger method="get" path="/webapi/base_url" baseUrl="https://papi.pepperi.com/v1.0" summary="" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="query" name="region" %}
What region to get the base_url for
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
{
    "BaseURL": "https://webapi.pepperi.com/16.60.82/webapi"
}
```


{% endswagger-response %}
{% endswagger %}

Supported Regions

* prod (oregon)
* eu (frankfurt)
* sandbox (works only on sandbox data center and only this works on data center)

{% hint style="info" %}
Default for region is the distributors data center
{% endhint %}
