# Get References Mapping

If importing to a different environment or to another distributor, you first need to call 'build\_references\_mapping' before calling import.\
'build\_references\_mapping' function receives the reference section that returned from the export response, and returns for each reference the appropriate reference in the new environment. \
The search for the appropriate reference is first done by ID or UUID (depending on the object) and if not found (which usually happens if it is indifferent environments) the search will be done by name.\
When the import receives the mapping, it will go through all the data and fix the references.\
For example, if there is a workflow action "custom form" that points to a file with ID: 123, and 123's partner file is 456, then the workflow's action will point to a 456 file.

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/Meta_Data/build_references_mapping" method="post" summary="Get references mapping" %}
{% swagger-description %}
This endpoint allows you to get free cakes.
{% endswagger-description %}

{% swagger-parameter in="header" name="Authentication" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="References" type="object" %}
the references section from export response
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
```javascript
{
        "Mapping": [
            {
                "Origin": {
                    "ID": "66645",
                    "Name": "Dependent Rep Test",
                    "Type": "profile"
                },
                "Destination": {
                    "ID": "69374",
                    "Type": "profile",
                    "Name": "Dependent Rep Test"
                }
            },
            {
                "Origin": {
                    "ID": "2809",
                    "Name": "PurchaseHistory",
                    "Type": "user_defined_table"
                },
                "Destination": {
                    "ID": "6577",
                    "Type": "user_defined_table",
                    "Name": "PurchaseHistory"
                }
            },
            {
                "Origin": {
                    "ID": "297602",
                    "Name": "AddCreditCardV2 02 02",
                    "Type": "file_storage",
                    "UUID": "00000000-0000-0000-0000-000000000000"
                },
                "Destination": {
                    "ID": "303766",
                    "Type": "file_storage",
                    "Name": "AddCreditCardV2 02 02"
                }
            },
            {
                "Origin": {
                    "ID": "256746",
                    "Name": "Customer",
                    "Type": "type_definition",
                    "SubType": "accounts"
                },
                "Destination": {
                    "ID": "290036",
                    "UUID": "69444888-9a01-4384-bbd9-7bd19d90ee62",
                    "Type": "type_definition",
                    "Name": "Customer"
                }
            },
            {
                "Origin": {
                    "ID": "71526",
                    "Name": "Default Catalog",
                    "Type": "catalog",
                    "UUID": "638dc721-e453-4ec9-bd27-139e5668ee8e"
                },
                "Destination": {
                    "ID": "76146",
                    "Type": "catalog",
                    "Name": "Default Catalog"
                }
            }
        ]
    }
```
{% endswagger-response %}

{% swagger-response status="404" description="" %}
```
{    
    "message": "our stansart error"
}
```
{% endswagger-response %}
{% endswagger %}

