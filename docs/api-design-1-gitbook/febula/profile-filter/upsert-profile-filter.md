---
description: Upsert a profile-filter
---

# Upsert Profile-Filter

## UPSERT/GET filter rules.

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/addons/febula/profile-filters`

#### Request Body

| Name                                           | Type      | Description                                                         |
| ---------------------------------------------- | --------- | ------------------------------------------------------------------- |
| EmployeeType<mark style="color:red;">\*</mark> | Number    | <p>1 = Admin</p><p>2 = Rep</p><p>3 = Buyer</p>                      |
| Resource<mark style="color:red;">\*</mark>     | String    | Name of the resource this profile-filter applies to                 |
| Key                                            | String    | Unique UUID of this profile-filter                                  |
| Filter<mark style="color:red;">\*</mark>       | Reference | Key of the filter that should be used for this resource and profile |
| PermissionSet                                  | String    | Sync \| Online. Default is Sync                                     |

{% tabs %}
{% tab title="200: OK get successful" %}
```javascript
[
        {
            Key: "ee069636-fbd8-4764-8157-87694583ead4",
            EmployeeType: 1,
            Resource: "BU",
            Filter: "fe069636-fbd8-4764-8157-87694583ead4",
            PermissionSet: "Sync"
        },
        {
            Key: "ee069636-fbd8-4764-8157-87694583ead5",
            EmployeeType: 2,
            Resource: "Account",
            Filter: "fe069636-fbd8-4764-8157-87694583ead6",
            PermissionSet: "Sync"
        },
        {
            Key: "ee069636-fbd8-4764-8157-87694583ead6",
            EmployeeType: 1,
            Resource: "BU",
            Filter: "fe069636-fbd8-4764-8157-87694583ead8",
            PermissionSet: "Sync"
        }
]

```
{% endtab %}

{% tab title="400: Bad Request operation failed" %}
```javascript
{
    // Response
}
```
{% endtab %}
{% endtabs %}
