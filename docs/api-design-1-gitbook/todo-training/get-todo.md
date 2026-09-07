---
description: Standard pepperi resource of "todo" items
---

# Get todo

## returns a single todo by key

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/todos/{key}`

returns the object matching the given key. in the resposnse tab there is an example of a returned object. The returned object will alsoe include the standard pepperi properties of every resource (CreationDateTime, ModificationDateTime and Hidden)  if no key exists 404 should be the status otherwise 200

#### Path Parameters

| Name | Type   | Description                  |
| ---- | ------ | ---------------------------- |
| key  | string | the key of the specific todo |

{% tabs %}
{% tab title="200 " %}
```
{
    "Key":"unique_key1",
    "Name":"header of the todo",
    "Description":"the todo text content",
    "DueDate":"2021-07-13T00:00:00Z",
    "Completed":false
}
```
{% endtab %}
{% endtabs %}

## return list of todos

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/todos?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}`

This is a standard pepperi resource GET endpoint, since it is training  we will explain in more details\
returns array of JSON objects with size equal or small to the page\_size  \
check the response tab for the todo properties&#x20;

#### Query Parameters

| Name             | Type   | Description                                            |
| ---------------- | ------ | ------------------------------------------------------ |
| include\_deleted | string | return also the "hidden" items                         |
| order\_by        | string | a field ID to be used as the sorted field              |
| page             | number | page index                                             |
| page\_size       | number | size of the returned page                              |
| where            | string | standard where close                                   |
| fields           | string | list of the fields to be returned, default, all fields |

{% tabs %}
{% tab title="200 " %}
```
[
{
    "Key":"unique_key1",
    "Name":"header of the todo",
    "Description":"the todo text content",
    "DueDate":"2021-07-13T00:00:00Z",
    "Completed":false
},
{},
{}
]
```
{% endtab %}
{% endtabs %}

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/todos?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}`

#### Path Parameters

| Name   | Type   | Description           |
| ------ | ------ | --------------------- |
| where  | string | standard where clause |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/todos?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}`

#### Path Parameters

| Name   | Type   | Description |
| ------ | ------ | ----------- |
| where  | string | clause      |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/todos?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}`

#### Path Parameters

| Name   | Type   | Description |
| ------ | ------ | ----------- |
| where  | string | clause      |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/todos?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}`

#### Path Parameters

| Name   | Type   | Description |
| ------ | ------ | ----------- |
| where  | string | pepperi     |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/todos?where={whereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page_Index={PageIndex}`

#### Path Parameters

| Name   | Type   | Description |
| ------ | ------ | ----------- |
| where  | string | pepperi     |

{% tabs %}
{% tab title="200 " %}
```
```
{% endtab %}
{% endtabs %}
