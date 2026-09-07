<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="1.0">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>
    <xsl:variable name="currency" select="//Header/Column[@ApiName='Currency']/Value" />
    <!--FOR CHANGING PDF TO HEBREW SET "true()"-->
    <xsl:variable name="Hebrew" select="false()" />
    <!--FOR DISPLAY TotalBox IN THE FOOTER SET "true()"-->
    <xsl:variable name="TotalBox" select="false()" />
    <!--FOR DISPLAY CURRENCY IN SUBTOTALS SET "true"-->
    <xsl:variable name="DisplayCurrencyinSubTotals" select="true()" />
    <!--FOR DISPLAY CURRENCY IN LINES SET "true"-->
    <xsl:variable name="DisplayCurrencyinLines" select="true()" />
    <!--FOR DISPLAY CURRENCY IN FOOTER SET "true"-->
    <xsl:variable name="DisplayCurrencyinFooter" select="true()" />
    <xsl:template name="copyXml">
        <xsl:param name="nodeSet"/>
        <xsl:for-each select="$nodeSet">
            <xsl:text>&lt;</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text></xsl:text>
            <xsl:for-each select="@*">
                <xsl:value-of select="name()"/>="
                
                <xsl:value-of select="."/>" 
                
                <xsl:text></xsl:text>
            </xsl:for-each>
            <xsl:text>&gt;</xsl:text>
            <xsl:choose>
                <xsl:when test="count(./*) = 0">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <br/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:call-template name="copyXml">
                <xsl:with-param name="nodeSet" select="./*"/>
            </xsl:call-template>
            <xsl:text>&lt;/</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>&gt;</xsl:text>
            <br/>
        </xsl:for-each>
    </xsl:template>
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
        padding:0;
        }

        .splitter {
          background-color: #f1f1f2;
          font-size: 12px;
          color: #000;
          font-weight:700;
        }


        .wrapper {
          padding: 15px;

        }

        .info td {
          padding: 5px;
          width: 25%;
          
        }

        .logo {
          margin-left: auto;
          margin-right: auto;
          height: auto;
          margin-top: 15px;
          
        }

        .logo img {
          display: block;
          max-width: 400px;
          padding-bottom: 15px;
          margin-left: auto;
          margin-right: auto;
        
        }

        hr {
          border: none;
          border-bottom: 3px solid #BBBDC0;
          
        }

        .item-info {
          margin-top: 50px;
          border-collapse: collapse;
          text-align: center;
         

        }

        .item-info th {
          font-size: 12px;
          background-color: #f1f1f2;
          font-weight: normal;
          border: 1px solid #dddddd;
         text-align: center;
        }

        .item-info td {
          font-size: 12px;
        }

       .item-info td{
        border: 1px solid #dddddd;
        padding: 3px;
       }

        tr,
        th {
          border-bottom: 1px solid #dddddd;
          padding: 3px;
          height:20px;
        }

        table td {
          padding: 3px 5px;
        }


        .footer-table{
        border-bottom:1px solid #f1f1f2;
        border-collapse: collapse;
        float:right;
        }
        
        .footer-table td{
        padding:2px;
        }

        .tr:last-child {
        background-color: #f1f1f2;
        font-weight:bold;
        border-top: 2px solid #000000;
        height:30px;
        }
        
        .hb_td{
        text-align:right;
        }

        .hb_splitter{
          background-color: #f1f1f2;
          font-size: 12px;
          color: #000;
          text-align:right;
          font-weight:700;
        }

        .hb_item-info{
         margin-top: 50px;
          border-collapse: collapse;
          text-align: right;
        }

        .hb_item-info td{
        border: 1px solid #dddddd;
        padding: 3px;
       }

        .hb_item-info th {
          font-size: 12px;
          background-color: #f1f1f2;
          font-weight: normal;
          border: 1px solid #dddddd;
          text-align: right;
        }

        .footerName{
        font-size:14px;
        }

        .footerValue,
        .foterNameHb{
        text-align:right;
        font-size:14px;
        }

        .footerValueHb{
        text-align:left;
        font-size:14px;
        }

        .Signature{
        width:50%;
        align:left;
        float:left;
        }

        .tf{
        display: inline;
        }

        .SigImg{
        max-width:320px;
        margin-top: 5%;
        }


        @supports (-webkit-touch-callout: none) {
			/*iOS*/
        *{
        font-size: 8px;
        }

        .mainTable{
        width:100%;
        }

        .splitter,
        .hb_splitter {
          font-size: 10px;
        }
        .item-info th,
        .hb_item-info th{
          font-size: 8px;
        }

        .item-info td,
        .hb_item-info td {
          font-size: 8px;
        }

        .footerName{
        font-size:8px;
        }

        .footerValue,
        .foterNameHb{
        text-align:right;
        font-size:8px;
        }

        .footerValueHb{
        text-align:left;
        font-size:8px;
        }

        #units-total,
        #interim,
        #total-sum{
        padding-left:40px;
        padding-right:40px;
        }
           
		  }
        
        
      </style>
            </head>
            <body>
                <!--FOR SHOW XML SET "true()"-->
                <xsl:if test="false()">
                    <div>
                        <!--SHOW XML-->
                        <h1>XML</h1>
                        <xsl:call-template name="copyXml">
                            <xsl:with-param name="nodeSet" select="/"/>
                        </xsl:call-template>
                        <br/>
                        END XML
                    </div>
                </xsl:if>
                <div class="wrapper">
                    <header>
                        <div class="logo">
                            <img>
                                <xsl:attribute name="src">
                                    <!--  <xsl:variable name="imgURL"  select="substring-before(Root/Title/Image,'&amp;')"/><xsl:value-of select="$imgURL"/>-->
                                    <xsl:value-of select="//Root/Title/Image"/>
                                </xsl:attribute>
                            </img>
                        </div>
                    </header>
                    <div class="mainBlock">
                        <table width="100%" align="center" cellpadding="4" cellspacing="0">
                            <tr class="info">
                                <xsl:apply-templates select="//Header/Column" />
                                <xsl:apply-templates select="//Line[@Type='1'][1]/Column" />
                                <br/>
                                <br/>
                                <xsl:call-template name="footer"></xsl:call-template>
                            </tr>
                        </table>
                    </div>
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
        <xsl:if test="$Hebrew!='true'">
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
                                <xsl:variable name="YY"  select="@Y"/>
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
        </xsl:if>
        <xsl:if test="$Hebrew='true'">
            <!--START OF HEBREW HEADER-->
            <table class="hebrewHeader">
                <xsl:if test="@Type='13'">
                    <td class="hb_splitter" colspan="4" style="color: black;">
                        <xsl:value-of select="Name" />
                    </td>
                </xsl:if>
                <xsl:if test="@Type!='13'">
                    <xsl:if test="@X='0' and $size='1'">
                        <tr>
                            <xsl:if test="@Type='14'">
                                <td class="hb_td" style="color: black; ">
                                    <xsl:for-each select="Value/*">
                                        <xsl:if test="child::node() != ''">
                                            <xsl:value-of select="." />
                                            <br />
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                                <td class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Name" />
                                </td>
                            </xsl:if>
                            <xsl:if test="@Type!='14'">
                                <td class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Value" />
                                </td>
                                <td class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Name" />
                                </td>
                            </xsl:if>
                            <xsl:for-each select="//Header/Column">
                                <xsl:variable name="YY"  select="@Y"/>
                                <xsl:if test="@X='1' and $Y=$YY">
                                    <xsl:if test="@Type='14'">
                                        <td class="hb_td" style="color: black; ">
                                            <xsl:for-each select="Value/*">
                                                <xsl:if test="child::node() != ''">
                                                    <xsl:value-of select="." />
                                                    <br />
                                                </xsl:if>
                                            </xsl:for-each>
                                        </td>
                                        <td class="hb_td" style="color: black; ">
                                            <xsl:value-of select="Name" />
                                        </td>
                                    </xsl:if>
                                    <xsl:if test="@Type!='14'">
                                        <td class="hb_td" style="color: black; ">
                                            <xsl:value-of select="Value" />
                                        </td>
                                        <td class="hb_td" style="color: black; ">
                                            <xsl:value-of select="Name" />
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
                                <td class="hb_td" style="color: black; ">
                                    <xsl:for-each select="Value/*">
                                        <xsl:if test="child::node() != ''">
                                            <xsl:value-of select="." />
                                            <br />
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                                <td class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Name" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="@Type!='14' and @Y!=$prevY">
                            <tr>
                                <td style="color: black; "></td>
                                <td style="color: black; "></td>
                                <td class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Value" />
                                </td>
                                <td class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Name" />
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="@X='0' and $size='2'">
                        <xsl:if test="@Type='14'">
                            <tr>
                                <td colspan="2" class="hb_td" style="color: black; ">
                                    <xsl:for-each select="Value/*">
                                        <xsl:if test="child::node() != ''">
                                            <xsl:value-of select="." />
                                            <br />
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                                <td colspan="2" class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Name" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="@Type!='14'">
                            <tr>
                                <td colspan="2" class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Value" />
                                </td>
                                <td colspan="2" class="hb_td" style="color: black; ">
                                    <xsl:value-of select="Name" />
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:if>
                </xsl:if>
            </table>
        </xsl:if>
    </xsl:template>
    <!--END OF HEBREW HEADER-->
    <!--END OF HEADER-->
    <!--START MAIN TABLE-->
    <xsl:template match="Line[@Type='1'][1]/Column">
        <xsl:if test="position()=1">
            <table class="mainTable" style="width:100%">
                <xsl:if test="$Hebrew!='true'">
                    <xsl:attribute name="class">item-info</xsl:attribute>
                </xsl:if>
                <xsl:if test="$Hebrew='true'">
                    <xsl:attribute name="class">hb_item-info</xsl:attribute>
                </xsl:if>
                <!--Headers of the table-->
                <thead style="display: table-header-group; border: none">
                    <tr>
                        <!-- To remove column ItemMainCategory from header-->
                        <xsl:for-each select="//Line[@Type='1'][1]/Column">
                            <!-- HIDE column TSAExample :-->
                            <!--<xsl:if test="@ApiName!='TSAExample'">-->
                            <th>
                                <xsl:value-of select="Name" />
                            </th>
                            <!--</xsl:if>-->
                        </xsl:for-each>
                    </tr>
                </thead>
                <xsl:for-each select="//Line[descendant::Column[@ApiName='UnitsQuantity']/Value &gt; 0 ] ">
                    <!-- FILTERING BY PARAMETER -->
                    <!--<xsl:if test="./Column[@ApiName='ItemMainCategory']/Value!='Hats'">-->
                    <tr>
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
                    </tr>
                    <!--</xsl:if>-->
                </xsl:for-each>
                <tr>
                    <td colspan="4" style="text-align: right; border:none;">Total:</td>
                    <td id="units-total">0</td>
                    <td id="stock-total">0</td>
                    <td id ="interim" colspan="2"></td>
                    <td id="total-sum"></td>
                </tr>
            </table>
            <hr/>
            <script language="javascript">
                var arr = [],
                result = [];   
                <xsl:for-each select = "//Line" >
                    <!--FILTERING BY PARAMETER-->
                    <!--<xsl:if test="./Column[@ApiName='ItemMainCategory']/Value!='Hats'">-->
                    <xsl:for-each select = "Column[@ApiName='UnitsQuantity']" >
                        <xsl:if test="Value != '' and Value &gt; 0 ">
                            arr.push(Math.abs("<xsl:value-of select='Value'/>")); 
                        </xsl:if>
                    </xsl:for-each>
                    <!-- </xsl:if>-->
                </xsl:for-each>
                arr.forEach(function(item, i, arr) {
                    result.push(parseInt(arr[i]));
                });
                var sum = result.reduce(function(a,b) { return a + b;}, 0);
                sum = String(sum);
                document.getElementById("units-total").innerHTML = sum.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            
            </script>
              <script language="javascript">
                var arr = [],
                result = [];   
                <xsl:for-each select = "//Line" >
                    <!--FILTERING BY PARAMETER-->
                    <!--<xsl:if test="./Column[@ApiName='ItemMainCategory']/Value!='Hats'">-->
                    <xsl:for-each select = "Column[@ApiName='TSAStockQuantity']" >
                        <xsl:if test="Value != '' and Value &gt; 0 ">
                            arr.push(Math.abs("<xsl:value-of select='Value'/>")); 
                        </xsl:if>
                    </xsl:for-each>
                    <!-- </xsl:if>-->
                </xsl:for-each>
                arr.forEach(function(item, i, arr) {
                    result.push(parseInt(arr[i]));
                });
                var sum = result.reduce(function(a,b) { return a + b;}, 0);
                sum = String(sum);
                document.getElementById("stock-total").innerHTML = sum.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            
            </script>
            <script language="javascript">
                var arr = [];
                var result = [];    
                 
                
                <!--To remove row with value 'Hats' of ItemMainCategory field from this total-->
                <!--<xsl:for-each select="//Line[descendant::Column[@ApiName='UnitsQuantity']/Value &gt; 0 and Column[@ApiName='ItemMainCategory']/Value!='Hats']">-->
                <xsl:for-each select = "//Line" >
                    <!-- <xsl:if test="./Column[@ApiName='ItemMainCategory']/Value!='Hats'">-->
                    <xsl:for-each select = "Column[@ApiName='TotalUnitsPriceAfterDiscount']" >
                        <xsl:if test="Value != ''">
                            arr.push("<xsl:value-of select='Value'/>");
                        </xsl:if>
                    </xsl:for-each>
                    <!-- </xsl:if>-->
                </xsl:for-each>
                <!--</xsl:for-each>-->
              arr.forEach(function (item, i, arr) {
        result.push(parseFloat(arr[i].replace(/,/g, ".").replace(/ /g, '').replace(/\$/g, '')));
    });
    var sum = result.reduce(function (a, b) { return a + b; }, 0);
    function format2(n, currency) {
        return currency + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
    }
    var DisplayCurrencyinSubTotals=
                <xsl:value-of select='$DisplayCurrencyinSubTotals'/>
    if(DisplayCurrencyinSubTotals)
    document.getElementById("total-sum").innerHTML = format2(Math.abs(sum), ("<xsl:value-of select='$currency'/>").replace(/\t/g,'').replace(/\n/g,'').replace(/ /g,'').replace(/\r/g,''));
    else 
    document.getElementById("total-sum").innerHTML = format2(Math.abs(sum), "");
            
            </script>
        </xsl:if>
    </xsl:template>
    <!--END MAIN TABLE-->
    <!--START FOOTER-->
    <xsl:template name="footer">
        <xsl:if test="$Hebrew!='true'">
            <xsl:if test="$TotalBox!='true'">
                <table class="footer-table tf">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName != 'Signature' and @ApiName!='TotalsBox'">
                            <tr class="tr">
                                <td class="footerName">
                                    <xsl:value-of select='Name'/> :    
                                                
                                </td>
                                <td class="footerValue">
                                    <xsl:if test="@ApiName!= 'DiscountPercentage' and @ApiName!='TaxPercentage' and $DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                    </xsl:if>
                                    <xsl:if test="@ApiName!= 'DiscountPercentage' and @ApiName!='TaxPercentage' and $DisplayCurrencyinFooter!='true'"></xsl:if>
                                    <xsl:if test="@ApiName = 'DiscountPercentage' or @ApiName= 'TaxPercentage'">
                                        <xsl:text>%</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select='Value'/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <table class="footer-table" align="left" style="display:none;">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName = 'TotalsBox'">
                            <tr class="tr">
                                <td class="footerName">Sub Total:</td>
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/SubTotal/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/SubTotal/Value" />
                                    </xsl:if>
                                </td>
                            </tr>
                            <tr class="tr">
                                <td class="footerName">
                                               Discount Percentage:</td>
                                <td class="footerValue">
                                    <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/DiscountPercentage/Name" />
                                    <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/DiscountPercentage/Value" />
                                </td>
                            </tr>
                            <tr class="tr">
                                <td class="footerName">Discount:</td>
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/Discount/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/Discount/Value" />
                                    </xsl:if>
                                </td>
                            </tr>
                            <tr class="tr">
                                <td class="footerName">Totals:</td>
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='GrandTotal']/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='GrandTotal']/Value" />
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </xsl:if>
            <xsl:if test="$TotalBox='true'">
                <table class="footer-table tf"  style="display:none;">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName != 'Signature' and @ApiName!='TotalsBox'">
                            <tr class="tr">
                                <td class="footerName">
                                    <xsl:value-of select='Name'/> :
                                                
                                </td>
                                <td class="footerValue">
                                    <xsl:if test="@ApiName!= 'DiscountPercentage' and @ApiName!='TaxPercentage' and $DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                    </xsl:if>
                                    <xsl:if test="@ApiName!= 'DiscountPercentage' and @ApiName!='TaxPercentage' and $DisplayCurrencyinFooter!='true'"></xsl:if>
                                    <xsl:if test="@ApiName = 'DiscountPercentage' or @ApiName= 'TaxPercentage'">
                                        <xsl:text>%</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select='Value'/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <table class="footer-table" align="left">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName = 'TotalsBox'">
                            <tr class="tr">
                                <td class="footerName">Sub Total:</td>
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/SubTotal/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/SubTotal/Value" />
                                    </xsl:if>
                                </td>
                            </tr>
                            <tr class="tr">
                                <td class="footerName">
                                               Discount Percentage:</td>
                                <td class="footerValue">
                                    <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/DiscountPercentage/Name" />
                                    <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/DiscountPercentage/Value" />
                                </td>
                            </tr>
                            <tr class="tr">
                                <td class="footerName">Discount:</td>
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/Discount/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/Discount/Value" />
                                    </xsl:if>
                                </td>
                            </tr>
                            <tr class="tr">
                                <td class="footerName">Totals:</td>
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='GrandTotal']/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='GrandTotal']/Value" />
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </xsl:if>
            <table class="Signature tf" align="left">
                <xsl:for-each select="//Footer/Column">
                    <xsl:if test="@ApiName = 'Signature'">
                        <tr>
                            <td>
                                <img class="SigImg">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="//Footer/Column[@ApiName='Signature']/Value" />
                                    </xsl:attribute>
                                </img>
                            </td>
                        </tr>
                        <tr>
                            <td>X----------------------------------------------------------</td>
                        </tr>
                        <tr>
                            <td>Customer Signature</td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
        </xsl:if>
        <br/>
        <br/>
        <!--START HEBREW  FOOTER-->
        <xsl:if test="$Hebrew='true'">
            <xsl:if test="$TotalBox='true'">
                <table class="footer-table tf" style="display:none;">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName != 'Signature' and @ApiName!='TotalsBox'">
                            <tr class="tr">
                                <td class="footerValue">
                                    <xsl:if test="@ApiName!= 'DiscountPercentage' and @ApiName!='TaxPercentage' and $DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                    </xsl:if>
                                    <xsl:if test="@ApiName!= 'DiscountPercentage' and @ApiName!='TaxPercentage' and $DisplayCurrencyinFooter!='true'"></xsl:if>
                                    <xsl:if test="@ApiName = 'DiscountPercentage' or @ApiName= 'TaxPercentage'">
                                        <xsl:text>%</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select='Value'/>
                                </td>
                                <td class="foterNameHb">
                                                   : 
                                    <xsl:value-of select='Name'/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <table class="footer-table tf" style="float:left;">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName = 'TotalsBox'">
                            <tr class="tr">
                                <td class="footerValueHb">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/SubTotal/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/SubTotal/Value" />
                                    </xsl:if>
                                </td>
                                <td class="foterNameHb">:Sub Total</td>
                            </tr>
                            <tr class="tr">
                                <td class="footerValueHb">
                                    <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/DiscountPercentage/Name" />
                                    <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/DiscountPercentage/Value" />
                                </td>
                                <td class="foterNameHb">
                                               :Discount Percentage</td>
                            </tr>
                            <tr class="tr">
                                <td class="footerValueHb">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/Discount/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/Discount/Value" />
                                    </xsl:if>
                                </td>
                                <td class="foterNameHb">:Discount</td>
                            </tr>
                            <tr class="tr">
                                <td class="footerValueHb">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='GrandTotal']/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='GrandTotal']/Value" />
                                    </xsl:if>
                                </td>
                                <td class="foterNameHb">:Totals</td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <table class="Signature tf" style="float:right;">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName = 'Signature'">
                            <tr>
                                <td style="border: 1px solod black;">
                                    <img class="SigImg">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//Footer/Column[@ApiName='Signature']/Value" />
                                        </xsl:attribute>
                                    </img>
                                </td>
                            </tr>
                            <tr>
                                <td>----------------------------------------------------------X</td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">Customer Signature</td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </xsl:if>
            <xsl:if test="$TotalBox!='true'">
                <table class="footer-table tf" style="float:left;">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName != 'Signature' and @ApiName!='TotalsBox'">
                            <tr class="tr">
                                <td class="footerValue">
                                    <xsl:if test="@ApiName!= 'DiscountPercentage' and @ApiName!='TaxPercentage' and $DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                    </xsl:if>
                                    <xsl:if test="@ApiName!= 'DiscountPercentage' and @ApiName!='TaxPercentage' and $DisplayCurrencyinFooter!='true'"></xsl:if>
                                    <xsl:if test="@ApiName = 'DiscountPercentage' or @ApiName= 'TaxPercentage'">
                                        <xsl:text>%</xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select='Value'/>
                                </td>
                                <td class="foterNameHb">
                                                   : 
                                    <xsl:value-of select='Name'/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <table class="footer-table tf" align="left" style="display:none;">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName = 'TotalsBox'">
                            <tr class="tr">
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/SubTotal/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/SubTotal/Value" />
                                    </xsl:if>
                                </td>
                                <td class="foterNameHb">:Sub Total</td>
                            </tr>
                            <tr class="tr">
                                <td class="footerValue">
                                    <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/DiscountPercentage/Name" />
                                    <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/DiscountPercentage/Value" />
                                </td>
                                <td class="foterNameHb">
                                               :Discount Percentage</td>
                            </tr>
                            <tr class="tr">
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/Discount/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='TotalsBox']/Value/Discount/Value" />
                                    </xsl:if>
                                </td>
                                <td class="foterNameHb">:Discount</td>
                            </tr>
                            <tr class="tr">
                                <td class="footerValue">
                                    <xsl:if test="$DisplayCurrencyinFooter='true'">
                                        <xsl:value-of select="//Header/Column[@ApiName='Currency']/Value"/>
                                        <xsl:value-of select="//Footer/Column[@ApiName='GrandTotal']/Value" />
                                    </xsl:if>
                                    <xsl:if test="$DisplayCurrencyinFooter!='true'">
                                        <xsl:value-of select="//Footer/Column[@ApiName='GrandTotal']/Value" />
                                    </xsl:if>
                                </td>
                                <td class="foterNameHb">:Totals</td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <table class="Signature tf" style="float:right;">
                    <xsl:for-each select="//Footer/Column">
                        <xsl:if test="@ApiName = 'Signature'">
                            <tr>
                                <td>
                                    <img class="SigImg">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="//Footer/Column[@ApiName='Signature']/Value" />
                                        </xsl:attribute>
                                    </img>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">----------------------------------------------------------X</td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">Customer Signature</td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </xsl:if>
        </xsl:if>
        <!--END HEBREW  FOOTER-->
        <!--END FOOTER-->
    </xsl:template>
</xsl:stylesheet>