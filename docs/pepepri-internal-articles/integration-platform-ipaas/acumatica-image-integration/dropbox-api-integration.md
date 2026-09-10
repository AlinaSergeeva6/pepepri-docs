---
title: "Dropbox API Integration"
description: "This guide provides step-by-step instructions for establishing a connection with Dropbox using HTTP and OAuth 2.0 to enable integration with Pepperi."
order: 109
---
# Dropbox API Integration

*This guide provides step-by-step instructions for establishing a connection with Dropbox using HTTP and OAuth 2.0 to enable integration with Pepperi.*

### Overview

This process allows you to integrate your Dropbox account with Pepperi using HTTP and OAuth 2.0, facilitating file access and synchronization. By creating a Dropbox app, configuring permissions, and setting up a dataflow task, you can connect Dropbox to Pepperi’s iPaaS module for seamless dataflow operations.

---

### Prerequisites

-   A personal Dropbox account or the ability to create one.
-   Access to the Pepperi iPaaS module.

---

### Steps to Establish the Connection

#### Step 1: Create a Dropbox Account

-   Create an account at [https://www.dropbox.com/](https://www.dropbox.com/) if you don’t already have one.

#### Step 2: Create a Dropbox App

-   Visit the [Dropbox App Console.](https://www.dropbox.com/developers/apps.)
-   Click **Create App** to start the app creation process.

#### Step 3: Configure Settings Tab

-   After creating the app, navigate to the **Settings** tab on the Dropbox website.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-571.png)

#### Step 4: Configure Permissions Tab

-   In the **Permissions** tab, check all checkboxes except **Connect** to grant the necessary access levels (e.g., read and write permissions for files and metadata).

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-572.png)

#### Step 5: Set Up Dataflow Task

-   In Pepperi iPaaS, create a new dataflow task and navigate to the **HTTP** tab.
-   Press **Get Token** for OAuth 2.0 and populate the following details:
    -   **Start Authorization URL:** https://www.dropbox.com/oauth2/authorize?token\_access\_type=offline
    -   **Get Access Token URL:** https://api.dropbox.com/oauth2/token
    -   **Renew Access Token URL:** https://api.dropbox.com/oauth2/token
    -   **Consumer Key:** Extract from the **App key** in the Dropbox Settings tab.
    -   **Consumer Secret:** Extract from the **App secret** in the Dropbox Settings tab.
    -   **OAuth2 Scope:** account\_info.read files.content.read files.content.write files.metadata.read
    -   **OAuth2 Access Type:** offline

-   Press **Generate Token** to initiate the connection and follow the authorization prompts.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-573.png)

---

### Additional Resources

-   **Reference Guide:** [https://developers.dropbox.com/oauth-guide](https://developers.dropbox.com/oauth-guide)
-   **List of Endpoints:** [https://www.dropbox.com/developers/documentation/http/documentation](https://www.dropbox.com/developers/documentation/http/documentation)
-   **Task Documentation Hint:** The tasks were built based on this Dropbox documentation article: [https://www.dropbox.com/developers/documentation/http/documentation#files-list\_folder](https://www.dropbox.com/developers/documentation/http/documentation#files-list_folder)

---

### Dropbox - Tasks Examples

-   **Get Folders Structure Task:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90306](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90306)
-   **Get All the Images Links:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90302](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90302)
-   **Upload CSV Data File from Dropbox:** [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90305](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=90305)
