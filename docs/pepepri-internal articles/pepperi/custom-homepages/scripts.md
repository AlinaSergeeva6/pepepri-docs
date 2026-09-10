---
title: "Scripts"
order: 280
---
# Scripts

*This article contains very basic information about scripts. For more advanced information, please check the following sections:*

[Scripts - How to Write](/pepperi/custom-homepages/scripts-how-to-write.md)[Scripts - VS Code](/pepperi/custom-homepages/scripts-vs-code.md)

## Description

Script module supports:

-   JavaScript;
-   TypeScript.

---

## Getting Started

!!!info
There is no possibility to edit scripts for regular users.

To edit scripts – log in as SupportAdminUser
!!!

### Creating a new script

1) Go to Settings -> Configuration -> Scripts:

![](/static/image-145.png)

2) Click "Add":

![](/static/image-146.png)

3) The following window will be opened:

![](/static/image-147.png)

-   Name: add script name;
-   Description: add script description;
-   Parameters: add parameters to be used in the script;
-   Code: add script code;

---

### Parameters

1) Click "Add" and fill inputs:

![](/static/image-148.png)

2) To use the parameter in code:

```
data.your_param;
```

---

## Example

You need to add a script to a button to redirect the user to a different page.

-   Create a parameter 'url\_param':

![](/static/image-149.png)

-   Add script example:

```
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

-   Add a script to the page element:

![](/static/image-150.png)

-   Enter a value to a param:

![](/static/image-151.png)

-   Using param in a script code:

```
let url_param = data.url_param;
```

-   Now when the user clicks a button:
    -   the script is run,
    -   "/list/all\_activities" value is set to url\_param,
    -   user is redirected to a new page.
