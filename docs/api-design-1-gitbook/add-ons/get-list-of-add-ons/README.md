# Get list of Add-ons

{% swagger baseUrl="https://api.pepperi.com/v1.0" path="/addons?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}" method="get" summary="Get list of add-ons" %}
{% swagger-description %}
This endpoint retrieves list of all add-ons available in your account
{% endswagger-description %}

{% swagger-parameter in="header" name="Authorization" type="string" %}

{% endswagger-parameter %}

{% swagger-response status="200" description="" %}
```javascript
[
  {
    "UUID": "",
    "Type": "",
    "Name": "",
    "Description": "",
    "SystemData": "{ Versions: ....}",
    "CreationDate": "",
    "ModificationDate": "",
    "Hidden": false
  },
  ....
]
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

{% hint style="info" %}
Usage:  &#x20;

~~a. "Regular user" will receive what is public and not hidden (Tools PRD item 4.2.1.1 – to show list of available tools)~~&#x20;

~~b. "Var-admin" will receive what is not belongs to distributors, i.e. what is public and system (Tools PRD item 4.1 – to show list of var tools)~~

~~GET WILL RETRIEVE FILE AS LINK AND BLANK BASE64CONTENT - SAME AS ALL THE OTHER APIS~~
{% endhint %}

