# Post Settings Of Object Type

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/Meta_Data/{resourceName}/types/{typeID}/Settings" method="post" summary="Post Settings" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="path" name="resourceName" type="string" %}
**Options**: Transactions, Activities.
{% endswagger-parameter %}

{% swagger-parameter in="path" name="typeID" type="string" %}

{% endswagger-parameter %}

{% swagger-parameter in="header" name="Authorization" type="string" %}
Authorization token
{% endswagger-parameter %}

{% swagger-response status="200" description="Cake successfully retrieved." %}
```javascript
{
    return the same object as GET
}
```
{% endswagger-response %}

{% swagger-response status="400" description="Activity Type Definition does not exist" %}
```javascript
{
    "fault": {
        "faultstring": "Activity Type Definition: 35662 does not exist. ",
        "detail": {
            "errorcode": "InvalidData"
        }
    }
}
```
{% endswagger-response %}
{% endswagger %}

## Error Codes:

| Scenario                                                              | Error code       | Fault String                                                                                              | HTTP Status Code |
| --------------------------------------------------------------------- | ---------------- | --------------------------------------------------------------------------------------------------------- | ---------------- |
| Type id does not exist/valid                                          | InvalidParameter | Sub type is not valid.                                                                                    | 404              |
| Type does not valid                                                   | InvalidParameter | Type is not valid.                                                                                        | 404              |
| Activity Type Definition does not exist                               | InvalidData      | Activity Type Definition: {type id} does not exist.                                                       | 404              |
| Transaction Items Scope Filter ID does not exist                      | InvalidData      | Transaction Items Scope Filter {filter ID} does not exist.                                                | 400              |
| Transaction Items Scope Filter ID does not associated to that type id | InvalidData      | Transaction Items Scope Filter {filter ID} does not associated to type id: {type id}                      | 400              |
| Transaction line filter does not exist                                | InvalidData      | There is no Activity Type Safe Attribute Config of Transaction line that associated to type id: {type id} | 400              |

