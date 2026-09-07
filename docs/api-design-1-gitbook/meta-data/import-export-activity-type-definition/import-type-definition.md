# Import Type Definition

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/{type}/import" method="post" summary="Import Type Definition - Create a new type definition" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="type" type="string" %}
The type of destination ATD you want to import (e.g: transactions, activities)
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="URL" type="string" %}
any URL that contains ATD (e.g. the URL from the export)
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
{
    "InternalID": 23431
}
```
{% endswagger-response %}
{% endswagger %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/{type}/types/{subType}/import" method="post" summary="Import Type Definition" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="type" type="string" %}
The type of destination ATD you want to import (e.g: transactions, activities)
{% endswagger-parameter %}

{% swagger-parameter in="path" name="subType" type="string" %}
the ATD ID of the activity destination for import
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="URL" type="string" %}
any URL that contains ATD (e.g. the URL from the export)
{% endswagger-parameter %}

{% swagger-response status="200" description="Import finished successfully " %}
```javascript
{
    "InternalID": 23431
}
```
{% endswagger-response %}

{% swagger-response status="404" description="An error occurred while importing" %}
```javascript
{
    "message": "our standart error" 
}
```
{% endswagger-response %}
{% endswagger %}



{% hint style="info" %}
The function upload a lot of data and therefore can take more than 30 seconds, so the function should be called asynchronously
{% endhint %}
