---
title: "Generate EDI File to on FTP"
description: "This example you can find in 'Integration Examples' (6685) 'Generate EDI File On FTP (txt)' and 'Generate EDI File On FTP (xml) ' webhook task"
order: 220
---
# Generate EDI File to on FTP

*This example you can find in 'Integration Examples' (6685) 'Generate EDI File On FTP (txt)'  and  'Generate EDI File On FTP (xml) ' webhook task*

An EDI file is a data file formatted using one of several Electronic Data Interchange (EDI) standards. It contains structured data stored in a plain text format and is used for transferring business data between multiple organizations. EDI files are designed to reduce errors, cost, and processing time associated with postal mail, email, and faxes.

To create new EDI File on target FTP you need to create a new separate webhook and new webhook task in an integration platform

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-24.png)

The connection between back office and integration is the same as in a regular webhooks for transactions.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2-18.png)

Next Integration platform configurations:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3-12.png)

File type can be TXT or XML, depending on this you will need to use the corresponding template and file of the appropriate format will be generated.

TXT file template:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/4-9.png)

This template will generate next file:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/5-8.png)

XML file template:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/6-7.png)

This template will generate next file:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/7-4.png)

Check the final generated file. One common error may be the following, an error about an incorrect field name (Currency in this screenshot):

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/8-3.png)

This error means that you entered a wrong name in the template. To fix this error, you can take advantage of the integration platform.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/9-3.png)

399B

[formatted\_96467799.txt](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-M8ikZbD-G1i10jMKZli%2F-M8ipqamlnsJxc6XJeCG%2Fformatted_96467799.txt?alt=media&token=1e5f17c9-b467-49af-9c83-750eb8d5ea35)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-M8ikZbD-G1i10jMKZli%2F-M8ipqamlnsJxc6XJeCG%2Fformatted_96467799.txt?alt=media&token=1e5f17c9-b467-49af-9c83-750eb8d5ea35)

3KB

[formatted\_96521300.xml](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-M8ikZbD-G1i10jMKZli%2F-M8ipxupZf_sb2hA2L2s%2Fformatted_96521300.xml?alt=media&token=a07f8abd-6710-420b-b89b-187b41fa581f)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-M8ikZbD-G1i10jMKZli%2F-M8ipxupZf_sb2hA2L2s%2Fformatted_96521300.xml?alt=media&token=a07f8abd-6710-420b-b89b-187b41fa581f)
