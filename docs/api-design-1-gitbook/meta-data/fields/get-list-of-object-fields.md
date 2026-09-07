# Get list of object fields

{% hint style="warning" %}
Phase #1  - items, accounts
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/{resourceName}/fields" method="get" summary="Get List Of Object Fields" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="resourceName" type="string" %}
**Options**: Accounts , Users , Items, Catalogs, Contacts, Transactions, Activities.
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Authorization token
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved" %}
```javascript
{
    same object like get list of typed object
}
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```javascript
{
   standard error
}
```
{% endswagger-response %}
{% endswagger %}

