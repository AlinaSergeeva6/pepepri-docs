---
title: "Connect Client To SSO Provider"
order: 247
---
# Connect Client To SSO Provider

Follow these steps to successfully connect a client to an SSO (Single Sign-On) provider. Each step is outlined below with clear instructions.

---

### Step 1: Request SSO Credentials from the Client

To begin, you’ll need to gather SSO credentials from the client. Start by preparing a requirement table for the SSO setup and sending it to the client. This table outlines the information the client needs to create the credentials. Below is the template:

|  |  |
| --- | --- |
| **Parameter** | **Value** |
| **Application Name** | &lt;name of the client> |
| **Application Type** | Web (options: Web, SPA, or Mobile) |
| **Application Logo (Optional)** | Not required now |
| **Login Redirect URIs** | https://idp.pepperi.com/signin-oidc-&lt;app-name><br><br>https://integration.pepperi.com/ipaas\_sso/signin-oidc |
| **Logout Redirect URIs** | https://idp.pepperi.com/signout-oidc-&lt;app-name><br><br>https://integration.pepperi.com/ipaas\_sso/signout-oidc |
| **Grant Types** |  |
| **Grant Client Credentials** | No (Y/N) |
| **Grant Authorization Code** | Yes (Y/N) |
| **Grant Refresh Token** | No (Y/N) |
| **Grant Implicit Hybrid** | Not supported due to security risks (N) |
| **Claims** | Email (default); no additional claims required |
| **Scopes** | Use out-of-the-box (OOTB) scopes: openid, profile, email, address (mention if custom scope is needed—we only need OOTB) |
| **Token Lifetime** | Set to the maximum possible duration |

Fill in the following fields in the table:

-   **Application Name**
-   **Login Redirect URIs**
-   **Logout Redirect URIs**

Once the client provides the credentials (ClientId, ClientSecret and Authority), proceed to the next step.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-279.png)

Example of filled requirement table

---

### Step 2: Test SSO in the Service Demo Environment

Before moving the SSO provider to the client’s environment, test it in the Service Demo Environment.

1.  **Locate the Demo Environment:** In IPaaS, navigate to the **Services Demo Environment**.
2.  **Update SSO Configuration:**
    -   Find the UI task labeled "SSO\_IPAAS\_7343\_1".
    -   Go to **Settings** > locate the "sso\_configuration" field -> update its value with the following JSON

```
{
  "authSchemeName": "<app-name>",
  "displayName": "<app-name>",
  "ClientId": "<given by client>",
  "ClientSecret": "<given by client>",
  "Authority": "<given by client>",
  "ClientLoginUrl": "",
  "ReturnUrlParamName": null,
  "RsaPublicKey": null,
  "TaskId": 95796,
  "ScheduledJobId": 65934,
  "UserLogoutTimeout": 5,
  "IsIpaasSSOLogin": true
}
```

!!!warning
**Do not modify any other settings.**
!!!

1.  **Restart the SSO Server:**
    -   Ask Roi to restart the SSO authentication server.

2.  **Test Authentication:**
    -   Create a test user in the Demo Environment.
    -   Assign the IPAAS\_SSO security group to the test user.
    -   Test the authentication process.

3.  **Troubleshooting:**
    -   If you encounter an error after authorization, it’s likely due to an incorrect redirect URL. Double-check the **Redirect URIs**.

4.  **Validation:**
    -   Once testing is successful and the client confirms everything works as expected, proceed to the next step.

---

### Step 3: Move the SSO Provider to the Client’s Environment

After successful testing, transfer the SSO setup to the client’s production environment.

1.  **Reset Demo Environment Configuration:**
    -   Return to the UI task in the Service Demo Environment.
    -   Restore the default value for the "sso\_configuration" field.
    -   Ask Roi to restart the SSO authentication server again.

2.  **Create an Auth Provider in the Client Environment:**
    -   Use Postman to set up the Auth Provider for the client’s environment.
    -   Ask Kostia to make the POST request to minimize errors (provide him with the necessary details from the client’s credentials).

---

### Step 4: Create a New Security Group

Set up a new security group in the client’s environment to manage user access.

1.  **Log In as Admin:** Log in to the client’s environment with admin credentials.
2.  **Check Security Groups:**
    -   Go to **Company Profile** > **Security Groups**.
    -   Verify that security groups are enabled (an **Add** button should be visible).
    -   If the **Add** button is missing, go to var3 and enable it for this environment.

3.  **Create a New Security Group:**
    -   By default, only the **Default** security group exists.
    -   Click **Add** to create a new security group.
    -   Fill in the details:
        -   **General Info Tab:** Enter required values in all fields (use &lt;app-name> from the Auth Provider).
        -   **Password Policy Tab:** Leave unchanged.
        -   **Login and Session Tab:** Leave unchanged.
        -   **Authentication Providers:**
            -   Change **Default Authentication** to the newly created Auth Provider via Postman.
            -   Uncheck the Pepperi provider.

4.  **Important Note:**

!!!danger
**Do not modify the Default security group. Changing it could lock the environment. Always create a new group instead.**
!!!

---

### Step 5: Assign the Security Group to a User

After creating the security group, assign it to the relevant users.

1.  **Assign to a User:**
    -   Go to **Users** > select the user who needs the new security group > click **Edit**.
    -   In the **Security Group** dropdown, select the recently created security group.
    -   Click **Apply**.

2.  **Note:** The interface may not visually reflect the change, but the assignment is applied correctly.
3.  **Assign to a Buyer (if needed):**
    -   Follow the same steps, but go to **Contacts** instead of **Users**.

---

### Attachments:

10KB

[Requirement table for client for SSO.xlsx](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FFM8HmXdR48tMhBey4N9g%2FRequirement%20table%20for%20client%20for%20SSO.xlsx?alt=media&token=617d3622-ccee-4224-bc09-4aa69d77c05d)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FFM8HmXdR48tMhBey4N9g%2FRequirement%20table%20for%20client%20for%20SSO.xlsx?alt=media&token=617d3622-ccee-4224-bc09-4aa69d77c05d)

Requirement table to send to the client

899KB

[Connect Users or Buyers to SSO.docx](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2Fm0jsQfAn8Gd0d2Qh53DO%2FConnect%20Users%20or%20Buyers%20to%20SSO.docx?alt=media&token=5a231ab4-85e5-46e0-b83c-32ad4a0911dc)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2Fm0jsQfAn8Gd0d2Qh53DO%2FConnect%20Users%20or%20Buyers%20to%20SSO.docx?alt=media&token=5a231ab4-85e5-46e0-b83c-32ad4a0911dc)

Client instruction to assign security group for users or buyers
