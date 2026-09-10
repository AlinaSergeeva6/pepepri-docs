---
title: "Xero API Integration"
description: "This guide provides step-by-step instructions for integrating Xero with Pepperi using OAuth 2.0, including obtaining the tenant ID, configuring dataflow tasks, and setting up webhooks."
order: 103
---
# Xero API Integration

*This guide provides step-by-step instructions for integrating Xero with Pepperi using OAuth 2.0, including obtaining the tenant ID, configuring dataflow tasks, and setting up webhooks.*

Overview

This integration connects Xero, an HTTP-based ERP, with Pepperi using OAuth 2.0, which has replaced the outdated OAuth 1.0 authentication. By obtaining the tenant ID and configuring dataflow tasks with the Generic HTTP Connector, you can synchronize data between Xero and Pepperi efficiently.

---

### Prerequisites

-   Access to the Pepperi Plugin with appropriate permissions.
-   ADMIN access to the customer’s Xero account.
-   **Tip:** Collaborate with the customer during the setup process for optimal results.

---

### Steps to Establish the Integration

#### Step 1: Obtain the Customer’s Tenant ID

-   **Purpose:** The tenant ID is required for all subsequent dataflow tasks and webhooks.
-   **Reference Task:** Check the example dataflow task 'Get tenant id - company id' (57474) on Integration
    -   **Examples**: [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57474.](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57474.)
    -   This task can be copied for any customer as its settings remain consistent.

-   **Configuration:**
    -   **Authentication Type:** OAuth 2.0
    -   **URL:** https://api.xero.com/connections

-   **Token Generation:**
    -   Click **Get Token** to generate the OAuth Access Token.

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-610.png)

    -   Fill the form with the following details (same for each customer except Consumer Key and Secret):
        -   **Application Unique Name:** default
        -   **Start Authorization URL:** https://login.xero.com/identity/connect/authorize
        -   **Get Access Token URL:** https://identity.xero.com/connect/token
        -   **Renew Access Token URL:** https://identity.xero.com/connect/token
        -   **Consumer Key:** 3A5D89EE1A2543C8BEBEF6688DCBCDA8
        -   **Consumer Secret:** k0goY5gRIDN32kv38Xn2dPG\_jQ0keMX7DGL8n7nggGrCHV6Q
        -   **OAuth2 Scope:** offline\_access accounting.transactions accounting.settings accounting.contacts

    -   **Note:** Ensure you are logged into Xero while performing this step.

-   **Generate Token:** Click **Generate Token** at the end of the form.
-   **Result:** A “successfully connected” notification will appear.
-   **Retrieve Tenant ID:** Run the task and download the **RESPONSE BODY** text file from the task’s Log to extract the tenant ID.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-611.png)

#### Step 2: Prepare Settings for Dataflow Tasks and Webhooks

-   **Configuration Requirements:**
    -   **Application:** Generic HTTP Connector
    -   **Source Object:** Generic Http Exporter

-   **Key Considerations:**
    -   Include the tenant ID in the URL of each HTTP task (e.g., https://api.xero.com/api.xro/2.0/&lt;resource>?TenantId=&lt;tenant-id>).

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-612.png)

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-613.png)

    -   **Remark:** OAuth 1.0 used the Xero Plugin, while OAuth 2.0 uses the Generic HTTP Connector.

-   **Reference Templates:** Check the templates in Integration Examples, folder 'Xero examples with OAuth 2.0' (dataflow tasks and webhooks):
    -   [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57475](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57475)
    -   [https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57480](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=57480)
