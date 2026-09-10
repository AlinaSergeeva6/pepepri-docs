---
title: "Barcode images generation"
description: "Effort Estimation: 2h"
order: 15
---
# Barcode images generation

*Effort Estimation: 2h*

### Description:

This implementation uses the [OrcaScan open API](https://orcascan.com/guides/free-barcode-image-api-0e4a4fa6) to generate barcode images and upload them to Pepperi as items' images.

### Advantages and disadvantages

!!!success
Allows quick generation of barcode images with very little effort
!!!

!!!warning
Supports only 15 requests per second
!!!

!!!danger
Can add as a separate HTML field to the item info page. **Do not add to the order center/cart views!**
!!!

!!!danger
**3rd-party open-source API used. Notify the customer about it before implementation!**
!!!

### Demo - how does it work:

Basically, you need a single scheduled job to generate and upload images. Below are the steps to see the final result:

1.  Log in to Pepperi as ukr\_templates@pepperi.com.
2.  Start "Sales Order" for any account.
3.  Select the catalog filter "Hats".
4.  Click on the 1st item's image and select the last one. Here's your barcode:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/Screenshot-2026-01-30-at-17.46.03.png)

### How to copy to another environment:

1.  Copy this schedule job to your client: [Barcode images generation](https://integration.pepperi.com/mgr/PluginSettings/ScheduledJobs?ScheduledJobId=71823&clientId=7343).
2.  If needed, adjust the "where" filter in the HTTP tab of the dataflow "Get items without barcode" and/or the destination image field in "Upload barcode images".
3.  Run the job. That's it 🙂
