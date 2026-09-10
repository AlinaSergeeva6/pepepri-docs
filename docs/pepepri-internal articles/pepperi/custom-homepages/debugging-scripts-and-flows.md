---
title: "Debugging Scripts and Flows"
order: 277
---
# Debugging Scripts and Flows

Navigation:

Scripts

Flows

!!!danger
Requires the extensions for new Pages. See [Pages Add-on](/add-ons-manuals/pricing-module-ppm-add-on/pages-add-on.md)
!!!

## Scripts

1.  Go to Pepperi Backoffice -> Configuration -> Scripts
2.  Select the script you need to debug, then click on pencil and Debugger:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-206.png)

1.  The debugging space will be opened:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-207.png)

#### Debugging space consists of:

-   **Code Editor**: you can view and edit script code here.
-   **Result**: shows any errors of the script
-   **Logs**: shows the output of all console.log functions in the script
-   **Parameters**: you can add the required input values here

!!!warning
If you need to add the **accountUUID** in parameters, you need first to make sure the needed **account** is visible for the admin by **opening it** from the account list, as admin users do not always have access to all the accounts.
!!!

-   **Publish button:** The changes you add will not be saved unless you click on the **Publish** button.
-   **Run button**: You can run the script. You do **not** need to publish the changed script to run it.

!!!success
If you want to save the changes of the script, click **Publish**; otherwise just **Run** the script to see if it works.
!!!

Once you add the needed values, click **Run** to execute the script. You will see errors and logs in the respective sections.

!!!info
If the script runs successfully it will open a new tab using the resulting link or Pepperi homepage if the link is not valid. If the script opens external link it will open both homepage and the external links.
!!!

## Flows

1.  Go to Pepperi Backoffice -> Configuration -> Flows
2.  Select the flow you need to debug, then click on pencil and Test:

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-208.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-209.png)

#### Debugging space consists of:

-   **Flow Parameters**: you can add required input values here
-   **Test Output** includes input object, run logs and output object.
-   **Run Flow button**: You can run the flow.

Once you run the flow, the execution result links will be opened or the link to homepage.
