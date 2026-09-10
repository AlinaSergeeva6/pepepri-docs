---
title: "IPAAS Single Sign-On"
order: 246
---
# IPAAS Single Sign-On

Single sign-on (SSO) is an authentication method that enables users to securely authenticate with multiple applications and websites by using just one set of credentials. IPAAS SSO allows you to login to Pepperi WebApp via Integration Platform.

## Setup

#### IPAAS SSO Login

With IPAAS Login you can login to Pepperi WebApp as any user, connected to the required security group.

**Main steps**

1) Create IPAAS SSO Client
2) Create Security Group in Pepperi
3) Change Security Group default provider to created one (IPAAS SSO Client)
4) Add Pepperi Users to Security Group
5) Login from IPAAS

### Create IPAAS SSO Client

Allow to create SSO Client from Integration side.

1) Go to Integration platform - Integration Accounts ([https://integration.pepperi.com/mgr/PluginManager/IntegrationAccounts](https://integration.pepperi.com/mgr/PluginManager/IntegrationAccounts))
2) Select Integration Account and click on “SSO Clients” menu:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/clip_image002.gif)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-14.png)

3) You will see the SSO Clients grid. Press “Add New Record”:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/clip_image002.gif)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2-9.png)

If it is first time you will need to enter user credentials of Pepperi User and press “Send” to create connection:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3-5.png)

4) Press “Add new record” one more time and you will see next record in Edit mode:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/clip_image002.gif)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/4-3.png)

In order to create Default SSO Client you just need to press Update. Confirm adding:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/5-4.png)

You should see created SSO Provider with checked Login column:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/6-4.png)

With this step SSO Provider creation is over.

### Create Security Group in Pepperi

This step allow us to create group (of users), that will have some specific Login behavior.

Note: Security Group creation can be not allowed (you will not see “Add” button). In this case you should contact Administrator.

1) Go to WebApp Security Group Settings and press “Add” button:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/clip_image002.gif)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/7-2.png)

2) Enter Name and Press “Save”:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/8-1.png)

Security group was created.

### Change Security Group default provider

In same tab/page go to Authentication Providers

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/9-1.png)

You should see created one in Integration. Select it and press save.

Now you have a group that will use IPAAS SSO for Login.

### Add Pepperi Users to Security Group

Allow to select user that will use IPAAS SSO Provider to Login

1) Go to WebApp Users tab
2) Select User, click edit icon and “Change Security Group”

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/10-1.png)

3) Select your security group and click apply:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/clip_image002.gif)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/11-1.png)

Now this user is connected to the group and IPAAS SSO Login. To connect another user just go over this step again.

### Login from IPAAS

1) Go to Integration SSO Clients (like with first step), select “Login” from menu:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/clip_image002.gif)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/12-1.png)

2) You will find dropdown with your users. Select one and press “Login”:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/13.png)

You will be redirected (in the new tab) to WebApp with selected logged in user. Setup is done. Now you can login to WebApp via Integration Platform.

You need to proceed step 1,2,3,4 just once . (Step 4 few times if you want to add another users)

#### IPPAS SSO As Proxy

TBD

### General Structure

TBD

### QA

#### Basic Validations

TBD
