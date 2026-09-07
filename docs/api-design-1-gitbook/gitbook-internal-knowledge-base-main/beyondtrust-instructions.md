# BeyondTrust instructions

### &#x20;What is BeyondTrust PRA?

BeyondTrust Privileged Remote Access (PRA) lets Advantive employees securely connect to customer servers without sharing passwords. It uses **Jump Clients** (lightweight agents on customer machines) and integrates with **Okta** (for SSO) and the **PRA Vault** (for credential injection).

### Access, Group Assignment

1. **Check for the BeyondTrust tile in Okta.**
   * If you **don’t** see a BeyondTrust tile, submit an **IT case** _(servicedesk@advantive.com)_ requesting to be added to **“BeyondTrust PRA Okta Group.”**
2. **SSO once to authenticate your user (one-time).**
   * After IT adds you to the Okta group, click the BeyondTrust tile in Okta to log in via **SAML**.
   * You will likely see only **Abaca** jump items—this is expected. This is **not** where you’ll normally log in; you’re just authenticating.
3. **Request business unit access for customer endpoints.**
   * Create a **Client Operations** _(clientoperations@advantive.com)_ case asking to be added to the **BeyondTrust PRA group for&#x20;**_**\[your Business Unit].** (Pepepri)_
   * Client Ops will assign you to the correct endpoints so next time you log in to the **Access Console**, you can connect to customers.

***

### Step 1: Have the Client Install the Jump Client (and Rename It)

1. **Send the customer the correct installer link** _(refer to the **customer email template** in the **💡Tips** section at the bottom of this article):_\
   <sub>_❗_</sub><sub>_**Note:**_</sub><sub>_&#x20;_</sub><sub>_Make sure you have the_</sub> <sub>_right Business Unit's URL. If a customer uses the wrong URL to install, it will place them in the wrong business unit's endpoint group, and you will not be able to find them._</sub>

<table data-view="cards"><thead><tr><th></th><th></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td>Lucy </td><td><a href="https://advantive.beyondtrustcloud.com/download_client_connector?fn=sra-pin-win_x64-j130jed1w8hgeyizgei7fgif7w6gx5hjx8ficry0hf7c90.msi&#x26;jc=0897f2348d1a481564165fb4ec30e261&#x26;p=winNT-64-msi&#x26;ss=aa1119cf4ac8353d8baddf06b157ffbb7cf9d1e9">https://advantive.beyondtrustcloud.com/download_client_connector?fn=sra-pin-win_x64-j130jed1w8hgeyizgei7fgif7w6gx5hjx8ficry0hf7c90.msi&#x26;jc=0897f2348d1a481564165fb4ec30e261&#x26;p=winNT-64-msi&#x26;ss=aa1119cf4ac8353d8baddf06b157ffbb7cf9d1e9</a> </td><td><a href=".gitbook/assets/1583973260045.jpeg">1583973260045.jpeg</a></td></tr><tr><td>Opmetrix </td><td><a href="https://advantive.beyondtrustcloud.com/download_client_connector?fn=sra-pin-win_x64-j130ijedjjxwfg56ej87e1hgdhjjj7w5efwfcry0hf7c90.msi&#x26;jc=108900ef64cb80258734930005fc86f6&#x26;p=winNT-64-msi&#x26;ss=adf53bedc17ddb4f20117de4e13d7da88ab174f9">https://advantive.beyondtrustcloud.com/download_client_connector?fn=sra-pin-win_x64-j130ijedjjxwfg56ej87e1hgdhjjj7w5efwfcry0hf7c90.msi&#x26;jc=108900ef64cb80258734930005fc86f6&#x26;p=winNT-64-msi&#x26;ss=adf53bedc17ddb4f20117de4e13d7da88ab174f9</a> </td><td><a href=".gitbook/assets/images.png">images.png</a></td></tr><tr><td>Pepperi </td><td><a href="https://advantive.beyondtrustcloud.com/download_client_connector?fn=sra-pin-win_x64-j130ey76jj7wg6edjzi1xejzji7zi675whw1cry0hf7c90.msi&#x26;jc=8d5b005f4b890a17e80a015a1b5cf3f7&#x26;p=winNT-64-msi&#x26;ss=c49dc2711d7732d1ebf92ba663f7ee5b29d0b098">https://advantive.beyondtrustcloud.com/download_client_connector?fn=sra-pin-win_x64-j130ey76jj7wg6edjzi1xejzji7zi675whw1cry0hf7c90.msi&#x26;jc=8d5b005f4b890a17e80a015a1b5cf3f7&#x26;p=winNT-64-msi&#x26;ss=c49dc2711d7732d1ebf92ba663f7ee5b29d0b098</a> </td><td><a href=".gitbook/assets/Pepperi__1_.webp">Pepperi__1_.webp</a></td></tr></tbody></table>

* Ask them to install it **on the server** you’ll support.
* **Installation** is **typically** on a **server**. It is **unlikely** they will need to install on **laptops/desktops**.
* Install **once** per server (if they installed multiple times, duplicates should be removed.)

1. **Ask the customer to confirm** when it’s installed and provide the machine's:
   * Public IP address
   * Domain
   * Hostname
2. **Rename the new Jump Client for easy identification:**
   * The new endpoint will be generically named as, **“\[Business unit] Endpoints September 2025”**, **"Advantive \[Business Unit] Server Jump Application"**, or similar.
   * **Log in** to the **Access Console**.
   * Use **Search** (center of the screen) to find the server by **public IP**, **hostname**, or **domain**.
   * Right-click the endpoint → **Properties** → rename it to the customer’s **Account Name**.
   * From now on, you’ll be able to find it quickly.

***

### Step 2: Connect to a Customer Site

Once the customer's endpoint is available and renamed.

1. **Open the BeyondTrust PRA Access Console.** \
   Log into customer sites from the Access Console.
   1. **Option 1: Web Console**
      1. Log into BeyondTrust Privileged Remote Access from your Okta page.
      2. Go to **Consoles & Downloads**.
      3. Choose to **launch** the web console.
   2. **Option 2: Downloaded Access Console**
      1. The first time
         1. Log into BeyondTrust Privileged Remote Access from your Okta page.
         2. Go to **Consoles & Downloads**.
         3. Select to download the Access Console.
      2. After you install the Access Console:
         1. Open the BeyondTrust Access Console on your PC
         2. Use SAML to log in.
   3. _<mark style="color:blue;">Option 3: Jump Box</mark> <mark style="color:blue;background-color:yellow;">(we don't have this option for now)</mark>_
      1. _<mark style="color:blue;">If your business unit has a jumpbox, you can access the jumpbox first.</mark>_
      2. _<mark style="color:blue;">Next, use option 2, above, to log into the Access Console on the jumpbox.</mark>_
2. **Find the endpoint:**
   * Search for the customer **Account Name** under your **Business Unit’s Endpoints**.\
     <sub>_**Can’t Find the Customer’s Endpoint?**_</sub><sub>_&#x20;_</sub><sub>_Refer to the Can’t Find the Customer’s Endpoint? in the_</sub><sub>_&#x20;_</sub><sub>_**💡Tips**_</sub><sub>_&#x20;_</sub><sub>_section at the bottom of this article_</sub>
3. **Connect to the server:**
   * Double-click the account name **or** right-click → **Jump**.
4. _<mark style="color:blue;">Log in using the Vault (preferred)</mark> <mark style="color:blue;background-color:yellow;">(we don't have this option for now)</mark><mark style="color:blue;">:</mark>_
   * _<mark style="color:blue;">Click the Key icon to view Vault accounts.</mark>_
   * _<mark style="color:blue;">Select the account → Inject to log in with Windows credentials.</mark>_
   * _<mark style="color:blue;">If the account isn’t in Vault, get credentials from the relevant Environment object in Salesforce</mark>_<mark style="color:blue;">.</mark>
5. **Perform your remote support.**
6. **When finished:**
   * **Log the user off** on the customer machine.
   * **End** your session in BeyondTrust (red **X** → **End Session**).
   * <mark style="color:blue;">If you’re on a jumpbox, ensure the session has fully ended before leaving the jumpbox.</mark>

***

### Troubleshooting: Timeouts & Logs

If you **time out** when connecting and the cause is unknown:

> **Note:** The **`blog.ini`** file referenced below should be **attached** to this knowledge article. Download it from there.

#### Step 1 — Enable logging in your console

1. Launch the **Rep** or **Access Console**.
2. At the login window, hold **Shift** and click **About** to reveal **Diagnostics**.
3. Check **Enable Logging** → **OK**.
4. **Restart** the console.
5. (When done troubleshooting) repeat to **disable** logging.

> **Log locations (console):**
>
> * If **`blog.ini`** is on the machine → logs in `C:\ProgramData\`.
> * If **no `blog.ini`** → logs in `%localappdata%\bomgar\bomgar-rep\instancename\log`.

#### Step 2 — Place the log config for the Jump Client

1. Put **`blog.ini`** directly in **`C:\`** on the system running the **Jump Client**.
2. **Restart** the Jump Client service (via **services.msc** or system restart).
3. Reproduce the issue and **note the time**.
4. If the Jump Client isn’t installed, **reinstall** and reproduce.

#### Step 3 — Attempt the connection

1. Try to log into the customer server.
2. Wait for the **timeout** message to appear.

#### Step 4 — Collect logs

* Logs appear as files in **`C:\ProgramData`**, named like `instancename-bomgar-xxx.log` (where **`xxx`** denotes the log type).
* If there was no `blog.ini` when console logs were generated, see `%localappdata%\bomgar\bomgar-rep\instancename\log`.
* The **PEC** log will be at the path above on the server.

#### Step 5 — Send logs

* Email the **PEC log file** (and any relevant logs) to _erika.youmans@advantive.com._

***

### 💡Tips

### ❗Customer Email Template

You can use the email template below to send the installer to your contact.

**Subject:** Install BeyondTrust Jump Client for Remote Support

Hello _\[CustomerName]_,

To prepare for our upcoming remote support session, please use the link below to install the BeyondTrust Jump Client on the **server** where we will be working:

_Insert BeyondTrust Jump Client Link_

After installation, please reply with the following details for that machine:

1. Public IP address
2. Domain
3. Hostname

This information helps us connect securely and assist you effectively. If you have any trouble with the installation, please let us know.

Thank you,\
YourName

### ❗Can’t Find the Customer’s Endpoint?

When a customer installs the agent, it creates a record in the Access Console but does **not** include the customer’s name. Multiple generic entries can exist.

1. **Search by technical identifiers:**
   * Ask the customer for **hostname**, **domain**, and **external IP**.
   * Use **Search Jump Items** to locate the matching entry.
2. **If you find the record:**
   * Right-click → **Properties** → rename from **the generic name** to the customer’s **Account Name**.
   * Connect using the steps above.
3. **If you don’t find the record:**
   * Re-send the correct **installer link**.
   * After they install, rename the new Jump Client as above.
4. **One-time use scenarios (e.g., Professional Services job):**
   * Provide the installer link as usual.
   * After the job, the customer can **uninstall** the agent; the entry will then **disappear** from our Access Console list.

### ❗Quick Reference (Cheat Sheet)

* **Missing Okta tile?** IT case → add to **“BeyondTrust PRA Okta Group.”**
* **One-time SSO via Okta** (you’ll see **Abaca** items—this is fine).
* **Client Ops case** → add to **BeyondTrust PRA group for BusinessUnitBusiness UnitBusinessUnit**.
* **Customer install** Jump Client on **server only**, once.
* **Rename** generic **“DistributionONE Endpoints September 2025”** to **Account Name**.
* **Connect** → **Jump** → **Vault Key** → **Inject** credentials.
* **Can’t find endpoint?** Search by IP/hostname/domain; rename when found.
* **Timeouts?** Enable logging, place **`blog.ini`**, reproduce, collect logs, email **erika.youmans@advantive.com**.

### 🔧 BeyondTrust Remote Support Console – Quick Start Guide for Support Reps

#### 1. **Launch the Console**

* Open the **BeyondTrust Representative Console** from your Okta page or browser (at [`https://advantive-rs.beyondtrustcloud.com/console)`](https://yourcompanysupport.beyondtrustcloud.com/login\)).
* Select to use SAML Credentials to log in.

#### 2. **Start a Support Session**

**Start a Session with a Session Key**

1. Click **"Start Session"** in the console.
2. Choose **"Generate Session Key"**.
3. Share the **session key** with the customer via email or phone.
4. The customer enters it in the form, accessed within the product or at **advantive-rs.beyondtrustcloud.com**. This will trigger an installation on the customer's end.
5. Once connected, click **"Join Session"**.

#### 3. **Control the Remote System**

* Once connected:
  * Click **“Screen Sharing”** to view or control the user's screen.
  * Use **File Transfer**, **System Info**, or **Command Shell** tabs as needed.
  * **Request permission** if prompted before taking control.

#### 4. **Chat and Collaborate**

* You can **send links, instructions, or files** through the chat interface.

#### 5. **Invite Another Support Rep**

1. In the active session, click the **gear icon** (Settings) or **Session Tools** menu.
2. Choose **"Invite Rep"** or **"Transfer/Collaborate"**.
3. Select a representative from the list or enter their name.
4. Click **Invite** – they will receive a prompt to join.
5. The new rep joins in **collaboration mode** (shared control and chat).

#### 6. **End the Session**

* Click **"End Session"** when the support is complete.
* The session will be logged for auditing/reporting purposes.

#### 7. **Logout (if applicable)**

* Always **log out** of the console at the end of your shift to ensure security.

{% file src=".gitbook/assets/Windows BLOG (Standard) (3).zip" %}
