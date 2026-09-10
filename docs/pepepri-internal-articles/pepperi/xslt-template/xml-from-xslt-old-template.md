---
title: "XML from XSLT (old template)"
order: 298
---
# XML from XSLT (old template)

**How to get XML from XSLT**

**Why is XSLT necessary**: It allows you to implement a scheme in which data is stored separately, and their presentation is separate. That is, one XML document is converted using another XML document (XSL, which contains XSLT templates) into the final document. The result can be XML, HTML, or a text document of any format.

In Pepperi such files as PDF of Invoices, Quotes and other makes with using XSLT.

How can you download and view a XSLT-file from Pepperi?

These files are located in **Configuration Files**:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-89.png)

For example, in this account, the invoice form is stored in a file called PDF:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-90.png)

Click edit (in the right corner):

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-91.png)

Download this file and open it in your code editor:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-92.png)

At this stage, the invoice looks like this:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-93.png)

If you need to change something in this document (for example, add a field, or remove extra fields, etc.), for understanding which field is in this document, it will be useful for you to look at XML-file. For getting of XML, find this :

`<xsl:if test="false()"> <div> <h1>XML</h1> <xsl:call-template name="copyXml"> <xsl:with-param name="nodeSet" select="/"/> </xsl:call-template> <br/> END XML </div> </xsl:if>`

And change `<xsl:if test="false()">` to `<xsl:if test="true()">`

Next go to **Configuration Files -> Configuration Files -> find your file (in this example it ‘PDF’) -> Press ‘Edit’-> Press ‘Upload’ and upload modified XSLT -> Save**

Next, just check how your file now looks. You should receive a file in which there will be a XML-code + invoice.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-94.png)

................................ ............................

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/image-95.png)
