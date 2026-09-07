---
description: >-
  Example of usage - UI task 'Add Contact' in Integration Account 'Integration
  Examples'
---

# Connect As Buyer API

{% hint style="info" %}
SelectAll=false - will connect the contacts with the UUIDs from the UUID array.

SelectAll=true- will connect all the distributor's contacts except of those with UUIDs in the UUID array.

The  "Filter" parameter will work ONLY when selectAll=true , It will connect all the contact persons that matches the condition in the where clause, except of contacts with UUIDs mentioned in the UUID array.
{% endhint %}

## Connect Contact as Buyer

<mark style="color:green;">`POST`</mark> `https://api.pepperi.com/v1.0/contacts/ConnectAsBuyer`

#### Request Body

| Name        | Type   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ----------- | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| JSON Object | object | <p><code>{</code><br><code>"EmailSubject": "{EmailSubject}",(optional)</code><br><code>"EmailCC":"{EmailCC}", (optional)</code><br><code>"UUIDs": [{ListOf UUID}],(required)</code><br><code>"SelectAll": false/true, (required)</code><br><code>"Filter": "{whereClause}",(optional)</code><br><code>"ProfileID" : Profile ID (ulong)(optional - set the buyers to a specific profile)</code><br><code>"SecurityGroupID" :SecurityGroup UUID (optional)</code><br><code>}</code><br></p> |

{% tabs %}
{% tab title="200 " %}
```
returns the new password
```
{% endtab %}
{% endtabs %}

