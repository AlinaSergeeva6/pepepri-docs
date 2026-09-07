---
description: >-
  All the examples you can find in 'Integration Examples' (6685), Webhook task -
  "SalesOrderSend"
---

# Retry failed transactions

If you know that webhook can be failed for one reason or another, but resubmit will fix this issue, then you can use the following setting:

**exp\_retry,** that reacts on 1/0.

You need to add a condition that returns 1 on error case, which means that in about 5 minutes this webhook will be resubmitted again. It will run until the transaction is Successful.

Example:

```
IIF(document_AllRows_Rows_Message_Status LIKE '%Error%',1,IIF(document_AllRows_Rows_Message_Status LIKE '%Bad%',1,0))
```

