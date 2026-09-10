---
title: "Events"
description: "This guide provides an overview of Events in Pepperi, their triggering mechanisms, setup of Flows and Scripts, and best practices for their implementation."
order: 281
---
# Events

*This guide provides an overview of Events in Pepperi, their triggering mechanisms, setup of Flows and Scripts, and best practices for their implementation.*

### Overview

Events in Pepperi are a feature that enables the execution of logic based on specific actions within Transactions. Recently updated, Events replace the deprecated "Events" (which relied on scripts) and now trigger Flows, offering greater flexibility for various scenarios. Flows represent an advanced abstraction level over scripts, enhancing adaptability in different situations.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-139.png)

---

### Event Triggers

Events are triggered in three cases within Transactions:

-   **Transaction Loaded (On Init):** Executes when a Transaction is initially loaded.
-   **Transaction Field Changed (On Change):** Triggers when a Transaction field is modified.
-   **Transaction Line Field Changed (On Line Change):** Activates when a field in a Transaction line is altered.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-140.png)

The appropriate Flow must be selected from the available list for each event. Scripts within a Transaction will execute even if no workflow steps remain, unless prevented.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-141.png)

#### Preventing Script Execution

-   Create a Boolean parameter in the Flow.
-   Add a new Event in the Transaction.
-   Select the Flow and set the Boolean parameter as dynamic.
-   Choose the IsTransactionEditable value to control execution (e.g., disable script if the Transaction is not editable).

---

### Best Practices for Using Events

-   **Use Case Specificity:** Employ Events in scenarios where calculated fields or workflow steps are insufficient, such as updating a submitted Transaction with new conditions or modifying specific fields.
-   **Avoid Overuse:** Reserve Events for targeted situations to maintain system performance and clarity.

---

### Flows and Scripts Setup

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-142.png)

#### Step 1: Install and Enable Add-ons

-   Install the Flows and Scripts add-ons via the **Add-on Manager** in Pepperi.
-   Enable them for the selected environment to ensure functionality.

#### Step 2: Prepare Flows and Scripts

-   **Source Options:** As of February 10, 2025, the library is empty. Options include:
    -   Copy flows and scripts from another environment.
    -   Create custom flows and scripts from scratch.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-143.png)

-   **Editing Access:** Editing is restricted to the SupportAdminUser\_{DistributorID}@Wrnty.com user.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-144.png)
