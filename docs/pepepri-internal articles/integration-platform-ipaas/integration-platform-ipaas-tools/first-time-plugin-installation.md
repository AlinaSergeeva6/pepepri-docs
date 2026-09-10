---
title: "First Time Plugin Installation"
order: 206
---
# First Time Plugin Installation

Before the installation please be sure that you have Remote Access to the customer server. Instructions how to get it you can read [here](https://pepperi.gitbook.io/internal-knowledge-base/logmein-rescue-instructions/remote-control). **PAY ATTENTION** - be sure you have access to the customer server via **LogMein Rescue Technician Console** when you must set QuickBooks integration, the permanent connection to the server is required.

**REMARKS** another type of connection can lead to some difficulties and issues while working on QuickBooks integration

### #1 Step: connect to the customer server via LogMein Rescue Technician Console

### #2 Step: choose Tools ----> then Desktop Applications ----> then QuickBooks ----> and download the files

a. **QuickBooks SDK** b. **QB Listener Importer + Exporter Full Version**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2021-09-01-at-11.21.01.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2021-09-01-at-11.18.43.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/Screenshot-2021-09-01-at-11.24.48.png)

**First**, you need to run **QuickBooks SDK (**software development kit- a collection of software development tools in one installable package) **Second**, you need to set **QB Listener Importer + Exporter Full Version**

Download three folders, **copy** them and **add to the customer server**: **connection\_tester online\_listener qb\_exporter**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-337.png)

**Open LogMeIn Rescue ----> Connect to your customer ------> File Manager ------> Launch File Manager Session -------> Move file to Remote Server**

**PAY ATTENTION** --- each QuickBooks has one common thing – **company file** (everything in QuickBooks is connected and works via the company file) \*you can open QuickBooks and find the company file there

### #3 Step: work on the first folder connection_tester

**1\.** open the folder **connection\_tester** and **run as** **ADMIN** open **QBImporterConfig.exe**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-338.png)

**2.** after that you will get a form with two columns: **key** **value** **companyfile** \*please add the companyfile’s value

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-339.png)

**REMARKS** QuickBooks has two types of mode (state/regime): **SINGLE-USER** and **MULTI-USER**

**3\.** log via ADMIN as a SINGLE-USER ----> and push the button **Test Connection (check the picture above)**

**4\.** as a result, **ALERT** appears - it confirms that you connected to QuickBooks successfully - it gives pepperi app the access to QuickBooks

**5\.** the **ALERT** must be filled as a form **6\.** push the button **Test Export Connection**

**PAY ATTENTION** – all this procedure described above doesn’t give the real access to dataflow tasks

### #4 Step: work on the second folder online_listener

**PAY ATTENTION** –**several options** of settings are suggested in this section, it is done on purpose to test different scenarios because of variety of QuickBooks’ behavior

\***different QuickBooks behave differently and all possible steps should be tested to make it work**

**1\.** open the folder online\_listener and find the file **MainSettings.xml** a. edit **MainSettings.xml** ---> at the end of the file you need to add companyfile’s value **&lt;key>companyfile&lt;/key> &lt;value/>**

**2.** open command prompt **PAY ATTENTION** \--- **option\_1:** open command prompt via ADMIN **option\_2:** open command prompt via NOT\_ADMIN

**3\.** in command prompt you should select **the way to the listener**

**4.** then in command prompt **OnlineListener.exe** should be run **PAY ATTENTION** \--- **option\_1:** OnlineListener.exe with letter **c option\_2:** OnlineListener.exe without letter **c**

**5\.** **Alert with the successful connection** will appear in QuickBooks

**PAY ATTENTION --**\- //remember different QuickBooks behave differently and require different settings **NOT\_WOKING OUTPUT response options:** a. open command prompt via ADMIN b. open command prompt via NOT\_ADMIN c. QuickBooks is on d. QuickBooks is off e. OnlineListener.exe with letter **c** f. OnlineListener.exe without letter **c** and try different combination of steps, e.g. a + c + e b + c + e a + d + e and etc.

**When one of these combinations works; listener is successfully run and you can find it here:**

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-340.png)

### #5 Step: work on the third folder qb_exporter

repeat the same steps of #4 work on the second folder online\_listener

**PAY ATTENTION** – **option\_1:** try to have all steps of settings **with listener on option\_2:** try to have all steps of settings **with listener off**

**REMARKS** QuickBooks Is **Equal FIGHT!!!!** the procedure of setting QuickBooks integration takes some time; need to try several settings’ options to make it work; one more thing that can be useful – try to run dataflow tasks – it may help to start QuickBooks
