# Internal: Create callback function for add-on async api

{% hint style="danger" %}
The lifespan of this function is 24 hours - after that the function will be deleted&#x20;
{% endhint %}

{% swagger baseUrl="https://papi.pepperi.com" path="/v1.0/addons/api/async_callback" method="post" summary="" %}
{% swagger-description %}
Creates a callback function to be used in the async api as a callback parameter 
{% endswagger-description %}

{% swagger-parameter in="body" name="callback" type="string" %}
the callback code 
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```
callback_uuid 
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
callback code must contain an exported function named "callback"

the callback function will be called with the three objects:

the client object, request object, response object&#x20;

in case of exception inside the code job or timeout - the response object will be {success: "Exception", errorMessage: excption\_message, resultObject: null}
{% endhint %}

