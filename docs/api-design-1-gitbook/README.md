---
description: Standards of Pepperi REST
---

# Pepperi Resource

### Endpoints

1. GET and POST work on the same object but GET will return the objects in an array, and the body sent in the POST is **single** object.
2. If you use {id} you will get a **single** object identical to the POST.
3. In POST there is no {id} on the endpoint (it is part of the object).
4. POST should always return the upserted object - just as if a call to single GET was made
5. To upsert more than one object one should use DIMX.
6. As in all REST the endpoint uses the plural form (i.e. ends with 's').

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1/pepperi_resources/:id`

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1/pepperi_resources/:id`

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1/pepperi_resources/:id`

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1/pepperi_resources/:id`

This endpoint allows you to get free cakes.

#### Path Parameters

| Name | Type   | Description                                |
| ---- | ------ | ------------------------------------------ |
| id   | string | ID of the cake to get, for free of course. |

#### Query Parameters

| Name   | Type    | Description                                                           |
| ------ | ------- | --------------------------------------------------------------------- |
| recipe | string  | The API will do its best to find a cake matching the provided recipe. |
| gluten | boolean | Whether the cake should be gluten-free or not.                        |

#### Headers

| Name           | Type   | Description                                                    |
| -------------- | ------ | -------------------------------------------------------------- |
| Authentication | string | Authentication token to track down who is emptying our stocks. |

{% tabs %}
{% tab title="200 Cake successfully retrieved." %}
```
{    "name": "Cake's name",    "recipe": "Cake's recipe name",    "cake": "Binary cake"}
```
{% endtab %}

{% tab title="404 Could not find a cake matching this query." %}
```
{    "message": "Ain't no cake like that."}prepperi_resource 
```
{% endtab %}
{% endtabs %}

#### Path Parameters

| Name | Type   | Description  |
| ---- | ------ | ------------ |
| id   | string | uIwlb6KHwzWB |

#### Query Parameters

| Name   | Type    | Description  |
| ------ | ------- | ------------ |
| recipe | string  | sG7p9E4EHO1q |
| gluten | boolean | esD1r4OUpFgx |

#### Headers

| Name           | Type   | Description  |
| -------------- | ------ | ------------ |
| Authentication | string | inF1vTsypPNc |

#### Path Parameters

| Name | Type   | Description  |
| ---- | ------ | ------------ |
| id   | string | ulmM9tesaXED |

#### Query Parameters

| Name   | Type    | Description  |
| ------ | ------- | ------------ |
| recipe | string  | rW0PaTR7QDh6 |
| gluten | boolean | 2CQMEcrdjIF0 |

#### Headers

| Name           | Type   | Description  |
| -------------- | ------ | ------------ |
| Authentication | string | 9EG5Yyn6aRtB |

#### Path Parameters

| Name | Type   | Description  |
| ---- | ------ | ------------ |
| id   | string | uGFGUvJm6CuC |

#### Query Parameters

| Name   | Type    | Description  |
| ------ | ------- | ------------ |
| recipe | string  | U5ilQycWdqpz |
| gluten | boolean | hi11E2JGUe0F |

#### Headers

| Name           | Type   | Description  |
| -------------- | ------ | ------------ |
| Authentication | string | KNds9L7ioXhg |

### Properties of Body/Payload

Every Pepperi Resource should have the following fields by default, and it should not be documented. If for some reason one of the fields cannot be provided by the resource, it should be documented&#x20;

```javascript
{
     // the following 2 parameters are readonly
     "CreationDateTime":"",
     "ModificationDateTime":"",
     // Default is false, when returning resources hidden are not returned by default
     "Hidden": false,
     
}
```

### URL Parameters - GET of multi only

Every endpoint must support these URL parameters, if there is an issue, it should document what it cannot support "for now"&#x20;

<table><thead><tr><th width="179.33333333333331">name</th><th>Description</th><th>Example</th></tr></thead><tbody><tr><td>where</td><td>the filter for the query</td><td>CreationDateTime>='2021-02-10T16:46:56Z' and CreationDateTime&#x3C;'2021-02-11T09:33:45Z'</td></tr><tr><td>fields</td><td>The fields be returned by the query </td><td>Name,CreationDateTime</td></tr><tr><td>order_by</td><td>the returned objects will be ordered according to this field</td><td>CreationDateTime</td></tr><tr><td>page_size</td><td>the size of the objects to be returned</td><td>100</td></tr><tr><td>page</td><td>the page number, 1-based</td><td>1</td></tr><tr><td>include_count</td><td>return on headers:<br>X-Pepperi-Total-Records, X-Pepperi-Total-Pages</td><td>true</td></tr><tr><td>include_deleted</td><td>returns the hidden objects as well</td><td>true</td></tr></tbody></table>

### Headers Parameters - Optional per endpoint for addons only

<table><thead><tr><th width="150">Name</th><th></th><th data-hidden></th></tr></thead><tbody><tr><td>X-Pepperi-OwnerID</td><td>The Addon Performing the request</td><td></td></tr><tr><td>X-Pepperi-ActionID</td><td>Action UUID to be used in logs and Audit Log</td><td></td></tr><tr><td>X-Pepperi-SecretKey</td><td>Must be used when updating a private addon resource </td><td></td></tr></tbody></table>

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1/pepperi_resources/:id`

#### Path Parameters

| Name | Type   | Description  |
| ---- | ------ | ------------ |
| id   | string | Fsrv7jcgtlIc |

#### Query Parameters

| Name   | Type    | Description  |
| ------ | ------- | ------------ |
| recipe | string  | jehyKggNbHMh |
| gluten | boolean | u33uPkvBVxcm |

#### Headers

| Name           | Type   | Description  |
| -------------- | ------ | ------------ |
| Authentication | string | THP1mJPFl0Dv |

{% tabs %}
{% tab title="200 Cake successfully retrieved." %}

{% endtab %}

{% tab title="404 Could not find a cake matching this query." %}

{% endtab %}
{% endtabs %}
