---
title: "Duplicate a Transaction/Activity Type"
order: 326
---
# Duplicate a Transaction/Activity Type

### Objective:

Create a copy of an existing Transaction or Activity Type for testing, new sales channels, or similar forms with modifications.

---

### Use Cases:

1.  Test trade promotions in a separate environment before live deployment.
2.  Replicate a Transaction Type for a different sales channel (e.g., Sales Reps to eCommerce Buyers) with minor tweaks.
3.  Reuse an Activity form as a template with adjusted workflows or fields.

---

### Steps:

1.  **Create New Type:**
    -   Go to **Settings → Sales Activities → Transaction Types/Activity Types**.
    -   Click **+**, enter a name and description, and save.

    ![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-31.png)

2.  **Export and Import:**
    -   Select the existing Transaction/Activity Type to duplicate.
    -   Choose **Export** from the menu to download the definition file.
    -   Select the new Transaction/Activity Type, choose **Import**, and drag the downloaded file into the import screen.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-32.png)

1.  **Modify Configuration:**
    -   Adjust the new Transaction/Activity Type (e.g., workflows, views, custom fields) for its intended use.

!!!info
**Note:** All custom fields, workflows, Order Center views, cart settings, and menus are duplicated.
!!!
