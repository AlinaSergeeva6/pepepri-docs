---
description: Defined the generic template for resource
---

# Introduction

#### Introduction

In the pepperi eco-system there are resources. All resources must have a generic interface so that services can be provided that work with all the resources

The following endpoints are available on all resources, and can be used by generic services.

## Upsert a single entity

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name`

#### Path Parameters

| Name                                             | Type   | Description |
| ------------------------------------------------ | ------ | ----------- |
| resource\_name<mark style="color:red;">\*</mark> | String | a resource  |

#### Request Body

| Name                                   | Type   | Description                 |
| -------------------------------------- | ------ | --------------------------- |
| body<mark style="color:red;">\*</mark> | Object | The entity to update/create |

{% tabs %}
{% tab title="200: OK The updated entity" %}
```javascript
{
    // Response
}
```
{% endtab %}
{% endtabs %}

## Get a single resource entity by key

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/key/:key`

#### Path Parameters

| Name                                             | Type   | Description                         |
| ------------------------------------------------ | ------ | ----------------------------------- |
| resource\_name<mark style="color:red;">\*</mark> | String | The resource to find the entity in  |
| key<mark style="color:red;">\*</mark>            | String | The key of the entity to search for |

{% tabs %}
{% tab title="200: OK The entity found" %}
```javascript
{
    // Response
}
```
{% endtab %}

{% tab title="404: Not Found If the entity does not exist or is hidden?" %}
```javascript
{
    // Response
}
```
{% endtab %}
{% endtabs %}

## Get a single resource entity by external key

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/unique/:field_id/:key`

#### Path Parameters

| Name           | Type   | Description                                                    |
| -------------- | ------ | -------------------------------------------------------------- |
| field\_id      | String | <p>the unique field to get the entity by<br>eg. ExternalID</p> |
| key            | String | the value of the unique field                                  |
| resource\_name | String | the resource to search for                                     |

{% tabs %}
{% tab title="200: OK The entity requested" %}
```javascript
{
    // Response
}
```
{% endtab %}

{% tab title="400: Bad Request field_id is not unique" %}
```javascript
{
    // Response
}
```
{% endtab %}

{% tab title="404: Not Found key not found" %}
```javascript
{
    // Response
}
```
{% endtab %}
{% endtabs %}

## search a entities using POST (bigger queries)

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/search`

#### Path Parameters

| Name                                             | Type   | Description           |
| ------------------------------------------------ | ------ | --------------------- |
| resource\_name<mark style="color:red;">\*</mark> | String | the resource to query |

#### Request Body

| Name            | Type    | Description                                                                                                                                                      |
| --------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Where           | String  | <p>an SQL like where clause</p><p>Mutually exclusive with KeyList &#x26; ExternalKey list</p>                                                                    |
| Page            | Integer | The page                                                                                                                                                         |
| PageSize        | Integer | The page size                                                                                                                                                    |
| KeyList         | String  | <p>List of keys to search for. <br>Mutually exclusive with where &#x26; ExternalIDList</p>                                                                       |
| UniqueFieldList | String  | <p>List of external IDs to search for. <br>Only works if there is an ExternalKey field for this resource<br>Mutually exclusive with where &#x26; KeyList<br></p> |
| UniqueFieldID   | String  | <p>The id of the unique field to search for<br>Mandatory for working with UniqueFieldList</p>                                                                    |
| IncludeCount    | Boolean | include the full count in the response                                                                                                                           |
| Fields          | Array   | <p>The fields to return<br>Default returns all field</p>                                                                                                         |

{% tabs %}
{% tab title="200: OK " %}
```javascript
{
    "Objects":[
        // list of entities - same as /resources/:resource_name
    ],
    
    // returns if IncludeCount = true
    "Count": 10982
}
```
{% endtab %}
{% endtabs %}

## Upsert a single entity

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name`

#### Path Parameters

| Name                                             | Type   | Description  |
| ------------------------------------------------ | ------ | ------------ |
| resource\_name<mark style="color:red;">\*</mark> | String | UjXDZhP6Ar7a |

#### Request Body

| Name                                   | Type   | Description  |
| -------------------------------------- | ------ | ------------ |
| body<mark style="color:red;">\*</mark> | Object | ZBaCdrSSw5gV |

## Get a single resource entity by key

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/key/:key`

#### Path Parameters

| Name                                             | Type   | Description  |
| ------------------------------------------------ | ------ | ------------ |
| resource\_name<mark style="color:red;">\*</mark> | String | 19jYr7QSjdV2 |
| key<mark style="color:red;">\*</mark>            | String | YDmMa3DQfahH |

## Get a single resource entity by external key

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/unique/:field_id/:key`

#### Path Parameters

| Name           | Type   | Description  |
| -------------- | ------ | ------------ |
| field\_id      | String | mg6FUWgAGy7C |
| key            | String | CF20zzFmGCXZ |
| resource\_name | String | Y3FTu89n50FC |

## search a entities using POST (bigger queries)

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/search`

#### Path Parameters

| Name                                             | Type   | Description  |
| ------------------------------------------------ | ------ | ------------ |
| resource\_name<mark style="color:red;">\*</mark> | String | mnyJ9jXXSbJ7 |

#### Request Body

| Name            | Type    | Description  |
| --------------- | ------- | ------------ |
| Where           | String  | F2C4WNv1hZuY |
| Page            | Integer | hNdCu67kuq70 |
| PageSize        | Integer | yBpljqXQ83NR |
| KeyList         | String  | amEJJgKBuQFs |
| UniqueFieldList | String  | Nad6fMVl6BKm |
| UniqueFieldID   | String  | fOxaxh84tOAh |
| IncludeCount    | Boolean | Korz5bWYc5sa |
| Fields          | Array   | uWbKBFLaWky9 |

## Search for distinct values in an entity

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/distinct_values`

#### Path Parameters

| Name                                             | Type   | Description           |
| ------------------------------------------------ | ------ | --------------------- |
| resource\_name<mark style="color:red;">\*</mark> | String | the resource to query |

#### Request Body

| Name                                     | Type      | Description                                                                                                                  |
| ---------------------------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Fields<mark style="color:red;">\*</mark> | String\[] | <p>The items fields you wish to get.<br>Field IDs separated by a comma.<br>If not provided all fields will be returned. </p> |
| MaxValuesSize                            | Integer   | The number of distinct values per field we wish to get                                                                       |
| Where                                    | String    | A SQL clause filter, filtering only the records that should be in the distinct values response                               |
| IncludeDeleted                           | Boolean   | A boolean stating if deleted record are part of the response or not                                                          |

{% tabs %}
{% tab title="200: OK" %}
```
{
  "Fields": [
    {
      FieldID: "DistributorUUID",
      Count: 15,
      Values: [
        {
          Value: "f512ca8c-57ab-4d27-907b-cf62c3f575ad",
          Count: 12,
        },
        ...
      ]
    },
    ...
  ]
}
```
{% endtab %}
{% endtabs %}

## Services that are available on all Generic Resources

### DIMX

Link to endpoints in DIMX

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/import/data`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/import/file`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/export/file`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/import/multipart_overwrite/initialize`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/import/multipart_overwrite/finalize`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/import/data`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/import/file`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/export/file`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/import/multipart_overwrite/initialize`

<mark style="color:green;">`POST`</mark> `https://papi.pepperi.com/V1.0/resources/:resource_name/import/multipart_overwrite/finalize`

#### Builtin Pepperi Resources

A list of all builtin pepperi resources

* accounts
* users
* items
* resources - list of all resources (builtin and user defined)

#### User Defined Resources

All user defined resources are available as resources

### Implementing a generic resource

Any addon can add a generic resource by setting the GenericResource field on the scheme to true

The addon must then implement the 5 basic function in its addon API

These functions will then be mapped by the generic-resources addon to the addons implementation

The following are the functions the addon is expected to implement for a generic resource

If one of the endpoints aren't relevant to the resource it should throw a relevant error.

### Upsert

#### Server Side relative URL

/addons/api/:addonUUID/api/:resourceName

#### &#x20;CPI Side relative URL

/addons/api/:addonUUID/addon-cpi/:resourceName

### Get by key

#### Server Side relative URL

/addons/api/:addonUUID/api/get\_{:resourceName}\_by\_key?key=:key

#### CPI Side relative URL

/addons/api/:addonUUID/addon-cpi/:resourceName/key/:key

### Get by unique field

{% hint style="info" %}
if your resource does not have unique fields other that key, do not implement this endpoint&#x20;
{% endhint %}

#### Server Side relative URL

/addons/api/:addonUUID/api/get\_{:resourceName}\_by\_unique\_field?field\_id=:fieldID\&value=:value

#### CPI Side relative URL

/addons/api/:addonUUID/addon-cpi/:resourceName/unique/:fieldID/:fieldValue

### Search

#### Server Side relative URL

/addons/api/:addonUUID/api/{:resourceName}\_search

#### CPI Side relative URL

/addons/api/:addonUUID/addon-cpi/:resourceName/search
