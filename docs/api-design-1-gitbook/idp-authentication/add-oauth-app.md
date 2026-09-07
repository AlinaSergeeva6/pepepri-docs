# Add OAuth App

{% swagger baseUrl="https://api.pepperi.com/v1.0/" path="oauth/apps" method="post" summary="Add OAuth 2.0 App" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="" type="object" %}
`{`\
&#x20;    `"AppName" : "MyTestApp",`\
&#x20;    `"RedirectURIs" :  ["",""],`\
&#x20;    `"OllowedOriginURIs" : ["",""],`\
&#x20;    `"PostLogoutRedirectURIs : ["",""],`\
&#x20;    `"OIDCFlow" : "AuthCode", //Or "AuthCodeAndPKCE" or "Implicit" or "Hybrid"`\
`}`
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
```
{% endswagger-response %}
{% endswagger %}
