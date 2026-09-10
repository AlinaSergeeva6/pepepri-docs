---
title: "Dynamic Banner Titles and Button Labels"
order: 55
---
# Dynamic Banner Titles and Button Labels

**Dynamic Banner Titles**:

-   Banner titles can now be modified based on flow parameters (e.g., bannerTitle).
-   Example parameters: testValue (dynamic value for Button/Banner), bannerTitle (text displayed).

**Dynamic Button Labels and Badges**:

-   Button labels and badges can be updated dynamically using flow parameters, similar to banners.

### Implementation Steps:

#### Step 1: Create Flow and Define Parameters:

-   Define parameters like testValue, bannerTitle, accounts, Users, Status.

**In the example below:** • testValue – will contain dynamic value for Button/Banner (e.g. Totals, field values) • bannerTitle – will contain text that will be shown on Button/Banner

![](/static/image-875.png)

#### Step 2: Add Build Text Logic Block:

-   Input text with placeholders (e.g., {value}).
-   Select a parameter to replace the placeholder.
-   Save the result in a parameter (e.g., bannerTitle).

![](/static/image-876.png)

#### Step 3: Save and Publish Flow:

-   Publish the flow to apply changes.

!!!info
**Sync may be required.**
!!!

![](/static/image-877.png)

#### Step 4: Add New Page Block and Select Flow:

-   Assign testValue (can be manual or dynamic).
-   Set bannerTitle to "dynamic" and choose the Banner element (identified by UUID in Content -> Action key).

![](/static/image-878.png)

-   Support for multiple titles (e.g., 1st and 2nd Title for Banners).

![](/static/image-879.png)

-   Enable 2nd Title in Content to make it available in the parameter dropdown.

![](/static/image-880.png)

-   Save to update the Banner title dynamically.

![](/static/image-881.png)

#### Button Labels and Badges:

-   Same dynamic update process applies to Button Labels and Badges.

![](/static/image-882.png)
