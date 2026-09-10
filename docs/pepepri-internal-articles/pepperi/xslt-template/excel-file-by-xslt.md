---
title: "Excel File by XSLT"
description: "You can find example of template in attachments on this page"
order: 295
---
# Excel File by XSLT

*You can find example of template in attachments on this page*

For example , you want to get Excel file like this:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-8.png)

Description:

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

**ORDER ID** – set the name in Excel

**test="Name='ID'"** – put name of the proper field in BackOffice

```
<Data ss:Type="String">  // Type of variable
<xsl:value-of select="Value"/>  // Set value of the field
```

Also you can hardcode Row or Cell :

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

32KB

[template.xslt](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FSvf6AFjibN5xDZcHNQd3%2Ftemplate.xslt?alt=media&token=f40711b7-5cb5-4749-a1d9-03a865315323)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2FSvf6AFjibN5xDZcHNQd3%2Ftemplate.xslt?alt=media&token=f40711b7-5cb5-4749-a1d9-03a865315323)
