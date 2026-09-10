---
title: "Send an e-mail about abandoned cart transactions within a period of time"
description: "All the examples you can find in 'Integration Examples' (6685)"
order: 239
---
# Send an e-mail about abandoned cart transactions within a period of time

*All the examples you can find in 'Integration Examples' (6685)*

Task: customer want to send emails to clients when they start order and didn’t finishes it.

In this examples we will see configurations to send client email with order number and items he already put to the cart.

***First task*** – getting transactions Headers:

![](/static/1-17.png)

```
URL: !%new_api_base_uri%!transactions?where=Status=1 AND GrandTotal!=0 AND Type = 'Sales Order'  AND ActionDateTime>='{#getdate(-48,yyyy-MM-ddZ,hour)#}'  AND ActionDateTime<='{#getdate(-24,yyyy-MM-ddThh:mm:ssZ,hour)#}'&page={#page_num#}&page_size=250&full_mode=true
```

In Url above you can see filters.

**Status=1** – it’s mean transaction is in creation,

**GrandTotal!=0** – at least one item was added to the cart,

**ActionDateTime** \- period of time for which you want to check transactions.

***Second task*** – getting transaction Lines:

![](/static/2-12.png)

Here we use data from first task

![](/static/3-8.png)

Also you might see **is\_loop\_over\_table\_per\_execution** setting – use it when test your tasks. When you have no data for current period of time system will take last data it has and use it. To prevent this use this setting.

***Third task*** – configure email subject, body, and send Email to agent/client:

Here we use data from second task. You can enter email subject and where do you want to sent it, it could be static email address or dynamic value.

![](/static/4-6.png)

Use Editor to configure you email body:

![](/static/5-6.png)

![](/static/6-5.png)

**Note**: Tasks examples you can see at examples integration:

![](/static/7-3.png)
