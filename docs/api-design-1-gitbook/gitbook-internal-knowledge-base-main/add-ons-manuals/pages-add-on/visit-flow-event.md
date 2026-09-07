---
description: Estimated time to implement for the new environment - 4h
---

# Visit Flow Event

## What is a Visit Flow Events

The visit flow is a new feature available in Pepperi, which is a part of Pages and Slugs.

This slug allow you to create your own visit flow. In Visit Flow you can:

* Create a transaction
* Create an activity
* Create a survey
* etc.

## How does it works

1. The user goes to this URL: https://app.pepperi.com/visit\_flow?AccountUUID=uuid
2. It runs the script.
3. You see a steps, you need to make in order to finish a visit. Go over each step.
4. Finish visit flow.

## Add-ons that should be installed

Make sure that all required add-ons are installed in your environment. All add-ons are listed in the table below.

| Add-on Name | Add-on UUID                          |
| ----------- | ------------------------------------ |
| Pages       | 50062e0c-9967-4ed4-9102-f2bc50602d41 |
| Slugs       | 4ba5d6f9-6642-4817-af67-c79b68c96977 |
| Scripts     | 9f3b727c-e88c-4311-8ec4-3857bc8621f3 |
| VisitFlow   | 2b462e9e-16b5-4e7a-b1e6-9e2bfb61db7e |

{% hint style="info" %}
In order to install add-on, please contact Services team manager/Support/Success manager.
{% endhint %}

## How To Setup

To set up launch page, you need to do the following:

1. Create a visit flow scripts.
2. Create a page and assign a script to a page.
3. Create a slug and map a page to a slug
4. Use a slug.

### Create a visit flow scripts

First of all, you need to create a visit flow scripts. Go to the **Configuration** -> **Scripts**.

<figure><img src="../../.gitbook/assets/Launch Page - Create a script - 1.png" alt=""><figcaption></figcaption></figure>

Click on **Add** to add new script.

You need to create two scripts:

* **OnVisitFlowViewLoad** - prepare all data from the visit flow.

<figure><img src="../../.gitbook/assets/Visit Flow - Create a script - 1.png" alt=""><figcaption></figcaption></figure>

* **OnVisitFlowStepClick** - Navigate to the pressed activity, either create a new activity or navigate to existing activity. In case there is more than one base activity, VisitFlow will navigate to the first activity.

<figure><img src="../../.gitbook/assets/Visit Flow - Create a script - 2.png" alt=""><figcaption></figcaption></figure>

You can find the code for this two scripts here.

{% file src="../../.gitbook/assets/Visit Flow - OnVisitFlowViewLoad (1).ts" %}

{% file src="../../.gitbook/assets/Visit Flow - OnVisitFlowStepClick.ts" %}

### Create a page

Now in order to use a script, we need to create a page for it. Go to the **Pages** -> **Page Builder**

Click on **Add Page** to add new page and choose **Blank** template.

Here you need to specify the following:

* Name, Description.
* Drag & Drop **VisitFlow** into the page section. After that you should see the settings for **VisitFlow** and select a UDC for it.&#x20;

<figure><img src="../../.gitbook/assets/Visit Flow - Create a page - 1.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If you don't have a UDC for a Visit Flows, create it.
{% endhint %}

### Create a slug and map a page to a slug

All that left is to map your page to a slug. Go to the **Pages** -> **Slugs** and create new slug.

It should have the following:

* **Display Name** - Visit Flow
* **Slug** - visit\_flow

<figure><img src="../../.gitbook/assets/Visit Flow - Create a slug and map a page to a slug - 1.png" alt=""><figcaption></figcaption></figure>

Open **Mapping** tab. Click **Edit** on the **Rep** profile, then Drag & Drop **visit\_flow** into the slug section and select your page.

<figure><img src="../../.gitbook/assets/Visit Flow - Create a slug and map a page to a slug - 2.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Visit Flow - Create a slug and map a page to a slug - 3.png" alt=""><figcaption></figcaption></figure>

Click **Save** to save your slug.

### How to use a page with script

You are now ready to use **Visit Flow** with your script.

To trigger the slug, you need to navigate to the visit\_flow path of the Pepperi domain and provide a few parameters.

{% hint style="info" %}
The number of parameters depends on the script.
{% endhint %}

Parameters:

* Other parameters - for example AccountUUID, etc. **(depends on the script and its parameters)**

{% hint style="info" %}
Your URL should look like this: https://app.pepperi.com/**visit\_flow**?**AccountUUID**=45b3fe4c-b76d-4e64-a013-29890ca5fee1
{% endhint %}
