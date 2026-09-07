---
description: >-
  to examine the information in greater detail, please, check
  https://developers.google.com/analytics
---

# Google Analytics

**REMARKS**\
**Google Analytics** is a web analytics service offered by Google that is used to track website activity such as session duration, pages per session, bounce rate etc. of individuals using the site, along with the information on the source of the traffic.

It can be integrated with Google Ads, with which users can create and review online campaigns by tracking landing page quality and conversions (goals).

**Goals** might include sales, lead generation, viewing a specific page, or downloading a particular file. Google Analytics' approach is to show high-level, dashboard-type data for the casual user, and more in-depth data further into the report set.

![](<../.gitbook/assets/Screenshot 2021-09-17 at 12.31.31.png>)

![](<../.gitbook/assets/Screenshot 2021-09-17 at 12.32.18.png>)

### &#xD;**How Google Analytics works**

To get any data from your website into Google Analytics, you must first place the tag on your site. As soon as that tag is properly placed, Google Analytics will start collecting data. The data is then put into reports made up of metrics and dimensions.

**REMARKS**\
**Metrics** are what produce the numbers you’ll find in the platform. Anything that can be measured with a number is a metric. Think of the number of users, number of purchases, value of conversions, average time on site, etc.

**A dimension** is how metrics can be segmented. Think of the word “by”: Number of users BY source. Average time on site BY landing page. Number of conversions BY device type.

In Order to use these GA dashboards to see the result of tracking the client should give you an access (of course if the client doesn’t want you to manage the **Tracking ID** and the **Global Site Tag** yourself, but in most cases, clients have everything managed and you are asked just to create trackers)

### #1 Step: The Google Analytics tag <a href="#the_google_analytics_tag" id="the_google_analytics_tag"></a>

The Google Analytics tag should be added near the top of the `<head>` tag and before any other script or CSS tags, and add the property ID of the Google Analytics property you wish to work with.

```
<!-- Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-XXXXX-Y', 'auto');
ga('send', 'pageview');
</script>
<!-- End Google Analytics -->
```

### The above code does four main things:

1. Creates a `<script>` element that starts asynchronously downloading the analytics.js JavaScript library from `https://www.google-analytics.com/analytics.js`
2. Initialises a global `ga` function (called the `ga()` command queue) that allows you to schedule commands to be run once the analytics.js library is loaded and ready to go.
3. Adds a command to the `ga()` command queue to create a new tracker object for the property specified via the `'GA_MEASUREMENT_ID'` parameter.
4. Adds another command to the `ga()` command queue to send a pageview to Google Analytics for the current page.

Custom implementations may require modifying the last two lines of the Google Analytics tag (the `create` and `send` commands) or adding additional code to capture more interactions. However, you should not change the code that loads the analytics.js library or initializes the `ga()` command queue function.

**Alternative async tag:**\


```
<!-- Google Analytics -->
<script>
window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
ga('create', 'UA-XXXXX-Y', 'auto');
ga('send', 'pageview');
</script>
<script async src='https://www.google-analytics.com/analytics.js'></script>
<!-- End Google Analytics -->
```

Almost everything you need to measure with analytics.js can be done using the `ga()` command queue. This guide explains what the command queue is, how it works, and how to execute commands to measure user interactions.

### The `ga` command queue <a href="#the_ga_command_queue" id="the_ga_command_queue"></a>

The Google Analytics tag defines a global `ga` function known as the "command queue". It's called the command queue because rather than executing the commands it receives immediately, it adds them to a queue that delays execution until the analytics.js library is fully loaded.

See the [`ga()` command queue reference](https://developers.google.com/analytics/devguides/collection/analyticsjs/command-queue-reference) for a comprehensive list of the optional parameters allowed for each of the commands.

### #2 Step: creating Trackers

**Tracker objects** (also known as "**trackers**") are objects that can collect and store data and then send that data to Google Analytics.

The analytics.js library provides a variety ways to create trackers, but the most common way is to use the create command and pass the tracking ID and cookie domain fields as the second and third parameters:

```
ga('create', 'UA-XXXXX-Y', 'auto');
```

You may also, optionally, name the tracker by passing the name field as the fourth argument in the create command. Naming a tracker is necessary in cases where you need to create more than one tracker for the same page. For more details on why you might need to do this, see the section below on working with multiple trackers.

```
ga('create', 'UA-XXXXX-Y', 'auto', 'myTracker');
```

Creating a tracker without setting the name field is known as creating a "default" tracker. A default tracker is internally given the name "t0".

Example: shows setting the tracker and tracking the clickable buttons on the HomePage of the client&#x20;

```
googleAnalytics('create', 'UA-XXXXXXXX-X', 'auto', 'clientTracker'); 
  window.onload = function() {
    // var buttonItemsCollection = document.getElementsByClassName("dropbtn");
    var buttonItemsCollection = document.querySelectorAll(".nav-btns .dropbtn, .nav-btns .drpdwn-content a, .nav-btns .dropbtnSub, .nav-btns .drpdwn-contentSub a");
    for (var index = 0; index < buttonItemsCollection.length; index++) {
      var button = buttonItemsCollection[index];
      button.addEventListener('click', function (event) {
        var btnName = event.target.innerText;
        googleAnalytics('clientTracker.send', 'event', 'HomePageBtnNavigation', 'click', `${btnName}`);
      });
    }
  };
```

### Working with multiple trackers

In some cases you might want to send data to multiple properties from a single page. This is useful for sites that have multiple owners overseeing sections of a site; each owner could view their own property.

To track data for two separate properties, you need to create two separate trackers, and at least one of them must be a named tracker. The following two commands create a default tracker and a tracker named "clientTracker":

```
ga('create', 'UA-XXXXX-Y', 'auto');
ga('create', 'UA-XXXXX-Z', 'auto', 'clientTracker');
```

#### Running commands for a specific tracker <a href="#running_commands_for_a_specific_tracker" id="running_commands_for_a_specific_tracker"></a>

To run analytics.js commands for a specific tracker, you prefix the command name with the tracker name, followed by a dot. When you don't specify a tracker name, the command is run on the default tracker.

To send pageviews for the above two trackers, you'd run the following two commands:

```
ga('send', 'pageview');
ga('clientTracker.send', 'pageview');
```

Future guides will go into more detail on the syntax for running specific commands. You can also refer to the [command queue reference](https://developers.google.com/analytics/devguides/collection/analyticsjs/command-queue-reference) to see the full command syntax for all analytics.js commands.
