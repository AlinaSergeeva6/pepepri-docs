<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
    <!-- PDF4d-3d16.xsl 24Sep2015 (PDF4d-3d15.xsl Does not Exist)-->
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no" />
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />  
    <xsl:variable name="imgUrl" select="//Line[@ApiName ='Image']"/>  
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

            .container {
                width: 100%;
                padding: 20px;
            }

            .logo {
                margin-top: 30px;
                margin-bottom: 60px;
                text-align: center;   
            }

            .logo img {
                <!-- margin: 0 auto; -->
            }

            table {
            border: none;
            border-collapse: separate;
            border-spacing: 25px;
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
                        <img src='data:image/png;base64,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' />

                    </div>
                    </header>
                    <div>
                    <xsl:apply-templates select="Root/Cart/Group"/>
                    </div>
        </body>
        </html>
    </xsl:template>

    <xsl:param name="cols">3</xsl:param>
  
    <xsl:template match="Root/Cart/Group" >
        <table width="90%" align="center" border="1">
            <xsl:apply-templates select="Line[position() mod $cols = 1 or position() = 1]" mode="row"/>
        </table>
    </xsl:template>

    <xsl:template match="Line" mode="row">
        <tr>
            <xsl:apply-templates select=". | following-sibling::Line[position() &lt; $cols]" mode="cell"/>
        </tr>
    </xsl:template>

    <xsl:template match="Line" mode="cell">
        <td>
        <div class="itemCell">
        <div class="itemImg">
        <img>
        <xsl:attribute name="src">
        <xsl:variable name="imgURL"  select="substring-before(Column[@ApiName='Image']/Value,'&amp;')"/>
<!--     
        <xsl:variable name="imgURL" select="concat('https://cdn.pepperi.com/',last-part)"/> -->
        <xsl:value-of select="$imgURL"/>
        </xsl:attribute>
        </img>
        </div>
        <div class="itemInfo">
            <xsl:for-each select="Column[@ApiName='ItemExternalID' or @ApiName='ItemMainCategory' or @ApiName='ItemName' or @ApiName='UnitsQuantity' or @ApiName='UnitPrice' or @ApiName='TotalUnitsPriceAfterDiscount']">
            <span style="font-weight:bold;"><xsl:value-of select="Name"/></span>&#160; <span><xsl:value-of select="Value"/>
              <xsl:if test="not(position()=last())">
    <br />
  </xsl:if></span>
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
