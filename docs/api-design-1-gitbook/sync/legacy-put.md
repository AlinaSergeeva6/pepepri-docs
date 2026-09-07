---
description: Integration from legacy PUT to push data to ADAL
---

# Legacy PUT



### Legacy PUT

{% hint style="info" %}
Legacy PUT sends the data in a specific format (like MapData objects).\
So, you need to call /push\_wacd instead of /push.

This endpoint converts the data from the special format to the regular format, and then calls the regular push.\
\
Besides, the behavior will be the same between the endpoints


{% endhint %}

The request body should be like the following array:

```json
[
  {
    "MapDataWrntyID": 1024706574,
    "SecondaryKey": "640e4c6a-aee9-43b2-a3d3-fb272f01be9c",
    "Values": "{\"ModificationDateTime\":\"2022-08-17T12:41:51.398Z\",\"Hidden\":false,\"lastName\":\"Zuchmir\",\"CreationDateTime\":\"2022-08-17T12:41:51.398Z\",\"firstName\":\"Moshe\"}"
  },
  {
    "MapDataWrntyID": 1024706575,
    "SecondaryKey": "440e4c6a-aee9-43b2-a3d3-fb272f01be9c",
    "Values": "{\"ModificationDateTime\":\"2022-08-17T12:41:51.398Z\",\"Hidden\":false,\"lastName\":\"Gross\",\"CreationDateTime\":\"2022-08-17T12:41:51.398Z\",\"firstName\":\"Chaim\"}"
  }
]

```

The response will be an array of extended DIMX objects like the following array:

```json
[
    {
        "ADALKey": "640e4c6a-aee9-43b2-a3d3-fb272f01be9c",
        "Key": 620851020,
        "Status": "Update"
    },
    {
        "ADALKey": "440e4c6a-aee9-43b2-a3d3-fb272f01be9c",
        "Status": "Error",
        "Key": "",
        "Details": "Schema not found for hashCode (MapDataWrntyID) 1024706575"
    }
]
```

Note: The order of the objects will be the same order as sent in the request.
