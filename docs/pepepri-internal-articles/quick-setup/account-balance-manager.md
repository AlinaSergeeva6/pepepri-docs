---
title: "Account Balance Manager"
description: "This guide walks you through the process of integrating the Account Balance Manager with Pepperi using iPaaS and a Custom Form within a Ledger Activity."
order: 50
---
# Account Balance Manager

*This guide walks you through the process of integrating the Account Balance Manager with Pepperi using iPaaS and a Custom Form within a Ledger Activity.*

### Overview

The Account Balance Manager is a tool integrated via Pepperi’s iPaaS to track and manage ledger data. This integration involves setting up a Ledger Activity, configuring a Custom Form, and linking it to the app’s interface.

-   **Prerequisites:** Ensure you have access to the iPaaS module and the necessary permissions to configure activities and workflows.

---

### Step 1: Set Up the Account Balance Manager in iPaaS

1.  **Access Quick Setup:**
    -   Go to **Settings → iPaaS → Quick Setup → Account Balance Manager**.
    -   Follow the instructions in the [**Account Balance Manager Quick Setup**](https://support.pepperi.com/hc/en-us/articles/14283718639772-Account-Balance-Manager-Quick-Setup) article to configure the Ledger settings.

2.  **Open iPaaS Account:**
    -   Navigate to your iPaaS account for the current environment.
    -   Locate the automatically created UI Task for the Ledger activity.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2024-12-12-at-16.28.02.png)

3.  **Copy the UI Task Code:**
    -   Run the UI Task to generate the code.
    -   Copy the code provided for the Ledger activity.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2024-12-12-at-16.31.46.png)

---

### Step 2: Create and Configure the Ledger Activity

1.  **Create a New Activity:**
    -   Go to **Settings → Sales Activities → Activity Types**.
    -   Click **Add New Activity** and create a new activity named "Ledger".

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2024-12-12-at-16.36.50.png)

        ;

2.  **Add a Custom Form to the Activity:**
    -   Open the newly created "Ledger" activity.
    -   Navigate to the **Programs** tab and create a new Custom Form.
    -   Paste the code copied from the UI Task into the Custom Form editor.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2024-12-12-at-16.40.17.png)

3.  -   **Update the Config ID:**
        -   Inside the Custom Form code, locate the page\_url parameter.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2024-12-12-at-17.25.38.png)

    -   Replace the configID with the actual Config ID from the Account Balance Manager in iPaaS:
        -   Go to **Settings → iPaaS → Quick Setup → Account Balance Manager** to find your Config ID.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-899.png)

---

### Step 3: Integrate the Custom Form into the Workflow

1.  **Add to Workflow:**
    -   Go to the "Ledger" activity’s **Workflows** tab.
    -   Add the Custom Form to the workflow to ensure it triggers when the activity is executed.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2024-12-12-at-17.29.20.png)

-   **Add to App Home Screen:**
    -   Go to **Settings → Company Profile → App Home Screen**.
    -   Select the profile for which you want to enable the Ledger activity.
    -   Add the "Ledger" activity to the view to make it accessible to users

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2024-12-12-at-17.34.15.png)

---

### Step 4: Troubleshoot

1.  **Troubleshooting:**
    -   If the Ledger does not work:
        -   Go to **Settings → iPaaS → Quick Setup → Account Balance Manager**.
        -   Verify that the Ledger configuration uses fields available in your Pepperi back-office environment.
        -   Check the Custom Form code for errors (e.g., incorrect configID) using Chrome Developer Tools (F12).
