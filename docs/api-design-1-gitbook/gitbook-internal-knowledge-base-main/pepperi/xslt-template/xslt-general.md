# XML from XSLT (old template)

**How to get XML from XSLT**

**Why is XSLT necessary**:  It allows you to implement a scheme in which data is stored separately, and their presentation is separate. That is, one XML document is converted using another XML document (XSL, which contains XSLT templates) into the final document. The result can be XML, HTML, or a text document of any format.

In Pepperi such files as PDF of Invoices, Quotes and other makes with using XSLT.&#x20;

How can you download and view a XSLT-file from Pepperi?

These files are located in **Configuration Files**:

![](<../../.gitbook/assets/image (193).png>)

For example, in this account, the invoice form is stored in a file called PDF:

![](<../../.gitbook/assets/image (510).png>)

Click edit (in the right corner):

![](<../../.gitbook/assets/image (235).png>)

Download this file and open it in your code editor:

![](<../../.gitbook/assets/image (362).png>)

At this stage, the invoice looks like this:

![](<../../.gitbook/assets/image (345).png>)

If you need to change something in this document (for example, add a field, or remove extra fields, etc.), for understanding which field is in this document, it will be useful for you to look at XML-file. \
For getting of XML, find this :\
&#x20;

`<xsl:if test="false()">`\
&#x20;`<div>`\
&#x20;`<h1>XML</h1>`\
`<xsl:call-template name="copyXml">`\
&#x20;`<xsl:with-param name="nodeSet" select="/"/>`\
`</xsl:call-template>`\
`<br/>`\
`END XML`\
`</div>`\
`</xsl:if>`

And change `<xsl:if test="false()">` to `<xsl:if test="true()">`

Next go to **Configuration Files -> Configuration Files -> find your file (in this example it ‘PDF’) ->**\
**Press ‘Edit’-> Press ‘Upload’ and upload modified XSLT -> Save**

Next, just check how your file now looks. You should receive a file in which there will be a XML-code +  invoice.

![](<../../.gitbook/assets/image (473).png>)

................................\
............................<br>

![](<../../.gitbook/assets/image (500).png>)

