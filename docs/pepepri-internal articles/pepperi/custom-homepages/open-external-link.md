---
title: "Open External Link"
description: "This page describes how to set up flow 'Open External Link'"
order: 270
---
# Open External Link

*This page describes how to set up flow 'Open External Link'*

### Navigation

1.  Script Setup
2.  Flow Setup
3.  Adding to pages
4.  Testing

### Script Setup

1.  Navigate to Pepperi backoffice -> Configuration -> Scripts
2.  Add new script:
    1.  Title and description**: Open External Link**
    2.  Parameters:

        ![](/static/image-240.png)

3.  Add this **code**:

```
export async function main(data)  {
    console.log(data);
    const options = {
        uri: data.url
    };
    await client.openURI(options);
    return "";
}
```

1.  Save the script

### Flow Setup

1.  Navigate to Pepperi backoffice -> Configuration -> **Flows**
2.  Add new flow with name and description **Open External Link**
3.  You will be redirected to Steps tab of the **Flow editor**
4.  Go to **Parameters tab** and add the following variable:

    ![](/static/image-241.png)

5.  In **Steps tab** add user script block with the following values:

    ![](/static/image-242.png)

6.  **Save** changes and update the flow

### Adding to pages

1.  Navigate to Pepperi backoffice -> Pages -> **Page Builder**
2.  Select a Page you would like to add the Flow to and click on **Edit**
3.  Edit the block you would like to add the flow to and find **Click Event**: Usually situated in Content -> Expand element -> **Click Event** Settings
4.  Add the following flow with the Link to navigate the user by:

    ![](/static/image-243.png)

5.  **Publish** the homepage to move changes to the live page.

### Testing

You can test the flows :

-   In **Preview**:
    -   in homepage editor **save** the changes
    -   click on **preview**
    -   click on the element you configured and you will be redirected by the link

-   On the **live page**:
    -   ensure you **published** the homepage changes
    -   sign in to **app.pepperi.com** as the buyer with the corresponding homepage
    -   click on the element you selected - the link you configured will be opened.

Alternatively you can test **Open External Link** configuration in Flow Test or Script Debugger, see article [Debugging Scripts and Flows](/pepperi/custom-homepages/debugging-scripts-and-flows.md)
