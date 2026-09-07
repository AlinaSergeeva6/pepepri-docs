# ❄️ Distinct Values

## Get Distinct Values for specified fields

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/data/distinct_values/{AddonUUID}/{table}`

#### Query Parameters

| Name                                          | Type   | Description            |
| --------------------------------------------- | ------ | ---------------------- |
| addon\_uuid<mark style="color:red;">\*</mark> | String | The addon's UUID       |
| table<mark style="color:red;">\*</mark>       | String | The table to search in |

#### Request Body

{% hint style="danger" %}
Only indexed fields are supported! (if a field from the list isn''t indexed throw an exception with the problematic fieldIDs)
{% endhint %}



| Name                                     | Type      | Description                                                                                                                  |
| ---------------------------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Fields<mark style="color:red;">\*</mark> | String\[] | <p>The items fields you wish to get.<br>Field IDs separated by a comma.<br>If not provided all fields will be returned. </p> |
| MaxValuesSize                            | Integer   | The number of distinct values per field we wish to get                                                                       |
| Where                                    | String    | A SQL clause filter, filtering only the records that should be in the distinct values response                               |
| IncludeDeleted                           | Boolean   | A boolean stating if deleted record are part of the response or not                                                          |

### Example Input:

```
{
    'Fields': ["DistributorUUID"], // Mandatory! the maximum number of fields for request is 10!
    'MaxValuesSize': 5, // 20 by default, 100 is the maximum
    'Where': "CreationDateTime >= 2022-11-24T12:45:32.166Z"
    'IncludeDeleted': false
}
```

### Example Response:

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

{% hint style="warning" %}
Note for these who write UI:

If the count is bigger then what you asked for (or 100 which is the maximum) consider not showing responses at all until the user narrows the search.

Returning a partial result might cause confusion or false assumption that the results shown are the only existing ones and not the most common ones.
{% endhint %}
