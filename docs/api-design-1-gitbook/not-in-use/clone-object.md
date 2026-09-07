# Clone Object type

{% hint style="info" %}
Phase #1 - supports only transaction types (should also copy UI controls of the source transaction)

For the "public" transaction types  we need to allow access to all users&#x20;
{% endhint %}

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/{resource name}/clone" method="post" summary="Clones object type meta data" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="" type="string" %}
{ "SourceTypeID": 1223,  "TargetTypeName:""}
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
{
    returns the new created type object - same as GET
}
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```javascript
{
    
}
```
{% endswagger-response %}
{% endswagger %}

