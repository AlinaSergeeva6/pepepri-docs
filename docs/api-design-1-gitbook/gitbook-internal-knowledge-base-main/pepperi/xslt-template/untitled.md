# Work with Footer and Header in Old PDF templates

&#x20;**Work with Header** . If you need to change header complitely, you need to construct table in html (Remark: some html tags complitely broke downloadable PDF file when you add them into your table, for example \<br> and etc. ). To fill up PDF fields with your data use.

```
<xsl:value-of select="//Header/Column[@ApiName='YourName']/Value"/>
```

These requests will change depends on what type of fields you need. For example if you need header field it will be

```
<xsl:value-of select="//Header[@ApiName='YourName']/Value"/>
```

You could saw that some fields in XSL have attribute "Column type" you can use this to make requests too.&#x20;

Example of creating PDF Header you can find here in attachments - HederExample.xslt

**Work with Footer.** To change footer completely use same strategy like header, but with one exception: you need to add signature or sticker to do this use such requests:

```
<img>
xsl:attribute name="src">
<xsl:value-of select="//Header/Column[@ApiName='Signature']/Value" /></xsl:attribute>
<xsl:attribute name="class">imgSignature</xsl:attribute>
</img>

```

To disable some fields in footer Pepperi XSLT Template have place in code in the:

```
<xsl:template name ="applyFields">
```

where you can add your fields in the cycle:

```
<xsl:for-each select="$fieldsSet[@Type!='23']">
```

For example like this:

```
<xsl:for-each select="$fieldsSet[@Type!='23' and @ApiName!='Signature']">
```

After this changes check your pdf on ios devices, if there you have bugs with such text:

_"Error message on PDF2\_NoPrice "This page contains the following errors: error on line X at column Y: Opening and ending tag mismatch: div line 0 and footer Below is a rendering of the page up to the first error. This document was created as the result of an XSL transformation. The line and column numbers given are from the tranformed result."_

You must list your "Exception fields" nearby of @Type!=23.

```
<xsl:variable name="pos" select="position()"/>
      <xsl:variable name="Y" select="@Y"/>
      <xsl:variable name="X" select="@X"/>
      <xsl:variable name="line" select="@Line_Number"/>
      <xsl:variable name="height" select="@Field_Height"/>
      <xsl:variable name="nextY" select="following-sibling::*[@Type!='23'][1]/@Y"/>
      <xsl:variable name="prevY" select="preceding-sibling::*[@Type!='23'][1]/@Y"/>
      <xsl:variable name="prev2Y" select="preceding-sibling::*[@Type!='23'][2]/@Y"/>
      <xsl:variable name="prev3Y" select="preceding-sibling::*[@Type!='23'][3]/@Y"/>
      <xsl:variable name="prevX" select="preceding-sibling::*[@Type!='23'][1]/@X"/>
      <xsl:variable name="prev2X" select="preceding-sibling::*[@Type!='23'][2]/@X"/>
      <xsl:variable name="prevSize" select="preceding-sibling::*[@Type!='23'][1]/@Size"/>
      <xsl:variable name="nextSize" select="following-sibling::*[@Type!='23'][1]/@Size"/>

      <xsl:variable name="nextLine" select="following-sibling::*[@Type!='23'][1]/@Line_Number"/>
      <xsl:variable name="prevLine" select="preceding-sibling::*[@Type!='23'][1]/@Line_Number"/>
      <xsl:variable name="prev2Line" select="preceding-sibling::*[@Type!='23'][2]/@Line_Number"/>
      <xsl:variable name="prevHeight" select="preceding-sibling::*[@Type!='23'][1]/@Field_Height"/>

      <xsl:variable name="isNewHighField" select="$prev2Line != $prevLine and $prevHeight > '1'"/>
```

For example like this:

```
<xsl:variable name="nextY" select="following-sibling::*[@Type!='23' and @ApiName!='Signature'][1]/@Y"/>
      <xsl:variable name="prevY" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][1]/@Y"/>
      <xsl:variable name="prev2Y" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][2]/@Y"/>
      <xsl:variable name="prev3Y" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][3]/@Y"/>
      <xsl:variable name="prevX" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][1]/@X"/>
      <xsl:variable name="prev2X" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][2]/@X"/>
      <xsl:variable name="prevSize" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][1]/@Size"/>
      <xsl:variable name="nextSize" select="following-sibling::*[@Type!='23' and @ApiName!='Signature'][1]/@Size"/>

      <xsl:variable name="nextLine" select="following-sibling::*[@Type!='23' and @ApiName!='Signature'][1]/@Line_Number"/>
      <xsl:variable name="prevLine" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][1]/@Line_Number"/>
      <xsl:variable name="prev2Line" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][2]/@Line_Number"/>
      <xsl:variable name="prevHeight" select="preceding-sibling::*[@Type!='23' and @ApiName!='Signature'][1]/@Field_Height"/>
```

Note that there two XSLT templates which can influence on PDF:

```
<xsl:template name ="applyFields">
```

and

```
 <xsl:template name ="applyFieldsOld">
```

Which one will be consider by xsl variable "areLinesUsed" :

```
<xsl:variable name="areLinesUsed" select="count(//Header/Column[@Field_Height > '1']) > 0 or count($firstColumn) = 0" /> 
```

as you can see in its turn it depends on header columns height. So better to modify all templates to avoid another bugs. Place of choosing xsl template depends on “applyFields” variable :

```
<xsl:choose>
      <xsl:when test="$areLinesUsed">
        <xsl:call-template name="applyFields">
          <xsl:with-param name="fieldsSet" select="//Footer/Column"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="applyFieldsOld">
          <xsl:with-param name="fieldsSet" select="//Footer/Column"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>    

```
