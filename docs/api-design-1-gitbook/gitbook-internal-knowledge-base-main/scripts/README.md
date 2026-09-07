# Scripts

_This article contains very basic information about scripts. For more advanced information, please check the following sections:_

{% content-ref url="scripts-how-to-write.md" %}
[scripts-how-to-write.md](scripts-how-to-write.md)
{% endcontent-ref %}

{% content-ref url="scripts-vs-code.md" %}
[scripts-vs-code.md](scripts-vs-code.md)
{% endcontent-ref %}

## Description

Script module supports:&#x20;

* JavaScript;
* TypeScript.

***

## Getting Started

{% hint style="info" %}
There is no possibility to edit scripts for regular users.

To edit scripts – log in as SupportAdminUser
{% endhint %}

### Creating a new script

1\) Go to Settings -> Configuration -> Scripts:

<div align="left"><figure><img src="../.gitbook/assets/image (1076).png" alt="" width="173"><figcaption></figcaption></figure></div>

2\) Click "Add":&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (1077).png" alt="" width="234"><figcaption></figcaption></figure></div>

3\) The following window will be opened:&#x20;

<div align="left"><figure><img src="../.gitbook/assets/image (1078).png" alt="" width="410"><figcaption></figcaption></figure></div>

* Name: add script name;
* Description: add script description;
* Parameters: add parameters to be used in the script;
* Code: add script code;

***

### Parameters

1\) Click "Add" and fill inputs:

<div align="left"><figure><img src="../.gitbook/assets/image (1080).png" alt="" width="204"><figcaption></figcaption></figure></div>

2\) To use the parameter in code:&#x20;

```typescript
data.your_param;
```

***

## Example&#x20;

You need to add a script to a button to redirect the user to a different page.

* Create a parameter 'url\_param':

<div align="left"><figure><img src="../.gitbook/assets/image (1081).png" alt="" width="203"><figcaption></figcaption></figure></div>

* Add script example:

```javascript
/** The main function that is executed when the script is run
 * @param data - object. Contains parameters, that were specified when creating script
 * @returns string
 */
export async function main(data) {
    let url_param = data.url_param;  // Take url_param key from data.
    await client.navigateTo({        // Pepperi function to change path in pepperi domain.
        url: url_param              //example '/lists/all_activities
    });
    return "";
}
```

* Add a script to the page element:

<div align="left"><figure><img src="../.gitbook/assets/image (1083).png" alt="" width="563"><figcaption></figcaption></figure></div>

* Enter a value to a param:

<figure><img src="../.gitbook/assets/image (1084).png" alt=""><figcaption></figcaption></figure>

* Using param in a script code:

```typescript
let url_param = data.url_param;
```

* Now when the user clicks a button:&#x20;
  * the script is run,&#x20;
  * "/list/all\_activities" value is set to url\_param,
  * user is redirected to a new page.
