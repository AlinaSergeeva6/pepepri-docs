---
title: "UI task in custom header"
order: 212
---
# UI task in custom header

**UI task in custom header**

You can add the hidden UI task in the JS file of the custom header that will work as normal UI task (do some logic and will be triggered by URL location).

In the JS code create a function that will track the location of “**window.location.href**” using “**setTimeout**” function.

Before this add an empty “**div**” element in the HTML part, set it as “**display**: none” and add the **id**:

```
<div id="accountBalanceRefresher" style="display:none !important"></div>code
```

And then the function:

```
var accountDashboardRefresh = new accountHandler();
function accountHandler() {
  this.Check;

  this.Check = setInterval(function () {
    detect()
  }, 1000);

  var detect = function () {};
}
```

If the location is correct, check the “**div**”, it must be empty (we need to add UI task only once and do not rewrite it many times) and then add an “**iframe**” element into “**div**”.

```
var accountDashboardRefresh = new accountHandler();
function accountHandler() {
  this.Check;

  this.Check = setInterval(function () {
    detect()
  }, 1000);

  var detect = function () {

        // check for the needed location
    if ((window.location.href).includes("https://app.pepperi.com/accounts/home_page/")) {

          // check that task is not runs already
      if (!document.getElementById("yourDivID").innerHTML) {

              // if not - add it to the HTML and task runs
          document.getElementById("yourDivID").innerHTML =
          `<iframe id="yourIframeID" style="display:none !important"
          src="https://integration.pepperi.com/...&account_external_id=ABCD123
          &accountId=${accountId}
          &accountUUID=${accountUUID}">
          </iframe>`;
      }
    }
        // if the location changes - remove the task
    else {
      document.getElementById("yourDivID").innerHTML = '';
    }
  };
}
```

“**Iframe**” needs to have id and also to be displayed as none. In the “**src**” attribute add the link of the UI task, take it from the “details” page of the task and use only “RunAddOn URL” (not “iFrame URL”).

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-323.png)

If you need to send value to the UI task – add it as parameters in the end of URL in “**src**” attribute of “**iframe**”, it might looks like:

‘src=”http://integration.pepperi.com/ui\_task....&account\_external\_id=ABCD123&**accountID**\=${**your\_parameter\_variable**}&accountUUID=${**your\_another\_variable}**’

Then you can get parameters with “get\_url\_parameter” function in UI task:

```
async function on_load() {
    var accountID = await get_url_parameter({
        parameter_name: "accountID",
    });
    var accountUUID = await get_url_parameter({
        parameter_name: "accountUUID",
    });
  }
```

For sending data back from UI task you can use “postMessage” method.

In the UI task:

```
// sending the post message
window.top.postMessage(res, "https://app.pepperi.com");
```

Where “res” is an object like:

```
var res = {
        // custom name to catch this message by name
    name: "my Name",
        // and other custom values to send
    value: "some value",
    uuid: "another value",
};
```

And the second parameter of post message function is a string with a URL of main window page.

You can use “\*” instead URL if you receive cors errors, but only for testing:

```
window.top.postMessage(res, "*");
```

After this you need to change it to the correct URL, it’s important.

Now, to catch the message create a listener in the main code:

```
    // add listener
var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
var eventer = window[eventMethod];
var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";
eventer(messageEvent, function(e) {
  var key = e.message ? "message" : "data";
  var data = e[key];
    // checking the name of postMessage data
  if (data.name == "my Name") {
    // put your code here

  }
},false);
```

And put it there in your code.
