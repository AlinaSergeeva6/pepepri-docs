---
description: Query installed addons not in the scope of specific distributor.
---

# Query installed addons



## Var api - Query installed addons&#x20;

<mark style="color:blue;">`GET`</mark> `https://api.pepperi.com/v1.0/var/addons/installed_addons?where={WhereClause}&include_deleted={RetrieveDeleted}&order_by={OrderBy}&page_size={PageSize}&page={PageIndex}&include_count={IncludeCount}"`

#### Path Parameters

| Name          | Type   | Description    |
| ------------- | ------ | -------------- |
| Authorization | string | Var admin only |

{% tabs %}
{% tab title="200 " %}
```javascript
[
    {
        "DistributorID": 30014217,
        "UUID": "",
        "Addon": {
            "UUID": "",
            "Name": "",
            "Description": "",
            "SystemData": "",
            "Hidden": false,
            "Type": 1,
            "CreationDate": "",
            "ModificationDate": ""
        },
        "Version": "",
        "SystemData": "",
        "AdditionalData": "{}",
        "Hidden": false,
        "PublicBaseURL": "",
        "AutomaticUpgrade": true,
        "CreationDate": "",
        "ModificationDate": "",
        "LastUpgradeDateTime": ""
    },
    ......
]
```
{% endtab %}
{% endtabs %}
