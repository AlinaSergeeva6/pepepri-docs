---
description: This page describes how to set up flow 'Open External Link'
---

# Open External Link

### Navigation

1. [#script-setup](open-external-link.md#script-setup "mention")
2. [#flow-setup](open-external-link.md#flow-setup "mention")
3. [#adding-to-pages](open-external-link.md#adding-to-pages "mention")
4. [#testing](open-external-link.md#testing "mention")

### Script Setup

1. Navigate to Pepperi backoffice -> Configuration -> Scripts
2. &#x20;Add new script:
   1. Title and descriptio&#x6E;**: Open External Link**
   2.  Parameters:

       <figure><img src="../../.gitbook/assets/image (867).png" alt=""><figcaption></figcaption></figure>
3. Add this **code**:

```typescript
export async function main(data)  {
    console.log(data);
    const options = {
        uri: data.url
    };
    await client.openURI(options);
    return "";
}
```

4. Save the script

### **Flow** Setup

1. Navigate to Pepperi backoffice -> Configuration -> **Flows**
2. Add new flow with name and description **Open External Link**
3. You will be redirected to Steps tab of the **Flow editor**
4.  Go to **Parameters tab** and add the following variable:

    <figure><img src="../../.gitbook/assets/image (868).png" alt=""><figcaption></figcaption></figure>
5.  In **Steps tab** add user script block with the following values:

    <figure><img src="../../.gitbook/assets/image (869).png" alt=""><figcaption></figcaption></figure>
6. **Save** changes and update the flow

### **Adding to pages**

1. Navigate to Pepperi backoffice -> Pages -> **Page Builder**
2. Select a Page you would like to add the Flow to and click on **Edit**
3. Edit the block you would like to add the flow to and find **Click Event**:\
   Usually situated in Content -> Expand element -> **Click Event** Settings
4.  Add the following flow with the Link to navigate the user by:

    <figure><img src="../../.gitbook/assets/image (870).png" alt=""><figcaption></figcaption></figure>
5. **Publish** the homepage to move changes to the live page.

### Testing

You can test the flows :

* In **Preview**:&#x20;
  * in homepage editor **save** the changes
  * click on **preview**&#x20;
  * click on the element you configured and you will be redirected by the link
* On the **live page**:&#x20;
  * ensure you **published** the homepage changes
  * sign in to **app.pepperi.com** as the buyer with the corresponding homepage&#x20;
  * click on the element you selected - the link you configured will be opened.&#x20;

Alternatively you can test **Open External Link** configuration in Flow Test or Script Debugger, see article [debugging-scripts-and-flows.md](../../scripts/debugging-scripts-and-flows.md "mention")

