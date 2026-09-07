---
description: >-
  This section contains the info about dataflow tasks configuration, needed to
  export images from Acumatica ERP system
---

# Integration Details

In order to do the image integration with the Acumatica ERP system, we need to have this set of the dataflow tasks, which can be found on the "[Services Demo](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90405)" environment.

<figure><img src="../../../../../.gitbook/assets/image (569).png" alt=""><figcaption></figcaption></figure>

### Get list of all images task

the given task is used to retrieve the needed images for each item based on Item external ID.&#x20;

{% hint style="warning" %}
The task should be utilized on the inital image upload only.
{% endhint %}

{% hint style="info" %}
After duplicating the dataflow task, please update the http tab with the needed connection URL.
{% endhint %}

### Get list of changed images

The given task gets the list of the images for each item, filtered based on the modification date. It allows to update images only for those items on Pepperi, which require image modification.

{% hint style="success" %}
This task should be utilized after the the initial imae upload has been done.
{% endhint %}

{% hint style="info" %}
After duplicating the dataflow task, please update the http tab with the needed connection URL.
{% endhint %}

### Get Image Link

The task loops over the **Get list of changed images** task and takes the direct link for the image via the http request to the ERP.

{% hint style="info" %}
After duplicating the dataflow task, please update the http tab with the needed connection URL.
{% endhint %}

### Group Image Link

The task takes "Get Image Link" as a source and groups the table with the links with the correspondent items.

### Format File

The task formats the links and item ids in the apropriate format for Pepperi.

### Upload

the task uploads the images to Pepperi.

