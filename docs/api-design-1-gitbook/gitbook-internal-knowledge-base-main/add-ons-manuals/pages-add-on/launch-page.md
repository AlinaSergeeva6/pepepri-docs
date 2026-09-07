---
description: Estimated time to implement for the new environment - 4h
---

# Launch Page

## What is a Launch Page

The launch page is a new feature available in Pepperi, which is a part of Pages and Slugs.

Basically it's a slug, which you can customize to do anything you want. For example, create a new transaction/activity from the URL, redirect from one URL to another URL and much more.

{% hint style="success" %}
Launch page slug is launch\_page
{% endhint %}

{% hint style="info" %}
Slug is a path in the Pepperi domain. You can use/change default paths **(not recommended)** or create your own slugs and use them as well.

Example of the default slugs:

* HomePage
* activities
* launch\_page
* etc.
{% endhint %}

To be more specific, this is a public URL that you can make to run custom scripts when the user navigates to it. In the script, you can work with multiple internal Pepperi services to make what you want. For example, you want to get some data from the UDT/UDC, make some validations, update transaction, redirect to the URL and all this in one place.

## How does it works

1. The user goes to this URL: https://app.pepperi.com/launch\_page?ScriptKey=Key\&otherparams=params
2. It runs the script.
3. The script executes its own code (show alert, create transaction, redirect to activity, etc.).

## Add-ons that should be installed

Make sure that all required add-ons are installed in your environment. All add-ons are listed in the table below.

| Add-on Name  | Add-on UUID                          |
| ------------ | ------------------------------------ |
| Pages        | 50062e0c-9967-4ed4-9102-f2bc50602d41 |
| Slugs        | 4ba5d6f9-6642-4817-af67-c79b68c96977 |
| Scripts      | 9f3b727c-e88c-4311-8ec4-3857bc8621f3 |
| Script Block | 21d174ae-a8dc-4842-a40d-1437a677abcf |

{% hint style="info" %}
In order to install add-on, please contact Services team manager/Support/Success manager
{% endhint %}

## How To Setup

To set up launch page, you need to do the following:

1. Create a script.
2. Create a page and assign a script to a page.
3. Map a page to a slug.
4. Use a slug.

Let's setup the first script to see how everything is working.

### Create a script

First of all, you need to create a script. Go to the **Configuration** -> **Scripts**

<figure><img src="../../.gitbook/assets/Launch Page - Create a script - 1.png" alt=""><figcaption></figcaption></figure>

Here you will see a list of all your scripts.

<figure><img src="../../.gitbook/assets/Launch Page - Create a script - 2.png" alt=""><figcaption></figcaption></figure>

Click on **Add** to add new script and you will see the following window.

Here you need to specify the following:

* Name, Description
* Parameters
* Code

<figure><img src="../../.gitbook/assets/Launch Page - Create a script - 3.png" alt=""><figcaption></figcaption></figure>

As an example, let's use this script code. Review it and pass it into your script.

```typescript
/** The main function that is executed when the script is run
 * @param data - object. Contains parameters, that were specified when creating script
 * @returns string
 */
export async function main(data) {
    let url_param = data.url_param;  // Take url_param key from data.
    await client.navigateTo({        // Pepperi function to change path in pepperi domain.
        url: url_param,
    });
    return "";
}
```

{% hint style="info" %}
The script supports **TypeScript**, so you can use all the tools that **TypeScript** provides. For example: interfaces, types, etc.
{% endhint %}

{% hint style="info" %}
For this example, don't forget to create a **parameter** as shown in the picture above.
{% endhint %}

Click **Save** to save the script. After that, you should see your script in the list.

### Create a page

Now in order to use a script, we need to create a page for it. Go to the **Pages** -> **Page Builder**

<figure><img src="../../.gitbook/assets/Launch Page - Create a page - 1.png" alt=""><figcaption></figcaption></figure>

Here you will see a list of all your pages.

<figure><img src="../../.gitbook/assets/Launch Page - Create a page - 2.png" alt=""><figcaption></figcaption></figure>

Click on **Add Page** to add new page and choose **Blank** template.

<figure><img src="../../.gitbook/assets/Launch Page - Create a page - 3.png" alt=""><figcaption></figcaption></figure>

Next you should see the following page. This is a constructor of the page.

<figure><img src="../../.gitbook/assets/Launch Page - Create a page - 4.png" alt=""><figcaption></figcaption></figure>

This is very powerful tool, but we are interested in the options on the left side.

Here you need to specify the following:

* Name, Description.
* Drag & Drop **ScriptBlockClient** into the page section. After that you should see the settings for **ScriptBlockClient**.&#x20;

{% hint style="info" %}
In **ScriptBlockClient** settings, you should specify a script and it's parameters. Choose your **Script** and add **Key** for it.
{% endhint %}

<div align="center"><figure><img src="../../.gitbook/assets/Launch Page - Create a page - 7.png" alt=""><figcaption></figcaption></figure></div>

<figure><img src="../../.gitbook/assets/Launch Page - Create a page - 6.png" alt=""><figcaption></figcaption></figure>

Click **Publish** to publish the page.

### Map a page to a slug

All that left is to map your page to a slug. Go to the **Pages** -> **Slugs** and open **Mapping** tab.

<figure><img src="../../.gitbook/assets/Launch Page - Map a page to a slug - 1.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Launch Page - Map a page to a slug - 2.png" alt=""><figcaption></figcaption></figure>

Here you will see a list of all profiles and the pages associated with them.

Click **Edit** on the **Rep** profile, then Drag & Drop **launch\_page** into the slug section and select your page.&#x20;

<figure><img src="../../.gitbook/assets/Launch Page - Map a page to a slug - 3.png" alt=""><figcaption></figcaption></figure>

Click **Save** to save your slug.

### How to use a page with script

You are now ready to use **Launch Page** with your script.

To trigger the slug, you need to navigate to the launch\_page path of the Pepperi domain and provide a few parameters.

{% hint style="info" %}
The number of parameters depends on the script.
{% endhint %}

Parameters:

* ScriptKey - key of the script, which were provided in the page builder in **ScriptBlockClient**. **(mandatory)**
* Other parameters - for example url\_param, etc. **(depends on the script and its parameters)**

{% hint style="info" %}
Your URL should look like this: https://app.pepperi.com/**launch\_page**?**ScriptKey**=Navigation&**url\_param**=transactions/cart/cc4d0f06-8ec2-4bd7-a251-ef1665a175fd
{% endhint %}

## Possible Problems

After installing **Scripts Add-on** and navigating to it, you could see the following page.&#x20;

<figure><img src="../../.gitbook/assets/Launch Page - No License.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Ask a senior developer to enable **Scripts Add-on** for your environment.
{% endhint %}
