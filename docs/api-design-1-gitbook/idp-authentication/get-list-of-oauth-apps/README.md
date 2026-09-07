---
description: Get list of apps per Org
---

# Get List Of OAuth Apps

## Get list of OAuth Apps&#x20;

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/oauth/apps`

{% tabs %}
{% tab title="200 " %}
```java
[
    {
         "UUID": "",
         "AppName" : "MyTestApp",
         "RedirectURIs" :  ["",""],
         "OllowedOriginURIs" : ["",""],
         "PostLogoutRedirectURIs : ["",""],
         "OIDCFlow" : "AuthCode", //Or "AuthCodeAndPKCE" or "Implicit" or "Hybrid"
         "ConsumerKey": "",
         "ConsumerSecret": ""
    },
    ...
]
```
{% endtab %}
{% endtabs %}
