---
description: General info about Integration Platform
---

# Integration Platform Overwiev

[https://integration.pepperi.com/mgr](https://integration.pepperi.com/mgr)

## Integration Accounts&#x20;

This tab represents table with rows, which **links** to the plugin, that you can connect to real account (means that if you will delete Integration account, that will not delete this account in the Pepperi). \
This tab contain&#x20;such **Fields**:

Id – unique identifier of account in numerical format\
Name – name of account\
Default Application – application which is used for account (Generic HTTP Connector, Generic Desktop Connector etc.)\
Default Provider – show database or solution, which accounts use (SQL Direct Connector, HTTP Connector etc.)\
Env. – environment, where account works. Can be 1 of 4 values: Prod, Sandbox, Dev, Prod (Europe)\
Date Created – show date and time when account was created in dd-MM-yyyy hh:mm:ss

And **Buttons**:\
\
Edit – allows to change Name, Default Provider and Env. Fields. Has 2 buttons: update (accept changes and update account) and cancel (cancel changes)\
Delete – allows delete selected account in Integration - it will not allow to delete account in Pepperi backoffice\
Plugin Settings – opens in a new window plugin settings of selected account;

Subscription – …;\
Back-office – open in a new window back office (studio.pepperi.com) of selected account if backoffice is linked to this account\
Re-link – allows to change backoffice account, connected to selected integration account

## Logs

From Integration platform you have a possibility to see all of the latest logs from any account - **Dataflow, Transaction or UI logs**

{% hint style="info" %}
Useful Tip: You can use Transaction Logs to find example of a webhook you want to use - try filters in the table!
{% endhint %}

## **Tools**

### **Create Account Without Plugin**

Allow to create new account without plugin.

### **Create Account With Plugin**

Allow to created new account with plugin. This option is widely used for creating new or copying existing integration accounts (creates also new trial account in backoffice for 14 days)\
Note that if this email-password combination exists in Pepperi, new account will be created in Integration but it will not be created in the backoffice

![](<../../.gitbook/assets/image (380).png>)

This Tab also allow to[ copy environment](https://kbint.pepperi.com/integration-platform-general/copy-environment)

**Desktop Application**

Tab allows to download latest Pepperi desktop applications&#x20;

Each application can have different versions, which you can see by pressing triangle at first column. There are 3 main desktop applications: QuickBooks, SAP Business One, Online Listener and Generic Plugins.
