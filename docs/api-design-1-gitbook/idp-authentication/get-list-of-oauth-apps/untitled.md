# Get Single OAuth App

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="oauth/apps/{App UUID}" method="get" summary="Get Single OAuth App by App UUID" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```java
    {
         "UUID": "",
         "AppName" : "MyTestApp",
         "RedirectURIs" :  ["",""],
         "OllowedOriginURIs" : ["",""],
         "PostLogoutRedirectURIs : ["",""],
         "OIDCFlow" : "AuthCode", //Or "AuthCodeAndPKCE" or "Implicit" or "Hybrid"
         "ConsumerKey": "",
         "ConsumerSecret": ""
    }
```
{% endswagger-response %}
{% endswagger %}
