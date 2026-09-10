---
title: "Direct SQL server connection"
order: 158
---
# Direct SQL server connection

### Overview

The direct SQL Server connection principle allows Pepperi to remotely connect to a SQL Server, facilitating data retrieval and synchronization. This process requires client-provided credentials and specific configuration settings to ensure secure and efficient access.

---

### Prerequisites

-   Access to the client’s SQL Server with administrative privileges.
-   Collaboration with the client to obtain necessary connection details and adjust security settings.

---

### Steps to Establish the Connection

#### Step 1: Obtain Client Information

-   Request the following details from the client:
    -   **Server Address**
    -   **User ID**
    -   **Password**

-   The client must update security settings to grant access to the Pepperi server (e.g., add the Pepperi IP to the firewall or SQL Server access list).

#### Step 2: Configure General Settings

-   Navigate to **General Settings** in Pepperi iPaaS.
-   Add the following settings:
    -   **Data Source:** Server address (e.g., sqlserver.example.com)
    -   **Initial Catalog:** Database name (e.g., MyDatabase)
    -   **User ID:** Provided by the client
    -   **Password:** Provided by the client
    -   **Connection Timeout:** Set to 3000 (in milliseconds, e.g., 3 seconds)

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-438.png)

#### Step 3: Create Dataflow Task

-   In Pepperi iPaaS, create a new dataflow task.
-   Add the following settings:
    -   **is\_new\_api:** Set to true
    -   **is\_sql\_source:** Set to true

        ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-439.png)

-   Navigate to the **SQL** tab and write the desired SQL query (e.g., SELECT \* FROM Customers).

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-440.png)

#### Step 4: Test the Connection

-   Run the dataflow task to verify the connection and data retrieval.
-   Ensure the query executes successfully and returns the expected data.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-441.png)
