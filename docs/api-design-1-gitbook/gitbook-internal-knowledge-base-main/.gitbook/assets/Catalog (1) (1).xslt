<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
    <!-- PDF4d-3d16.xsl 24Sep2015 (PDF4d-3d15.xsl Does not Exist)-->
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no" />
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    <xsl:variable name="imgUrl" select="//Line[@ApiName ='Image']" />
    <xsl:template match="/">
        <html>
            <head>
                <style type="text/css">
                    * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, Arial Hebrew, Helvetica, Garuda, sans-serif;
                font-size: 12px;
                }

                
        .header td,
        .hebrewHeader td{
        width: 23.3%;
        table-layout: fixed;
        }
        .header,
        .hebrewHeader {
        width:100%;
        table-layout: fixed;
        padding:0 20px;
        }
        .splitter {
            background-color: #f1f1f2;
            font-size: 16px;
            color: #000;
            font-weight:700;
          }
        .splitter,
        .hb_splitter {
          font-size: 10px;
        }

            .container {
                width: 100%;
                padding: 20px;
            }

            .logo {
                margin-top: 30px;
                margin-bottom: 40px;
                text-align: center;   
            }

            .logo img {
                    <!-- margin: 0 auto; -->
                    }

            table {
            border: none;
            border-collapse: separate;
            border-spacing: 5px;
            margin: 0 auto;
            }

            table tr {
               page-break-inside:avoid !important; 
               page-break-before:auto !important; 
               page-break-after:auto !important; 
            } 
            table td {
                page-break-inside:avoid !important;
               border: none;
                overflow:hidden;
                width: 30%;
                page-break-before:auto !important; 
               page-break-after:auto !important;
            }
                    <!-- .itemCell {
                border: 1px solid black;
            } -->
                    .itemImg {
                min-height: 300px;
                padding: 10px;
                page-break-inside:avoid !important;

            }

            .itemImg img {
                display: block;
                margin: 0 auto;
                width: 300px;
                max-width: 300px;
                max-height: 300px;
            }

            .itemInfo {
                padding: 0 15px 15px 15px;
                text-align:center;
                page-break-inside:avoid !important;
            }

            .itemCell {
                border: 1px solid black;
                page-break-inside:avoid !important;
                min-height:450px;
            }
                </style>
            </head>

            <body>
                <header>
                    <div class="logo">
                        <img>
                            <xsl:attribute name="src">
                                <!--  <xsl:variable name="imgURL"  select="substring-before(Root/Title/Image,'&amp;')"/><xsl:value-of select="$imgURL"/>-->
                                <xsl:value-of select="//Root/Title/Image" />
                            </xsl:attribute>
                        </img>
                    </div>
                </header>
                <div class="mainBlock">
                    <table width="100%" align="center" cellpadding="4" cellspacing="0">
                        <tr class="info">
                            <xsl:apply-templates select="//Header/Column" />
                            <!-- <xsl:apply-templates select="//Line[@Type='1'][1]/Column" /> -->
                        </tr>
                    </table>
                </div>
                <div>
                    <xsl:apply-templates select="Root/Cart/Group" />
                </div>
            </body>
        </html>
    </xsl:template>


    <!--START OF HEADER-->
    <xsl:template match="//Header/Column">
        <xsl:param name='Y'>
            <xsl:value-of select='@Y' />
        </xsl:param>
        <xsl:param name='size'>
            <xsl:value-of select='@Size' />
        </xsl:param>
        <xsl:param name='prevY'>
            <xsl:value-of select="preceding-sibling::*[@Type!='23'][1]/@Y" />
        </xsl:param>
        <table class="header">
            <xsl:if test="@Type='13'">
                <td class="splitter" colspan="4" style="color: black;">
                    <xsl:value-of select="Name" />
                </td>
            </xsl:if>
            <xsl:if test="@Type!='13'">
                <xsl:if test="@X='0' and $size='1'">
                    <tr>
                        <xsl:if test="@Type='14'">
                            <td style="color: black; ">
                                <xsl:value-of select="Name" />
                            </td>
                            <td style="color: black; ">
                                <xsl:for-each select="Value/*">
                                    <xsl:if test="child::node() != ''">
                                        <xsl:value-of select="." />
                                        <br />
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </xsl:if>
                        <xsl:if test="@Type!='14'">
                            <td style="color: black; ">
                                <xsl:value-of select="Name" />
                            </td>
                            <td style="color: black; ">
                                <xsl:value-of select="Value" />
                            </td>
                        </xsl:if>
                        <xsl:for-each select="//Header/Column">
                            <xsl:variable name="YY" select="@Y" />
                            <xsl:if test="@X='1' and $Y=$YY">
                                <xsl:if test="@Type='14'">
                                    <td style="color: black; ">
                                        <xsl:value-of select="Name" />
                                    </td>
                                    <td style="color: black; ">
                                        <xsl:for-each select="Value/*">
                                            <xsl:if test="child::node() != ''">
                                                <xsl:value-of select="." />
                                                <br />
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                </xsl:if>
                                <xsl:if test="@Type!='14'">
                                    <td style="color: black; ">
                                        <xsl:value-of select="Name" />
                                    </td>
                                    <td style="color: black; ">
                                        <xsl:value-of select="Value" />
                                    </td>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </tr>
                </xsl:if>
                <xsl:if test="@X='1' and $size='1'">
                    <xsl:if test="@Type='14' and @Y!=$prevY">
                        <tr>
                            <td style="color: black; "></td>
                            <td style="color: black; "></td>
                            <td style="color: black; ">
                                <xsl:value-of select="Name" />
                            </td>
                            <td style="color: black; ">
                                <xsl:for-each select="Value/*">
                                    <xsl:if test="child::node() != ''">
                                        <xsl:value-of select="." />
                                        <br />
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="@Type!='14' and @Y!=$prevY">
                        <tr>
                            <td style="color: black; "></td>
                            <td style="color: black; "></td>
                            <td style="color: black; ">
                                <xsl:value-of select="Name" />
                            </td>
                            <td style="color: black; ">
                                <xsl:value-of select="Value" />
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="@X='0' and $size='2'">
                    <xsl:if test="@Type='14'">
                        <tr>
                            <td colspan="2" style="color: black; ">
                                <xsl:value-of select="Name" />
                            </td>
                            <td colspan="2" style="color: black; ">
                                <xsl:for-each select="Value/*">
                                    <xsl:if test="child::node() != ''">
                                        <xsl:value-of select="." />
                                        <br />
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="@Type!='14'">
                        <tr>
                            <td colspan="2" style="color: black; ">
                                <xsl:value-of select="Name" />
                            </td>
                            <td colspan="2" style="color: black; ">
                                <xsl:value-of select="Value" />
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:if>
            </xsl:if>
        </table>
    </xsl:template>
    <!--END OF HEBREW HEADER-->

    <xsl:param name="cols">3</xsl:param>

    <xsl:template match="Root/Cart/Group">
        <table width="90%" align="center" border="1">
            <xsl:apply-templates select="Line[position() mod $cols = 1 or position() = 1]" mode="row" />
        </table>
    </xsl:template>

    <xsl:template match="Line" mode="row">
        <tr>
            <xsl:apply-templates select=". | following-sibling::Line[position() &lt; $cols]" mode="cell" />
        </tr>
    </xsl:template>

    <xsl:template match="Line" mode="cell">
        <td>
            <div class="itemCell">
                <div class="itemImg">
                    <xsl:variable name="imgURL" select="substring-before(./Column[@ApiName='Image']/Value,'&amp;')" />
                    <img>
                        <xsl:attribute name="src">
                            <!--     
        <xsl:variable name="imgURL" select="concat('https://cdn.pepperi.com/',last-part)"/> -->
        <xsl:value-of select="./Column[@ApiName='Image']/Value" />
                        </xsl:attribute>
                    </img>
                </div>
                <div class="itemInfo">
                    <xsl:for-each select="Column[@ApiName='ItemExternalID' or @ApiName='ItemMainCategory' or @ApiName='ItemName' or @ApiName='UnitsQuantity' or @ApiName='UnitPrice' or @ApiName='TotalUnitsPriceAfterDiscount']">
                        <span style="font-weight:bold;">
                            <xsl:value-of select="Name" />
                        </span>
                        &#160;
                        <span>
                            <xsl:value-of select="Value" />
                            <xsl:if test="not(position()=last())">
                                <br />
                            </xsl:if>
                        </span>
                    </xsl:for-each>
                </div>
            </div>
            <!-- <xsl:copy>
            <xsl:copy-of select="Column/Value"/>
            </xsl:copy>
      -->
        </td>
    </xsl:template>
</xsl:stylesheet>