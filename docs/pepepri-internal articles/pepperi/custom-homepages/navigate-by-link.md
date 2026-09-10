---
title: "Navigate By Link"
description: "This page describes how to set up flow 'Navigate By Link'"
order: 271
---
# Navigate By Link

*This page describes how to set up flow 'Navigate By Link'*

### Navigation

1.  Script Setup
2.  Flow Setup
3.  Adding to pages
4.  Testing

### Script Setup

1.  Navigate to Pepperi backoffice -> Configuration -> **Scripts**
2.  Add new script:
    1.  **Title** and **description**: Navigate By Link
    2.  **Parameters**:

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-236.png)

3.  Add the following **code**:

```
export async function main(data) {

    let url_param = data.url_param;
//await client.alert("test",data.url_param);
        await client.navigateTo({
           // url: '/transactions/scope_items/6d63f639-1956-4563-86aa-fa4b06174d12'//'/list/all_activities'// +data.url_param
            url: url_param//'/list/all_activities'
        })
return ''
}
```

1.  **Save** the script

### Flow Setup

1.  Navigate to Pepperi backoffice -> Configuration -> **Flows**
2.  Add new flow with name and description **Navigate By Link**
3.  You will be redirected to Steps tab of the **Flow editor**
4.  Go to **Parameters tab** and add the following variables:

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-237.png)

5.  In **Steps tab** add user script block with the following values:

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-238.png)

6.  **Save** changes and update the flow

### Adding to pages

1.  Navigate to Pepperi backoffice -> Pages -> **Page Builder**
2.  Select a Page you would like to add the Flow to and click on **Edit**
3.  Edit the block you would like to add the flow to and find **Click Event**: Usually situated in Content -> Expand element -> **Click Event** Settings
4.  Add the flow **Navigate By Link**
5.  **url\_param**: used to open pepperi link, for instance **/list/all\_activities** (must have leading '/' to work in mobile)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-239.png)

6.  Once you added the parameters you need, **save** the flow configuration popup.
7.  **Publish** the homepage to move changes to the live page.

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

Alternatively you can test the **Navigate By Link** configuration in Flow Test or Script Debugger, see article [Debugging Scripts and Flows](/pepperi/custom-homepages/debugging-scripts-and-flows.md)
