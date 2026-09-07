# Get list of Security Groups

{% swagger baseUrl="https://idp.sandbox.pepperi.com/api/" path="securitygroups" method="get" summary="Get list of security groups" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-response status="200" description="" %}
```java
[
    {
        "securityGroupID": "fcbc8ee0-2b42-4fa6-8666-389fdf6892ca",
        "name": "default group",
        "externalID": null,
        "description": null,
        "isDefault": true,
        "loginAndSessionPolicy": {
            "keepLoggedInWeb": true,
            "keepLoggedInExpirationDaysWeb": 30,
            "sessionAllowedIdleTimeMinutesWeb": null,
            "keepLoggedInApp": true,
            "keepLoggedInExpirationDaysApp": 30,
            "sessionAllowedIdleTimeMinutesApp": null,
            "forceLogoutCheckFrequencyMin": 60,
            "homePageUri": "https://app.sandbox.pepperi.com"
        },
        "passwordPolicy": {
            "minLength": 6,
            "requireNumbers": true,
            "requireSymbols": false,
            "requireUppercase": true,
            "requireLowercase": true,
            "requireAlphabet": true,
            "passwordLifetime": null,
            "blockUsersAfterFailedAttempts": false,
            "maxFailedAttempts": 6,
            "passwordHistorySize": 0,
            "useOTP": false
        },
        "loginProvidersPolicy": {
            "allowedProviders": [
                {
                    "name": "local",
                    "isDefault": true
                },
                {
                    "name": "google",
                    "isDefault": false
                },
                {
                    "name": "facebook",
                    "isDefault": false
                }
            ]
        },
        "creationDate": "2019-07-18T09:48:20.577"
    }
]
```
{% endswagger-response %}
{% endswagger %}

