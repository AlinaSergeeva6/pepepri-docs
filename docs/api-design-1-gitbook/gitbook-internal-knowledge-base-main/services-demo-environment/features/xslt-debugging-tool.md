---
description: This tool will help you test xslt code fast and reliable
---

# XSLT debugging tool

1.
2. **To test XSLT code, download "XSLT Checker.html" attached file and open it:**

<figure><img src="../../.gitbook/assets/image (1214).png" alt=""><figcaption><p>pic. 1</p></figcaption></figure>

2. **Put your XSLT, XML and click 'Update' button to see result:**

&#x20;    <mark style="color:orange;">2.1  \* To get XML find this function in your XSLT code and change false()---> true(). Upload updated      file and XML will be generated</mark>

```xsl
 <xsl:if test="false()">
    <div>
      <h1>XML</h1>
      <xsl:call-template name="copyXml">
        <xsl:with-param name="nodeSet" select="/"/>
      </xsl:call-template>
      <br/>
      END XML
    </div>
  </xsl:if>
```

<figure><img src="../../.gitbook/assets/image (1215).png" alt=""><figcaption><p>pic. 2</p></figcaption></figure>

3. **If there is any error in your code, you will see a notification on the "Error Log" button. Click this button to see the detailed error:**&#x20;

<figure><img src="../../.gitbook/assets/image (1216).png" alt=""><figcaption><p>pic. 3</p></figcaption></figure>

4. **With this tool you can debug not only XSLT code that is intended to generate a PDF file, but also XSLT code that will generate an Excel file, the sequence of actions is the same:**

<figure><img src="../../.gitbook/assets/image (1217).png" alt=""><figcaption><p>pic. 4</p></figcaption></figure>

<mark style="color:orange;">\*\*In  attachment you can also find all the necessary example files to test this feature.</mark>

{% file src="../../.gitbook/assets/XSLTCodeExamplePDF (1).zip" %}

{% file src="../../.gitbook/assets/XMLExample.zip" %}

{% file src="../../.gitbook/assets/XSLT Checker 1 (1).zip" %}

{% file src="../../.gitbook/assets/XSLTCodeExamplePDFExcel.zip" %}



