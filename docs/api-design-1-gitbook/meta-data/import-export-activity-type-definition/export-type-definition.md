# Export Type Definition

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/meta_data/{type}/types/{subType}/export" method="get" summary="Export Type Definition" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="type" type="string" %}
The type of ATD you want to export (e.g: transactions, activities)
{% endswagger-parameter %}

{% swagger-parameter in="path" name="subType" type="string" %}
The ID of the ATD you want to export
{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authentication" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="Export finished successfully" %}
```javascript
{
    "URL": "https://cdn.staging.pepperi.com/TemporaryFiles/fc3b130c-4427-4049-bd86-eaafec3a6cdd"
}
```
{% endswagger-response %}

{% swagger-response status="404" description="An error occurred while exporting" %}
```javascript
{ 
   "message": "our standart error"
}
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
The response URL contains all the ATD metadata including its data objects (Fields,  LineFields, Workflow, Settings, Data views).

In addition, in the file, there is another section that contains references.\
The references point to objects that need to be mapped if importing into another environment.
{% endhint %}
