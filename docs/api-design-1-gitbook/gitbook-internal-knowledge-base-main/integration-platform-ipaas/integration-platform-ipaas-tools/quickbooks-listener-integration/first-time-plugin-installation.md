# First Time Plugin Installation

Before the installation please be sure that you have Remote Access to the customer server. Instructions how to get it you can read [here](https://pepperi.gitbook.io/internal-knowledge-base/logmein-rescue-instructions/remote-control).\
\
**PAY ATTENTION**   - be sure you have access to the customer server via **LogMein Rescue Technician Console** when you must set QuickBooks integration, the permanent connection to the server is required.

**REMARKS**\
another type of connection can lead to some difficulties and issues while working on QuickBooks integration

### #1 Step: connect to the customer server via LogMein Rescue Technician Console

### #2 Step: choose **Tools** ---->  then **Desktop Applications** ----> then **QuickBooks** ----> and download the files

&#x20;                                                 a.     **QuickBooks SDK**\
&#x20;                                                 b.     **QB Listener Importer + Exporter Full Version**

![](<../../../.gitbook/assets/Screenshot 2021-09-01 at 11.21.01.png>)

![](<../../../.gitbook/assets/Screenshot 2021-09-01 at 11.18.43.png>)

![](<../../../.gitbook/assets/Screenshot 2021-09-01 at 11.24.48.png>)

**First**,          you need to run **QuickBooks SDK (**&#x73;oftware development kit- a collection of software\
&#x20;                  development tools in one installable package)\
**Second**,     you need to set **QB Listener Importer + Exporter Full Version**&#x20;

Download three folders, **copy** them and **add to the customer server**:\
&#x20;                                                                             **connection\_tester**\
&#x20;                                                                             **online\_listener**\
&#x20;                                                                             **qb\_exporter**

![](<../../../.gitbook/assets/image (68).png>)

&#x20;                      **Open LogMeIn Rescue ---->  Connect to your customer ------> File Manager** \
&#x20;                         **------> Launch File Manager Session ------->  Move file to Remote Server**

**PAY ATTENTION**  ---  each QuickBooks has one common thing – **company file** \
&#x20;                                   (everything in QuickBooks is connected and works via the company file)\
\*you can open QuickBooks and find the company file there

### &#xD;#3 Step:  work on the first folder **connection\_tester**

**1.**  open the folder **connection\_tester** and **run as** **ADMIN** open **QBImporterConfig.exe**

![](<../../../.gitbook/assets/image (433).png>)

**2.**          after that you will get a form with two columns:\
&#x20;                                            **key**                                       **value**\
&#x20;                                           **companyfile**                      \*please add the companyfile’s value

![](<../../../.gitbook/assets/image (331).png>)

**REMARKS**\
QuickBooks has two types of mode (state/regime):       **SINGLE-USER** and **MULTI-USER**

**3.**          log via ADMIN as a SINGLE-USER  ----> and push the button **Test Connection**\
&#x20;            **(check the picture above)**

**4.**         as a result, **ALERT** appears\
&#x20;            \-  it confirms that you connected to QuickBooks successfully\
&#x20;            \-  it gives pepperi app the access to QuickBooks

**5.**    the **ALERT** must be filled as a form\
\
**6.** push the button **Test Export Connection**

**PAY ATTENTION**    – all this procedure described above doesn’t give the real access to\
&#x20;                                    dataflow tasks

### &#xD;#4 Step:  work on the second folder online\_listener

**PAY ATTENTION**          –**several options** of settings are suggested in this section, it is done on purpose to\
&#x20;                                        test different scenarios because of variety of QuickBooks’ behavior

\***different QuickBooks behave differently and all possible steps should be tested to make it work**

**1.**    open the folder online\_listener and find the file **MainSettings.xml**\
&#x20;                     a. edit **MainSettings.xml** ---> at the end of the file you need to add companyfile’s value\
&#x20;      **\<key>companyfile\</key>**\
&#x20;      **\<value/>**

**2.**     open command prompt\
&#x20;        **PAY ATTENTION**        ---        **option\_1:**     open command prompt via ADMIN\
&#x20;                                                          **option\_2:**      open command prompt via NOT\_ADMIN

**3.** in command prompt you should select **the way to the listener**

**4.**     then in command prompt **OnlineListener.exe** should be run\
&#x20;        **PAY ATTENTION**        ---        **option\_1:**     OnlineListener.exe with letter **c**\
&#x20;                                                          **option\_2:**      OnlineListener.exe without letter **c**

**5.**      **Alert with the successful connection** will appear in QuickBooks

**PAY ATTENTION   --**-      //remember different QuickBooks behave differently and require different settings\
**NOT\_WOKING OUTPUT  response options:**\
&#x20;                                                                              a.    open command prompt via ADMIN\
&#x20;                                                                              b.   open command prompt via NOT\_ADMIN \
&#x20;                                                                              c.   QuickBooks is on\
&#x20;                                                                              d.   QuickBooks is off\
&#x20;                                                                              e.   OnlineListener.exe with letter **c**\
&#x20;                                                                              f.   OnlineListener.exe without letter **c**\
and try different combination of steps, e.g.\
a + c + e\
b + c + e\
a + d + e       and etc.

&#x20;**When one of these combinations works;  listener is successfully run and you can find it here:**

![](<../../../.gitbook/assets/image (306).png>)

### &#xD;#5 **Step:** work on the third folder **qb\_exporter**

repeat the same steps of #4 work on the second folder online\_listener

**PAY ATTENTION**     –           **option\_1:**      try to have all steps of settings **with listener on**\
&#x20;                                               **option\_2:**      try to have all steps of settings **with listener off**

**REMARKS**\
QuickBooks Is **Equal FIGHT!!!!**\
&#x20;                the procedure of setting QuickBooks integration takes some time;\
&#x20;                 need to try several settings’ options to make it work;\
&#x20;                 one more thing that can be useful – try to run dataflow tasks – it may help to start QuickBooks
