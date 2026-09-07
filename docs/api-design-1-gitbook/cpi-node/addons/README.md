---
description: Addons cpi side code
---

# Addons

{% hint style="success" %}
[https://pepperi-addons.github.io/cpi-node/](https://pepperi-addons.github.io/cpi-node/)
{% endhint %}

Addons can add cpi-side JavaScript files. These files can are run within the CPI Node when it is loaded, and have access to client API, ADAL (specified for CPI Data), subscribe to application events, perform client actions, etc.

The cpi-side files need to be specified in the Addon config files Publish section like so:

```javascript
"PublishConfig": {
    "Editors": [
      ...
    ],
    "CPISideFiles": [
      {
        "FileName": "cpi-side.js"
      }
    ],
  }
```

This will ensure that the Addons code file is available within the CPI when the addon is installed on the distributor

