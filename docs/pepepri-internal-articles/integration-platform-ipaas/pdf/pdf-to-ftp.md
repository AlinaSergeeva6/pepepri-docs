---
title: "PDF to FTP"
description: "All the examples you can find in 'Integration Examples' (6685); 'Send PDF to FTP'(64022) - folder for dataflow tasks"
order: 228
---
# PDF to FTP

*All the examples you can find in 'Integration Examples' (6685);  'Send PDF to FTP'(64022) - folder for dataflow tasks*

The main idea of ​​this article is to show how to save PDF files to a client's FTP server.

In order to save a file to FTP follow the next steps:

**Step#1: prepare a dataflow task** which will generate a PDF file

With this dataflow task, we generate a PDF file

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1Capture.PNG)

**Required settings:**

-   donotsend = enabled checkbox
-   is\_new\_api = enabled checkbox
-   throw\_error\_on\_no\_data = disabled checkbox
-   pdf\_html\_code, where we write the code on the PDF structure clicking Editor ()

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2Capture.PNG)

We receive the generated PDF file

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3Capture.PNG)

**Step#2: prepare a dataflow task** which will send pdf file to ftp server.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/4Capture.PNG)

**Required settings:**

-   webapi = disabled checkbox
-   sourse = dataflow task that generates a pdf file
-   is\_new\_api = disabled checkbox
-   user = username
-   pass = user password
-   ftp = FTP IP address
-   ftp\_in\_folder = FTP folder path
-   is\_ftp\_out\_static\_name = disabled checkbox
-   is\_only\_copy\_to\_ftp = enabled checkbox

**Step#3:** Open FileZilla, enter the correct Host, Username and Password, then select the folder where we want to upload the PDF file (ftp\_in\_folder = FTP folder path)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/9Capture.PNG)

Run the dataflow task and done)

Now we have saved the file to FTP

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/111Capture.PNG)
