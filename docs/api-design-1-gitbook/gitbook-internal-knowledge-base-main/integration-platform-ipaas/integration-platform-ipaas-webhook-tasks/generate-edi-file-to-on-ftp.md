---
description: >-
  This example you can find in 'Integration Examples' (6685) 'Generate EDI File
  On FTP (txt)'  and  'Generate EDI File On FTP (xml) ' webhook task
---

# Generate EDI File to on FTP

An EDI file is a data file formatted using one of several Electronic Data Interchange (EDI) standards. It contains structured data stored in a plain text format and is used for transferring business data between multiple organizations. EDI files are designed to reduce errors, cost, and processing time associated with postal mail, email, and faxes.

To create new EDI File on target FTP you need to create a new separate webhook and new webhook task in an integration platform

![](<../../.gitbook/assets/1 (42).png>)

\
The connection between back office and integration is the same as in a regular webhooks for transactions.

![](<../../.gitbook/assets/2 (32).png>)

Next Integration platform configurations:

![](<../../.gitbook/assets/3 (7).png>)

File type can be TXT or XML, depending on this you will need to use the corresponding template and file of the appropriate format will be generated.

TXT file template:

![](<../../.gitbook/assets/4 (3).png>)

This template will generate next file:

![](<../../.gitbook/assets/5 (2).png>)

XML file template:

![](<../../.gitbook/assets/6 (18).png>)

This template will generate next file:

![](<../../.gitbook/assets/7 (12).png>)

\
Check the final generated file. One common error may be the following, an error about an incorrect field name (Currency in this screenshot):

![](<../../.gitbook/assets/8 (5).png>)

This error means that you entered a wrong name in the template. To fix this error, you can take advantage of the integration platform.

![](<../../.gitbook/assets/9 (2).png>)

{% file src="../../.gitbook/assets/formatted_96467799.txt" %}

{% file src="../../.gitbook/assets/formatted_96521300.xml" %}

