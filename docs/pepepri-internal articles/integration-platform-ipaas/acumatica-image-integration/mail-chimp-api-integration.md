---
title: "Mail Chimp API Integration"
description: "This guide provides step-by-step instructions for integrating MailChimp with Pepperi."
order: 110
---
# Mail Chimp API Integration

*This guide provides step-by-step instructions for integrating MailChimp with Pepperi.*

### Overview

This integration allows you to connect your MailChimp account with Pepperi to automate the transfer of account data into MailChimp audiences. By creating a MailChimp audience, generating an API key, and configuring dataflow tasks, you can streamline contact management and marketing efforts.

---

### Prerequisites

-   A MailChimp account (new or existing).
-   Access to the Pepperi iPaaS module.

---

### Steps to Establish the Integration

#### Step 1: Set Up MailChimp Account

-   Create a new account at [https://mailchimp.com/](https://mailchimp.com/) or log in to your existing account.
-   **Create an Audience:**
    -   Navigate to **Audience** and create a list of contacts where Pepperi data will be loaded.

-   **Generate API Key and Audience ID:**
    -   Go to **Profile -> Extras -> API Keys** to generate an API key.
    -   Go to **Audience -> Manage Audience -> Settings** to find the Audience ID.

        ![](/static/image-570.png)

#### Step 2: Create a Task to Get Accounts from Pepperi

-   In Pepperi iPaaS, create a new dataflow task to retrieve accounts from Pepperi.
-   Configure the task to export the desired account data (e.g., email, name) to be used in the next step.

#### Step 3: Create a Task to Send Data to MailChimp

-   Create another dataflow task in Pepperi iPaaS to process data from the previous task and send it to MailChimp.
-   **Key Configuration Points in the HTTP Tab:**
    -   **URL:** Use the first subdomain from your MailChimp URL (e.g., us1.api.mailchimp.com) followed by the endpoint (e.g., /3.0/lists/&lt;audience\_id>/members).
    -   **Audience ID:** Include your Audience ID in the URL (e.g., replace &lt;audience\_id> with your specific ID).
    -   **Authorization:** Use your API key in the Authorization header (e.g., apikey &lt;your-api-key>).

![](/static/2-36.png)

### Example reference

!!!success
### Check the 'Integration Examples' (6685) 'Accounts to MailChimp' dataflow task for a working model.
!!!
