# Search

{% hint style="danger" %}
Where does not work for more than 10,000 rows
{% endhint %}

{% swagger method="post" path="/addons/data/search/{AddonUUID}/{table}" baseUrl="https://api.pepperi.com/v1.0" summary="Get data from dynamo by keys" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="KeyList" type="String[]" required="true" %}
The items keys
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Fields" type="String" %}
The items fields you wish to get.\
Field IDs separated by a comma.\
If not provided all fields will be returned.&#x20;
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Where" type="String" %}
The SQL clause filter. \
Mutually exclusive with KeyList
{% endswagger-parameter %}

{% swagger-parameter in="query" name="addon_uuid" required="true" type="String" %}
The addon UUID
{% endswagger-parameter %}

{% swagger-parameter in="body" name="OrderBy" %}
The returned objects will be ordered according to this field
{% endswagger-parameter %}

{% swagger-parameter in="body" name="IncludeCount" type="Boolean" %}

{% endswagger-parameter %}

{% swagger-parameter in="query" name="table" required="true" type="String" %}
The table to search in
{% endswagger-parameter %}

{% swagger-parameter in="body" name="PageSize" type="Integer" %}
The size of the page we wish to get, see PageSize section below
{% endswagger-parameter %}

{% swagger-parameter in="body" name="Page" type="Integer" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="PageKey" %}
Mutually exclusive with the Page parameter, and with the KeyList parameter (empty string and undefined are considered the same)
{% endswagger-parameter %}

{% swagger-response status="200: OK" description="" %}
```javascript
{
  "Objects": [
    {
      "Hidden":false, 
      "CreationDateTime":"2020-11-08T11:55:10.501Z",
      "ModificationDateTime":"2020-11-08T11:55:10.501Z",
      "Key":"hello",
      ...
    },
    { 
    ... 
    }
  ],
  "Count": 0, // if include count = true, on non indexed data we will return -1 

  // NextPageKey will return only if no Page & PageSize body params where sent
  // and there might be more data in that answer the specific query
  // The NextPageKey value should be included in the next request under "pageKey"
  // In some cases you might get "NextPageKey" even if there is no more data
  // (for example, when asking for the exect number of rows left)
  "NextPageKey": "", 
}
```
{% endswagger-response %}
{% endswagger %}

## PageSize

The PageSize states the the size of the page we wish to get.\
However, it behaves in two different manners depending on the type of the request:

#### Page:

The PageSize states the maximum number of items that are returned

#### PageKey:

The PageSize states the minimum amount of items we are trying to return.\
However, we might get up to twice the amount we asked for.

For example: if a PageSize of 100 was requested we'll try to return 100 items but we might return up to 199 items. Obviously, if less than 100 items answers the query we'll return less than 100 items.
