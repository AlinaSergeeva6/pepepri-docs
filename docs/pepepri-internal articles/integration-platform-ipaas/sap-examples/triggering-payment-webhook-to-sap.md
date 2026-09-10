---
title: "Triggering payment webhook to SAP"
description: "You can find existing solution in “Integration Examples” (6685)"
order: 142
---
# Triggering payment webhook to SAP

*You can find existing solution in “Integration Examples” (6685)*

### Why do we need this?

Client want to add some payment to his transaction and send information to his database (SAP in this case). Pepperi Intergration and SAP platform allow you to send payment webhook only with next settings:

● Source Object: Pepperi **Activity** Webhook

● Target Object: SAP B1 Desktop Import Payment

But you don't have any activity, so lets create it!

### Webhook and way to trigger it

#### Activity creation

Our payment UI task is located in transaction, so after we get success response from our payment system we should create new activity (In general, it should be separate activity type only for this purpose). So lets use “pepperi.app.activities.add” pepperi api call and… We will get activity with “New” status, so our InternalID will be with “-” (-34 etc.). That's why we should use http POST request:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/1-41.png)

**bodyofRequest** should be next:

```
const bodyToCreateActivities = {
                    "ExternalID": user.context.transaction.uuid,
                    "Type": 'Payment Activity',
                    "AccountInternalID": user.context.account.id,
                    "Status": 2,
                    ...params
                }
```

To params you should pass required by client params (of course, you also should create these TSA fields in that activity)

So, we created payment activity with “Submited” status and we have acceptable InternalID. Now we should create our webhook.

#### Webhook settings

Target and Source Objects should be next:

● Source Object: Pepperi **Activity** Webhook

● Target Object: SAP B1 Desktop Import Payment

Settings Tab:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2-30.png)

Mapping Tab:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/3-22.png)

All that fields (SAP fields) you can find in other article or with next link: [http://www.saptables.net/?schema=BusinessOne9.1&column=CardCode](http://www.saptables.net/?schema=BusinessOne9.1&column=CardCode)

#### Triggering part

So we created activity, get it InternalID and can run our webhook. We need to create use **get\_data()** UI function to run next dataflow task:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/4-17.png)

**bodyofRequest** should be next:

```
	{
                Data: {
                    ID: res.object.InternalID
                }
            }
```

Where res.object.InternalID - InternalID of our payment activity (We just pass it like from pepperi).

Result: you created Payment Activity and send webhook with payment information to SAP.
