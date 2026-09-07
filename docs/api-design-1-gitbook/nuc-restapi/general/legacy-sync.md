---
description: Internal endpoints for the legacy WACD/CPAPI service
---

# Legacy Sync

The following endpoints are to be called only by WACD/CPAPI service and testings if needed. Do not use this api from any other place. If needed, a better review should be conducted because we are using internal data structures (e.g. Light Data Table)

### LightDataTable&#x20;

This Object is used by the nucleus to return data in an efficient JSON which is not a standard JSON&#x20;

```json
// example of Light Data Table JSON
{
       "Headers": [
              {
                     "ColumnName": "ExternalID"
              },             {
                     "ColumnName": "Stock"
              },             {
                     "ColumnName": "Price"
              }
       ],
       // Rows is array of array (Matrix) where each line defines and object and each cell is the property of the object
       // each object is defined by the Headers index - Name and Type 
       // Rows [3][2] is an object that its name is Headers[2]."ColumnName" and its type is Headers[2].ColumnType
       "Rows": {
              "m_Rows": [
                      {
                             "ItemsArray": ["val1","123","6.89"]
                      },
                      {
                             "ItemsArray": ["val2","1423","16.29"]
        
                      }
               ],
              "Count": 2
       }
}
```

## Sync Transaction Lines&#x20;

<mark style="color:green;">`GET`</mark> /wcad/delta/order\_items

get all of the keys that were changed sync the last sync time, will require to use a "get light data table" with keys using pagination to get the real data

**Headers**

| Name          | Value              |
| ------------- | ------------------ |
| Content-Type  | `application/json` |
| Authorization | `Bearer <token>`   |

**Request Parameters**

| Name               | Type   | Description                                    |
| ------------------ | ------ | ---------------------------------------------- |
| agent\_key         | string | AgentDataKey of WACD                           |
| modification\_date | string | ISO date time - last sync time from the client |

**Response**

close to the open sync delta response but without the resource since it is for specific resource

{% tabs %}
{% tab title="200" %}
```json
{
   "Keys": ["",""], 
   "HiddenKeys": ["",""]
}
```
{% endtab %}

{% tab title="400" %}
```json
{
  "error": "Invalid request"
}
```
{% endtab %}
{% endtabs %}



### Real Example

{% embed url="http://localhost:8070/V1/RestAPI.svc/wcad/order_items?agent_key=aaa&modification_date=2021-06-25T18:11:30.736Z" fullWidth="false" %}

