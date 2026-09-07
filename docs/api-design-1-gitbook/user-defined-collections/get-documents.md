# Get Documents

{% swagger method="get" path="/user_defined_collection/{key}" baseUrl="https://api.pepperi.com/v1.0" summary="Get documents from collection" %}
{% swagger-description %}
Get all documents under a specific collection
{% endswagger-description %}

{% swagger-parameter in="path" name="key" type="string" required="true" %}
name of the collection to get documents for
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="successfully retrieved" %}
```javascript
[{
    Key: "", // mandatory, unique
    // all the fields from the collection scheme object
},
{},
]
```
{% endswagger-response %}
{% endswagger %}
