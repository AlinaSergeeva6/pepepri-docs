---
title: "Pepperi Platform Overview: Key Features of Sales Activities"
order: 329
---
# Pepperi Platform Overview: Key Features of Sales Activities

This article explores the key features of Sales Activities in the Pepperi platform, focusing on **Transaction Types** and **Activity Types**, which are essential for managing sales processes and user interactions.

![](/static/image-24.png)

---

### Section 1: Transaction Types

Transactions are a cornerstone of Pepperi’s configuration, enabling various business transactions for accounts. Transaction Types define the different kinds of transactions, such as Orders, Returns, Invoices, Stock Counting, Quotes, and more.

![](/static/image-25.png)

#### Common Transaction Types

-   **Sales Order:** Standard order placed by a sales representative.
-   **Sales Quotation:** Proposal or quote prepared by a sales representative.
-   **B2B Storefront Transaction (Buyer Order):** Order placed directly by the buyer via the Pepperi B2B Storefront.

![](/static/image-26.png)

**Note:** Transaction Types can vary in several aspects:

-   Workflows
-   ERP integration processes
-   Order Center Views, Menus, and Cart Configurations
-   PDF templates (including header/footer content)
-   Custom and Calculated Fields

#### Creating a New Transaction Type

To create a new Sales Transaction Type:

1.  Go to **Settings → Sales Activities → Transaction Types**.
2.  Click **Add New Transaction Type**. **Important:** This feature is available only for the Pepperi Corporate package and above. For the Professional package, you can customize the default "Sales Order" Transaction Type but cannot create additional types.

#### Types of Orders

Orders are categorized based on the user initiating them:

1.  **Salesperson-Initiated Orders:**
    -   Sales Order
    -   Sales Quotation

2.  **Buyer-Initiated Orders:**
    -   B2B Storefront Transaction (Buyer Order)

**Recommendation:** Create an admin profile and test all configurations in the Views to ensure consistency across user experiences.

#### Working with Calculated Fields in Transaction Types

**Common Mistake**

A frequent error developers make is improperly preparing Calculated Fields. Follow these requirements to avoid issues:

**Requirements for Creating and Testing Calculated Fields**

1.  **Create a New Calculated Field:** Ensure the field is necessary and aligns with the transaction’s purpose.
2.  **Naming:** The field name should clearly reflect its purpose (e.g., `TotalDiscountCalc`).
3.  **Add a Comment:** Include the following details in a comment at the top of the field:
    -   Who created it
    -   Creation date
    -   Purpose of the field
    -   Dependencies (other fields or data it relies on)
    -   Whether the field is part of ERP integration

4.  **Admin View:** Add the field only to the admin view for initial testing.

**Checking if a Client is in Production**

To determine if a client is in production:

-   Check the Workflows for the presence of a Webhook or Export File. If either exists, the client is in production.
-   **Caution:** Never submit an order to an account in production. Always confirm details with the Project Manager (PM) before proceeding.

**Preparing a Backup for Calculated Fields**

-   **Export ATD:** Download a JSON file containing the transaction, which includes all functions, calculated fields, and dependencies. This serves as a fast backup for recovery or auditing.

**Testing Calculated Fields**

1.  **Header Fields:** Add an action to the Workflow on the "Submit" step to test header-level calculated fields.
2.  **Test Across Scenarios:**
    -   Test on existing orders.
    -   Test in the "In Creation" state by preparing a transaction in this state and testing it.

3.  **Custom Forms with On Demand Formula Evaluation:** Use Programs to test Custom Forms where the Formula Evaluation Trigger is set to "On Demand".
4.  **Notifications:** Use only one Notification at the end of Workflows for all actions.
5.  **Pricing Logic:** To test pricing logic in a Workflow, create a branch (e.g., "In Creation - In Creation") and test within this branch.
6.  **Platform-Specific Testing:**
    -   Confirm with the PM whether the client uses an iPad or WebApp.
    -   **iPad:** Displays information assigned by the user.
    -   **WebApp:** Shows information relevant to the specific account.
    -   **Note:** Issues may arise when functionality works on one platform but not the other. Test both to ensure compatibility.

**Best Practice: Documentation**

For large clients, prepare detailed documentation covering all new features, logic, and changes. Create a TEST Sales Order to showcase these updates, ensuring transparency and ease of review.

---

### Section 2: Activity Types

Activity Types allow you to create custom forms for sales reps, merchandisers, or other users (e.g., buyers) to perform specific tasks in the Pepperi mobile or web app. These forms enhance CRM workflows and data collection.

#### Examples of Activities

-   In-Store Audit
-   Customer Survey
-   Contact Us Form (for buyers on the Storefront)
-   Product Survey
-   Service Request
-   Other CRM-related forms within your workflow

#### Creating a New Activity Type

To create a new Activity Type:

1.  Go to **Settings → Sales Activities → Activity Types**.
2.  Click **\+ Activity Types**.

#### Configuring Activity Types

1.  **Define the Form:**
    -   Add fields to the form by dragging them into the layout.
    -   Configure forms for all relevant user profiles (e.g., Rep, Buyer). If additional profiles exist, create forms for each; otherwise, the Rep form is used as the default.

2.  **Account Association:**
    -   Specify which accounts the Activity applies to via the Accounts tab.
    -   Options:
        -   Limit to specific Account Types (e.g., for managing inventory across warehouses or customer types).
        -   Disassociate from any account (useful for capturing data not tied to existing customers, such as prospects at a trade show).

3.  **Workflows:**
    -   Define status transitions and actions (e.g., email notifications on submission).
    -   Use Alternative Forms to guide users through multi-page forms dynamically, opening relevant pages based on status or conditions.

4.  **Menu Options:**
    -   Configure the menu to include options like a PDF preview, allowing users to view, print, or email a PDF copy of the form directly from the app.

5.  **Sharing and ERP Integration:**
    -   Enable "Export Activity to ERP" if the Activity should be exported to your ERP system.
    -   Enable "Share this Activity among all sales reps assigned to an Account" to allow multiple reps to view the Activity for shared accounts.

#### Best Practices

-   **Conditional Forms:** Use Alternative Forms in Workflows to display additional pages conditionally (e.g., if a merchandiser checks a box during a Store Audit).
-   **Testing:** Test Activities on both iPad and WebApp to ensure compatibility, as differences in platform behavior may affect functionality.
-   **Documentation:** Document the purpose, fields, and workflows of each Activity Type to assist other developers and ensure maintainability.

---

### Final Notes

-   For more detailed information, refer to the Pepperi Support documentation on Transaction Types and Activity Types.
