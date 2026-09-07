# Handling errors - Pepperi webservice from Amazon

It is not a secret that if dataflow task works on Integration --> you have to check the uploaded files in backoffice  anyway\
&#x20;                             **ERP Integration ---> File Upload and Logs**,\
&#x20;                        to make sure that all data is sent to Pepperi without errors

If you need to get more information about errors, facing with uploading issues\
you can use **Pepperi webservice from Amazon** :

&#x20;[**https://d-99673832dc.awsapps.com/start#/**](https://d-99673832dc.awsapps.com/start#/)   \
to look at Pepperi Server Logs\
(if you have no access ask Kostya or Yossi, they will help you to get it)

\
**1.**  when you get on this service ---> choose **CloudWatch**\
**2**.  **CloudWatch** can be also found in **All services**

**3.**   on the left panel **Logs Insights** should be chosen

**4.**    to run any queries you need, you can check the **Queries library** on the right\
**Queries ---> support ---> get-put log**

![](<../../.gitbook/assets/image (333).png>)

![](<../../.gitbook/assets/image (321).png>)

![](<../../.gitbook/assets/image (314).png>)

![](<../../.gitbook/assets/image (45).png>)

**5.**    this service is used to check the failed files, so for this purpose\
you will need a **File ID** which was failed\
you can find it in **ERP Integration ---> File Upload and Logs ---> File ID**

![](<../../.gitbook/assets/image (407).png>)

**6.** you can use this File ID as **ActionID** and push the button **Run query**

![](<../../.gitbook/assets/image (299).png>)

**7.** you can see the explanation of the failed file below

![](<../../.gitbook/assets/image (297).png>)

**8.**    having these filters

&#x20;                        filter **ActionID** = {Filter ID}\
&#x20;                        filter **Level** = ‘ERROR’  \
You can see which lines from this upload file failed and for what reason

![](<../../.gitbook/assets/image (315).png>)
