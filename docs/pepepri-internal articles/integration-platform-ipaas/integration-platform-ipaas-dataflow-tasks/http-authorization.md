---
title: "HTTP Authorization"
description: "All the examples you can find in 'Integration Examples' (6685);"
order: 241
---
# HTTP Authorization

*All the examples you can find in 'Integration Examples' (6685);*

HTTP Integration requests often require auth credentials based on authorization policies of the server.

The common auth method is Basic which requires login and password.

There are two ways to set auth credentials in Integration.

Inadvisable:

You can simply hardcode your base64 encoded login and pass for each dataflow task/webhook etc.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2-11.png)

Notice that in this case when client change the auth credentials of his server, you will need to change this credentials for ALL OF THE dataflow tasks, webhooks, etc.

The best approach:

Set two general HTTP settings:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/3-7.png)

With your login and password and apply the expression like:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/4-5.png)

In header section of dataflow/webhook task.
