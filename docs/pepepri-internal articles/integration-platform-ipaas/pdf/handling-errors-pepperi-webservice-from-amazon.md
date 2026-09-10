---
title: "Handling errors - Pepperi webservice from Amazon"
order: 224
---
# Handling errors - Pepperi webservice from Amazon

It is not a secret that if dataflow task works on Integration --> you have to check the uploaded files in backoffice anyway **ERP Integration ---> File Upload and Logs**, to make sure that all data is sent to Pepperi without errors

If you need to get more information about errors, facing with uploading issues you can use **Pepperi webservice from Amazon** :

[**https://d-99673832dc.awsapps.com/start#/**](https://d-99673832dc.awsapps.com/start#/) to look at Pepperi Server Logs (if you have no access ask Kostya or Yossi, they will help you to get it)

**1\.** when you get on this service ---> choose **CloudWatch** **2**. **CloudWatch** can be also found in **All services**

**3\.** on the left panel **Logs Insights** should be chosen

**4\.** to run any queries you need, you can check the **Queries library** on the right **Queries ---> support ---> get-put log**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-302.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-303.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-304.png)

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-305.png)

**5\.** this service is used to check the failed files, so for this purpose you will need a **File ID** which was failed you can find it in **ERP Integration ---> File Upload and Logs ---> File ID**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-306.png)

**6\.** you can use this File ID as **ActionID** and push the button **Run query**

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-307.png)

**7\.** you can see the explanation of the failed file below

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-308.png)

**8\.** having these filters

filter **ActionID** = {Filter ID} filter **Level** = ‘ERROR’ You can see which lines from this upload file failed and for what reason

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-309.png)
