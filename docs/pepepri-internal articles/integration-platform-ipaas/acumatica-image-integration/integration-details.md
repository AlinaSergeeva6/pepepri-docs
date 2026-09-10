---
title: "Integration Details"
description: "This section contains the info about dataflow tasks configuration, needed to export images from Acumatica ERP system"
order: 121
---
# Integration Details

*This section contains the info about dataflow tasks configuration, needed to export images from Acumatica ERP system*

In order to do the image integration with the Acumatica ERP system, we need to have this set of the dataflow tasks, which can be found on the "[Services Demo](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90405)" environment.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-502.png)

### Get list of all images task

the given task is used to retrieve the needed images for each item based on Item external ID.

!!!warning
The task should be utilized on the inital image upload only.
!!!

!!!info
After duplicating the dataflow task, please update the http tab with the needed connection URL.
!!!

### Get list of changed images

The given task gets the list of the images for each item, filtered based on the modification date. It allows to update images only for those items on Pepperi, which require image modification.

!!!success
This task should be utilized after the the initial imae upload has been done.
!!!

!!!info
After duplicating the dataflow task, please update the http tab with the needed connection URL.
!!!

### Get Image Link

The task loops over the **Get list of changed images** task and takes the direct link for the image via the http request to the ERP.

!!!info
After duplicating the dataflow task, please update the http tab with the needed connection URL.
!!!

### Group Image Link

The task takes "Get Image Link" as a source and groups the table with the links with the correspondent items.

### Format File

The task formats the links and item ids in the apropriate format for Pepperi.

### Upload

the task uploads the images to Pepperi.
