# Post Object Type

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/{resourceName}/types" method="post" summary="post type definition" %}
{% swagger-description %}
This endpoint allows you to post type definition.
{% endswagger-description %}

{% swagger-parameter in="path" name="resourceName" type="string" %}
**Options**: Contacts, Accounts, Transactions, Activities.
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Authorization token
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Hidden" type="boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Icon" type="string" %}
Should be like the following format: "icon2". (the number between 2-25)
{% endswagger-parameter %}

{% swagger-parameter in="body" name="ExternalID" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="Description" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="InternalID" type="number" %}
mandatory only for update
{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
{
        "TypeID": 141065,
        "InternalID": 141065,
        "ExternalID": "Sales Order",                         
        "Description": "Default format for catalog orders", 
        "Icon": "icon9",                                     
        "CreationDateTime": "2017-05-25T10:44:40.227Z",
        "ModificationDateTime": "2020-11-10T08:31:03.38Z",
        "Hidden": false,
        "UUID": "693f5ed2-603a-46fc-80fe-829a3492acfb"
 }
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```
{    "message": "Our standart error" }
```
{% endswagger-response %}
{% endswagger %}

