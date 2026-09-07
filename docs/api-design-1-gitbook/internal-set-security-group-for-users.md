# Internal - Set Security Group for Users



{% swagger method="post" path="/users/security_group" baseUrl="https://api.pepperi.com/v1.0" summary="Set security groups to users" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="Array" required="true" %}
array of user-security group (see example)
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}

{% endswagger-response %}
{% endswagger %}



## Body

```
[
    {
        "User":"879730f3-68a1-4ac8-9224-d70f87780fe0",
        "SecurityGroup":"493bae41-533c-4095-924f-b3a0079631af"
    },
    ...
]
```
