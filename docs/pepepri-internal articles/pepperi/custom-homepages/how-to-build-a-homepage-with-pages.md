---
title: "How to build a Homepage with Pages"
description: "Effort Estimation: depends on complexity"
order: 284
---
# How to build a Homepage with Pages

*Effort Estimation: depends on complexity*

## Prerequisites

In order to start building a homepage you need to have all the relevant addons installed e.g. Flows, Buttons block, Gallery etc. Due to there are lot of addons needed to be installed, there is a way to install them in one step - by installing another addon - `AppHeaderInstaller.` You need to install it via Postman, uuid is

```
6f15faad-a120-40e2-9e5e-dcb32be1f0bd
```

and version is `0.0.34` (need to specify it explicitly, as there are no phased versions yet)

## Building a homepage

Homepage consists of two parts: header and body. Header is always visible on webapp (except when custom form is opened), and on devices it is visible only on homepage.

!!!info
You can still use legacy header with new body, but it won't be visible on devices
!!!

### Creating Flows

For full understanding of what are flows and how they work please read this article first.

[Flows](/pepperi/custom-homepages/flows.md)

Flows are used for all the dynamic actions and calculations on the homepage. There are 3 general types of events which can have a flow that handles it:

-   **On Load** - when page or page block is loaded. Mainly used for setting page parameters or changing configuration of a specific block (in case of a page block). Blocks' flows will run after page flow.
-   **On Parameter Change** - when at least one of the page parameters was manually changed. In most of the cases it will be triggered when buyer selects another account in the filter block. Filter page block updates AccountUUID page parameter and all the flows that are assigned to On Parameter Change events will be triggered. Blocks' flows will run after page flow.
-   **On Click** \- assigned flow runs when user clicks on a specific area on the page.

!!!success
For a quick start you can go to Settings -> Configuration -> Flows and import basic flows from library
!!!

For basic homepage workability you will need to have flows that will handle basic needs like navigation to order, opening activity lists or replacing static text with dynamic values.

### Homepage Body

#### General - creating basic page

Settings -> Pages -> Page Builder

First, start with creating a blank page or importing existing one.

!!!warning
In case of importing from different environment you will need to replace all the images and make sure all the flows are set correctly (because it stores references from origin environment)
!!!

In some cases UI import may not work, so you can use API to duplicate the page:

1.  GET [https://papi.pepperi.com/v1.0/pages](https://papi.pepperi.com/v1.0/pages) and find a json object of the relevant page
2.  Prepare json body
    1.  Update the name if needed
    2.  If you duplicate the page in the same environment don't forget to change the "Key"

3.  POST json body as a single object to the same endpoint

Now you have a page to work with we can go through its configuration

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-12.17.20.png)

In the "General" section you can setup page parameters, flows, add sections and page blocks

In "Design" tab there are some styling configurations which will be applied to page, e.g. spacing between sections

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-12.17.44.png)

!!!info
List of available blocks can be different and depends on the addons installed. If you need a block which is not in the list yet, you need to install a corresponding addon.
!!!

#### Sections configuration

Sometimes it is hard to build a homepage which looks good both on desktop and devices. To resolve such issue, sections can be set up to be visible only on specified screen types. The common approach is to add some additional sections which will be shown only for mobile, while those that look good only on desktop, should be hidden.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-14.03.50.png)

If you click pencil icon, configuration sub-menu will be opened. There you can split the section into sub-sections which sometimes is a really useful feature

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-14.14.42.png)

Section configuration menu

#### Page blocks overview

Gallery, Slideshow, Buttons, Banner, Filter blocks are a bit similar in configuration terms and have General and Content tabs. General allows to specify main settings to be applied like styling and onload/onchange flows (if supported). Also, these blocks support show if logic. This allows to hide a specific element of a block depending on page parameters values and condition which was set.

**Gallery**

The block is used to show some static images with possibility to add titles.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-15.28.05.png)

Gallery block

Onload/onchange flows allow you to dynamically set titles or to implement some advanced filtering. However, it is better to use show if when possible.

In the Content tab, you can edit each of the gallery slides and set on click flow to run any custom action you need.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-15.33.34.png)

If a slide is satisfying the show if logic conditions, it will be shown.

**Slideshow**

The block is used to present slides that can automatically change each other.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-16.14.11.png)

Slideshow block

This block has a wider range of possible settings compared to gallery. For example, you can add a button, or make a slide itself clickable

Onload/onchange flows allow you to dynamically set titles or to implement some advanced filtering. However, it is better to use show if when possible.

**Buttons**

Allows to add clickable buttons to the page

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-16.52.35.png)

Buttons block

There are several styling settings, but if you need something more custom, you can use Gallery block instead by setting up any custom image and onclick flow.

Onload/onchange flows allow you to dynamically set titles or to implement some advanced filtering. However, it is better to use show if when possible.

**Banner**

The block is similar to Buttons block but with few more advances

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-17.02.33.png)

Banner block

Unlike buttons, you can add an icon (which can be imported from Icon selector or just an any image you have) and a second title with ability to manage font weight

**Filter**

The block represents a dropdown with some options to choose from

In most of the cases, you will use it for presenting a list of accounts for multi account buyer homepage

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-30-at-17.32.02.png)

Filter block

Each filter from the Content tab needs a flow which will return the list of available options. More on how to create a suitable flow you can read in dedicated article:

[Flows](/pepperi/custom-homepages/flows.md)

**Rich Text**

Allows to use custom HTML on the page. HTML code can be written directly inside block configuration, imported as a file from assets manager or returned by onload flow.

Usage: ideally fits to create a footer for the page

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-06-02-at-17.18.31.png)

Rich Text block

Onload/onchange events allow you to assign a flow which will replace static placeholders with some dynamic values

**Widgets**

This block allows you to add some external widgets to the page. It requires an HTML script tag which will be added to the page when it is loaded.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/oie_FhumDLtoDu3H.png)

Widget block

Your script can contain JavaScript or a link to remoter code.

If your widget is not displayed, try opening the page with network tab in devtools and see if there are:

-   any errors or messages in console
-   successful http request(s) to get the widget source code
-   if those requests are successful, try checking the response, maybe widget configuration is wrong

#### How to combine altogether

### Homepage Header

Settings -> Pages -> Application Header

Header takes up some defined space on the top of the homepage, and it is primarily needed for quick access to commonly used actions, like notifications, activity lists, logout button etc.

Create new header by clicking "Add" in the Application Header Configuration

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-01-at-16.21.48.png)

Creating new header

-   **General** tab - specify the name and description
-   **Menu** tab - custom action buttons are defined here. You can assign a flow for each button to be executed on click

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-01-at-20.26.49.png)

Example from above will look like this:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-01-at-20.39.07.png)

As parameters on the input for flows you can use static, AccountUUID or global parameters.

-   **Buttons** tab - currently only notification button is supported. Drag and drop the option from available fields to "Buttons" container to add notifications ring to the header.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-01-at-16.30.59.png)

!!!warning
Don't forget to publish you changes
!!!

## Connecting homepage to buyers

1.  Make sure legacy homepage is not used
    1.  Go to `Settings -> Branded App -> Webapp Main Bar` and check if relevant profile has empty configuration. It should look like this:

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-01-at-21.05.27.png)

    2.  Remove any mappings from configuration in the relevant profiles

2.  Go to `Settings -> Pages -> Slugs -> Mapping`
    1.  Add relevant profile (Buyer) if it is not present

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-01-at-21.09.46.png)

    2.  Edit Buyer's profile, drag and drop ApplicationHeader and HomePage slugs to the available space. Map your homepage header to ApplicationHeader and homepage body page to HomePage slug. Don't forget to save the mappings.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2025-05-01-at-21.12.37.png)

## Troubleshooting

-   when you want to remove the event handling flow from the page / page block:
    -   You can create an empty flow and assign it instead of existing one.
    -   Or remove it with Postman. Use GET [https://papi.pepperi.com/v1.0/pages](https://papi.pepperi.com/v1.0/pages) to get the relevant page JSON, remove flow's base64 text and POST modified object to the same endpoint.
