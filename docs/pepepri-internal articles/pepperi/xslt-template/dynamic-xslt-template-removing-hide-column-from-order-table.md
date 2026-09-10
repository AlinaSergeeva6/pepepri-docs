---
title: "Dynamic XSLT template - Removing (hide) column from order table"
order: 309
---
# Dynamic XSLT template - Removing (hide) column from order table

This becomes very useful when, for example, you are faced with the task of filtering order lines by some value, but this value should not be visible as a result in the PDF . Thus, we should first filter the lines, and then hide the column. We can’t just take it and remove it from the view in the back office, because then this value will not come to XML.

```
<!-- HIDE column TSAExample :-->
<!--<xsl:if test="@ApiName!='TSAExample'">-->
<th>
<xsl:value-of select="Name" />
</th>
<!--</xsl:if>-->
```

So we have field TSAExample in the lines:

![](/static/1-3.png)

just fox example , you filtered lines by TSAExample value and need to hide this field from PDF.

found this part code in xstl template:

```
<xsl:for-each select="//Line[@Type='1'][1]/Column">
<!-- HIDE column TSAExample :-->
<!--<xsl:if test="@ApiName!='TSAExample'">-->
<th>
<xsl:value-of select="Name" />
</th>
<!--</xsl:if>-->
</xsl:for-each>
```

uncomment the necessary parts of the code (result):

```
<xsl:for-each select="//Line[@Type='1'][1]/Column">
<!-- HIDE column TSAExample :-->
<xsl:if test="@ApiName!='TSAExample'">
<th>
<xsl:value-of select="Name" />
</th>
</xsl:if>
</xsl:for-each>
```

Secont step, fount this part of code in xslt template:

```
<!--Values of the table-->
                        <xsl:for-each select="Column">
                            <!--HIDE column TSAExample-->
                            <!--<xsl:if test="@ApiName!='TSAExample'">-->
                            <!--SORTING BY PARAMETER-->
                            <!--<xsl:sort select="./Column[@ApiName='ItemExternalID']"/>-->
                            <xsl:choose>
                                <xsl:when test="@ApiName='Image'">
                                    <td>
                                        <xsl:attribute name="style">width:

                                            <xsl:value-of select="@width" />;

                                        </xsl:attribute>
                                        <img style="width:60px">
                                            <xsl:attribute name="src">
                                                <xsl:variable name="imgURL"  select="substring-before(Value,'&amp;')"/>
                                                <xsl:value-of select="Value"/>
                                            </xsl:attribute>
                                        </img>
                                    </td>
                                </xsl:when>
                                <xsl:when test="@ApiName='UnitsQuantity'">
                                    <td>
                                        <xsl:value-of select='Value'/>
                                    </td>
                                </xsl:when>
                                <xsl:when test="@ApiName='TotalUnitsPriceAfterDiscount' or @ApiName='UnitPriceAfterDiscount' or @ApiName='UnitPrice'">
                                    <td >
                                        <xsl:variable name="last_part" select="substring(normalize-space(Value),string-length(normalize-space(Value))-2)"/>
                                        <xsl:variable name="first_part" select="substring-before(translate(Value,' ',''),$last_part)"/>
                                        <xsl:variable name="vals" select="concat(translate($first_part,',',''),translate($last_part,',','.'))"/>
                                        <xsl:if test="$DisplayCurrencyinLines='true'">
                                            <xsl:value-of select="concat($currency,format-number($vals, '###,##0.00'))"/>
                                        </xsl:if>
                                        <xsl:if test="$DisplayCurrencyinLines!='true'">
                                            <xsl:value-of select="format-number($vals, '###,##0.00')"/>
                                        </xsl:if>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td>
                                        <xsl:value-of select="Value" />
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- </xsl:if>-->
                        </xsl:for-each>
```

uncomment the necessary parts of the code (result):

```
 <!--Values of the table-->
                        <xsl:for-each select="Column">
                            <!--HIDE column TSAExample-->
                            <xsl:if test="@ApiName!='TSAExample'">
                            <!--SORTING BY PARAMETER-->
                            <!--<xsl:sort select="./Column[@ApiName='ItemExternalID']"/>-->
                            <xsl:choose>
                                <xsl:when test="@ApiName='Image'">
                                    <td>
                                        <xsl:attribute name="style">width:

                                            <xsl:value-of select="@width" />;

                                        </xsl:attribute>
                                        <img style="width:60px">
                                            <xsl:attribute name="src">
                                                <xsl:variable name="imgURL"  select="substring-before(Value,'&amp;')"/>
                                                <xsl:value-of select="Value"/>
                                            </xsl:attribute>
                                        </img>
                                    </td>
                                </xsl:when>
                                <xsl:when test="@ApiName='UnitsQuantity'">
                                    <td>
                                        <xsl:value-of select='Value'/>
                                    </td>
                                </xsl:when>
                                <xsl:when test="@ApiName='TotalUnitsPriceAfterDiscount' or @ApiName='UnitPriceAfterDiscount' or @ApiName='UnitPrice'">
                                    <td >
                                        <xsl:variable name="last_part" select="substring(normalize-space(Value),string-length(normalize-space(Value))-2)"/>
                                        <xsl:variable name="first_part" select="substring-before(translate(Value,' ',''),$last_part)"/>
                                        <xsl:variable name="vals" select="concat(translate($first_part,',',''),translate($last_part,',','.'))"/>
                                        <xsl:if test="$DisplayCurrencyinLines='true'">
                                            <xsl:value-of select="concat($currency,format-number($vals, '###,##0.00'))"/>
                                        </xsl:if>
                                        <xsl:if test="$DisplayCurrencyinLines!='true'">
                                            <xsl:value-of select="format-number($vals, '###,##0.00')"/>
                                        </xsl:if>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td>
                                        <xsl:value-of select="Value" />
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            </xsl:if>
                        </xsl:for-each>
```

As result you will get PDF without TSAExample column, but still will have it in XML:

![](/static/1-4.png)

![](/static/2-1.png)
