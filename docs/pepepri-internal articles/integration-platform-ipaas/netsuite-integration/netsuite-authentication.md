---
title: "NetSuite Authentication"
order: 170
---
# NetSuite Authentication

Pepperi authentication to NetSuite is Token based.

After we have created a script for communicating with saved search, we create an integration in NetSuite. **So we need to setup the relevant tokens**

1\. Go on NetSuite --> **“Setup”** --> **“Integrations”** \---> **“Manage Integrations”**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-399.png)

2\. Select the Pepperi application

3\. Edit

4\. Under the Authentication tab - select the checkbox –

“TOKEN-BASED AUTHENTICATION”

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-400.png)

5\. Save

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-401.png)

6\. copy the **CONSUMER KEY** and **CONSUMER SECRET** that were generated (we will use it later on)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-402.png)

7\. the the **CONSUMER KEY** and **CONSUMER SECRET** should be added into Integration as

**ns\_consumer\_secret**

**ns\_consumer\_key**

8\. Go to **Setup** > **Users/Roles** > **Access Tokens** > **New**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-403.png)

9\. In the application name – select the **Pepperi application**. Fill the user and role that will be assigned to the access token.

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-404.png)

10\. Save

!!!info
Make sure that this role has access to all the relevant objects and lists needed for the integration. You can view/edit the role permissions under - Setup > Users/Roles > Manage Roles

![](https://alinasergeeva6.github.io/pepepri-docs/static/Manage-Roles.png)
!!!

11\. Copy the **Token ID** and **Token Secret** (we will use it later on)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-405.png)

12\. Go to your **Pepperi account** – **Settings > ERP Integration > Plugin Settings > Advanced Settings**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-406.png)

13\. **Add the following setting options in the general integration settings** –

1.  ***ns\_token\_secre****t* > the NetSuite Token secret you copied on step 10
2.  ***ns\_token\_id*** \> the NetSuite Token ID you copied on step 10
3.  ***ns\_consumer\_secret*** \> the NetSuite Token ID you copied on step 6
4.  ***ns\_consumer\_key*** > the NetSuite Token ID you copied on step 6
5.  ***ns\_is\_tba*** \= 1 (to activate the token based authentication)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-407.png)

14\. Make sure you have sufficient access to roles

Go to **Setup** > **Users/Roles** > **Manage Roles** > select the required type for Saved Search and add required fields in ***Transaction*****s** and ***Lists*** tabs. Below you can find an excel file with an example of filling

![](https://alinasergeeva6.github.io/pepepri-docs/static/Capture-3.PNG)

16KB

[Manage Roles.xlsx](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2F6GvBSAeZp3xGP8Ny2Myn%2FManage%20Roles.xlsx?alt=media&token=5eb86fdd-4073-4d79-b8ee-e70becb29ae5)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2F6GvBSAeZp3xGP8Ny2Myn%2FManage%20Roles.xlsx?alt=media&token=5eb86fdd-4073-4d79-b8ee-e70becb29ae5)
