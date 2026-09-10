---
title: "Integration Setup and Changes in Production"
order: 337
---
# Integration Setup and Changes in Production

### Overview

Integration is a critical first step when a new client begins using Pepperi, even though Pepperi can function without ERP integration. This process establishes a foundation for data synchronization, ensuring that client data is accurately imported and processed before implementing custom logic or fields. Integration serves as an environment for:

-   **Dataflow Tasks:** To retrieve data from client systems.
-   **Webhook Tasks:** To send data to client servers.

---

### Importance of Integration Setup

#### Why Prioritize Integration?

Setting up integration first is recommended to:

-   Retrieve all client data upfront, ensuring a complete dataset for implementation.
-   Avoid issues during implementation by establishing a stable data foundation before developing new logic or fields tailored to client requests.

---

### Section 1: Dataflow Tasks

Dataflow tasks are used to import data into Pepperi from client systems. They must be handled with care, especially in production environments.

#### Best Practices for Production Clients

1.  **File Structure Consistency:**
    -   Ensure that uploaded files maintain the same structure (e.g., same columns) as previously used for the client to prevent data mismatches.

2.  **API Compatibility:**
    -   If the client uses the old API, continue using the old API for consistency. If they use the new API, adopt the new API.

**Advantages of the New API**

-   Supports bulk uploads for large datasets.
-   Allows HTTP requests for flexibility.
-   Includes the is\_new\_api setting in dataflow tasks.
-   Provides detailed error responses for troubleshooting.

**Disadvantages of the Old API**

-   Higher risk of unpredictable behavior and errors.
-   Lacks detailed error responses, complicating debugging.

#### Supported Systems

Before creating dataflow tasks, identify the client’s system. Common options include:

-   SAP
-   QuickBooks
-   SQL-based systems
-   HTTP
-   FTP

**System Connection Guidelines**

-   Verify connection details for the chosen system.
-   Avoid changing the application in dataflow task settings (e.g., switching from SAP to FTP), as this will break existing configurations. Instead, create a new dataflow task with the updated application and settings.

#### Configuring Dataflow Tasks

1.  **Schedule Jobs:**
    -   Set up a scheduled job to automate the dataflow task; otherwise, it will only run manually, and the client won’t receive updated data.

2.  **Use the** donotsend **Setting with Caution:**
    -   Enable donotsend (do not send data to Pepperi) only during testing.
    -   Once testing is complete and functionality is verified, remove the donotsend setting to ensure data is sent to Pepperi.

3.  **Verify Data in Backoffice:**
    -   After running the dataflow task in the Integration environment, check the uploaded files in **ERP Integration -> File Upload and Logs** to confirm data is sent to Pepperi without errors.

---

### Section 2: Webhooks

Webhooks enable sending data from Pepperi to the client’s server, requiring careful configuration to avoid unintended consequences.

#### Best Practices for Webhooks

-   **Access and Permissions:**
    -   Ensure you have access to the client’s server and explicit permission to delete data if needed.

-   **Error Handling:**
    -   If a sales order is accidentally submitted, immediately notify the PM or Kostya to resolve the issue.

-   **Testing Scenarios:**
    -   Consult the PM for appropriate testing scenarios before testing webhooks.

**Recommended Testing Approach**

-   Test webhooks by setting them as a program and triggering at the **In Creation** stage:
    -   Prevents creation of submitted transactions in Pepperi.
    -   Keeps the webhook hidden, visible only in Admin View.

**Handling Multiple Webhooks**

-   Avoid configuring multiple webhooks in a workflow if they need to start simultaneously.
-   Instead, use the **Scheduled Job** functionality in Integration:
    -   Create a webhook to trigger a job.
    -   Use a dataflow task to initiate each webhook as part of the job.

---

### Additional Resources

For more detailed information on the Integration API, refer to: https://integration.pepperi.com/prod/Help
