# NetSuite Authentication

Pepperi authentication to NetSuite is Token based.&#x20;

After we have created a script for communicating with saved search, we create an integration in NetSuite. **So we need to setup the relevant tokens**

1\. Go on NetSuite --> **“Setup”** --> **“Integrations”** ---> **“Manage Integrations”**

![](<../../../../.gitbook/assets/image (232).png>)

2\. Select the Pepperi application

3\. Edit

4\. Under the Authentication tab - select the checkbox –&#x20;

“TOKEN-BASED AUTHENTICATION”

![](<../../../../.gitbook/assets/image (281).png>)

5\. Save

![](<../../../../.gitbook/assets/image (225).png>)

6\. copy the **CONSUMER KEY** and **CONSUMER SECRET** that were generated (we will use it later on)

![](<../../../../.gitbook/assets/image (100).png>)

7\.  the the **CONSUMER KEY** and **CONSUMER SECRET** should be added into Integration as&#x20;

&#x20;                 **ns\_consumer\_secret**

&#x20;                 **ns\_consumer\_key**

8\. Go to **Setup** > **Users/Roles** > **Access Tokens** > **New**

![](<../../../../.gitbook/assets/image (99).png>)

9\. In the application name – select the **Pepperi application**. Fill the user and role that will be assigned to the access token.&#x20;

![](<../../../../.gitbook/assets/image (488).png>)

10\. Save

{% hint style="info" %}
Make sure that this role has access to all the relevant objects and lists needed for the integration. You can view/edit the role permissions under - Setup > Users/Roles > Manage Roles

<img src="../../../../.gitbook/assets/Manage Roles.png" alt="" data-size="original">&#x20;


{% endhint %}

11\. Copy the **Token ID** and **Token Secret** (we will use it later on)

&#x20;

![](<../../../../.gitbook/assets/image (370).png>)

12\. Go to your **Pepperi account** –\
&#x20;**Settings > ERP Integration > Plugin Settings > Advanced Settings**

![](<../../../../.gitbook/assets/image (327).png>)

13\. **Add the following setting options in the general integration settings** –

1. _**ns\_token\_secre**t_ > the NetSuite Token secret you copied on step 10
2. _**ns\_token\_id**_ > the NetSuite Token ID you copied on step 10
3. _**ns\_consumer\_secret**_ > the NetSuite Token ID you copied on step 6&#x20;
4. _**ns\_consumer\_key**_ > the NetSuite Token ID you copied on step 6
5. _**ns\_is\_tba**_ = 1 (to activate the token based authentication)

![](<../../../../.gitbook/assets/image (490).png>)

14\. Make sure you have sufficient access to roles

Go to  **Setup** > **Users/Roles** > **Manage Roles** > select the required type for Saved Search and add required fields in _**Transaction**_**s** and _**Lists**_ tabs. Below you can find an excel file with an example of filling

![](<../../../../.gitbook/assets/Capture (42).PNG>)

{% file src="../../../../.gitbook/assets/Manage Roles.xlsx" %}
