---
title: "Connect As Buyer API"
description: "Example of usage - UI task 'Add Contact' in Integration Account 'Integration Examples'"
order: 84
---
# Connect As Buyer API

*Example of usage - UI task 'Add Contact' in Integration Account 'Integration Examples'*

!!!info
SelectAll=false - will connect the contacts with the UUIDs from the UUID array.

SelectAll=true- will connect all the distributor's contacts except of those with UUIDs in the UUID array.

The "Filter" parameter will work ONLY when selectAll=true , It will connect all the contact persons that matches the condition in the where clause, except of contacts with UUIDs mentioned in the UUID array.
!!!

## Connect Contact as Buyer

`POST` `https://api.pepperi.com/v1.0/contacts/ConnectAsBuyer`

#### Request Body

| Name | Type | Description |
| --- | --- | --- |
| JSON Object | object | `{ "EmailSubject": "{EmailSubject}",(optional) "EmailCC":"{EmailCC}", (optional) "UUIDs": [{ListOf UUID}],(required) "SelectAll": false/true, (required) "Filter": "{whereClause}",(optional) "ProfileID" : Profile ID (ulong)(optional - set the buyers to a specific profile) "SecurityGroupID" :SecurityGroup UUID (optional) }` |

```
returns the new password
```
