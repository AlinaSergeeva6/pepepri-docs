---
title: "Homepage issue - \"Account not found\""
description: "Customers often face an issue \"Account not found\" on the Homepage when they're trying to log in as buyers. There are few possible solutions for it, so let's take a look on them."
order: 286
---
# Homepage issue - "Account not found"

*Customers often face an issue "Account not found" on the Homepage when they're trying to log in as buyers. There are few possible solutions for it, so let's take a look on them.*

!!!info
First of all, make sure that required account really exists and wasn't deleted.
!!!

The most common problem is when **userId**, that is taken from **context,** equals `null`. Usually, after page reloading the value comes up. In this case we need to add additional logic to `dynamic-header-template.js` file (located in **template** folder). Inside of `onPluginLoad` function add next part of code:

```
// -- onPluginLoad function start
this.onPluginLoad = async function (context) {
  // -- Getting context
  this.context = context;

  // -- Part of code to add START
  if (!this.context.userId) {
    let reloadCount = window.sessionStorage.getItem("reloadCounter") ? parseInt(window.sessionStorage.getItem("reloadCounter")) + 1 : 1;
    window.sessionStorage.setItem( "reloadCounter", reloadCount );

    if (reloadCount <= 3) {
      window.location.reload(true);
    }
  }
  // -- Part of code to add END
```

The code above is doing page reloading if **userId** is null. The amount of reloads is limited to 3 times (in order to avoid infinite loop).

There can be a situation when **userId** is not populating even after reloading. In this case we will need to adjust the logic and take this value from session storage:

```
// -- onPluginLoad function start
this.onPluginLoad = async function (context) {
  // -- Getting context
  this.context = context;

  // -- Part of code to add START
  if (!this.context.userId) {
    let sessionStorageUserData = null;
    for (let parameter in sessionStorage) {
        if (parameter.includes('oidc.user')) sessionStorageUserData = parameter;
    }

    if (sessionStorageUserData) {
      this.context.userId = JSON.parse(sessionStorage[sessionStorageUserData]).profile['pepperi.id'];
    } else {
      let reloadCount = window.sessionStorage.getItem("reloadCounter") ? parseInt(window.sessionStorage.getItem("reloadCounter")) + 1 : 1;
      window.sessionStorage.setItem( "reloadCounter", reloadCount );

      if (reloadCount <= 3) {
        window.location.reload(true);
      }
    }
  }
  // -- Part of code to add END
```

Also, if your `onPluginLoad` function in `dynamic-header-template.js` file contains logic for setting `accountUUID`, you'll need to add additional check:

```
// -- onPluginLoad function workflow
var data = JSON.parse(context.pluginData);
this.accountUUID = this.getSessionStorage("accountUUID") || "";

// -- Add check for userId here
if (this.context.userId) {
    if (data.accountUUID) {
        this.accountUUID = data.accountUUID;
        customHeader.setSessionStorage("accountUUID", data.accountUUID);
    } else if (!data.accountUUID && !this.accountUUID) {
        alert('Could not find account');
    }
}
```
