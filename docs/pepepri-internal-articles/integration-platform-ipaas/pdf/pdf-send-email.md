---
title: "PDF Send Email"
description: "All the examples you can find in 'Integration Examples' (6685); ' Send Sales Order Email PDF (default pepperi pdf)' -folder for dataflow tasks and 'Trigger Job - Send email' (64024) - Webhook task"
order: 226
---
# PDF Send Email

*All the examples you can find in 'Integration Examples' (6685);  ' Send Sales Order Email PDF (default pepperi pdf)' -folder for dataflow tasks and 'Trigger Job - Send email' (64024) - Webhook task*

The main idea of ​​this article is to show how to prepare PDF files for sending to a client's email.

As a first step, you need to prepare 3 **dataflow tasks, for instance:**

a. Get Sales Order Header

b. Get Sales Order Lines

c. Send Email Sales Order PDF

**Step#1: prepare a dataflow task 'Get Sales Order Header':**

With this dataflow task, we send an HTTP request and get the necessary transaction header

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-22.png)

**Step#2: prepare a dataflow task 'Get Sales Order Lines':**

With this dataflow task, we send an HTTP request and get the necessary transaction **lines.**

Mandatory settings are **loop\_over\_table** of the first task "Get Sales Order Header" and **loop\_over\_table\_distinct** on UUID

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2Capture-2.PNG)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3Capture-1.PNG)

**Step#3: prepare a dataflow task 'Send Email Sales Order PDF':**

With this dataflow task, we generate a PDF file and send a message to the client's email

Required settings:

\- loop\_over\_table of the second task "Get Sales Order Lines"

\- loop\_over\_table\_distinct on UUID

\- dataflow\_email\_from = sender's email

\- dataflow\_email\_display\_from = display sender's email

\- dataflow\_email\_to = to whom the email was sent

\- dataflow\_email\_subject = dataflow email subject

\- pdf\_file\_name = pdf file name

\- dataflow\_email\_body\_html = write the HTML structure of email body

\- pdf\_html\_code = write the HTML structure of the pdf file

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/4Capture-1.PNG)

**Step#4:** prepare Scheduled Jobs in which add all three dataflow tasks that are described above

**Step#5 :** create a webhook that will trigger this Scheduled Jobs

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/6Capture.PNG)
