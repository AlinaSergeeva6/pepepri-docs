---
description: You can find example of template in attachments on this page
---

# Excel File by XSLT

For example , you want to get Excel file like this:

![](<../../.gitbook/assets/1 (13).png>)

Description:&#x20;

```
  			         <Row>
                        <Cell>
                            <Data ss:Type="String">ORDER ID</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='ID'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>
```

**ORDER ID** – set the name in Excel&#x20;

**test="Name='ID'"** – put name of the proper field in BackOffice

```
<Data ss:Type="String">  // Type of variable
<xsl:value-of select="Value"/>  // Set value of the field
```

&#x20;Also you can hardcode Row or Cell :

```
 <Row ss:Index="25">  or <Cell ss:Index="5"> //put here number of row/cell that you need
```

Also it is possible to do calculations :

```
<Cell ss:Index="6" ss:StyleID="s21" ss:Formula="=RC[-1]*RC[-3]">
<xsl:attribute name="ss:Type">Number</xsl:attribute>
 </Cell>
 
//ss:Formula="=RC[-1]*RC[-3]"> - it means, 
RC[-1] - cell from far right side minus 1(Order QTY in Excel),
RC[-3] - cell from far right side minus 3(Wholesale Price in Excel).
In the result – SUBTOTAL cell was calculated
```



{% file src="../../.gitbook/assets/template.xslt" %}
